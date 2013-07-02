From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Jul 2013 22:31:07 +0200
Subject: [Buildroot] [PATCH v3] package/libsvg: new package
In-Reply-To: <1372706401-10935-1-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Mon, 1 Jul 2013 21:20:01 +0200")
References: <1372706401-10935-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <87y59osnzo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> Libsvg provides a library for parsing SVG content in files or buffers.
 Carsten> Libsvg does not do any rendering, but instead provides a function-based
 Carsten> interface that can be used by various rendering engines.

 Carsten> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
 Carsten> ---
 Carsten> Changes v3:
 Carsten> 	- removing specific config option for selection of XML parser, the
 Carsten> 	  XML parser can be changed by selecting BR2_PACKAGE_EXPAT from the
 Carsten> 	  user manually, otherwise BR2_PACKAGE_LIBXML2 will be automatically
 Carsten> 	  selected
 Carsten> 	- setting selection for BR2_PACKAGE_LIBPNG and _LIBJPEG in Config.in

 Carsten> Changes v2:
 Carsten> 	- reworking the whole patch after suggestions from Peter and Thomas
 Carsten> 	- adding patch to preventing compiler errors while linking
 Carsten> 	  against libexpat

 Carsten> +################################################################################
 Carsten> +#
 Carsten> +# libsvg
 Carsten> +#
 Carsten> +################################################################################
 Carsten> +
 Carsten> +LIBSVG_VERSION         = 0.1.4
 Carsten> +LIBSVG_SITE            = http://cairographics.org/snapshots/
 Carsten> +LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
 Carsten> +LIBSVG_INSTALL_STAGING = YES
 Carsten> +LIBSVG_LICENSE         = LGPLv2+
 Carsten> +LIBSVG_LICENSE_FILES   = COPYING
 Carsten> +
 Carsten> +# libsvg needs at last a XML parser
 Carsten> +ifeq ($(BR2_PACKAGE_EXPAT),y)
 Carsten> +LIBSVG_CONF_OPT += --with-expat
 Carsten> +LIBSVG_DEPENDENCIES += expat
 Carsten> +else ifeq ($(BR2_PACKAGE_LIBXML2),y)

This ifeq isn't really needed as there's only 2 options, expat or
libxml2.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
