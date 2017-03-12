From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Mar 2017 23:19:49 +0100
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.29
In-Reply-To: <ba0a3fc34ab165fa4434c71e4547811a078f70e1.1489339086.git.baruch@tkos.co.il>
References: <ba0a3fc34ab165fa4434c71e4547811a078f70e1.1489339086.git.baruch@tkos.co.il>
Message-ID: <20170312231949.2930200e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Mar 2017 19:18:06 +0200, Baruch Siach wrote:
> Include upstream equivalent patch to fix build with older kernel headers. This
> fixes build failures caused by the previous (reverted) version bump:
> http://autobuild.buildroot.net/results/563/563f46e9a11f9e3b174a4e1308444f284d1b3421/
> http://autobuild.buildroot.net/results/970/970463b628d9c81d5e217e92a455d2e05d0aa89e/
> http://autobuild.buildroot.net/results/cee/ceea635a9d620398cbcd44ccb859b07bf6682780/
> 
> Add libc-compat.h patch to make it work for musl libc.
> 
> Add another upstream patch to fix both missing strerror_l() implementation,
> and optionally missing locale support in uClibc-ng:
> http://autobuild.buildroot.net/results/dce/dce5d21c27df57ac96d9302752dd1802e7a9786b/
> http://autobuild.buildroot.net/results/c4b/c4b1c3f396ddd1d9242aed0953558606f929d57d/
> http://autobuild.buildroot.net/results/44d/44dd3db6cdda4646fa12ccf243d6aca16bed3c90/
> 
> Add host-pkgconf dependency, since configure.ac uses PKG_CHECK_MODULES.
> 
> Add optional dependency on the 'check' package.
> 
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  .../0001-fix-libc-kernel-headers-conflict.patch    | 756 +++++++++++++++++++++
>  ...musl-workaround-to-the-libc-compat.h-copy.patch |  37 +
>  ...usage-of-strerror_l-if-it-doesn-t-exist-i.patch | 106 +++
>  package/libnl/libnl.hash                           |   4 +-
>  package/libnl/libnl.mk                             |  13 +-
>  5 files changed, 912 insertions(+), 4 deletions(-)
>  create mode 100644 package/libnl/0001-fix-libc-kernel-headers-conflict.patch
>  create mode 100644 package/libnl/0003-Add-musl-workaround-to-the-libc-compat.h-copy.patch
>  create mode 100644 package/libnl/0004-lib-escape-usage-of-strerror_l-if-it-doesn-t-exist-i.patch

Applied to master, thanks for reworking the patch with the appropriate
build fixes. Hopefully, upstream will release a new tarball soon, so
that we can get rid of those biggish patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
