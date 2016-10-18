From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 23:32:48 +0200
Subject: [Buildroot] [PATCH 75/93] perl: use $(HOST_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-76-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-76-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <8c3e80e1-8ab5-6ed1-a390-ba801e03b6be@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:07, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/perl/perl.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index fa051b9..9c1389c 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -101,11 +101,11 @@ define HOST_PERL_CONFIGURE_CMDS
>  endef

 How about configure?

 Regards,
 Arnout

>  
>  define HOST_PERL_BUILD_CMDS
> -	$(MAKE) -C $(@D)
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  define HOST_PERL_INSTALL_CMDS
> -	$(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_DEPENDENCE='' install
>  endef
>  
>  $(eval $(generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
