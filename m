From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 11:47:10 +0300
Subject: [Buildroot] [PATCH v3] nfs-utils: Bump version
In-Reply-To: <1436775857-32224-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436775857-32224-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20150713084710.GJ2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

On Mon, Jul 13, 2015 at 10:24:17AM +0200, Maxime Hadjinlian wrote:
> Refresh the patches (Thanks to Thomas Petazzoni's work)
> 
> Patches removed:
> 0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
> 0004-fix-build-with-uClibc.patch
> 0004-fix-build-with-uClibc.patch
> 0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
> 0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch

The diffstat below indicates that this patch was not removed actually.

baruch

> 0007-sockaddr-h-needs-stddef-h-for-NULL.patch
> 0008-tirpc-with-pkgconfig.patch
> 
> Patches modified:
> 0002-Patch-taken-from-Gentoo.patch
> 0003-Switch-legacy-index-in-favour-of-strchr.patch
> 
> Also, change source of the package to git repository (and remove the hash,
> sourceforce is clearly not a platform which can be trusted nowadays)
> 
> Rework the startup script to accomodate new rpc.statd
> The startup scripts now uses rcp.statd -F for a startup in foreground,
> also we avoid starting it twice, it makes rcp.statd crash the whole
> script.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
> v2 -> v3:
>     - Fix SITE used
> v1 -> v2:
>     - Change commit log format
>     - Specify patches removed/added
>     - Using git format-patch -M
>     - Using tarball sources and thus adding sha256 from the source
>     - Explain the -F for rpc.stad in the commit log
> ---
>  ...oo.patch => 0001-Patch-taken-from-Gentoo.patch} |  52 +++--------
>  ...d-AM_CONDITIONAL-in-conditional-execution.patch |  57 ------------
>  ...-Switch-legacy-index-in-favour-of-strchr.patch} |  29 +++---
>  ...figure-script-find-getrpcbynumber-in-libt.patch |  46 ++++++++++
>  package/nfs-utils/0004-fix-build-with-uClibc.patch |  31 -------
>  ...-of-getrpcbynumber-when-getrpcbynumber_r-.patch |  70 --------------
>  ...figure-script-find-getrpcbynumber-in-libt.patch |  38 --------
>  .../0007-sockaddr-h-needs-stddef-h-for-NULL.patch  |  19 ----
>  package/nfs-utils/0008-tirpc-with-pkgconfig.patch  | 102 ---------------------
>  package/nfs-utils/S60nfs                           |   3 +-
>  package/nfs-utils/nfs-utils.hash                   |   4 +-
>  package/nfs-utils/nfs-utils.mk                     |   6 +-
>  12 files changed, 80 insertions(+), 377 deletions(-)
>  rename package/nfs-utils/{0002-Patch-taken-from-Gentoo.patch => 0001-Patch-taken-from-Gentoo.patch} (62%)
>  delete mode 100644 package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
>  rename package/nfs-utils/{0003-Switch-legacy-index-in-favour-of-strchr.patch => 0002-Switch-legacy-index-in-favour-of-strchr.patch} (87%)
>  create mode 100644 package/nfs-utils/0003-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
>  delete mode 100644 package/nfs-utils/0004-fix-build-with-uClibc.patch
>  delete mode 100644 package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
>  delete mode 100644 package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
>  delete mode 100644 package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
>  delete mode 100644 package/nfs-utils/0008-tirpc-with-pkgconfig.patch

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
