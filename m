From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 00:18:11 +0100
Subject: [Buildroot] [PATCH v4 4/6] Add init script files for snowball
 board
In-Reply-To: <1353927919-7250-5-git-send-email-gregory.hermant@calao-systems.com>
References: <1353927919-7250-1-git-send-email-gregory.hermant@calao-systems.com>
 <1353927919-7250-5-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50B69BB3.1000501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/11/12 12:05, Gregory Hermant wrote:
> +config BR2_PACKAGE_SNOWBALL_INIT
> +	bool "snowball-init"
> +	# Runtime dependency, needed by snowball startup script
> +	select BR2_PACKAGE_BLUEZ_UTILS

  BLUEZ_UTILS depends on a lot of things:

	depends on !BR2_avr32 # bluez_utils
	depends on BR2_USE_WCHAR # bluez_utils -> libglib2
	depends on BR2_TOOLCHAIN_HAS_THREADS # bluez_utils -> dbus
	depends on BR2_USE_MMU # bluez_utils -> dbus


  Regards,
  Arnout

> +	select BR2_PACKAGE_UX500_FIRMWARE
> +	help
> +	  Snowball init scripts
> +
> +	http://www.igloocommunity.org
> +

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
