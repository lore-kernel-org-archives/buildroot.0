From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 09:13:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 security bump version to 1.20.9
In-Reply-To: <20200828061858.878475-1-bernd.kuhls@t-online.de>
References: <20200828061858.878475-1-bernd.kuhls@t-online.de>
Message-ID: <20200828091349.6083ecc1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 28 Aug 2020 08:18:58 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Fixes CVE-2020-14345, CVE-2020-14346, CVE-2020-14361 & CVE-2020-1436:
> https://lists.x.org/archives/xorg-announce/2020-August/003058.html
> 
> Removed patch 0002, not needed anymore due to upstream commit
> https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=c601c8faf54ff9e3bcbc653421828d71042deef7
> 
> Build-tested with wayland:
> checking for a useful monotonic clock ......
> checking whether CLOCK_MONOTONIC is declared... yes
> guessing yes
> 
> Removed patch 0007, included in upstream release.
> 
> Rebased and renumbered remaining patches.
> 
> Reformatted license hashes.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...ure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 66 -------------------
>  .../1.20.8/0007-fix-for-ZDI-11426.patch       | 36 ----------
>  .../0001-modesettings-needs-dri2.patch        |  2 +-
>  ...02-Remove-check-for-useSIGIO-option.patch} |  2 +-
>  ...003-include-misc.h-fix-uClibc-build.patch} |  0
>  ...d-Makefile.am-fix-build-without-glx.patch} |  0
>  ...on-xf86Init.c-fix-build-without-glx.patch} |  4 +-
>  package/x11r7/xserver_xorg-server/Config.in   |  4 +-
>  .../xserver_xorg-server.hash                  | 14 ++--
>  .../xserver_xorg-server.mk                    |  5 --
>  10 files changed, 13 insertions(+), 120 deletions(-)
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.20.8/0002-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
>  delete mode 100644 package/x11r7/xserver_xorg-server/1.20.8/0007-fix-for-ZDI-11426.patch
>  rename package/x11r7/xserver_xorg-server/{1.20.8 => 1.20.9}/0001-modesettings-needs-dri2.patch (97%)
>  rename package/x11r7/xserver_xorg-server/{1.20.8/0003-Remove-check-for-useSIGIO-option.patch => 1.20.9/0002-Remove-check-for-useSIGIO-option.patch} (96%)
>  rename package/x11r7/xserver_xorg-server/{1.20.8/0004-include-misc.h-fix-uClibc-build.patch => 1.20.9/0003-include-misc.h-fix-uClibc-build.patch} (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.8/0005-hw-xwayland-Makefile.am-fix-build-without-glx.patch => 1.20.9/0004-hw-xwayland-Makefile.am-fix-build-without-glx.patch} (100%)
>  rename package/x11r7/xserver_xorg-server/{1.20.8/0006-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch => 1.20.9/0005-hw-xfree86-common-xf86Init.c-fix-build-without-glx.patch} (97%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
