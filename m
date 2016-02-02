From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 14:24:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/smack: fix musl build
In-Reply-To: <1454257581-22383-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454257581-22383-1-git-send-email-bernd.kuhls@t-online.de>
 <1454257581-22383-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0AE0F.5070706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31-01-16 17:26, Bernd Kuhls wrote:
> The build error was not yet found by the autobuilders:
> 
> common.c: In function ?clear?:
> common.c:36:12: error: ?PATH_MAX? undeclared (first use in this function)
>   char path[PATH_MAX];
>             ^
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  ...ck-common.c-Include-limits.h-for-PATH_MAX.patch | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
> 
> diff --git a/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch b/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
> new file mode 100644
> index 0000000..0e30ef5
> --- /dev/null
> +++ b/package/smack/0001-libsmack-common.c-Include-limits.h-for-PATH_MAX.patch
> @@ -0,0 +1,29 @@
> +From 316c911aa741b14513622a4206ed6d324e951fa0 Mon Sep 17 00:00:00 2001
> +From: Felix Janda <felix.janda@posteo.de>
> +Date: Wed, 20 May 2015 21:25:22 +0200
> +Subject: [PATCH 1/1] libsmack/common.c: Include <limits.h> for PATH_MAX
> +
> +Signed-off-by: Felix Janda <felix.janda@posteo.de>
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> +Downloaded from upstream commit
> +https://github.com/smack-team/smack/commit/316c911aa741b14513622a4206ed6d324e951fa0
> +
> + libsmack/common.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/libsmack/common.c b/libsmack/common.c
> +index 55fee1a..55b59e3 100644
> +--- a/libsmack/common.c
> ++++ b/libsmack/common.c
> +@@ -22,6 +22,7 @@
> + #include <dirent.h>
> + #include <errno.h>
> + #include <fcntl.h>
> ++#include <limits.h>
> + #include <stdio.h>
> + #include <string.h>
> + #include <unistd.h>
> +-- 
> +2.7.0
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
