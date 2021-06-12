From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Jun 2021 23:40:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/perl-crypt-openssl-rsa:
 requires RMD160 support in openssl
In-Reply-To: <20210612205835.546667-1-fontaine.fabrice@gmail.com>
References: <20210612205835.546667-1-fontaine.fabrice@gmail.com>
Message-ID: <20210612214038.GG168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-06-12 22:58 +0200, Fabrice Fontaine spake thusly:
> Enable RMD160 in openssl to fix build failure raised since commit
> a83d41867c8d69a77d5cd0a665aa216af5340359
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e61d2f06812ce171e20bac96b3573d57927030d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl-crypt-openssl-rsa/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/perl-crypt-openssl-rsa/Config.in b/package/perl-crypt-openssl-rsa/Config.in
> index e58a921bcb..7c0c3acf17 100644
> --- a/package/perl-crypt-openssl-rsa/Config.in
> +++ b/package/perl-crypt-openssl-rsa/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_PERL_CRYPT_OPENSSL_RSA
>  	bool "perl-crypt-openssl-rsa"
>  	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_PERL_CRYPT_OPENSSL_RANDOM # runtime
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160 if BR2_PACKAGE_LIBOPENSSL

This is confusing, because perl-crypt-openssl-rsa does not depend,
conditionally or unconditionally, on openssl: it is not in its
dependencies...

However, the dependency is indirect via perl-crypt-openssl-random, so
this is really going to confuse people.

I've fixed that by pushing an extra preliminary fix to ad openssl to the
dependencies of perl-crypt-openssl-rsa.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  RSA encoding and decoding, using the openSSL libraries.
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
