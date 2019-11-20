From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 12:07:16 +0800
Subject: [Buildroot] [PATCH 0/9] new board ls1028ardb introduced
Message-ID: <20191120040725.32207-1-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
