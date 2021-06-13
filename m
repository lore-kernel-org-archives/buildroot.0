From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jun 2021 09:26:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/snmppp: requires DES support in
 openssl
In-Reply-To: <20210612215216.655735-1-fontaine.fabrice@gmail.com>
References: <20210612215216.655735-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613072647.GM168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:52 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2aece7e503d36ebee2bce526f11b2400b9df761e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/snmppp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/snmppp/Config.in b/package/snmppp/Config.in
> index de1a09ca4b..1f05f53f9f 100644
> --- a/package/snmppp/Config.in
> +++ b/package/snmppp/Config.in
> @@ -23,6 +23,7 @@ config BR2_PACKAGE_SNMPPP_SNMPV3
>  	default y
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Enable optional support for SNMP++. This selects OpenSSL.
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
