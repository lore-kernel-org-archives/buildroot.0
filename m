From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 15:35:52 +0200
Subject: [Buildroot] [v2 3/3] perl-net-ssleay: fix build
In-Reply-To: <1404406406-9209-3-git-send-email-francois.perrad@gadz.org>
References: <1404406406-9209-1-git-send-email-francois.perrad@gadz.org>
 <1404406406-9209-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140713133552.GD3588@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois, All,

On 2014-07-03 18:53 +0200, Francois Perrad spake thusly:
> the following error occurs after the previous patch
>     arm-none-linux-gnueabi-gcc: error: unrecognized command line option '-shared '
> 
> so, force LDDLFLAGS without quote
> 
> note: previously LDDLFLAGS was correct
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

I've dropped this patch from my resend [0], and marked it Rejected in
the patchwork, because I submitted an alternative patch, and C extensions
to Perl can not be built static anyway.

[0] http://lists.busybox.net/pipermail/buildroot/2014-July/101699.html

Regards,
Yann E. MORIN.

> ---
>  package/perl-net-ssleay/perl-net-ssleay.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/perl-net-ssleay/perl-net-ssleay.mk b/package/perl-net-ssleay/perl-net-ssleay.mk
> index 7e4c194..48ff715 100644
> --- a/package/perl-net-ssleay/perl-net-ssleay.mk
> +++ b/package/perl-net-ssleay/perl-net-ssleay.mk
> @@ -13,4 +13,9 @@ PERL_NET_SSLEAY_LICENSE_FILES = LICENSE
>  
>  PERL_NET_SSLEAY_CONF_ENV = OPENSSL_PREFIX=$(STAGING_DIR)/usr
>  
> +define PERL_NET_SSLEAY_FIX_MAKEFILE
> +	$(SED) 's/^LDDLFLAGS =.*/LDDLFLAGS = -shared/' $(@D)/Makefile
> +endef
> +PERL_NET_SSLEAY_POST_CONFIGURE_HOOKS += PERL_NET_SSLEAY_FIX_MAKEFILE
> +
>  $(eval $(perl-package))
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
