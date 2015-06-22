From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 23 Jun 2015 00:15:44 +0200
Subject: [Buildroot] [PATCH] package/perl: Fix typos in HOSTCC
 specification
In-Reply-To: <1435011012-23666-1-git-send-email-trisk@omniti.com>
References: <87si9j8nxg.fsf@dell.be.48ers.dk>
 <1435011012-23666-1-git-send-email-trisk@omniti.com>
Message-ID: <20150622221544.GE7547@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Albert, All,

On 2015-06-22 18:10 -0400, Albert Lee spake thusly:
> Signed-off-by: Albert Lee <trisk@omniti.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks you! :-)

Regards,
Yann E. MORIN.

> ---
>  package/perl/perl.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 93efc57..c3569a9 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -75,7 +75,7 @@ PERL_CONF_OPTS += --only-mod=$(subst $(space),$(comma),$(PERL_MODULES))
>  endif
>  
>  define PERL_CONFIGURE_CMDS
> -	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./configure $(PERL_CONF_OPTS))
> +	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./configure $(PERL_CONF_OPTS))
>  	$(SED) 's/UNKNOWN-/Buildroot $(BR2_VERSION_FULL) /' $(@D)/patchlevel.h
>  endef
>  
> @@ -101,7 +101,7 @@ HOST_PERL_CONF_OPTS = \
>  	-Dcc="$(HOSTCC)"
>  
>  define HOST_PERL_CONFIGURE_CMDS
> -	(cd $(@D); HOSTCC='$(HOSTCC_NOCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
> +	(cd $(@D); HOSTCC='$(HOSTCC_NOCCACHE)' ./Configure $(HOST_PERL_CONF_OPTS))
>  endef
>  
>  define HOST_PERL_BUILD_CMDS
> -- 
> 1.7.10.4
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
