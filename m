From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:10:24 +0200
Subject: [Buildroot] [PATCH 37/51] moarvm: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-38-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-38-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <febf6e2f-d5f7-e053-898e-90fd208de5c2@mind.be>
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
>  package/moarvm/moarvm.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/moarvm/moarvm.mk b/package/moarvm/moarvm.mk
> index ee58f76..acdfff5 100644
> --- a/package/moarvm/moarvm.mk
> +++ b/package/moarvm/moarvm.mk
> @@ -33,15 +33,15 @@ define MOARVM_CONFIGURE_CMDS
>  endef

 Again, I think the configure commands should get TARGET_MAKE_ENV as well.

 Regards,
 Arnout

>  
>  define MOARVM_BUILD_CMDS
> -	$(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  define MOARVM_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
>  endef
>  
>  define MOARVM_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
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
