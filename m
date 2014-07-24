From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 24 Jul 2014 20:29:21 +0200
Subject: [Buildroot] [PATCH] perl-net-ssleay: fix configure
In-Reply-To: <1406225756-29824-1-git-send-email-francois.perrad@gadz.org>
References: <1406225756-29824-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140724182921.GB4065@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-24 20:15 +0200, Francois Perrad spake thusly:
> CCFLAGS needs the same replacement as LDDLFAGS
> 
> see http://autobuild.buildroot.net/results/299/299d6fa6b2ccf97987ffd9c99130c25dd55ca9b4/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/perl-net-ssleay/perl-net-ssleay.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
> index 7234d1e..fb9b385 100644
> --- a/package/perl-net-ssleay/perl-net-ssleay.mk
> +++ b/package/perl-net-ssleay/perl-net-ssleay.mk
> @@ -15,9 +15,10 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
>  # suffers from: don't search for openssl, they pick the host-system one.
>  PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
>  
> -# Remove problematic single quotes in LDDLFLAGS definition
> +# Remove problematic single quotes in LDDLFLAGS & CCFLAGS definition
>  define PERL_NET_SSLEAY_FIX_MAKEFILE
>  	$(SED) "s/^LDDLFLAGS = '\(.*\)'/LDDLFLAGS = \1/" $(@D)/Makefile
> +	$(SED) "s/^CCFLAGS = '\(.*\)'/CCFLAGS = \1/" $(@D)/Makefile
>  endef
>  PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
>  
> -- 
> 1.9.1
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
