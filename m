From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 14 Aug 2016 23:49:34 +0200
Subject: [Buildroot] [PATCH 7/8] package/linknx: drop a
 musl-compatibility patch
In-Reply-To: <00defd00b4a94479e2cc50ce12d72ddad9f8a533.1471033837.git.yann.morin.1998@free.fr>
References: <cover.1471033837.git.yann.morin.1998@free.fr>
 <00defd00b4a94479e2cc50ce12d72ddad9f8a533.1471033837.git.yann.morin.1998@free.fr>
Message-ID: <8d48fc22-2c46-2d9d-63c2-bbeb4d98f9f7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12-08-16 22:50, Yann E. MORIN wrote:
> We now always have a sys/cdefs.h, so we can drop this patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/linknx/0002-musl-cdefs.patch | 37 ------------------------------------
>  1 file changed, 37 deletions(-)
>  delete mode 100644 package/linknx/0002-musl-cdefs.patch
> 
> diff --git a/package/linknx/0002-musl-cdefs.patch b/package/linknx/0002-musl-cdefs.patch
> deleted file mode 100644
> index 59e28ca..0000000
> --- a/package/linknx/0002-musl-cdefs.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -Do not use the non-standard <sys/cdefs.h> header
> -
> -<sys/cdefs.h> is glibc-specific, and should be used only internally by
> -glibc, not by external libraries/programs. It is not available in all
> -standard C libraries.
> -
> -Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> -(Patch sent upstream: https://sourceforge.net/p/linknx/patches/21/)
> -
> -diff -uNr linknx-0.0.1.32.org/include/eibclient.h linknx-0.0.1.32/include/eibclient.h
> ---- linknx-0.0.1.32.org/include/eibclient.h	2007-10-11 01:55:33.000000000 +0200
> -+++ linknx-0.0.1.32/include/eibclient.h	2016-01-23 23:21:17.315006629 +0100
> -@@ -27,11 +27,12 @@
> - #ifndef EIBCLIENT_H
> - #define EIBCLIENT_H
> - 
> --#include "sys/cdefs.h"
> - #include "stdint.h"
> - #include <pthsem.h>
> - 
> --__BEGIN_DECLS;
> -+#ifdef __cplusplus
> -+extern "C" {
> -+#endif
> - 
> - #include "eibloadresult.h"
> - 
> -@@ -705,5 +706,8 @@
> -  */
> - int EIB_LoadImage_async (EIBConnection * con, const uint8_t * image, int len);
> - 
> --__END_DECLS
> -+#ifdef __cplusplus
> -+}
> -+#endif
> -+
> - #endif
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
