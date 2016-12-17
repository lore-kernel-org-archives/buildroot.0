From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 16:34:08 +0100
Subject: [Buildroot] [PATCH for-next 3/3] package/google-breakpad: bump
 to the latest version
In-Reply-To: <1480263400-29605-3-git-send-email-romain.naour@gmail.com>
References: <1480263400-29605-1-git-send-email-romain.naour@gmail.com>
 <1480263400-29605-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20161217163408.3e4810bb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 17:16:40 +0100, Romain Naour wrote:

> diff --git a/package/google-breakpad/Config.in b/package/google-breakpad/Config.in
> index 5c3f2e8..31ca422 100644
> --- a/package/google-breakpad/Config.in
> +++ b/package/google-breakpad/Config.in
> @@ -6,6 +6,7 @@ config BR2_PACKAGE_GOOGLE_BREAKPAD_ARCH_SUPPORTS
>  config BR2_PACKAGE_GOOGLE_BREAKPAD
>  	bool "google-breakpad"
>  	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11

You forgot to propagate this dependency to the
BR2_GOOGLE_BREAKPAD_ENABLE global option in the main Config.in file.
I've done so and applied your patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
