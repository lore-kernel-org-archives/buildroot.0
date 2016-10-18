From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:27:55 +0200
Subject: [Buildroot] [PATCH 20/93] libpfm4: use $(TARGET_MAKE_ENV) when
 calling $(MAKE)
In-Reply-To: <1476720440-22239-21-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-21-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <299dcb60-5ffb-e713-3d9e-6e8e8a4d55cf@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Why not TARGET_CONFIGURE_OPTS here?

 Regards,
 Arnout

On 17-10-16 18:06, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/libpfm4/libpfm4.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
> index 358fd9d..913fc35 100644
> --- a/package/libpfm4/libpfm4.mk
> +++ b/package/libpfm4/libpfm4.mk
> @@ -17,15 +17,15 @@ LIBPFM4_FLAGS = SYS=Linux ARCH=$(BR2_ARCH) \
>  	DBG=
>  
>  define LIBPFM4_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS)
>  endef
>  
>  define LIBPFM4_INSTALL_STAGING_CMDS
> -	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(STAGING_DIR)/usr install
>  endef
>  
>  define LIBPFM4_INSTALL_TARGET_CMDS
> -	$(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBPFM4_FLAGS) PREFIX=$(TARGET_DIR)/usr install
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
