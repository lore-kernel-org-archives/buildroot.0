Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04DDC02195
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1549820D8;
	Mon,  3 Feb 2025 15:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDesu3-ud1Bi; Mon,  3 Feb 2025 15:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A4C781FB2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A4C781FB2;
	Mon,  3 Feb 2025 15:47:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 97D99185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 873EB414BD
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRJC87I3Y-Tq for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D99984089A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D99984089A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D99984089A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:47:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.121.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3KTo-1tEtDy2DeE-00vJIm; Mon, 03
 Feb 2025 16:47:08 +0100
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>
Date: Mon,  3 Feb 2025 16:46:51 +0100
Message-ID: <20250203154651.2790784-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:eWMqmQXXWsueDbQwqmohtSgGzB4oig/RRazQ6P/6Z4NQJPwp7ch
 J1wJvEK30aNgvVyXYZ0/TGljmFBYCZE85wTwiIywhdYZIChE1GTWi87yp04LusJdc7iJtXM
 6hBwG5vi8kJeeuVEh9naskn5DSaf8NnKBLSjQdGnw3d/K1TSbvcZhc/07n6EZweK6lowmHJ
 HOz0/qL0TgNlWuEsm2EDQ==
UI-OutboundReport: notjunk:1;M01:P0:ml8LUzb+O6k=;h0iUbox7D8eZs07Bely/P+mVGjC
 H5zdSORMDxaH+0+qBwkNDsUwF12pNlmrrpjWwcveurisUJyDrdYtCkqKUYD8h1b/eiZwwmd/N
 n8vZat+tjE33Afiw47sb8n4ts0SL8l4o2zFH33uouBGh5q2MgBiizNa+hZcvEM8ggQHcOk8gh
 YodLRHrfoNKOTAyv+p5q80k8wYP9qiFr7c04Pw10IRJ1Y2Jhzno6RJrfAS8IRTFyEJQq3rVbf
 8u6OXsb8wGldNsIW1VDrMu4ul7CJq92AQx78AzTslfezTuUvNpot2dFGSeAox7GMIKo4FIqsM
 kbMtfsqvML5N0W9fME/8kWwPJRibKBSlHXzkdYCjn5afHnTpobtxS5kQBfDmPmh0iMMPxBHei
 NEQQ+jAtFeSiN9LSgFOwq7Uml3ZGibxGhKFD4krInb5YtZKO2LnKeorM/FQaW/GHrSCb0hnVt
 LZcWvtzZxrjOTv25OLG8sJQMCoCfBe3EySWcT0Suw8iAjPdJ6r8n17F46LaaAYaxOKANC/rnq
 3slqsFIRMf1wSyi6e0+RfyLhtUbpG60aZwzf7itoRXuAvCadCkfG+TiphkZesthQi/LJN+u7b
 2a66kf0y2Jv8RvzQks4zXiMXzSBYYaouYWrWs534B/O8FuvrrWQf32RNNGSY1YNvPBx0wZklY
 jA4COZfK0edYOam3mlb2+keYNgfkxyRDk9eTkRJ2Ug+txWw4ZT+S0F16eJfNhUfLebjx6VHgS
 2GTrsZa/y+qsW4HOnehamLnyf+k/ARu0HtvmI1ZEY/lTCyH4tmXQPZYCMNzO46nHuWNeHLTSN
 wnh9qfjxf/RkT5AUdTmCAkPaQr4Ef2OBz3c321lVvejIS/ixLAA+HBwiqX9YaDSWI7fJktpRQ
 gW1FFiPuK8XFoby15amNwdvWEFj2ldh4Io++osiAn38GfjElJg3amqUMTmrors3nIRLpBXFs3
 /zohK288uEQ+k6t7QMHIrMPRb9J6ezLukV4NNEgsEJrF0fhzm86Oi5RpaXItWLTNKe0JmXzXT
 K9rRqIvJnAwglNR5KIyDz1y0foW3gK24dixvf/Qhnlcq4z2PArkiT2LG4uYjHdqtSCoJpeX+M
 OZRQe7s+boOGn9zg+uBCP51P1y3Z12sV64YBBEhLnQgw+yxblpwFtWM7XUYsheySnfTUm4hPk
 D7n1Piz5bminOpTg3GyGHk0iPj6sR2ZXjWdneyNTp0NjEqg95IRABdwQal1t/OOuZX+jjg6ks
 gH+Y1FFKtA5YDE9U5w4INNZfNhKpFURAK8ZOCNPEdMFyPWbpN8eVgMHAL4sd0Q9VbUiZadWIz
 cFxx4UEtPt+i9hj0NNcrIUtyFJkOSga1IhPzeqkxFvQbSg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738597628; x=1739202428; i=fiona.klute@gmx.de;
 bh=v2Us2Qius8boCsngVW2pOPG8AfpXgJrtcjvcbNkxZ+s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=fLtRHHqFyJLVedMgAOISsG+nQzAYDbikdZi1VKF5VMb9jOgH+RRVOj8EVkt9bT0Q
 1cZA57kQis/HarbffZkjHhR/nFMZGsBQDncBq2GidOV88HvKWWBc0kdCODpwFHJAc
 vBrqbFqz8MlX+8/3nb2Se/ox4qpLVtpu+02tPnuyce+N+YW7E8EKCAvzi9lGZ8CIG
 nU5E3wCbbiWeSjlAauMAhEIT3AULe8UlB4a9wp5Nlxh/p/QMmdjwN4une3oWGAj2U
 avNm3FnQaVAYZCQ4T+cMLpGMRBE4B8VNpTjbPy8HVoh62LYh5FER+rzjPPX2u3rbZ
 yhP6tU72w2Bjo4ys0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=fLtRHHqF
Subject: [Buildroot] [PATCH 1/1] package/custom-dtbs: tool to build DTB/DTBO
 outside kernel build
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
kernel being built.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I originally created this package to compile custom overlays for
Raspberry Pi based devices, and added support for full device trees
after Linux 6.12 broke drop-in DTB builds. It works for those cases,
but it's possible that there are corner cases (or different
architecture requirements) that won't work.

The reason it's a package and not integrated into the kernel build
infrastructure is simply that it's easier to handle in an external
tree as a package, I'm happy with either approach if there's interest
in merging in principle.

 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/custom-dtbs/Config.in      | 20 +++++++++++++
 package/custom-dtbs/Makefile       | 37 ++++++++++++++++++++++++
 package/custom-dtbs/custom-dtbs.mk | 45 ++++++++++++++++++++++++++++++
 5 files changed, 104 insertions(+)
 create mode 100644 package/custom-dtbs/Config.in
 create mode 100644 package/custom-dtbs/Makefile
 create mode 100644 package/custom-dtbs/custom-dtbs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7b1756a18..05913923f0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1091,6 +1091,7 @@ F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
 F:	package/*/S*
+F:	package/custom-dtbs/
 F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-dunamai/
diff --git a/package/Config.in b/package/Config.in
index 04dd9f36b6..bb8df4bc53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endmenu
 	source "package/cpuburn-arm/Config.in"
 	source "package/crucible/Config.in"
 	source "package/cryptsetup/Config.in"
+	source "package/custom-dtbs/Config.in"
 	source "package/cwiid/Config.in"
 	source "package/dahdi-linux/Config.in"
 	source "package/dahdi-tools/Config.in"
diff --git a/package/custom-dtbs/Config.in b/package/custom-dtbs/Config.in
new file mode 100644
index 0000000000..c7bee8b18c
--- /dev/null
+++ b/package/custom-dtbs/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_CUSTOM_DTBS
+	bool "build custom device tree binaries"
+	select BR2_PACKAGE_HOST_DTC
+	select BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT if BR2_LINUX_KERNEL_DTS_SUPPORT
+	help
+	  This package builds a configurable list of DTB/DTBO
+	  files. DTB files are installed to $(BINARIES_DIR), DTBO
+	  files to $(BINARIES_DIR)/overlays, selected by the matching
+	  source file names (.dts/.dtso).
+
+if BR2_PACKAGE_CUSTOM_DTBS
+
+config BR2_PACKAGE_CUSTOM_DTBS_SOURCE
+	string "DTS/DTSO files to build"
+	default ""
+	help
+	  Space separated list of files, names must end in .dts or
+	  .dtso.
+
+endif # BR2_PACKAGE_CUSTOM_DTBS
diff --git a/package/custom-dtbs/Makefile b/package/custom-dtbs/Makefile
new file mode 100644
index 0000000000..5e4cdcb8a2
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
+	$(DTC) -@ -I dts -O dtb -o $@ -b 0 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $<.tmp
+endef
+
+%.dtbo: %.dtso Makefile
+	$(DTB_BUILD_CMDS)
+
+%.dtb: %.dts Makefile
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
index 0000000000..a090bbc465
--- /dev/null
+++ b/package/custom-dtbs/custom-dtbs.mk
@@ -0,0 +1,45 @@
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
+	$(LINUX_DIR)/include \
+	$(LINUX_DIR)/scripts/dtc/include-prefixes
+
+ifeq ($(BR2_PACKAGE_CUSTOM_DTBS)$(strip $(shell echo $(BR2_PACKAGE_CUSTOM_DTBS_SOURCE))),y)
+$(error DTB(O)s to build not defined, check "BR2_PACKAGE_CUSTOM_DTBS_SOURCE")
+endif
+
+CUSTOM_DTBS_DTBOS = $(subst .dts,.dtb,$(notdir $(shell echo $(BR2_PACKAGE_CUSTOM_DTBS_SOURCE))))
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
+	DTBS="$(CUSTOM_DTBS_DTBOS)"
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
