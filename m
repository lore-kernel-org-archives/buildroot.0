From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:40:23 +0200
Subject: [Buildroot] [PATCH 04/51] lz4: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-5-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-5-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <ddcb7624-d3ed-20fd-e2a0-dd0ee6eeaa26@mind.be>
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
>  package/lz4/lz4.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
> index a5a41d3..f96e279 100644
> --- a/package/lz4/lz4.mk
> +++ b/package/lz4/lz4.mk
> @@ -27,16 +27,16 @@ define HOST_LZ4_INSTALL_CMDS
>  endef

 Could you add a patch that does the same for host-lz4 as well?

 Regards,
 Arnout

>  
>  define LZ4_BUILD_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib
>  endef
>  
>  define LZ4_INSTALL_STAGING_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
>  		PREFIX=/usr install -C $(@D)
>  endef
>  
>  define LZ4_INSTALL_TARGET_CMDS
> -	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
>  		PREFIX=/usr install -C $(@D)/lib
>  endef
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
