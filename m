From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:41:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/libfreefare: requires DES
 support in openssl
In-Reply-To: <20210612212209.636197-1-fontaine.fabrice@gmail.com>
References: <20210612212209.636197-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612214104.GI168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:22 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/889ac8e5799e5b48c5964592acefb67feec1c021
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfreefare/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
> index b330b2256a..574787e83b 100644
> --- a/package/libfreefare/Config.in
> +++ b/package/libfreefare/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_LIBFREEFARE
>  	bool "libfreefare"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_LIBNFC
>  	help
>  	  Library for high level manipulation of MIFARE cards.
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
