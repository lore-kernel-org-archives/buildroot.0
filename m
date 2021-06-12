From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 14:26:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsnmp: requires DES support
 in openssl
In-Reply-To: <20210612113707.3995-1-fontaine.fabrice@gmail.com>
References: <20210612113707.3995-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612122659.GQ168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 13:37 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/76ddd42cfecc596e431490747e3a32b937f95a17
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/netsnmp/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
> index f22e38b335..dff0f18bee 100644
> --- a/package/netsnmp/Config.in
> +++ b/package/netsnmp/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_NETSNMP
>  	bool "netsnmp"
>  	depends on BR2_USE_MMU # fork()
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  Suite of applications used to implement SNMP v1, SNMP v2c, and
>  	  SNMP v3 using both IPv4 and IPv6.
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
