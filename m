From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:13:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/softether: requires DES,
 MD4 and RC4 support in openssl
In-Reply-To: <20210612133222.482124-1-fontaine.fabrice@gmail.com>
References: <20210612133222.482124-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612211311.GB168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 15:32 +0200, Fabrice Fontaine spake thusly:
> Enable DES, MD4 and RC4 in openssl to fix build failure raised since
> commit a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ce601fb26d143e03adb39c41f2fdfca3b3191127
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/softether/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/softether/Config.in b/package/softether/Config.in
> index bfb45b0315..b195bcf99a 100644
> --- a/package/softether/Config.in
> +++ b/package/softether/Config.in
> @@ -6,6 +6,9 @@ config BR2_PACKAGE_SOFTETHER
>  	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	select BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL

The conditionals on the selects are redundant: indeed, libopenssl is
forced, so we can only be using libopenssl with softether.

Applied to master with the above coditionals dropped, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_READLINE
>  	help
>  	  The SoftEther Server is a fully integrated implementation of
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
