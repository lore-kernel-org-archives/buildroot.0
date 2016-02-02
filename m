From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 16:03:54 +0100
Subject: [Buildroot] [PATCH 2/2] package/libndp: fix musl build
In-Reply-To: <1454168407-3108-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454168407-3108-1-git-send-email-bernd.kuhls@t-online.de>
 <1454168407-3108-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0C55A.7090809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 16:40, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/libndp/0001-ndptool.c-Fix-musl-build.patch | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/libndp/0001-ndptool.c-Fix-musl-build.patch
> 
> diff --git a/package/libndp/0001-ndptool.c-Fix-musl-build.patch b/package/libndp/0001-ndptool.c-Fix-musl-build.patch
> new file mode 100644
> index 0000000..547598c
> --- /dev/null
> +++ b/package/libndp/0001-ndptool.c-Fix-musl-build.patch
> @@ -0,0 +1,30 @@
> +From 561f80b9a848be923f37bf1afedbecf92da3b2e7 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
> +Date: Sat, 30 Jan 2016 16:36:39 +0100
> +Subject: [PATCH 1/1] ndptool.c: Fix musl build
> +
> +Fixes a build issue with the musl C library
> +http://autobuild.buildroot.net/results/d42/d42bebe51bbec38f131840b6bbefdc162f0ad194/build-end.log
> +
> +Patch sent upstream: https://github.com/jpirko/libndp/pull/7
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +---
> + utils/ndptool.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/utils/ndptool.c b/utils/ndptool.c
> +index 04ec4e1..c6ef48c 100644
> +--- a/utils/ndptool.c
> ++++ b/utils/ndptool.c
> +@@ -27,6 +27,7 @@
> + #include <netinet/in.h>
> + #include <arpa/inet.h>
> + #include <errno.h>
> ++#include <sys/select.h>
> + #include <ndp.h>
> + 
> + enum verbosity_level {
> +-- 
> +2.7.0.rc3
> +
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
