Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB88AC67871
	for <buildroot@archiver.kernel.org>; Thu, 27 Oct 2022 08:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 205C340914;
	Thu, 27 Oct 2022 08:56:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 205C340914
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s_t6Y9cU9Jzx; Thu, 27 Oct 2022 08:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7A9C40904;
	Thu, 27 Oct 2022 08:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7A9C40904
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5C2A1BF86C
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 08:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81315404B3
 for <buildroot@lists.busybox.net>; Thu, 27 Oct 2022 08:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81315404B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YCXa95KWjjB0 for <buildroot@lists.busybox.net>;
 Thu, 27 Oct 2022 08:56:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FCD8400E2
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FCD8400E2
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 08:56:33 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id d26so2551014eje.10
 for <buildroot@buildroot.org>; Thu, 27 Oct 2022 01:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2UkAu9DL59ZHUCjE4YeG+A2IqvVz9umOldb3ze7h70w=;
 b=F243W/edV+AFqd4hm8PwgG6ln0qn89/ZMPAI/4P1ssJWvjSoUr4QtOb7KiVeaTV6iw
 ErYOJ+WpcSvPuxmpXTmqeBtSvJNcyI5ns3s1xZsE8N+WseJSlef0frmB/hj6DRlvETNQ
 m//C3MC4vRKQ8zcyISHWCcr73xGmyNKD8zYnDDOGN9IPPcPP7o5CdWNk0FhNq0kAaI4P
 VTjaFBQcvbtEUICPF5UB9MWQzzGzEu/FBV97app7CFBOxrcYjOZM/x3rGG1PuTWV97F/
 8QqojG4IGAHIgRqOzFKUYE1BC/Gwot+Zscw/Q1uZbQPYbuvbs/haW0ZUUc9LKXxIegPL
 X2nQ==
X-Gm-Message-State: ACrzQf2sAAwMHyRUb0UZ+7/LZIN1MV/S6ksqwUwgco2LqXCgfqqRuPUK
 +M6r5ambemw+Z3e9iy67Ugg=
X-Google-Smtp-Source: AMsMyM4C9jt/MwTLhYqqDPFWsdt9iTcPEBClAOZz2p6UaBR6IiZ85yIeLjOYoL0sL+bGejbJgmilqw==
X-Received: by 2002:a17:907:b15:b0:7a7:19a3:e9e7 with SMTP id
 h21-20020a1709070b1500b007a719a3e9e7mr18593648ejl.361.1666860991495; 
 Thu, 27 Oct 2022 01:56:31 -0700 (PDT)
Received: from fedora.. (cpezg-94-253-144-49-cbl.xnet.hr. [94.253.144.49])
 by smtp.googlemail.com with ESMTPSA id
 p16-20020a17090653d000b0078a83220609sm459930ejo.13.2022.10.27.01.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 01:56:30 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, angelo@amarulasolutions.com
Date: Thu, 27 Oct 2022 10:56:28 +0200
Message-Id: <20221027085628.102086-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2UkAu9DL59ZHUCjE4YeG+A2IqvVz9umOldb3ze7h70w=;
 b=B2G8wmlitP2PCqK7NSl/HKxn8HPYX3lGi5z+w84bQEKMi7hlrZyYEVtEuQlkaiRDbH
 RjY1GXlF7CCAhDeqO1wGtTEAd+onSnCjFV0sNjW6jW1O6Zd+5SaUJLIHWhQavIz+pzom
 uutbxSWS7iFHkhGjPZRkxc8PBQM9fmnckaIFITqEzHqxmK8P+aYTPo+Ptl2j3vT3MEx9
 0om1GrTsf+FLLgUa4MqJnLqLKFSK+3dSywLyiKg+Pc1Cs8cG/CBCwOmGd/PFtf19Mbzi
 NbO+uHJpQNf0p9Xn3GPCMNtSmhs51K0IsIe+d6lKAZlexyJHs+WkwUBi/P/u/akyJC8l
 QPIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B2G8wmli
Subject: [Buildroot] [PATCH v3] package/mdio-tools: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mdio-tools are kernel module and accompanying tools for low-level
debugging of devices attached on MDIO bus like PHY-s, switches etc.

Userspace tools provide C22 or C45 reads and writes, benchmarking
and even dedicated Marvell Link Street tools via the included
kernel module.

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
Changes in v3:
* Add dependecy on 5.1 headers

Changes in v2:
* Correct license
* Add host-pkgconf to DEPENDENCIES
* Add minimal required kernel config options
---
 package/Config.in                  |  1 +
 package/mdio-tools/Config.in       | 10 ++++++++++
 package/mdio-tools/mdio-tools.hash |  3 +++
 package/mdio-tools/mdio-tools.mk   | 20 ++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/mdio-tools/Config.in
 create mode 100644 package/mdio-tools/mdio-tools.hash
 create mode 100644 package/mdio-tools/mdio-tools.mk

diff --git a/package/Config.in b/package/Config.in
index e3a34d6e97..ed41e8bdd4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ endmenu
 	source "package/mbpfan/Config.in"
 	source "package/mdadm/Config.in"
 	source "package/mdevd/Config.in"
+	source "package/mdio-tools/Config.in"
 	source "package/memtest86/Config.in"
 	source "package/memtester/Config.in"
 	source "package/memtool/Config.in"
diff --git a/package/mdio-tools/Config.in b/package/mdio-tools/Config.in
new file mode 100644
index 0000000000..8a09bf19a7
--- /dev/null
+++ b/package/mdio-tools/Config.in
@@ -0,0 +1,10 @@
+comment "mdio-tools needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_MDIO_TOOLS
+	bool "mdio-tools"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+	select BR2_PACKAGE_LIBMNL
+	help
+	  Low-level debug tools for MDIO devices
diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
new file mode 100644
index 0000000000..0111165f27
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c5e17431c62392f6c1da1ba4fb0a6f5918521509a377af74485851f93ff2a106  mdio-tools-1.2.0.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
new file mode 100644
index 0000000000..308a23824b
--- /dev/null
+++ b/package/mdio-tools/mdio-tools.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# mdio-tools
+#
+################################################################################
+
+MDIO_TOOLS_VERSION = 1.2.0
+MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
+MDIO_TOOLS_LICENSE = GPL-2.0
+MDIO_TOOLS_LICENSE_FILES = COPYING
+MDIO_TOOLS_DEPENDENCIES = host-pkgconf libmnl
+
+MDIO_TOOLS_MODULE_SUBDIRS = kernel
+define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
+endef
+
+$(eval $(kernel-module))
+$(eval $(autotools-package))
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
