Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA4EC02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 14:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E952406C1;
	Thu, 23 Jan 2025 14:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SL3d3t3oOJIq; Thu, 23 Jan 2025 14:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6299F40663
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6299F40663;
	Thu, 23 Jan 2025 14:40:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A3206B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 14:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E3A340FD5
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 14:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s5cgJ_Kr5Ip for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 14:40:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 73A9D40F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73A9D40F49
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73A9D40F49
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 14:40:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.120.49]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRfl-1t4Oey0yN7-00cgt7; Thu, 23
 Jan 2025 15:40:53 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Jan 2025 15:40:32 +0100
Message-ID: <20250123144032.1429434-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:bOSiv7o1et1kC5rJ4yQVKegJ2jsNaFqvS9/zxryN4O+mCek62dg
 w9Q8HSamZpBZ6kssTMZa17GVE6hK3/YlBCTntnjiisOiOhHX9aeNRZ2j8HgeqXgjdOUEEPq
 YkGI86ek4k7jBLyRIsZDAIJ/lPz8W92B6hFX+pS+5TlRtMVCIalxHTxACP49AtBwQGq5hq0
 hI8I5eL7j19fMsMb/xZ/Q==
UI-OutboundReport: notjunk:1;M01:P0:vNXB9Rhveb0=;logc+QkkOFg1qzUl1uuY7+944Zd
 vxit3ML1nZHNH+AXTLbEXZP7yx37f1TQg+QtWptQlIqfUdVPFt6Kgjn3YFd7iPrqL5QTJhYTr
 /sc6/Asza9rEH5vgg5Pv1LZPVOCVylXVELoR9bun6thYrqrUqCDPGceDTy+O1igmOb5eTtExF
 ZsCUyONl8nPPtXK5DjY+FwX4ivaSe//4/qS/jeOZbtE3JMRmEjFRtErJ4fs4Ed/784nOWpy5t
 2kYXmiXcIwCBk4VDFr3QAax1HE9LG/J3GeydniTdUwi3+HA8bSoi6nxwSiJRtEe0NRcpYBQNR
 56qznkd7Mn8m8E1u7SwOz31T5jfgDs7wOdYpgvqjw6gQ9k5cgyU8/S2bLx5rAMMcIIcpyCL48
 /zPdH0FlJaDGJSxhRo6IgOGgfXjOEjZKnaWJwIikTSj6W1+h6WFpvdSTCtAsD0U8dvtdQQ68e
 a+MwgcCXpMbWRs+PpBM+0whi3GLG9cT4/8pV47e2Yd05NgdRRLj7YVU9G3iQkev9MRE9iKxqp
 3S/LYdYY/qZHu+gx1nbcPqAVnD6ksCZFdmO99UqLDcdAGZ1IW78jG8luDI6DeaHTgkY8o4qIF
 /Kn8iXBQdeitWAV5iKsDUB7XnBulv12Fc97/yqsnMHfcw8s1p12RLR/JlL6UCKSu+OdAmvKEH
 8SyaHvWw0p87Bj7+mXUKCC0S1lyH+zVvqqJ1qT+Ps31hVvidDKCpRugj2JRbSFDqDirQcjEJV
 zUpyPpMJsBrwfv/civEiNC/U+3pR3gCvzyEu3v5HfE86phbHxBo/FicbnydXsH3AmsI5y+Ucl
 hbMujChzDiU4V2NAO6rK23Q1xundpoZXvsqVuuHYY8XLyYi/p1xlGJHMghSJhATOBB0xVBqi+
 enAfgS3Zm3GiFx2gSIcZ/DOH8E+p90wodLDfrcbcd5GkT8IPR2HVTZicFDTVIlMbxBDtikLaM
 JBHuxr41nIjH1AoOep1B4jUqm0Pb0ytaCSkg12URHT2tQM79Lg0+nAg7ObLJaFPbV4k8po6+W
 mQvd36nK8VmT41x4MTVRaonFUb6ZDlpKkICAIYUpFwd1WstAR6aRGQtTCzZrNG0fLrB4QbVwE
 iM/99F/qjFd5xhuOxbyREP0/rF7SuL0VcVXGVClE04xd40ghAD+cPst3kPtYb2cLmyHzy1lbh
 H/iAp0tmad0npYWc8jAU/54E3wSd8dgNZ0oINcZHADzZCK+voEZMb+RmApc74KJRVz2wFBKJ1
 U+rGymDYbp7hcFI/FCuoum9XtERlFhxfTvEZN5qPQDxJAcnF0iAAparPN7+hfreoRzGGkoSIm
 Ul/vjErIbai9DUEuiHVHYhQHXvX1xwY2MyRpNwCpVLkpctZuKph1M0gQqkqib40YsmrNEOU5v
 YTEc1cDNcjjSHDWw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1737643253; x=1738248053; i=fiona.klute@gmx.de;
 bh=sO/vK06yBQajKjUqtpstN8h1xWaFcu/W7YlcryaJ3kA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Ino5L9hMyvZX3OGSm4Qf+Y1KUdmZvTKhiaZeGeP5qCRgw9qx2ZUUBxZIbCjzTmwP
 UzjPObnZcNYRg2E3XeQ7I8et6nYD0P7txL9eiCgaqFyhQsfsLXYX0SGqcNROLoQ2C
 vqK6pZ+HDX1IhAmn8YXLdqKphiP9t0YSxm/J15/uJFJCWgUpErLUmgihcQ0QQTWNR
 KOx/nBjSk78JMrAKE+nRz2t3P5DzIQve54BuTfScXas9lX3u7IVu5fT6cUM6ubC4b
 4UwJwOWs3tpDxM5GZJqCuIAzluioT2yRDqRE5cEKg+VPE3chkbWUC1KOsZi0VZp8Z
 9rBfqRnEI+l9mH4RFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Ino5L9hM
Subject: [Buildroot] [PATCH 1/1] package/panel-mipi-dbi-firmware: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This package supports building and installing initialization command
firmware files for use with the panel-mipi-dbi DRM driver. To use the
package, initialization commands for the specific display(s) must be
provided in text form.

See:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/tiny/Kconfig?id=7004a2e46d1693848370809aa3d9c340a209edbb#n70
https://github.com/notro/panel-mipi-dbi/wiki

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/panel-mipi-dbi-firmware/Config.in     | 29 +++++++++++++++
 .../panel-mipi-dbi-firmware.hash              |  3 ++
 .../panel-mipi-dbi-firmware.mk                | 35 +++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/panel-mipi-dbi-firmware/Config.in
 create mode 100644 package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash
 create mode 100644 package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dbb028998a..c0ab17c5ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1091,6 +1091,7 @@ F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
+F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-dunamai/
 F:	package/python-poetry-dynamic-versioning/
diff --git a/package/Config.in b/package/Config.in
index 400183516e..3f4dd42cbe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -449,6 +449,7 @@ menu "Firmware"
 	source "package/linux-firmware/Config.in"
 	source "package/murata-cyw-fw/Config.in"
 	source "package/odroidc2-firmware/Config.in"
+	source "package/panel-mipi-dbi-firmware/Config.in"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
diff --git a/package/panel-mipi-dbi-firmware/Config.in b/package/panel-mipi-dbi-firmware/Config.in
new file mode 100644
index 0000000000..08ed51f594
--- /dev/null
+++ b/package/panel-mipi-dbi-firmware/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE
+	bool "panel-mipi-dbi firmware"
+	help
+	  Build and install firmware files for the panel-mipi-dbi DRM
+	  driver. The driver requires firmware file(s) to provide
+	  initialization commands for the specific display(s) in
+	  use. The initialization commands are written in text form
+	  and converted to the binary format during the build.
+
+	  If you select this package you will be prompted for the
+	  initialization command file(s) to build firmware from.
+
+	  https://github.com/notro/panel-mipi-dbi
+
+if BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE
+
+config BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE
+	string "Source files for panel-mipi-dbi firmware"
+	default ""
+	help
+	  Space separated list of initialization command files for
+	  displays used with the panel-mipi-dbi driver. The files will
+	  be converted to binary format and installed to /lib/firmware
+	  in the rootfs. The binary files will use the basenames of
+	  the input files, plus a .bin ending. The basename of each
+	  file must match the first element of the "compatible" device
+	  tree property of the display the file is for.
+
+endif # BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE
diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash
new file mode 100644
index 0000000000..cb06ae66ee
--- /dev/null
+++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  6d57b140dca0241079b186027e72a9168843bd1b6427536dcd422b7a9b6dc53f  panel-mipi-dbi-firmware-1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e-git4.tar.gz
+sha256  e3f98ddc0b15dae65c5661d6c8403a007f30e2f04bcb6170526da609e3fcfd05  mipi-dbi-cmd
diff --git a/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
new file mode 100644
index 0000000000..c3a9fa7afc
--- /dev/null
+++ b/package/panel-mipi-dbi-firmware/panel-mipi-dbi-firmware.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# panel-mipi-dbi-firmware
+#
+################################################################################
+
+PANEL_MIPI_DBI_FIRMWARE_VERSION = 1cbd40135a8c7f25d7b444a7fac77fd3c3ad471e
+PANEL_MIPI_DBI_FIRMWARE_SITE = https://github.com/notro/panel-mipi-dbi.git
+PANEL_MIPI_DBI_FIRMWARE_SITE_METHOD = git
+PANEL_MIPI_DBI_FIRMWARE_LICENSE = CC0-1.0
+# license info is directly in the only source file
+PANEL_MIPI_DBI_FIRMWARE_LICENSE_FILES = mipi-dbi-cmd
+
+PANEL_MIPI_DBI_FIRMWARE_DEPENDENCIES = host-python3
+
+BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_BIN = $(addsuffix .bin,$(basename $(notdir $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)))))
+
+define PANEL_MIPI_DBI_FIRMWARE_BUILD_CMDS
+	for source in $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)) ; do \
+		$(HOST_DIR)/bin/python $(@D)/mipi-dbi-cmd "$(@D)/$$(basename $${source%.*}).bin" "$${source}" ; \
+	done
+endef
+
+define PANEL_MIPI_DBI_FIRMWARE_INSTALL_TARGET_CMDS
+	for bin in $(shell echo $(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_BIN)); do \
+		$(INSTALL) -m 0644 -D "$(@D)/$${bin}" "$(TARGET_DIR)/lib/firmware/$${bin}" ; \
+	done
+endef
+
+# installing firmware requires source, give a clear error message if missing
+ifeq ($(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE)$(call qstrip,$(BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE)),y)
+$(error No panel-mipi-dbi firmware source selected, check your BR2_PACKAGE_PANEL_MIPI_DBI_FIRMWARE_SOURCE setting)
+endif
+
+$(eval $(generic-package))
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
