From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 03 Jan 2013 21:38:40 +0100
Subject: [Buildroot] [PATCH 2/8] fluxbox: fix build against imlib2
In-Reply-To: <d7aa4b5c9cd9aefcb9670572007dac718155df9b.1356907750.git.s.martin49@gmail.com>
 (Samuel Martin's message of "Sun, 30 Dec 2012 23:54:09 +0100")
References: <cover.1356907750.git.s.martin49@gmail.com>
 <cover.1356907750.git.s.martin49@gmail.com>
 <d7aa4b5c9cd9aefcb9670572007dac718155df9b.1356907750.git.s.martin49@gmail.com>
Message-ID: <87sj6ingrz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> * fix configure.in to take care of the given imlib2-prefix
 Samuel> * disable imlib2 support if imlib2 is not part of the selection

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 Samuel> +++ b/package/fluxbox/fluxbox.mk
 Samuel> @@ -10,11 +10,19 @@ FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBO
 Samuel>  FLUXBOX_LICENSE = MIT
 Samuel>  FLUXBOX_LICENSE_FILES = COPYING
 
 Samuel> +FLUXBOX_AUTORECONF = YES
 Samuel> +
 Samuel>  FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 Samuel>  		   --x-libraries=$(STAGING_DIR)/usr/lib
 Samuel> -
 Samuel>  FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 Samuel> +ifeq ($(BR2_PACKAGE_IMLIB2),y)
 Samuel> +FLUXBOX_CONF_OPT += --enable-imlib2 --with-imlib2-prefix=$(STAGING_DIR)/usr

Imlib2 needs to be built with X11 support, otherwise linking fails, so
I've updated the test to handle this and committed, thanks.


-- 
Bye, Peter Korsgaard
