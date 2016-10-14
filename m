From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 16:43:59 +0200
Subject: [Buildroot] [PATCH 15/51] openssl: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476396838-12276-16-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476396838-12276-16-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <aa8ddb7f-92bc-d81c-f047-8f4185fb7c84@mind.be>
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
>  package/openssl/openssl.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index 6dc4b85..5f6267c 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -106,11 +106,11 @@ define HOST_OPENSSL_BUILD_CMDS
>  endef

 Could you add a patch that does the same for host-openssl as well?

 Regards,
 Arnout

>  
>  define OPENSSL_BUILD_CMDS
> -	$(MAKE) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
>  endef
>  
>  define OPENSSL_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(STAGING_DIR) install
>  endef
>  
>  define HOST_OPENSSL_INSTALL_CMDS
> @@ -118,7 +118,7 @@ define HOST_OPENSSL_INSTALL_CMDS
>  endef
>  
>  define OPENSSL_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) INSTALL_PREFIX=$(TARGET_DIR) install
>  	rm -rf $(TARGET_DIR)/usr/lib/ssl
>  	rm -f $(TARGET_DIR)/usr/bin/c_rehash
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
