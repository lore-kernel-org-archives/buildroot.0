From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:50:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: requires DES support
 in openssl
In-Reply-To: <20210612213827.654832-1-fontaine.fabrice@gmail.com>
References: <20210612213827.654832-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612215054.GL168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 23:38 +0200, Fabrice Fontaine spake thusly:
> Enable DES in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d73b477bd2064aee076f9debfd8d3346c63ba657
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libkrb5/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
> index 2e24c87229..39b5733b47 100644
> --- a/package/libkrb5/Config.in
> +++ b/package/libkrb5/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBKRB5
>  	# needs fork()
>  	depends on BR2_USE_MMU
>  	depends on !BR2_STATIC_LIBS
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL

This one I have not applied on purpose: libkrb5 does not depend on
openssl at all in its .mk file, neither conditionally or
unconditionally.

So adding a select to a libopenssl option is confusing.

Contrary to the earlier perl-crypt-openssl-rsa that I fixed, libkrb5
looks a bit more involved: it is not obvious if openssl is mandatory
or not. And it is too late for me tonight to investigate furhte. ;-)

Could you please have a look and respin a series to fix both?

Regards,
Yann E. MORIN.

>  	help
>  	  Kerberos is a system for authenticating users and services
>  	  on a network. Kerberos is a trusted third-party service.
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
