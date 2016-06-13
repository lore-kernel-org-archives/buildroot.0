From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 13 Jun 2016 21:47:04 +0200
Subject: [Buildroot] [PATCH 1/6] Replace (e)glibc by glibc
In-Reply-To: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1465422059-22254-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <9cdb244c-a242-adae-969b-7f09133bff59@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 08/06/2016 ? 23:40, Thomas Petazzoni a ?crit :
> Following the removal of eglibc support, this commit replaces all
> occurences of "(e)glibc" by just "glibc". Most of the occurences are in
> package Config.in comments.
> 
> In addition, when the form "an (e)glibc ..." was used, it is replaced by
> "a glibc ...".

This patch must also include efibootmgr and efivar packages.

> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---

[snip]

> diff --git a/package/ltrace/Config.in b/package/ltrace/Config.in
> index ff4d7bd..8802860 100644
> --- a/package/ltrace/Config.in
> +++ b/package/ltrace/Config.in
> @@ -18,6 +18,6 @@ config BR2_PACKAGE_LTRACE
>  
>  	  http://ltrace.org
>  
> -comment "ltrace needs a uclibc or (e)glibc toolchain w/ wchar, dynamic library"
> +comment "ltrace needs a uclibc or glibc toolchain w/ wchar, dynamic library"
                            ^^
Not related to this patch but we prefer uClibc instead of uclibc.

Otherwise:

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain
