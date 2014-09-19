From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 22:05:29 +0200
Subject: [Buildroot] [PATCH v2] whois: Fix unmet dependencies
In-Reply-To: <1411138378-32002-1-git-send-email-jezz@sysmic.org>
References: <1411138378-32002-1-git-send-email-jezz@sysmic.org>
Message-ID: <20140919200529.GB4155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

J?r?me, All,

On 2014-09-19 16:52 +0200, J?r?me Pouiller spake thusly:
> Fix :
>    BR2_PACKAGE_WHOIS selects BR2_PACKAGE_GETTEXT which has unmet direct dependencies (BR2_USE_WCHAR)
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/whois/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/whois/Config.in b/package/whois/Config.in
> index 40b6590..95e3dc6 100644
> --- a/package/whois/Config.in
> +++ b/package/whois/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_WHOIS
>  	bool "whois"
> +	depends on BR2_USE_WCHAR # gettext
>  	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>  	help
>  	  Improved whois client.
>  
>  	  http://www.linux.it/~md/software/
> +
> +comment "whois needs a toolchain w/ wchar"
> +	depends on !BR2_USE_WCHAR
> -- 
> 2.1.0
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
