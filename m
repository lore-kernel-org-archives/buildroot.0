From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 17:01:09 +0100
Subject: [Buildroot] [PATCH 2/2] package/iprutils: Fix musl build
In-Reply-To: <1454167529-26085-2-git-send-email-bernd.kuhls@t-online.de>
References: <1454167529-26085-1-git-send-email-bernd.kuhls@t-online.de>
 <1454167529-26085-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0D2C5.6030106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 16:25, Bernd Kuhls wrote:
> This patch is intended to replace
> http://patchwork.ozlabs.org/patch/572182/
> 
> Fixes
> http://autobuild.buildroot.net/results/558/5584556c04077c8bd4829f31f1aad2587c3d5d4d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Commit messages are not so great, but OK.

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/iprutils/0003-musl.patch | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 package/iprutils/0003-musl.patch
> 
> diff --git a/package/iprutils/0003-musl.patch b/package/iprutils/0003-musl.patch
> new file mode 100644
> index 0000000..69bfb1c
> --- /dev/null
> +++ b/package/iprutils/0003-musl.patch
> @@ -0,0 +1,21 @@
> +Fix musl build
> +
> +Patch was created by Thomas Petazzoni
> +http://patchwork.ozlabs.org/patch/572182/
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr iprutils-2.4.10.1.org/iprlib.h iprutils-2.4.10.1/iprlib.h
> +--- iprutils-2.4.10.1.org/iprlib.h	2016-01-15 20:39:29.000000000 +0100
> ++++ iprutils-2.4.10.1/iprlib.h	2016-01-30 11:01:05.144054555 +0100
> +@@ -46,9 +46,9 @@
> + #include <asm/byteorder.h>
> + #include <sys/mman.h>
> + #include <paths.h>
> +-#include <bits/sockaddr.h>
> + #include <linux/netlink.h>
> + #include <time.h>
> ++#include <limits.h>
> + 
> + typedef uint8_t u8;
> + typedef uint16_t u16;
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
