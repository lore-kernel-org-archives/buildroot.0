From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:28:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/rhash: requires RMD160 support
 in openssl
In-Reply-To: <20210609213046.1591967-1-fontaine.fabrice@gmail.com>
References: <20210609213046.1591967-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612122836.GT168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-09 23:30 +0200, Fabrice Fontaine spake thusly:
> Enable RMD160 in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e3733ad25de55616b2eafff0b489aea2bee65e06
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rhash/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rhash/Config.in b/package/rhash/Config.in
> index 2ddcb00feb..35ccb3833e 100644
> --- a/package/rhash/Config.in
> +++ b/package/rhash/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_RHASH
>  	bool "rhash"
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  LibRHash is a professional, portable, thread-safe C library
>  	  for computing a wide variety of hash sums, such as CRC32,
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
