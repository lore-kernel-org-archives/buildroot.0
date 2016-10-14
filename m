From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:16:07 +0200
Subject: [Buildroot] [PATCH 50/51] ocrad: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-51-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-51-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <db355d31-71aa-6834-d25f-bf774d86ecf2@mind.be>
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
>  package/ocrad/ocrad.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
> index 8a038e2..d0fbd4c 100644
> --- a/package/ocrad/ocrad.mk
> +++ b/package/ocrad/ocrad.mk
> @@ -17,15 +17,15 @@ define OCRAD_CONFIGURE_CMDS
>  endef

 Again, should be done for configure as well. Even though the configure script
doesn't call the compiler at the moment, it might in the future.

 Regards,
 Arnout

>  
>  define OCRAD_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
>  endef
>  
>  define OCRAD_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
>  endef
>  
>  define OCRAD_INSTALL_TARGET_CMDS
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
