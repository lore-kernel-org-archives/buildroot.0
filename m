From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Oct 2012 21:56:58 +0200
Subject: [Buildroot] [PATCH] barebox: Allow to pass a custom
 configuration file
In-Reply-To: <1350547405-31491-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1350547405-31491-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <50805F0A.7010407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/12 10:03, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard<maxime.ripard@free-electrons.com>
[snip]
> +config BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE
> +	string "Configuration file path"
> +	depends on BR2_TARGET_BAREBOX_USE_CUSTOM_CONFIG
> +	help
> +	  Path to the kernel configuration file
                       ^^^^^^
                       barebox

[snip]
> +ifeq ($(BAREBOX_SOURCE_CONFIG),)
> +$(error No Barebox config file. Check your BR2_TARGET_BAREBOX_BOARD_DEFCONFIG setting)

  or BR2_TARGET_BAREBOX_CUSTOM_CONFIG_FILE


  Regards,
  Arnout

>   endif
>   endif
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
