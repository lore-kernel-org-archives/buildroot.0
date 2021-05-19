From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 May 2021 22:14:57 +0200
Subject: [Buildroot] [PATCH next] package/libcurl: make sure openssl
 supports DES
In-Reply-To: <d358be700aa4dcfe0df4ba7f15832d4721f718ba.1621450908.git.baruch@tkos.co.il>
References: <d358be700aa4dcfe0df4ba7f15832d4721f718ba.1621450908.git.baruch@tkos.co.il>
Message-ID: <20210519201457.GH2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2021-05-19 22:01 +0300, Baruch Siach spake thusly:
> DES support in openssl is optional since commit a83d41867c8d
> ("package/libopenssl: add option to enable some features"). curl uses
> DES support in openssl when enabled. Select DES support to avoid build
> failure.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8931fd2b71eb2490cdc041b47eff58377ac823da/
> http://autobuild.buildroot.net/results/f159195adf05c375d7d314a270afd3a55d43ebdd/
> http://autobuild.buildroot.net/results/e143c75bccd7bcd4216954b76099404a38cf9bc1/
> 
> Cc: Erwan GAUTRON <erwan.gautron@bertin.fr>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libcurl/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libcurl/Config.in b/package/libcurl/Config.in
> index b89c46f5eff7..466f9ee3a1c7 100644
> --- a/package/libcurl/Config.in
> +++ b/package/libcurl/Config.in
> @@ -51,6 +51,7 @@ choice
>  config BR2_PACKAGE_LIBCURL_OPENSSL
>  	bool "OpenSSL"
>  	depends on BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  
>  config BR2_PACKAGE_LIBCURL_BEARSSL
>  	bool "BearSSL"
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
