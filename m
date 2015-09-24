From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 24 Sep 2015 17:22:38 +0100
Subject: [Buildroot] [PATCH] libmng: new package
In-Reply-To: <1443105404-30913-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1443105404-30913-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <5604234E.5050008@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 09/24/2015 03:36 PM, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ file output/target/usr/lib/libmng.so.2.0.2
output/target/usr/lib/libmng.so.2.0.2: ELF 64-bit LSB shared object,
MIPS, MIPS64 rel2 version 1 (SYSV), dynamically linked, with unknown
capability 0x756e670000000f41 = 0x104000000070100, stripped

One nit-pick comment below; please scroll down.

[snip]

> diff --git a/package/libmng/Config.in b/package/libmng/Config.in
> new file mode 100644
> index 0000000..a0bd59c
> --- /dev/null
> +++ b/package/libmng/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBMNG
> +	bool "libmng"
> +	select BR2_PACKAGE_JPEG
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  The reference library for reading, displaying, writing and
> +	  examining Multiple-Image Network Graphics.

"examining" could be in the first line as it wouldn't exceed the 72
characters limit.

Regards,

Vincent.

[snip]
