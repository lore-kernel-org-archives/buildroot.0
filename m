From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Aug 2017 15:53:16 +0300
Subject: [Buildroot] [PATCH] package/e2fsprogs: version bump for bug fix.
In-Reply-To: <20170810124536.26344-1-daggs@gmx.com>
References: <20170810124536.26344-1-daggs@gmx.com>
Message-ID: <20170810125316.6qeroacb3dcvicj4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dagg,

On Thu, Aug 10, 2017 at 03:45:36PM +0300, Dagg Stompler wrote:
> when compiling host e2fsprogs on my system (gentoo amd64, glibc 2.25) the build fails with this error:
> ../lib/libext2fs.a(ismounted.o): In function `check_mntent_file':
> ismounted.c:(.text+0x224): undefined reference to `major'

Please provide the defconfig that causes this issue.

Was that the host version of e2fsprogs?

> bumping versions fixes the issue.

This is upstream commit 3fb715b554268759 (include sys/sysmacros.h as needed), 
right? If so, please add a reference in the commit log.

baruch

> Signed-off-by: Dagg Stompler <daggs@gmx.com>
> ---
>  package/e2fsprogs/e2fsprogs.hash | 4 ++--
>  package/e2fsprogs/e2fsprogs.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
> index cf41e3a3d5..ac420dd825 100644
> --- a/package/e2fsprogs/e2fsprogs.hash
> +++ b/package/e2fsprogs/e2fsprogs.hash
> @@ -1,2 +1,2 @@
> -# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.4/sha256sums.asc
> -sha256 54b3f21123a531a6a536b9cdcc21344b0122a72790dbe4dacc98e64db25e4a24  e2fsprogs-1.43.4.tar.xz
> +# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.43.5/sha256sums.asc
> +sha256 261f3d9ade383fbf032a19140c9c25e998cc0f71a1ae686614fb3ae0eb955a17  e2fsprogs-1.43.5.tar.xz
> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> index 75e9213351..7627a1f589 100644
> --- a/package/e2fsprogs/e2fsprogs.mk
> +++ b/package/e2fsprogs/e2fsprogs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -E2FSPROGS_VERSION = 1.43.4
> +E2FSPROGS_VERSION = 1.43.5
>  E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
>  E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
>  E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
