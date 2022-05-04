Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04577C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 02:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 829BA4161B;
	Wed,  4 May 2022 02:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJ7kUnfjp4PM; Wed,  4 May 2022 02:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2289E415EB;
	Wed,  4 May 2022 02:57:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 205FD1BF360
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 02:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B75740139
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 02:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c6WiEA8fKc-l for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 02:57:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F2B0B4057C
 for <buildroot@buildroot.org>; Wed,  4 May 2022 02:57:45 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id k1so272106pll.4
 for <buildroot@buildroot.org>; Tue, 03 May 2022 19:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oAkBz1VJrYToKO8OcFNR+rli2HOtGeaIer0V0lfu2og=;
 b=NnNlQKLFGqlnbSJWtlomlkNzRvVzURq6JfjrTwkao22wN2NRQw3Zc7FLCxH8NM28wc
 Iyto1mxqiINVBhaSelWMOIGlYWIxEBWFUuihcb1NAF82oxy4d7dHeGd0qQJXKGmEzliG
 oYLC9GK4XOOmaBYuAIWTyO7PGCg4xllifp6uczhdzr3xebnmDX4Y0K3ffiU/FGAt7ZoL
 MoSGOFBo92lcrKS+SECv2QK5FvZxyS7bUWSBT5pRKnVvroLHKVPfhV626xXnjyKIO8zB
 BFCM1Y/D2glEWbhQaTph81oeQKxGTwADobquDXwyUA5hZsRj+3H0XgbuR0/9YwlIij7n
 P2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oAkBz1VJrYToKO8OcFNR+rli2HOtGeaIer0V0lfu2og=;
 b=veosP5CuueolsBmEuUwdxtoATfslqPxjEI7oQ768WH9zDYbw5a7MZJrxaNf7VJw8iw
 oCFcM/oSKCZonWBcj/gS4iDB5L7ao9FE66RQUwFKOGBXTdp4xM34VgtAgr9l/ZR+/bu6
 dxp+LV3pPb1xhrJpCPLtMP9Ih1hVf8ID1iTOpPg1EkIkzjmzGf1NN0DWsz7XiMiwxUV1
 tX2fmnHQO40DRfrZ2M3n65kP01gCzEGtJB/OkO6SN8d4GhIbSbcvGuVF1YeX0ZM+Kad9
 Dm+wWo+7dvcKYndBLAlAJJZASkXk1lPq89RkeQg3RqwqkQd6jpgAnd5ovcUlqwYOMdD2
 K8zw==
X-Gm-Message-State: AOAM531J2i/D8PlYsQa4/nm4Kn4usNiswrwICpZdVd3qkFsm9bbjpZRr
 Iv3hD33YgWSEpSCHoUm1XTXNnhhOsCE=
X-Google-Smtp-Source: ABdhPJwKqpI4+9dEic9YOEDPXR4aZolVOBxe+QsPmqNDza6jQHFX0EEh2yfKC/5sqV0MUKpnwsxDxQ==
X-Received: by 2002:a17:902:9684:b0:158:b28c:41e0 with SMTP id
 n4-20020a170902968400b00158b28c41e0mr19550956plp.85.1651633065010; 
 Tue, 03 May 2022 19:57:45 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 y23-20020a63de57000000b003c5eccae5besm33808pgi.4.2022.05.03.19.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 19:57:44 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  3 May 2022 19:57:32 -0700
Message-Id: <20220504025732.1788544-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package: Add cpulimit
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cpulimit is a tool which limits the CPU usage of a process (expressed in
percentage, not in CPU time). It is useful to control batch jobs, when
you don't want them to eat too many CPU cycles.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 package/Config.in            |  1 +
 package/cpulimit/Config.in   |  7 +++++++
 package/cpulimit/cpulimit.mk | 23 +++++++++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/cpulimit/Config.in
 create mode 100644 package/cpulimit/cpulimit.mk

diff --git a/package/Config.in b/package/Config.in
index 433941dc01b8..f56a8fe2594d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2524,6 +2524,7 @@ menu "System tools"
 	source "package/circus/Config.in"
 	source "package/containerd/Config.in"
 	source "package/coreutils/Config.in"
+	source "package/cpulimit/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/daemon/Config.in"
 	source "package/dc3dd/Config.in"
diff --git a/package/cpulimit/Config.in b/package/cpulimit/Config.in
new file mode 100644
index 000000000000..48f9fad972de
--- /dev/null
+++ b/package/cpulimit/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CPULIMIT
+	bool "cpulimit"
+	help
+	  Cpulimit is a tool which limits the CPU usage of a process (expressed
+	  in percentage, not in CPU time)
+
+	  https://github.com/opsengine/cpulimit
diff --git a/package/cpulimit/cpulimit.mk b/package/cpulimit/cpulimit.mk
new file mode 100644
index 000000000000..63b1446cc08b
--- /dev/null
+++ b/package/cpulimit/cpulimit.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# cpulimit
+#
+################################################################################
+
+CPULIMIT_VERSION = v0.2
+CPULIMIT_SOURCE = $(CPULIMIT_VERSION).tar.gz
+CPULIMIT_SITE = https://github.com/opsengine/cpulimit/archive/refs/tags/$(CPULIMIT_VERSION)
+CPULIMIT_LICENSE = GPL-2.0+
+CPULIMIT_LICENSE_FILES = LICENSE
+
+define CPULIMIT_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
+		LDLIBS="$(TARGET_LDFLAGS)"
+endef
+
+define CPULIMIT_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/src/cpulimit \
+		$(TARGET_DIR)/usr/bin/cpulimit
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
