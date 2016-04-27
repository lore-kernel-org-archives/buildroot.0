From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Apr 2016 13:41:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xlib_libXfixes: fix
 compile error by backporting upstream commit
In-Reply-To: <1461622934-16581-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461622934-16581-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160427134146.57c39168@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Apr 2016 00:22:14 +0200, Bernd Kuhls wrote:
> Fixes an error not yet caught by autobuilders:
> 
> In file included from SaveSet.c:27:0:
> Xfixesint.h:67:20: error: static declaration of '_XEatDataWords' follows non-static declaration
>  static inline void _XEatDataWords(Display *dpy, unsigned long n)
>                     ^
> 
> To reproduce use this defconfig:
> 
> BR2_powerpc64le=y
> BR2_powerpc_power8=y
> BR2_OPTIMIZE_3=y
> BR2_GLIBC_VERSION_2_23=y
> BR2_BINUTILS_VERSION_2_26_X=y
> BR2_GCC_VERSION_5_X=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_XORG7=y
> BR2_PACKAGE_XLIB_LIBXFIXES=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../0001-remove-fallback-for-xeatdatawords.patch   | 63 ++++++++++++++++++++++
>  package/x11r7/xlib_libXfixes/xlib_libXfixes.mk     |  2 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 package/x11r7/xlib_libXfixes/0001-remove-fallback-for-xeatdatawords.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
