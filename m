From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 15 Jul 2016 15:23:06 -0400
Subject: [Buildroot] [PATCH v7 0/2] ARM: ts4800: add basic board support
Message-ID: <1468610588-9709-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds support for the TS-4800 SoM manufactured by
Technologic Systems based on the Freescale i.MX515 SoC.

Changes v6->v7:
	- moved package to boot/
Changes v5->v6:
	- removed mbrboot source as it was published by Technologic System
	- removed custom U-boot v2016.07 which is now the default version in
	  BR
Changes v4->v5:
	- remove the unnecessary section from mbrboot binary to fix build
with Linaro toolchain
	- cleanup Makefile
	- delete all the unnecessary defconfig options

Patrick Keroulas (2):
  boot: add ts4800-mbrboot package
  configs: add defconfig for TS-4800

 board/technologic/ts4800/genimage.cfg   | 37 +++++++++++++++++++++++++++++++++
 board/technologic/ts4800/linux.fragment |  3 +++
 board/technologic/ts4800/post-image.sh  | 22 ++++++++++++++++++++
 boot/Config.in                          |  1 +
 boot/ts4800-mbrboot/Config.in           |  7 +++++++
 boot/ts4800-mbrboot/ts4800-mbrboot.mk   | 20 ++++++++++++++++++
 configs/ts4800_defconfig                | 19 +++++++++++++++++
 7 files changed, 109 insertions(+)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100755 board/technologic/ts4800/post-image.sh
 create mode 100644 boot/ts4800-mbrboot/Config.in
 create mode 100644 boot/ts4800-mbrboot/ts4800-mbrboot.mk
 create mode 100644 configs/ts4800_defconfig

-- 
1.9.1
