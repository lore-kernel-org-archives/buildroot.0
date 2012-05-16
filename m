From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 May 2012 09:17:01 +0200
Subject: [Buildroot] [PATCH] Added package fbterm: a framebuffer-based
	terminal emulator.
In-Reply-To: <1337135766-26862-1-git-send-email-golubovsky@gmail.com>
 (Dmitry's message of "Tue, 15 May 2012 22:36:06 -0400")
References: <1337135766-26862-1-git-send-email-golubovsky@gmail.com>
Message-ID: <87ipfwr3wy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dmitry" == Dmitry  <golubovsky@gmail.com> writes:

Hi,

 Dmitry> +++ b/package/fbterm/Config.in
 Dmitry> @@ -0,0 +1,15 @@
 Dmitry> +config BR2_PACKAGE_FBTERM
 Dmitry> +	bool "fbterm"
 Dmitry> +	depends on (BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && \
 Dmitry> +			BR2_TOOLCHAIN_BUILDROOT_CXX && BR2_USE_WCHAR)
 Dmitry> +	select BR2_PACKAGE_FONTCONFIG
 Dmitry> +	select BR2_PACKAGE_LIBERATION
 Dmitry> +	help
 Dmitry> +	  fbterm is a fast terminal emulator for Linux with frame buffer
 Dmitry> +	  device or VESA video card.
 Dmitry> +
 Dmitry> +	  http://code.google.com/p/fbterm/
 Dmitry> +
 Dmitry> +comment "fbterm requires a C++, WCHAR in toolchain and locale support"
 Dmitry> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_ENABLE_LOCALE && \
 Dmitry> +			BR2_TOOLCHAIN_BUILDROOT_CXX && BR2_USE_WCHAR)

BR2_TOOLCHAIN_BUILDROOT_CXX isn't needed. Otherwise it looks good,
committed to next - Thanks.

-- 
Bye, Peter Korsgaard
