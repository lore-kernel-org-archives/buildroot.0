From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 08:50:19 +0200
Subject: [Buildroot] [PATCH] ne10: new package
In-Reply-To: <1365876586-7824-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365876586-7824-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <516E462B.20309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/04/13 20:09, Thomas Petazzoni wrote:
> +ifeq ($(BR2_PREFER_STATIC_LIB),)
> +define NE10_INSTALL_STAGING_SHARED_LIB
> +	cp -dpf $(@D)/modules/libNE10*.so* $(STAGING_DIR)/usr/lib/
> +endef
> +endif
> +
> +define NE10_INSTALL_STAGING_CMDS
> +	cp -dpf $(@D)/inc/NE10*h $(STAGING_DIR)/usr/include/
> +	cp -dpf $(@D)/modules/libNE10.a $(STAGING_DIR)/usr/lib/
> +	$(NE10_INSTALL_STAGING_SHARED_LIB)
> +endef
> +
> +
> +define NE10_INSTALL_TARGET_CMDS
> +	cp -dpf $(@D)/modules/libNE10*.so* $(TARGET_DIR)/usr/lib/
> +endef

  Shouldn't the latter one be inside an ifeq ($(BR2_PREFER_STATIC_LIB),) 
as well? But then you probably need an else part as well to override the 
default commands.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
