From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 10:24:16 +0200
Subject: [Buildroot] [PATCH 1/2] package/x11r7/xlib_libXfont: remove
 autoreconf
In-Reply-To: <20180915121806.5264-1-bernd.kuhls@t-online.de>
References: <20180915121806.5264-1-bernd.kuhls@t-online.de>
Message-ID: <20180916102416.05476006@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Sep 2018 14:18:05 +0200, Bernd Kuhls wrote:
> Nine years ago we added autoreconf to fix libtool-related problems
> with the matchbox package:
> 
> https://git.buildroot.net/buildroot/commit/?id=51ef5b81224c243aa7f937c4690b1a120c81ccbc
> 
> Autoreconf for this package needs the xutil_util-macros but after
> building this defconfig with autoreconf removed from this package
> 
> BR2_x86_64=y
> BR2_x86_core_avx2=y
> BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XLIB_LIBXFONT=y
> BR2_PACKAGE_MATCHBOX=y
> BR2_PACKAGE_MATCHBOX_SM=y
> BR2_PACKAGE_MATCHBOX_COMMON=y
> BR2_PACKAGE_MATCHBOX_COMMON_PDA=y
> BR2_PACKAGE_MATCHBOX_DESKTOP=y
> BR2_PACKAGE_MATCHBOX_KEYBOARD=y
> BR2_PACKAGE_MATCHBOX_PANEL=y
> BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR=y
> 
> it is obvious that the problem which existed nine years ago seems to be
> gone. So instead of fixing autoreconf we remove it from this package
> because there is no need for it anymore.
> 
> Fixes
> http://autobuild.buildroot.net/results/30c/30cf5cc139f9f6a9dc070953270f74e18b9310d4/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/x11r7/xlib_libXfont/xlib_libXfont.mk | 1 -
>  1 file changed, 1 deletion(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
