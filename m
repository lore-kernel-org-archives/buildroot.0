From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Feb 2016 19:16:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/zip: add host-zip
In-Reply-To: <1454692180-6467-1-git-send-email-martin@barkynet.com>
References: <1454692180-6467-1-git-send-email-martin@barkynet.com>
Message-ID: <20160208181640.GE3436@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Martin, All,

On 2016-02-05 17:09 +0000, Martin Bark spake thusly:
> Make the host variant of zip available.  This can be useful in
> post-{build,image} scripts.
> 
> Signed-off-by: Martin Bark <martin@barkynet.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Config.in.host     |  1 +
>  package/zip/Config.in.host | 10 ++++++++++
>  2 files changed, 11 insertions(+)
>  create mode 100644 package/zip/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 8e6b870..917670f 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -31,5 +31,6 @@ menu "Host utilities"
>  	source "package/uboot-tools/Config.in.host"
>  	source "package/util-linux/Config.in.host"
>  	source "package/vboot-utils/Config.in.host"
> +	source "package/zip/Config.in.host"
>  
>  endmenu
> diff --git a/package/zip/Config.in.host b/package/zip/Config.in.host
> new file mode 100644
> index 0000000..b14ce55
> --- /dev/null
> +++ b/package/zip/Config.in.host
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_HOST_ZIP
> +	bool "host zip"
> +	help
> +	  Zip is a compression and file packaging/archive utility.
> +	  Although highly compatible both with PKWARE's PKZIP and
> +	  PKUNZIP utilities for MS-DOS and with Info-ZIP's own UnZip,
> +	  our primary objectives have been portability and
> +	  other-than-MSDOS functionality.
> +
> +	  http://infozip.sourceforge.net/Zip.html
> -- 
> 2.5.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
