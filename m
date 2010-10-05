From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Oct 2010 09:18:29 +0200
Subject: [Buildroot] [PATCH 2/2] imagemagick: convert to autotargets and
	bump to 6.6.4
In-Reply-To: <1286052682-22218-3-git-send-email-Martin.Banky@gmail.com>
	(Martin Banky's message of "Sat, 2 Oct 2010 13:51:22 -0700")
References: <1286052682-22218-1-git-send-email-Martin.Banky@gmail.com>
	<1286052682-22218-3-git-send-email-Martin.Banky@gmail.com>
Message-ID: <87d3rpt8e2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Banky <martin.banky@gmail.com> writes:

 Martin> program-transform-name='s,,,' is needed, otherwise configure defines it as
 Martin> $(platform)-$(cpu)-. During install, all executables are prepended with this
 Martin> variable.

 Martin> Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
 Martin> -IMAGEMAGICK_MAJOR:=6.4.8
 Martin> -IMAGEMAGICK_VERSION:=$(IMAGEMAGICK_MAJOR)-4
 Martin> -IMAGEMAGICK_SOURCE:=ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 Martin> -IMAGEMAGICK_SITE:=ftp://ftp.imagemagick.org/pub/ImageMagick
 Martin> -IMAGEMAGICK_DIR:=$(BUILD_DIR)/ImageMagick-$(IMAGEMAGICK_VERSION)
 Martin> -IMAGEMAGICK_CAT:=$(BZCAT)
 Martin> -IMAGEMAGICK_LIB:=$(TARGET_DIR)/usr/lib/libMagickCore.so
 Martin> +IMAGEMAGICK_MAJOR = 6.6.4
 Martin> +IMAGEMAGICK_VERSION = $(IMAGEMAGICK_MAJOR)-8
 Martin> +IMAGEMAGICK_SOURCE = ImageMagick-$(IMAGEMAGICK_VERSION).tar.bz2
 Martin> +IMAGEMAGICK_SITE = ftp://ftp.imagemagick.org/pub/ImageMagick
 Martin> +IMAGEMAGICK_INSTALL_STAGING = YES

We neee IMAGEMAGICK_LIBTOOL_PATCH = NO

 Martin> +define ICU_INSTALL_STAGING_CMDS
 Martin> +	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
 Martin> +endef

That's wrong/not needed.

Committed with those 2 fixes, thanks.

-- 
Bye, Peter Korsgaard
