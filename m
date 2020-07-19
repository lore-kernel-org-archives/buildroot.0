From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jul 2020 21:42:09 +0200
Subject: [Buildroot] [PATCH v2] package/cdrkit: fix build with GCC 10
In-Reply-To: <20200719174236.534982-1-urjaman@gmail.com>
References: <20200625005836.2232591-1-urjaman@gmail.com>
 <20200719174236.534982-1-urjaman@gmail.com>
Message-ID: <20200719194209.GY18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Urja, All,

On 2020-07-19 20:42 +0300, Urja Rannikko spake thusly:
> This patch adds a missing extern on the outfile
> variable in genisoimage.h.
> 
> Signed-off-by: Urja Rannikko <urjaman@gmail.com>

Applied to master, thanks.

> ---
> Note: I would like to see this applied to the LTS 2020.02
> branch too, since it fixes building host-cdrkit for ISO9660
> generation with a host GCC 10.

+Peter in cc.

Regards,
Yann E. MORIN.

> v2: Make the patch a fully fledged commit with a sign-off and
> way more description than is necessary for a single "extern".
> 
>  ...ar-outfile-declaration-to-fix-build-.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch
> 
> diff --git a/package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch b/package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch
> new file mode 100644
> index 0000000000..30f4c8d01d
> --- /dev/null
> +++ b/package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch
> @@ -0,0 +1,30 @@
> +From eabcc8a6e39dc3c28faee3e04aa56cc65a38d65a Mon Sep 17 00:00:00 2001
> +From: Urja Rannikko <urjaman@gmail.com>
> +Date: Sun, 19 Jul 2020 20:28:27 +0300
> +Subject: [PATCH] Add extern to char* outfile declaration to fix build with gcc
> + 10
> +
> +Without this linking fails with a rather long spew of
> +"multiple definition of `outfile'".
> +
> +Signed-off-by: Urja Rannikko <urjaman@gmail.com>
> +---
> + genisoimage/genisoimage.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
> +index bbedfb0..82c859b 100644
> +--- a/genisoimage/genisoimage.h
> ++++ b/genisoimage/genisoimage.h
> +@@ -376,7 +376,7 @@ extern int	use_fileversion;
> + extern int	split_SL_component;
> + extern int	split_SL_field;
> + extern char	*trans_tbl;
> +-char		*outfile;
> ++extern char	*outfile;
> + 
> + #define	JMAX		64	/* maximum Joliet file name length (spec) */
> + #define	JLONGMAX	103	/* out of spec Joliet file name length */
> +-- 
> +2.27.0
> +
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
