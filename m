From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2012 18:22:23 +0200
Subject: [Buildroot] [PATCH] barebox: Allow to pass a custom
 configuration file
In-Reply-To: <1350547405-31491-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1350547405-31491-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <5082CFBF.2000802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/12 10:03, Maxime Ripard wrote:
>   define BAREBOX_CONFIGURE_CMDS
> -	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) $(BAREBOX_BOARD_DEFCONFIG)_defconfig
> +	cp $(BAREBOX_SOURCE_CONFIG) $(@D)/arch/$(BAREBOX_ARCH)/configs/buildroot_defconfig
> +	$(MAKE) $(BAREBOX_MAKE_FLAGS) -C $(@D) buildroot_defconfig
>   endef

  Could you also add barebox-update-{def,}config targets that save the config
back to BAREBOX_SOURCE_CONFIG ?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
