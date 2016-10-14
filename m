From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:18:12 +0200
Subject: [Buildroot] [PATCH 24/51] poco: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-25-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-25-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <0b2a07d4-e857-b07d-b407-67426837f127@mind.be>
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
>  package/poco/poco.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index 79452c0..535c9a3 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -58,19 +58,19 @@ define POCO_CONFIGURE_CMDS
>  endef

 Again, I think it should be done for configure as well.

 Regards,
 Arnout

>  
>  define POCO_BUILD_CMDS
> -	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
>  		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
>  		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
>  		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
>  endef
>  
>  define POCO_INSTALL_STAGING_CMDS
> -	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
>  		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
>  endef
>  
>  define POCO_INSTALL_TARGET_CMDS
> -	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
> +	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
>  		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
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
