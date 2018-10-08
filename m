From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:12:48 +0200
Subject: [Buildroot] [PATCH v2] linux-firmware: fix build failure on
 legal-info
In-Reply-To: <20181003141120.31516-1-giulio.benetti@micronovasrl.com>
References: <20181003044542.hrqjjfbxoic56hpb@sapphire.tkos.co.il>
 <20181003141120.31516-1-giulio.benetti@micronovasrl.com>
Message-ID: <20181008181248.07497798@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 16:11:20 +0200, Giulio Benetti wrote:
> In linux-firmware.hash WHENCE sha256 is wrong causing make legal-info to
> fail.
> This is due to version bumping.
> 
> Summarized changes follow:
> - update mrvl/usb8801_uapsta.bin to version W14.68.36.p131
> - remove amdgpu/vegam_me_2.bin
> - add qed/qed_init_values_zipped-8.37.7.0.bin
> - add brcm/brcmfmac43430-sdio.AP6212.txt and
>   brcm/brcmfmac43430-sdio.MUR1DX.txt config files under GPLv2
> - update ti-connectivity/wl18xx-fw-4.bin to version 8.9.0.0.79
> - update intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq to version
>   BT_StonePeak_D1_REL_52_00005
> - update intel/ibt-11-5.ddc to version LnP/SfP_REL0487
> - update intel/ibt-11-5.sfi to version BT_LightningPeak_REL0487
> - update intel/ibt-12-16.ddc to version BT_WindStormPeak_REL0244
> - update intel/ibt-12-16.sfi to version BT_WindStormPeak_REL0244
> - update intel/ibt-17-16-1.* to version BT_JeffersonPeak_B0_B0_REL0329
> - update intel/ibt-17-2.* to version BT_JeffersonPeak_B0_B0_REL0329
> - update intel/ibt-18-16-1.* to version BT_ThunderPeak_B0_B0_REL0329
> - update intel/ibt-18-2.* to version BT_ThunderPeak_B0_B0_REL0329
> - add rtl_bt/rtl8822cu_fw.bin
> - add mediatek/mt7622pr2h.bin version 20180621204904
> - add mediatek/mt7610u.bin version 2.6
> - add mediatek/mt7662u.bin version 1.5
> - add mediatek/mt7662u_rom_patch.bin version 0.0.2_P48
> - point to LICENCE.mediatek for Mediatek binaries above
> - update netronome/flower version to AOTC-2.9.A.31
> - update Qualcomm venus-5.2 version to 5.2-00023
> - add mellanox/mlxsw_spectrum-13.1702.6.mfa2 and
>   mellanox/mlxsw_spectrum-13.1703.4.mfa2 under new Copyright covering
>   2017-2018
> - add cadence/mhdp8546.bin version 1.2.12 pointing to LICENCE.cadence
>   for licensing informations
> 
> Recalculate locally and update it.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> Changes V1->V2:
> * describe changes for WHENCE file

Applied to master with a tweaked commit title/log, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
