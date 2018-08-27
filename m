From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 27 Aug 2018 09:37:31 +0300
Subject: [Buildroot] [PATCH] package/squashfs: fix build on hosts with
 glibc >= 2.28
In-Reply-To: <20180825200751.28097-1-richard.kunze@web.de>
References: <20180825200751.28097-1-richard.kunze@web.de>
Message-ID: <20180827063731.m3xm4jamqyugxfwm@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Richard,

Thanks for your contribution. Please find a few comments below.

On Sat, Aug 25, 2018 at 10:07:51PM +0200, Richard Kunze wrote:
> Since glibc 2.28, sys/sysmacros.h is no longer included from sys/types.h
> This patch fixes the resulting build error by explicitly including
> sys/sysmacros.h
> 
> Signed-off-by: Richard Kunze <richard.kunze@web.de>
> ---
>  package/squashfs/0001-include-sysmacros.patch | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 package/squashfs/0001-include-sysmacros.patch
> 
> diff --git a/package/squashfs/0001-include-sysmacros.patch b/package/squashfs/0001-include-sysmacros.patch
> new file mode 100644
> index 0000000000..56d9a742e7
> --- /dev/null
> +++ b/package/squashfs/0001-include-sysmacros.patch

Patches should have a description and sign-off. See the patches chapter in the 
Buildroot manual:

  https://buildroot.org/downloads/manual/manual.html#patch-policy

It would also be nice to add a note about the upstream status of this patch.

> @@ -0,0 +1,19 @@
> +--- a/squashfs-tools/mksquashfs.c       2018-02-15 14:11:24.661930637 +0100
> ++++ b/squashfs-tools/mksquashfs.c       2018-02-15 14:12:28.218412025 +0100
> +@@ -44,6 +44,7 @@
> + #include <setjmp.h>
> + #include <sys/types.h>
> ++#include <sys/sysmacros.h>
> + #include <sys/mman.h>
> + #include <pthread.h>
> + #include <regex.h>
> + #include <sys/wait.h>
> +--- a/squashfs-tools/unsquashfs.c       2018-02-15 14:25:34.608263881 +0100
> ++++ b/squashfs-tools/unsquashfs.c       2018-02-15 14:26:01.376410327 +0100
> +@@ -36,6 +36,7 @@
> + #include <sys/types.h>
> ++#include <sys/sysmacros.h>
> + #include <sys/time.h>
> + #include <sys/resource.h>
> + #include <limits.h>
> + #include <ctype.h>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
