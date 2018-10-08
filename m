From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 18:11:54 +0200
Subject: [Buildroot] [git commit] linux-firmware: fix hash of WHENCE license
 file
Message-ID: <20181008161124.2E1BC8E45C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=964521fbecac98022cf81cff4f3daa1713d28395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In linux-firmware.hash WHENCE sha256 is wrong causing make legal-info to
fail, due to the latest version bump of linux-firmware.

The changes to the WHENCE file are summarized below:
- update mrvl/usb8801_uapsta.bin to version W14.68.36.p131
- remove amdgpu/vegam_me_2.bin
- add qed/qed_init_values_zipped-8.37.7.0.bin
- add brcm/brcmfmac43430-sdio.AP6212.txt and
  brcm/brcmfmac43430-sdio.MUR1DX.txt config files under GPLv2
- update ti-connectivity/wl18xx-fw-4.bin to version 8.9.0.0.79
- update intel/ibt-hw-37.8.10-fw-22.50.19.14.f.bseq to version
  BT_StonePeak_D1_REL_52_00005
- update intel/ibt-11-5.ddc to version LnP/SfP_REL0487
- update intel/ibt-11-5.sfi to version BT_LightningPeak_REL0487
- update intel/ibt-12-16.ddc to version BT_WindStormPeak_REL0244
- update intel/ibt-12-16.sfi to version BT_WindStormPeak_REL0244
- update intel/ibt-17-16-1.* to version BT_JeffersonPeak_B0_B0_REL0329
- update intel/ibt-17-2.* to version BT_JeffersonPeak_B0_B0_REL0329
- update intel/ibt-18-16-1.* to version BT_ThunderPeak_B0_B0_REL0329
- update intel/ibt-18-2.* to version BT_ThunderPeak_B0_B0_REL0329
- add rtl_bt/rtl8822cu_fw.bin
- add mediatek/mt7622pr2h.bin version 20180621204904
- add mediatek/mt7610u.bin version 2.6
- add mediatek/mt7662u.bin version 1.5
- add mediatek/mt7662u_rom_patch.bin version 0.0.2_P48
- point to LICENCE.mediatek for Mediatek binaries above
- update netronome/flower version to AOTC-2.9.A.31
- update Qualcomm venus-5.2 version to 5.2-00023
- add mellanox/mlxsw_spectrum-13.1702.6.mfa2 and
  mellanox/mlxsw_spectrum-13.1703.4.mfa2 under new Copyright covering
  2017-2018
- add cadence/mhdp8546.bin version 1.2.12 pointing to LICENCE.cadence
  for licensing informations

Recalculate locally and update it.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/linux-firmware.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.hash b/package/linux-firmware/linux-firmware.hash
index ba0de28848..ca6ad8f59d 100644
--- a/package/linux-firmware/linux-firmware.hash
+++ b/package/linux-firmware/linux-firmware.hash
@@ -27,5 +27,5 @@ sha256 8542aeabf2761935122d693561e16766ce1bcc2b0d003204f9040b7d6d929f2e LICENSE.
 sha256 be904cd28cb292b80cdb6cf412ab0d9159d431671e987ad433c1f62e0988a9bc LICENSE.qcom
 sha256 fc6223d4bfe9f2f9e2eddc44b9fe5721d0caf49f01cb08d602906add686d8c6f LICENSE.radeon
 sha256 2bdd2e716f05d9737d3f9a20f9a3a3c0caee0e866100ddb0673f1178e42f92b9 LICENSE.sdma_firmware
-sha256 a2cb7fe112a70132b423aa5db5fdb206bb0bfb89b2fbeb2c38a60ed7da57a3ba WHENCE
+sha256 ef38a9a8bb4b0f72b369d337426eea63ef8fc9d48453f127028d935f7dbc5820 WHENCE
 sha256 fa43e1b9a13b341a07adca9dbe73d0f9072d7966fdfe811c01f0dd2872d7309a qcom/NOTICE.txt
