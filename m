From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 22:06:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/tpm-tools: requires DES support
 in openssl
In-Reply-To: <20210613104706.1188475-1-fontaine.fabrice@gmail.com>
References: <20210613104706.1188475-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613200650.GX168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-13 12:47 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c104263d0fb6f758ac1e654b114f68b4fbfcf6bd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tpm-tools/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tpm-tools/Config.in b/package/tpm-tools/Config.in
> index ca70adc80c..3ce6391acd 100644
> --- a/package/tpm-tools/Config.in
> +++ b/package/tpm-tools/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_TPM_TOOLS
>  	depends on !BR2_STATIC_LIBS # trousers
>  	select BR2_PACKAGE_TROUSERS
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Tools to manage and diagnose a TPM
>  
> -- 
> 2.30.2
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
