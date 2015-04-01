From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 15:23:06 +0200
Subject: [Buildroot] AMD Radeon firmware
In-Reply-To: <551BD9A2.7080804@ext.leroymerlin.fr>
References: <551BD9A2.7080804@ext.leroymerlin.fr>
Message-ID: <20150401152306.7afccf2b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David,

Thanks for your patch!

On Wed, 01 Apr 2015 13:42:26 +0200, david.barbion at ext.leroymerlin.fr
wrote:

> To be able to use the radeon framebuffer on my devices, I needed the AMD 
> Radeon firmware from linux-firmware package. Absence of those firmware 
> files results in black screen.
> 
> You can find the patch below.

Thanks a lot! Could you generate this patch with Git instead, so that
we can apply it easily?

See
http://buildroot.org/downloads/manual/manual.html#submitting-patches
for some tips on how to submit patches to Buildroot.

> diff --git a/package/linux-firmware/Config.in 
> b/package/linux-firmware/Config.in
> index 9e1eb91..f704176 100644
> --- a/package/linux-firmware/Config.in
> +++ b/package/linux-firmware/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE
> 
>   if BR2_PACKAGE_LINUX_FIRMWARE
> 
> +

This is non-needed spurious change, it shouldn't be there.

>   menu "Audio firmware"
> 
>   config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
> @@ -17,6 +18,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP
> 
>   endmenu # Audio
> 
> +menu "Video firmware"
> +
> +config BR2_PACKAGE_LINUX_FIRMWARE_RADEON
> +  bool "AMD Radeon video card firmware"
> +  help

Indentation for 'config' and 'help' should be one tab.

> +    Firmware files for AMD Radeon video cards.

And one tab + two spaces here.

See
http://buildroot.org/downloads/manual/manual.html#_literal_config_in_literal_file.

> diff --git a/package/linux-firmware/linux-firmware.mk 
> b/package/linux-firmware/linux-firmware.mk
> index 71c8611..9c00ae1 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -14,6 +14,232 @@ LINUX_FIRMWARE_FILES += 
> intel/fw_sst_0f28.bin-48kHz_i2s_master
>   LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.fw_sst_0f28
>   endif
> 
> +ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RADEON),y)
> +LINUX_FIRMWARE_FILES += radeon/ARUBA_me.bin
> +LINUX_FIRMWARE_FILES += radeon/ARUBA_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/ARUBA_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/BARTS_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/BARTS_me.bin
> +LINUX_FIRMWARE_FILES += radeon/BARTS_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/BARTS_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_me.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/BONAIRE_vce.bin
> +LINUX_FIRMWARE_FILES += radeon/BTC_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/CAICOS_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/CAICOS_me.bin
> +LINUX_FIRMWARE_FILES += radeon/CAICOS_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/CAICOS_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/CAYMAN_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/CAYMAN_me.bin
> +LINUX_FIRMWARE_FILES += radeon/CAYMAN_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/CAYMAN_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/CAYMAN_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/CEDAR_me.bin
> +LINUX_FIRMWARE_FILES += radeon/CEDAR_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/CEDAR_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/CEDAR_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/CYPRESS_me.bin
> +LINUX_FIRMWARE_FILES += radeon/CYPRESS_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/CYPRESS_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/CYPRESS_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/CYPRESS_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_me.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/HAINAN_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_me.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/HAWAII_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/JUNIPER_me.bin
> +LINUX_FIRMWARE_FILES += radeon/JUNIPER_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/JUNIPER_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/JUNIPER_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/KABINI_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/KABINI_me.bin
> +LINUX_FIRMWARE_FILES += radeon/KABINI_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/KABINI_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/KABINI_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/KABINI_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/KAVERI_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/KAVERI_me.bin
> +LINUX_FIRMWARE_FILES += radeon/KAVERI_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/KAVERI_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/KAVERI_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/KAVERI_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/MULLINS_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/MULLINS_me.bin
> +LINUX_FIRMWARE_FILES += radeon/MULLINS_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/MULLINS_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/MULLINS_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/MULLINS_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_me.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/OLAND_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/PALM_me.bin
> +LINUX_FIRMWARE_FILES += radeon/PALM_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_me.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/PITCAIRN_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/R100_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/R200_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/R300_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/R420_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/R520_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/R600_me.bin
> +LINUX_FIRMWARE_FILES += radeon/R600_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/R600_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/R600_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/R700_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/REDWOOD_me.bin
> +LINUX_FIRMWARE_FILES += radeon/REDWOOD_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/REDWOOD_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/REDWOOD_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/RS600_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/RS690_cp.bin
> +LINUX_FIRMWARE_FILES += radeon/RS780_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RS780_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RS780_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/RV610_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV610_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV620_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV620_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV630_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV630_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV635_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV635_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV670_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV670_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV710_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV710_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV710_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/RV710_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/RV730_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV730_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV730_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/RV740_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/RV770_me.bin
> +LINUX_FIRMWARE_FILES += radeon/RV770_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/RV770_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/RV770_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/SUMO2_me.bin
> +LINUX_FIRMWARE_FILES += radeon/SUMO2_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/SUMO_me.bin
> +LINUX_FIRMWARE_FILES += radeon/SUMO_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/SUMO_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/SUMO_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_me.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/TAHITI_uvd.bin
> +LINUX_FIRMWARE_FILES += radeon/TURKS_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/TURKS_me.bin
> +LINUX_FIRMWARE_FILES += radeon/TURKS_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/TURKS_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_mc2.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_me.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/VERDE_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_me.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/bonaire_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/hainan_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/hainan_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/hainan_me.bin
> +LINUX_FIRMWARE_FILES += radeon/hainan_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/hainan_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/hainan_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_me.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/hawaii_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/kabini_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/kabini_me.bin
> +LINUX_FIRMWARE_FILES += radeon/kabini_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/kabini_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/kabini_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/kabini_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_me.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_mec2.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/kaveri_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/mullins_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/mullins_me.bin
> +LINUX_FIRMWARE_FILES += radeon/mullins_mec.bin
> +LINUX_FIRMWARE_FILES += radeon/mullins_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/mullins_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/mullins_sdma.bin
> +LINUX_FIRMWARE_FILES += radeon/oland_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/oland_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/oland_me.bin
> +LINUX_FIRMWARE_FILES += radeon/oland_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/oland_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/oland_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/pitcairn_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/pitcairn_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/pitcairn_me.bin
> +LINUX_FIRMWARE_FILES += radeon/pitcairn_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/pitcairn_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/pitcairn_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/tahiti_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/tahiti_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/tahiti_me.bin
> +LINUX_FIRMWARE_FILES += radeon/tahiti_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/tahiti_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/tahiti_smc.bin
> +LINUX_FIRMWARE_FILES += radeon/verde_ce.bin
> +LINUX_FIRMWARE_FILES += radeon/verde_mc.bin
> +LINUX_FIRMWARE_FILES += radeon/verde_me.bin
> +LINUX_FIRMWARE_FILES += radeon/verde_pfp.bin
> +LINUX_FIRMWARE_FILES += radeon/verde_rlc.bin
> +LINUX_FIRMWARE_FILES += radeon/verde_smc.bin

Hum, this is a rather long and boring list of files. Let's try to be a
bit smarter, and do something like:

LINUX_FIRMWARE_RADEON_FILES = \
	ARUBA_me ARUBA_pfp ARUBA_rlc BARTS_mc BARTS_me \
	BARTS_pfp BARTS_smc BONAIRE_ce BONAIRE_mc BONAIRE_mc2 \
	.... to be completed ...

LINUX_FIRMWARE_FILES += $(foreach f,$(LINUX_FIRMWARE_RADEON_FILES),radeon/$(f).bin)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
