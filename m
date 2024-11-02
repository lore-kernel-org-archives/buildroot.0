Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD250E67802
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 15:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ADCF61545;
	Sat,  2 Nov 2024 15:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9dKDqZ92Ylnk; Sat,  2 Nov 2024 15:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B000161544
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B000161544;
	Sat,  2 Nov 2024 15:21:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A9597979
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98C49404B6
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZMsjvCy-2dG for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 15:21:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 15A094010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A094010A
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15A094010A
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 15:21:28 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a139be16dso52670566b.3
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 08:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730560887; x=1731165687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjdo6vRtYR0Ho6cQXNDexsZtg1sOIZGZ8Us3/IOkxuo=;
 b=FWWKx+58TuXZtHTEhc344hhyErRYL0aqAyX0piL+xGBccO+sHAjjmQzu/8nJ/ircH3
 s272gqsheZU3vsik3QVbzzGjSyjDz0uFK50gakWmvx8YNyoAnU7Fh9V2rAJF2OCcMd3x
 X7G/n3B/xy1nukiJ8ZItGg8zFdciUFBx8YQgaws89dhB8wSGtuiHJ9yWDCT6q8fuD4+o
 xWAt0+q8MxXX3p2gDvNdQ/FeVDgd7cfQdwt3Aw5HfT1CdnMtDUoUXKVWanOfXwrBDQMR
 hMERrNBKItRRJRHp8awd5zAW6LXResS7IAM6hcpRvXx+dMYieXI8qn3BsoA+dF3BFX1h
 VySg==
X-Gm-Message-State: AOJu0YzGTqcfxeE2m6mC1JasUoxfS+gmtL0JDbrX57CIrJYjzBcIPyGt
 sF3Rph3IzvKajf8/ZblCKbDSLzeV8KlPdLbf9im9FCNqA/hyj6DG/Xw7WjeH
X-Google-Smtp-Source: AGHT+IGVUEwX/GUf4ZHmwqDQsm0H0a1y0OPj3sYnCYyOmDpfPFl7bLrow68oRdeAh2tOCqljBBdyTQ==
X-Received: by 2002:a05:6402:520d:b0:5cb:6b9f:91fd with SMTP id
 4fb4d7f45d1cf-5cbbf9208e7mr9342131a12.5.1730560886509; 
 Sat, 02 Nov 2024 08:21:26 -0700 (PDT)
Received: from skbuf.lan ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ceac74ced8sm2587535a12.17.2024.11.02.08.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 08:21:25 -0700 (PDT)
From: Vladimir Oltean <olteanv@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <Brandon.Maier@collins.com>,
 Rabeeh Khoury <rabeeh@solid-run.com>, Josua Mayer <josua@solid-run.com>,
 Ioana Ciornei <ciorneiioana@gmail.com>
Date: Sat,  2 Nov 2024 17:21:04 +0200
Message-ID: <20241102152106.2153747-6-olteanv@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241102152106.2153747-1-olteanv@gmail.com>
References: <20241102152106.2153747-1-olteanv@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730560887; x=1731165687; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hjdo6vRtYR0Ho6cQXNDexsZtg1sOIZGZ8Us3/IOkxuo=;
 b=DhkYbVfznIDxuZ5vJqgeB0Zf6EzlUr+mZeReyi5rd0syIaRFlOdYSD3uZ+YmyGPlE2
 IHCfi1wBs+jDELWUBM72gYyGliXUfhOkX8wsJhUVY3Osd88Vjn2hJgny49ueSQf5Ur/R
 yjmOwFfiMjDm13Bk5vKL8gfZVFmsfKkMZE4e4GieBDaFqZidbFTcSAU71xx47lchJHVa
 DF9F+KCFkCBfqHyREbNElwJXLo2QnIpjcfQRkY4eVEZJCXHJ08HPAIejjC1PtwVsjOYM
 0qraLPG7X1eKju6wR22MQADgnA5teYxe0ylusY9y4PFKXehuXmsBXjn9xxR+RQksvGet
 tXZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DhkYbVfz
Subject: [Buildroot] [PATCH 5/7] package/qoriq-restool: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Introduce a package for the restool program, which permits the user to
modify the network configuration of the DPAA2 subsystem and create one
that is adequate to their use case.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/qoriq-restool/Config.in          | 21 +++++++++++++++++++++
 package/qoriq-restool/qoriq-restool.hash |  3 +++
 package/qoriq-restool/qoriq-restool.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 50 insertions(+)
 create mode 100644 package/qoriq-restool/Config.in
 create mode 100644 package/qoriq-restool/qoriq-restool.hash
 create mode 100644 package/qoriq-restool/qoriq-restool.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index ace48c35961c..596a1f8ed36d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3309,6 +3309,7 @@ N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
 F:	package/qoriq-mc-utils/
+F:	package/qoriq-restool/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 47a4648f49a2..d379a762bd55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -598,6 +598,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/qoriq-cadence-dp-firmware/Config.in"
+	source "package/qoriq-restool/Config.in"
 	source "package/raspi-gpio/Config.in"
 	source "package/rdma-core/Config.in"
 	source "package/read-edid/Config.in"
diff --git a/package/qoriq-restool/Config.in b/package/qoriq-restool/Config.in
new file mode 100644
index 000000000000..3f1834a7dce0
--- /dev/null
+++ b/package/qoriq-restool/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_QORIQ_RESTOOL
+	bool "qoriq-restool"
+	help
+	  The DPAA2 architecture in Layerscape SoCs consists of
+	  networking resources that can be assembled into various
+	  nuggets of functionality, called "objects" (DPMAC, DPNI,
+	  DPDMUX, DPSW etc), by the Management Complex (MC) firmware.
+
+	  The MC firmware reads a file called Data Path Layout (DPL)
+	  which describes the set of networking objects it should
+	  create statically, at boot time.
+
+	  The restool program is able to talk to the Management Complex
+	  at runtime and permits the dynamic reconfiguration of
+	  networking objects, as well as saving the current configuration
+	  into a new DPL file. Without the restool program, the only
+	  possible networking configuration is that specified in the
+	  boot-time DPL file.
+
+	  https://github.com/nxp-qoriq/restool
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM # sign in required
diff --git a/package/qoriq-restool/qoriq-restool.hash b/package/qoriq-restool/qoriq-restool.hash
new file mode 100644
index 000000000000..c2332d9b27eb
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  0cfced32caa615266ff633946d40a36660c856d7eb057b81de392570e136c5e5  qoriq-restool-lf-6.6.36-2.1.0.tar.gz
+sha256  68f4b15ecc085729419bc60ca6eeadca5af0237bbfec791e8a79da9c943d42e9  LICENSE
diff --git a/package/qoriq-restool/qoriq-restool.mk b/package/qoriq-restool/qoriq-restool.mk
new file mode 100644
index 000000000000..4a89a80afa70
--- /dev/null
+++ b/package/qoriq-restool/qoriq-restool.mk
@@ -0,0 +1,24 @@
+###############################################################################
+#
+# qoriq-restool
+#
+################################################################################
+
+QORIQ_RESTOOL_VERSION = lf-6.6.36-2.1.0
+QORIQ_RESTOOL_SITE = $(call github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
+QORIQ_RESTOOL_LICENSE = GPL2.0
+QORIQ_RESTOOL_LICENSE_FILES = COPYING
+
+QORIQ_RESTOOL_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CROSS_COMPILE="$(TARGET_CROSS)"
+
+define QORIQ_RESTOOL_BUILD_CMDS
+	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(QORIQ_RESTOOL_MAKE_OPTS)
+endef
+
+define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr install
+endef
+
+$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
