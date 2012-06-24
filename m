From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jun 2012 19:24:09 +0200
Subject: [Buildroot] [PATCH v2] New package: zxing
In-Reply-To: <1332720940-28373-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Sun, 25 Mar 2012 20:15:40 -0400")
References: <1332720940-28373-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <8762agaaiu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 Frank> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Thanks, committed. I ended up reworking it to use a simple makefile
instead of scons, both because of the dos/unix newline issue you pointed
out yourself, and also because scons hardcoded compiler flags.

See below for a few other minor issues.

 Frank> +config BR2_PACKAGE_ZXING
 Frank> +	bool "zxing"
 Frank> +	depends on BR2_INSTALL_LIBSTDCPP
 Frank> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 Frank> +	help
 Frank> +	  ZXing (pronounced "zebra crossing") is an open-source, 
 Frank> +	  multi-format 1D/2D barcode image processing library 

These two lines have trailing spaces.

 Frank> +++ b/package/zxing/zxing.mk
 Frank> @@ -0,0 +1,38 @@
 Frank> +#############################################################
 Frank> +#
 Frank> +# zxing
 Frank> +#
 Frank> +#############################################################
 Frank> +ZXING_VERSION = 2.0
 Frank> +ZXING_SITE = http://zxing.googlecode.com/files
 Frank> +ZXING_SOURCE = ZXing-$(ZXING_VERSION).zip
 Frank> +ZXING_DEPENDENCIES = host-scons
 Frank> +ZXING_INSTALL_STAGING = YES
 Frank> +ZXING_INSTALL_TARGET = NO

Buildroot can be used to build a native compiler and development
environment, so we also install into target. If BR2_HAVE_DEVFILES is
disabled, then the target filesystem is cleaned up of usr/lib/lib*.a /
usr/include before the filesystem images are created.

-- 
Bye, Peter Korsgaard
