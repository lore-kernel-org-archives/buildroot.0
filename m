From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:18:50 +0200
Subject: [Buildroot] [PATCH 25/51] pppd: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-26-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-26-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <227db744-cb2e-20a6-6abd-69a80fb4a5ca@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/pppd/pppd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
> index 92897be..e2d4a19 100644
> --- a/package/pppd/pppd.mk
> +++ b/package/pppd/pppd.mk
> @@ -50,7 +50,7 @@ define PPPD_CONFIGURE_CMDS
>  endef

 Again, I think it should be done for configure as well.

 Regards,
 Arnout

>  
>  define PPPD_BUILD_CMDS
> -	$(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
> +	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" COPTS="$(TARGET_CFLAGS)" \
>  		-C $(@D) $(PPPD_MAKE_OPTS)
>  endef
>  
> @@ -104,7 +104,7 @@ define PPPD_INSTALL_TARGET_CMDS
>  endef
>  
>  define PPPD_INSTALL_STAGING_CMDS
> -	$(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
> +	$(TARGET_MAKE_ENV) $(MAKE) INSTROOT=$(STAGING_DIR)/ -C $(@D) $(PPPD_MAKE_OPTS) install-devel
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
