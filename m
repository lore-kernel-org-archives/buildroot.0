From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:14 +0800
Subject: [Buildroot] [PATCH v2 0/9] new board ls1028ardb introduced
Message-ID: <20191121102324.35225-1-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

changes since v1:
1> According to the feedback from other guys, modify the codes
2> create one new patch to move package/rcw to package/freescale-qoriq/
patches detail in v2:
0001-xxxx: is 0005-xxxx in v1, don't change
0002-xxxx: new patch to move rcw to sub-direcotry "freescale-qoriq"
0003-xxxx: is 0001-xxxx in v1, add-back license hash
0004-xxxx: is 0002-xxxx in v1, add option BR2_PACKAGE_HOST_RCW_ATF
0005-xxxx: is 0003-xxxx in v1, add option BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE
0006-xxxx: is 0004-xxxx in v1, use BR2_PACKAGE_HOST_RCW_ATF ATF
0007-xxxx: is 0006-xxxx in v1, rename to fsl-qoriq-cadence-dp-fw, 
	use the "fsl" to replace freescale, fw to replace firmware,
	update DEVELOPERS
	add license hash
	rewrite makefile
0008-xxxx: is 0007-xxxx in v1, change to unconditional for patches
0009-xxxx: is 0008-xxxx in v1, use BR2_PACKAGE_FSL_QORIQ_CADENCE_DP_FW to DP
0010-xxxx: is 0009-xxxx in v1, add new options

---
The following nine patches is to enable LS1028ARDB board in Buildroot.

NXP LS1028A silicon is based on Arm A72 core and  designed for industry,
some key features are enabled:
  TSN - Time Sensitive Network on Network interface
  TSN/Swith - naive TSN Swith, support six ports
  DP - display port for different resolution up to 4K

The base for these patches is "next" branch, commitID: 5fd8db02ef

1. Upgrade the RCW version to latest version supported via LSDK-19.09
2. Use RCW binary for boot board
3. Intruduce u-boot-dtb.bin for NXP Layerscape serial platform
4. Introduce RCW to Arm-trusted-firmware
5. Create one freescale-qoriq direcotry for all firmware hardware related 
6. LS1028ARDB DP firmware is stored in freescale-qoriq
7. New patches to eanble GPIO interrupt for eNETC and Micro-bus
8. One standard directory for all Layerscape platform
9. LS1028ARDB related scripts and default configurations

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
