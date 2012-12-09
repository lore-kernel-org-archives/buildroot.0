From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Dec 2012 19:43:53 +0100
Subject: [Buildroot] [PATCH 13/51] package/spice: new package
In-Reply-To: <1355070924-8009-14-git-send-email-yann.morin.1998@free.fr>
References: <1355070924-8009-1-git-send-email-yann.morin.1998@free.fr>
 <1355070924-8009-14-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20121209194353.4aad4adb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun,  9 Dec 2012 17:34:46 +0100, Yann E. MORIN wrote:

> +# We need to tweak spice.pc because it /forgets/ (for static linking) that
> +# it should link against libz and libjpeg. libz is pkg-config-aware, while
> +# libjpeg isn't, hence the two-line tweak
> +define SPICE_POST_INSTALL_STAGING_FIX_PC
> +	$(SED) 's/^\(Requires.private:.*\)$$/\1 zlib/; s/^\(Libs.private:.*\)$$/\1 -ljpeg/;'    \
> +	       "$(STAGING_DIR)/usr/lib/pkgconfig/spice-server.pc"
> +endef
> +SPICE_POST_INSTALL_STAGING_HOOKS += SPICE_POST_INSTALL_STAGING_FIX_PC

Do you think it's possible to replace this by a patch that could be
upstreamed?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
