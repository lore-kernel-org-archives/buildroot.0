From: spdawson at gmail.com <spdawson@gmail.com>
Date: Wed, 11 Apr 2012 11:02:48 +0100
Subject: [Buildroot] [PATCH] Add lcdproc config options, for driver selection
Message-ID: <1334138568-28717-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/lcdproc/Config.in  |  246 ++++++++++++++++++++++++++++++++++++++++++++
 package/lcdproc/lcdproc.mk |  151 +++++++++++++++++++++++++++-
 2 files changed, 396 insertions(+), 1 deletions(-)

diff --git a/package/lcdproc/Config.in b/package/lcdproc/Config.in
index 6c8614d..1f0f185 100644
--- a/package/lcdproc/Config.in
+++ b/package/lcdproc/Config.in
@@ -5,3 +5,249 @@ config BR2_PACKAGE_LCDPROC
          LCD display driver daemon and clients
 
          http://lcdproc.org/
+
+menu "Drivers"
+	depends on BR2_PACKAGE_LCDPROC
+
+config BR2_PACKAGE_LCDPROC_DRIVER_BAYRAD
+	bool "bayrad"
+	help
+	  Driver for bayrad devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_CFONTZ
+	bool "CFontz"
+	help
+	  Driver for CFontz devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_CFONTZ633
+	bool "CFontz633"
+	help
+	  Driver for CFontz633 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_CFONTZPACKET
+	bool "CFontzPacket"
+	help
+	  Driver for CFontzPacket devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_CURSES
+	bool "curses"
+	default y
+	help
+	  Driver for curses devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_CWLNX
+	bool "CwLnx"
+	help
+	  Driver for CwLnx devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_EA65
+	bool "ea65"
+	help
+	  Driver for ea65 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_EYEBOXONE
+	bool "EyeboxOne"
+	help
+	  Driver for EyeboxOne devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_G15
+	bool "g15"
+	help
+	  Driver for g15 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_GLCDLIB
+	bool "glcdlib"
+	help
+	  Driver for glcdlib devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_GLK
+	bool "glk"
+	help
+	  Driver for glk devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_HD44780
+	bool "hd44780"
+	help
+	  Driver for hd44780 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_I2500VFD
+	bool "i2500vfd"
+	help
+	  Driver for i2500vfd devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_ICP_A106
+	bool "icp_a106"
+	help
+	  Driver for icp_a106 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_IMON
+	bool "imon"
+	help
+	  Driver for imon devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_IMONLCD
+	bool "imonlcd"
+	help
+	  Driver for imonlcd devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_IOWARRIOR
+	bool "IOWarrior"
+	help
+	  Driver for IOWarrior devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_IRMAN
+	bool "irman"
+	help
+	  Driver for irman devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_IRTRANS
+	bool "irtrans"
+	help
+	  Driver for irtrans devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_JOY
+	bool "joy"
+	help
+	  Driver for joy devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_LB216
+	bool "lb216"
+	help
+	  Driver for lb216 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_LCDM001
+	bool "lcdm001"
+	help
+	  Driver for lcdm001 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_LCTERM
+	bool "lcterm"
+	help
+	  Driver for lcterm devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_LIRC
+	bool "lirc"
+	help
+	  Driver for lirc devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_LIS
+	bool "lis"
+	help
+	  Driver for lis devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_MD8800
+	bool "MD8800"
+	help
+	  Driver for MD8800 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_MDM166A
+	bool "mdm166a"
+	help
+	  Driver for mdm166a devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_MS6931
+	bool "ms6931"
+	help
+	  Driver for ms6931 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_MTC_S16209X
+	bool "mtc_s16209x"
+	help
+	  Driver for mtc_s16209x devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_MTXORB
+	bool "MtxOrb"
+	help
+	  Driver for MtxOrb devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_MX5000
+	bool "mx5000"
+	help
+	  Driver for mx5000 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_NORITAKEVFD
+	bool "NoritakeVFD"
+	help
+	  Driver for NoritakeVFD devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_PICOLCD
+	bool "picolcd"
+	help
+	  Driver for picolcd devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_PYRAMID
+	bool "pyramid"
+	help
+	  Driver for pyramid devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SED1330
+	bool "sed1330"
+	help
+	  Driver for sed1330 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SED1520
+	bool "sed1520"
+	help
+	  Driver for sed1520 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SERIALPOS
+	bool "serialPOS"
+	help
+	  Driver for serialPOS devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SERIALVFD
+	bool "serialVFD"
+	help
+	  Driver for serialVFD devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SHUTTLEVFD
+	bool "shuttleVFD"
+	help
+	  Driver for shuttleVFD devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SLI
+	bool "sli"
+	help
+	  Driver for sli devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_STV5730
+	bool "stv5730"
+	help
+	  Driver for stv5730 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SUREELEC
+	bool "SureElec"
+	help
+	  Driver for SureElec devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_SVGA
+	bool "svga"
+	help
+	  Driver for svga devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_T6963
+	bool "t6963"
+	help
+	  Driver for t6963 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_TEXT
+	bool "text"
+	help
+	  Driver for text devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_TYAN
+	bool "tyan"
+	help
+	  Driver for tyan devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_ULA200
+	bool "ula200"
+	help
+	  Driver for ula200 devices
+
+config BR2_PACKAGE_LCDPROC_DRIVER_XOSD
+	bool "xosd"
+	help
+	  Driver for xosd devices
+
+endmenu
diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index e8919e9..e0964a5 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -7,7 +7,156 @@ LCDPROC_VERSION = 0.5.5
 LCDPROC_SOURCE = lcdproc-$(LCDPROC_VERSION).tar.gz
 LCDPROC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/lcdproc/lcdproc/$(LCDPROC_VERSION)
 
-LCDPROC_CONF_OPT = --enable-drivers=all
+LCDPROC_DRIVERS =
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_BAYRAD),y)
+	LCDPROC_DRIVERS += bayrad
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_CFONTZ),y)
+	LCDPROC_DRIVERS += CFontz
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_CFONTZ633),y)
+	LCDPROC_DRIVERS += CFontz633
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_CFONTZPACKET),y)
+	LCDPROC_DRIVERS += CFontzPacket
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_CURSES),y)
+	LCDPROC_DRIVERS += curses
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_CWLNX),y)
+	LCDPROC_DRIVERS += CwLnx
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_EA65),y)
+	LCDPROC_DRIVERS += ea65
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_EYEBOXONE),y)
+	LCDPROC_DRIVERS += EyeboxOne
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_G15),y)
+	LCDPROC_DRIVERS += g15
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_GLCDLIB),y)
+	LCDPROC_DRIVERS += glcdlib
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_GLK),y)
+	LCDPROC_DRIVERS += glk
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_HD44780),y)
+	LCDPROC_DRIVERS += hd44780
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_I2500VFD),y)
+	LCDPROC_DRIVERS += i2500vfd
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_ICP_A106),y)
+	LCDPROC_DRIVERS += icp_a106
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_IMON),y)
+	LCDPROC_DRIVERS += imon
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_IMONLCD),y)
+	LCDPROC_DRIVERS += imonlcd
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_IOWARRIOR),y)
+	LCDPROC_DRIVERS += IOWarrior
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_IRMAN),y)
+	LCDPROC_DRIVERS += irman
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_IRTRANS),y)
+	LCDPROC_DRIVERS += irtrans
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_JOY),y)
+	LCDPROC_DRIVERS += joy
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_LB216),y)
+	LCDPROC_DRIVERS += lb216
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_LCDM001),y)
+	LCDPROC_DRIVERS += lcdm001
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_LCTERM),y)
+	LCDPROC_DRIVERS += lcterm
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_LIRC),y)
+	LCDPROC_DRIVERS += lirc
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_LIS),y)
+	LCDPROC_DRIVERS += lis
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_MD8800),y)
+	LCDPROC_DRIVERS += MD8800
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_MDM166A),y)
+	LCDPROC_DRIVERS += mdm166a
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_MS6931),y)
+	LCDPROC_DRIVERS += ms6931
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_MTC_S16209X),y)
+	LCDPROC_DRIVERS += mtc_s16209x
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_MTXORB),y)
+	LCDPROC_DRIVERS += MtxOrb
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_MX5000),y)
+	LCDPROC_DRIVERS += mx5000
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_NORITAKEVFD),y)
+	LCDPROC_DRIVERS += NoritakeVFD
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_PICOLCD),y)
+	LCDPROC_DRIVERS += picolcd
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_PYRAMID),y)
+	LCDPROC_DRIVERS += pyramid
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SED1330),y)
+	LCDPROC_DRIVERS += sed1330
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SED1520),y)
+	LCDPROC_DRIVERS += sed1520
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SERIALPOS),y)
+	LCDPROC_DRIVERS += serialPOS
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SERIALVFD),y)
+	LCDPROC_DRIVERS += serialVFD
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SHUTTLEVFD),y)
+	LCDPROC_DRIVERS += shuttleVFD
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SLI),y)
+	LCDPROC_DRIVERS += sli
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_STV5730),y)
+	LCDPROC_DRIVERS += stv5730
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SUREELEC),y)
+	LCDPROC_DRIVERS += SureElec
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_SVGA),y)
+	LCDPROC_DRIVERS += svga
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_T6963),y)
+	LCDPROC_DRIVERS += t6963
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_TEXT),y)
+	LCDPROC_DRIVERS += text
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_TYAN),y)
+	LCDPROC_DRIVERS += tyan
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_ULA200),y)
+	LCDPROC_DRIVERS += ula200
+endif
+ifeq ($(BR2_PACKAGE_LCDPROC_DRIVER_XOSD),y)
+	LCDPROC_DRIVERS += xosd
+endif
+
+ifeq ($(LCDPROC_DRIVERS),)
+	LCDPROC_DRIVERS = all
+endif
+LCDPROC_CONF_OPT = --enable-drivers=$(shell echo $(LCDPROC_DRIVERS) | sed -e 's/ /,/g')
 
 LCDPROC_DEPENDENCIES = ncurses
 
-- 
1.7.5.4
