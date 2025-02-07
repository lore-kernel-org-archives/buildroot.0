Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEA7C0219C
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 18:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01ECB42CAE;
	Fri,  7 Feb 2025 18:35:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MW_3htDKhmM8; Fri,  7 Feb 2025 18:35:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9C842CC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9C842CC9;
	Fri,  7 Feb 2025 18:35:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6758FCF
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A97AF704FE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYxPThZf6KiE for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 18:35:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CDD8704F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CDD8704F9
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CDD8704F9
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 18:35:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.112.179]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6lpM-1tlPgJ27fa-00179z; Fri, 07
 Feb 2025 19:35:17 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Michael Walle <mwalle@kernel.org>
Date: Fri,  7 Feb 2025 19:34:53 +0100
Message-ID: <20250207183455.1468220-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:0FGtbMhe+s6G38/VEERqu0oyHdo2wwWckB2/8dfkxeWdzzGdknd
 DeJ+J3MrggSbkWKYXyPKsVA8pjUoR7acPbWZoHgcFo+ineyR1gZbTHNzRyLAhPDSQTqAgCh
 fFvyAf4XEjJqlzg+BCTqx+2r5AUHpXXFei5/vdtrtJ5vQQ137y6Z6PdfR4uStdICJtjtp9G
 C6kExmGeAVvc4lUIucnbQ==
UI-OutboundReport: notjunk:1;M01:P0:fw17J3di9ZI=;P07T3QUFsUDLwVJ7rWu7ODThk1Y
 3YeaQ4/fB3B4VrlxsFFKf4+fnJpQauxUdogO2cZ4Dv/1/rMBUPUPKy+DKEN9YVQIoFMl1RnuH
 95zPKzpaGDaHnj1wdwZkUTYvz7mnDrrKemHI5a9S+zW2RefpTMN3c+XEuJ5/GxsczCQjfBj3f
 r/hZ7xcrqmec892uwjFzuqOBwUPpX7SRJp5qfEj6uVPi4NegY7fM8GX6uQBm0mZ2M3wT+zuhM
 ISys/SrRKBfoy6+KCOQYuO+BbltluEj/iEDbKBAz3PMEQi9I3DmJLmSHiHZn51MqQdDMvF2rk
 nmkEN04ZMX/C42XaYSrFExWSf55BjxG20cW33fN8xbKJ/IKEEpgsQZ8lDimvoRy36GmHqtL3g
 7WQVRAF3fqPHenC+PMx60tAJ+D3Od75OMmneQyz0jDGt4xpYioC3vO+S1tZR+Qis6IG5M3Icn
 g23aWrQO56AqiB1zJWVJtErgO0y/sQ2B7Cv5gIsIdpPjmpTw22bQFwI7/nHDiU1rD9fvrf6dZ
 AIUKvZK9kG5cUvBoAtp65vtENjpssSyWZ/1Mp2GkWrhT8g7ImQ49GR/p+Sc8mJMtmwT413x4i
 MKsGE+LUmiQWRBQXAIHIDIJGxG5dlaNI0J3lZSW05ksbcOdOmYTo9RlXa4910WWp/+Z61nhRr
 ijkGMx4IB1UP9zpHisQsSZKgiPWbQXVwJehU2m4KiMXdng6GK5uJha2svQRLYLVrCbXZ/+W/O
 TNbZbvS5zHuPGYAGTaaOiOqVY0M8LEDpos1gfKTtvc3ZcslMn6ZU152FhRVLQz2ZYskgmCEg8
 ueb0XkhgK9xz5YqC0fBuNeEHL+zPLNNq2aIg8TD0c1xmwZ71bW/SnBw7H+0uIcDi5FcFsW/ey
 FIvHhjsL7ZOQdDsDIxRzqTRUyBBFqpyndTBDEcUDJ7EHClZwIm1iN3l7g2jf+YxqU/PNDkNNa
 k6nNaHHtOrSZD0225wpbuRqy7oPR1LXRcSDpkWwYlsATnapfN6oKICrwXymqUssL150BUKn67
 /I5saXPuwwq7GmAnH7H3w3uo/pAg+NyYTW51PuVItZ0fd77UCcW0OQX+mrhtYd1diwCxvsXSm
 hh+rwiceYZWhsgnJApvMNKgIbvHkU82ZkEuRcMGzBDO6vulA6TkLO/t8bNKiu6LRhPfBfx4tE
 BlxQ8O7f6IMFOJm3ACXLYqiBked/nuD0Et4FAMgcGi3+YmDPedMjAlGB7uPPJeGYz4EQqP6Nt
 EuFb94jZwq4ZWDHfCHiruY3MIuAbXE2eS39cmKVYbqaILufwt6gEkwVtXJclrSQdNzYikAzEE
 VJXwQ6bXox8RcHyjYUt8QjcrbxQ57JghRK87Qpt5kluNJoqmXBS6bdMJOzqdA70dX5F6dpRTR
 4o4HdnVwaupr4hUaVIx5Bpg77mJmXZMW8PdWMGKw9i55K/37/9xCXFcvmf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738953317; x=1739558117; i=fiona.klute@gmx.de;
 bh=GlKUyZzrCpRLrc0Po6QRDiysenTgHSqQKGi6XdgA7wE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=bc8OEh/hv44FnNTYDoyVh62zZ1M9hVGqu8i+Falt3ZUZgdcHe677Zz1zGI280x2+
 uOKfPpuf0SOn0ZmLSzXS1k0Pe7dXR3RwpRxHfkm7y/VxF9EITYJwUFSlxfOB3qXwF
 P3+01h9oWSC3cAa+9a+CORxFgUg1uxbgDABq61fhrjz4qTHZPwTOZm5FoYdJZrhzn
 a5TPYGgfFQMkHSw8laP0zi6a6AMpPoodV+NmruFe5z+jMS8sc6dFvOdL61V3Rx8cz
 9Zr7FFKd7HPxVQuKcoTkDHvW+LpRikNCAeS05gP+DE6C16+SF0uHn+6Uoq1EK5gPL
 nILIYzEAHqqkQeQRZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=bc8OEh/h
Subject: [Buildroot] [PATCH v2 1/3] package/custom-dtbs: tool to build
 DTB/DTBO outside kernel build
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

This package builds a configurable list of DTB/DTBO files. DTB files
are installed to $(BINARIES_DIR), DTBO files to
$(BINARIES_DIR)/overlays, selected by the matching source file names
(.dts/.dtso). Source files may include DTS and header files from the
kernel being built, additional .dtsi files can be provided in the
sources list.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2
* add support for drop-in .dtsi files
* add config option to set dtc flags

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/custom-dtbs/Config.in      | 27 ++++++++++++++++
 package/custom-dtbs/Makefile       | 37 ++++++++++++++++++++++
 package/custom-dtbs/custom-dtbs.mk | 49 ++++++++++++++++++++++++++++++
 5 files changed, 115 insertions(+)
 create mode 100644 package/custom-dtbs/Config.in
 create mode 100644 package/custom-dtbs/Makefile
 create mode 100644 package/custom-dtbs/custom-dtbs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 97ec5e2c89..583b818f45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1104,6 +1104,7 @@ F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
+F:	package/custom-dtbs/
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-dunamai/
diff --git a/package/Config.in b/package/Config.in
index 1a9c94027d..e69552ae5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -481,6 +481,7 @@ endmenu
 	source "package/cpuburn-arm/Config.in"
 	source "package/crucible/Config.in"
 	source "package/cryptsetup/Config.in"
+	source "package/custom-dtbs/Config.in"
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
diff --git a/package/custom-dtbs/Config.in b/package/custom-dtbs/Config.in
new file mode 100644
index 0000000000..1f8509f243
--- /dev/null
+++ b/package/custom-dtbs/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_CUSTOM_DTBS
+	bool "build custom device tree binaries"
+	select BR2_PACKAGE_HOST_DTC
+	select BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT if BR2_LINUX_KERNEL_DTS_SUPPORT
+	help
+	  This package builds a configurable list of DTB/DTBO
+	  files. DTB files are installed to $(BINARIES_DIR), DTBO
+	  files to $(BINARIES_DIR)/overlays, selected by the matching
+	  source file names (.dts/.dtso). Any .dtsi files on the list
+	  are made available to include, but not compiled themselves.
+
+if BR2_PACKAGE_CUSTOM_DTBS
+
+config BR2_PACKAGE_CUSTOM_DTBS_SOURCE
+	string "DTS/DTSO files to build"
+	default ""
+	help
+	  Space separated list of files, names must end in .dts,
+	  .dtsi, or .dtso.
+
+config BR2_PACKAGE_CUSTOM_DTBS_DTCFLAGS
+	string "extra flags for dtc"
+	default ""
+	help
+	  Add the provided flags to the dtc invocation.
+
+endif # BR2_PACKAGE_CUSTOM_DTBS
diff --git a/package/custom-dtbs/Makefile b/package/custom-dtbs/Makefile
new file mode 100644
index 0000000000..c1161b9c4a
--- /dev/null
+++ b/package/custom-dtbs/Makefile
@@ -0,0 +1,37 @@
+DTC ?= dtc
+INSTALL ?= install
+OVERLAYS_DIR ?= $(BINARIES_DIR)/overlays
+
+all: $(DTBS)
+
+define DTB_BUILD_CMDS
+	$(CC) -E -nostdinc $(addprefix -I,$(DTC_INCLUDE)) -undef -D__DTS__  -x assembler-with-cpp -o $<.tmp $<
+	$(DTC) $(DTC_FLAGS) -@ -I dts -O dtb -o $@ -b 0 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $<.tmp
+endef
+
+%.dtbo: %.dtso $(DTSIS) Makefile
+	$(DTB_BUILD_CMDS)
+
+%.dtb: %.dts $(DTSIS) Makefile
+	$(DTB_BUILD_CMDS)
+
+clean:
+	rm -f *.dtb *.dts.tmp *.dtbo *.dtso.tmp
+
+install: all
+	for dtb in $(DTBS); do \
+		case "$$dtb" in \
+			*.dtb) \
+				$(INSTALL) -D -m 0644 -t $(BINARIES_DIR)/ "$$dtb"; \
+				;; \
+			*.dtbo) \
+				$(INSTALL) -D -m 0644 -t $(OVERLAYS_DIR)/ "$$dtb"; \
+				;; \
+			*) \
+				echo "don't know how to handle file $$dtb"; \
+				exit 1; \
+				;; \
+		esac \
+	done
+
+.PHONY: clean
diff --git a/package/custom-dtbs/custom-dtbs.mk b/package/custom-dtbs/custom-dtbs.mk
new file mode 100644
index 0000000000..3f7007e321
--- /dev/null
+++ b/package/custom-dtbs/custom-dtbs.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# custom-dtbs
+#
+################################################################################
+
+CUSTOM_DTBS_VERSION = 1.0.0
+CUSTOM_DTBS_SITE = package/custom-dtbs
+CUSTOM_DTBS_SITE_METHOD = local
+CUSTOM_DTBS_INSTALL_TARGET = NO
+CUSTOM_DTBS_INSTALL_IMAGES = YES
+CUSTOM_DTBS_LICENSE = GPL-2.0
+CUSTOM_DTBS_DEPENDENCIES = host-dtc linux
+
+CUSTOM_DTBS_DTC_INCLUDE = \
+	$(@D) \
+	$(LINUX_DIR)/include \
+	$(LINUX_DIR)/scripts/dtc/include-prefixes
+
+ifeq ($(BR2_PACKAGE_CUSTOM_DTBS)$(strip $(shell echo $(BR2_PACKAGE_CUSTOM_DTBS_SOURCE))),y)
+$(error DTB(O)s to build not defined, check "BR2_PACKAGE_CUSTOM_DTBS_SOURCE")
+endif
+
+CUSTOM_DTBS_DTBOS = $(subst .dts,.dtb,$(filter %.dts %.dtso,$(notdir $(shell echo $(BR2_PACKAGE_CUSTOM_DTBS_SOURCE)))))
+CUSTOM_DTBS_DTSIS = $(filter %.dtsi,$(notdir $(shell echo $(BR2_PACKAGE_CUSTOM_DTBS_SOURCE))))
+
+define CUSTOM_DTBS_COPY_SOURCE
+	cp --preserve=timestamps $$(echo $(BR2_PACKAGE_CUSTOM_DTBS_SOURCE)) $(@D)
+endef
+
+CUSTOM_DTBS_PRE_BUILD_HOOKS += CUSTOM_DTBS_COPY_SOURCE
+
+define CUSTOM_DTBS_ENV
+	PATH=$(BR_PATH) \
+	DTC_INCLUDE="$(CUSTOM_DTBS_DTC_INCLUDE)" \
+	DTC_FLAGS="$(shell echo $(BR2_PACKAGE_CUSTOM_DTBS_DTCFLAGS))" \
+	DTBS="$(CUSTOM_DTBS_DTBOS)" \
+	DTSIS="$(CUSTOM_DTBS_DTSIS)"
+endef
+
+define CUSTOM_DTBS_BUILD_CMDS
+	$(CUSTOM_DTBS_ENV) make -C $(@D)
+endef
+
+define CUSTOM_DTBS_INSTALL_IMAGES_CMDS
+	$(CUSTOM_DTBS_ENV) make -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
