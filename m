From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Fri, 15 Jul 2016 11:00:58 -0400
Subject: [Buildroot] [PATCH v6 0/2] ARM: ts4800: add basic board support
Message-ID: <1468594860-14932-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset adds support for the TS-4800 SoM manufactured by
Technologic Systems based on the Freescale i.MX515 SoC.

Changes v5->v6:
	- removed mbrboot source as it was published by Technologic System
	- removed custom U-boot v2016.07 which is now the default version in
	  BR
Changes v4->v5 (after Peter Korsgaard's review):
	- remove the unnecessary section from mbrboot binary to fix build
with Linaro toolchain
	- cleanup Makefile
	- delete all the unnecessary defconfig options

Patrick Keroulas (2):
  ts4800-mbrboot: new package
  configs: add defconfig for TS-4800

 board/technologic/ts4800/genimage.cfg    | 37 ++++++++++++++++++++++++++++++++
 board/technologic/ts4800/linux.fragment  |  3 +++
 board/technologic/ts4800/post-image.sh   | 22 +++++++++++++++++++
 configs/ts4800_defconfig                 | 19 ++++++++++++++++
 package/Config.in                        |  1 +
 package/ts4800-mbrboot/Config.in         |  5 +++++
 package/ts4800-mbrboot/ts4800-mbrboot.mk | 20 +++++++++++++++++
 7 files changed, 107 insertions(+)
 create mode 100644 board/technologic/ts4800/genimage.cfg
 create mode 100644 board/technologic/ts4800/linux.fragment
 create mode 100755 board/technologic/ts4800/post-image.sh
 create mode 100644 configs/ts4800_defconfig
 create mode 100644 package/ts4800-mbrboot/Config.in
 create mode 100644 package/ts4800-mbrboot/ts4800-mbrboot.mk

-- 
1.9.1
