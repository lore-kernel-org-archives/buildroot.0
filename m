From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Jun 2014 23:13:38 +0200
Subject: [Buildroot] [v2 2/2] perl-mojolicious: new package
In-Reply-To: <1402947357-6359-3-git-send-email-francois.perrad@gadz.org>
References: <1402947357-6359-1-git-send-email-francois.perrad@gadz.org>
 <1402947357-6359-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140622211338.GD21768@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Francois, All,

On 2014-06-16 21:35 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[--SNIP--]
> diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
> new file mode 100644
> index 0000000..e4ced7e
> --- /dev/null
> +++ b/package/perl-mojolicious/perl-mojolicious.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# perl-mojolicious
> +#
> +################################################################################
> +
> +PERL_MOJOLICIOUS_VERSION = 5.07

5.07 is no longer available. There's now 5.08, and it seems only the
latest version is ever available on CPAN. :-(

This is causing autobuild failures:
    http://autobuild.buildroot.net/results/358/358f531f2db90b9bc3b1e4e2158c68d2bf6587fc/

I'll send a patch bumping to 5.08 in a moment...

Regards,
Yann E. MORIN.

> +PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
> +PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
> +PERL_MOJOLICIOUS_DEPENDENCIES = perl 
> +PERL_MOJOLICIOUS_LICENSE = artistic_2
> +
> +$(eval $(perl-package))
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
