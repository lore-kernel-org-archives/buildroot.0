Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863DEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B1C140734;
	Sat, 23 Apr 2022 15:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BXfo3lRXKKpE; Sat, 23 Apr 2022 15:51:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26ED8405C1;
	Sat, 23 Apr 2022 15:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B8D01BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 385F360A6D
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:51:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dSrZ_WjWTqln for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:51:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5CB7606EC
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:51:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n126-20020a1c2784000000b0038e8af3e788so7038792wmn.1
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A0jPa1DrderyQj44S8vktMrYUKut6B9xyUT347SVOCY=;
 b=AJjA6r/Ml4dxmOc4Uq2BwO4sxEfYGeufa+r/9r56Ae2PFHswBsbcvKRDYTJ2OKrSMq
 YWl9PEkvWtloQlwlcnTsPPTv8+/smSckb6hR1LdmSIJs/qDS+UCeb3KIdzJTOSMs8C3X
 FQHc7Zaopu18Idw7lI5o78us7UVXx/ufZ5IWwOzsjqvWwy0oOvimPBTGTa3f0MUmyj4R
 WBlLVlc4Ft/X3/SNU14TtHo+GPHLFWaRxRH4sgO5ncPfyIdsH68kjLZwM2oHHi6Ua7Kr
 nUM84fE61Ty7TZ1Ni9MUU9bPc5DY5N9Yqzju77CfyZGqJThl6/Hv6o3SBuJ5ID9yYBQJ
 lUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A0jPa1DrderyQj44S8vktMrYUKut6B9xyUT347SVOCY=;
 b=XWfvYKn1XVQIdO2wmailAAebbCSgns42kJdIXHydyb1aQcv5xDMKiCEXNmEueQ8qjD
 +jMktcu/3+X+WFvr5uxWA75rRVGwuxk66W0Glp7A6uR4B/zIvVnHqhb0PWa3sAS46MGw
 PjBYZnr7K6f6Uq75ZnlzeE2z2wa4XZC0e9xX5CtDbRdKtR8j6VGLe3NrJxgcJnsUzOWy
 z7wb0JpmPoHNCX8EsI9+LtdwWVqAn6vS5vgIb/0ZS7uIPNVik8/lSVS/Rs2TShu+csnk
 2gZ4PnvlowASzV9D2P7kVK6DDSM2KpNcoEX5LNV1yo8V5VejQDT6s+YrqrpbRnvoEGZ2
 pc+Q==
X-Gm-Message-State: AOAM530nazT1yH4ne1eSVczKpgwNCxPcO6B4z7iTtIvtuVD2nAYklnCm
 TnnHlHz7/rTNnJ2wR3AR8zOEmKgank4=
X-Google-Smtp-Source: ABdhPJzSVxBhrIjgp/8Z2JgKdCOQJOdyVuyuK4fiBDjHR4wwaEe2tT1M2sp6/XaN0tbevku7JLbtPg==
X-Received: by 2002:a05:600c:a44:b0:38e:3ce3:3148 with SMTP id
 c4-20020a05600c0a4400b0038e3ce33148mr9123502wmq.26.1650729077605; 
 Sat, 23 Apr 2022 08:51:17 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m8-20020a056000008800b00207b3fa7fc0sm4864886wrx.108.2022.04.23.08.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 08:51:17 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:49:03 +0200
Message-Id: <20220423154903.155257-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ding-libs: bump to version 0.6.2
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site to get latest release
- Update indentation in hash file (two spaces)

https://github.com/SSSD/ding-libs/releases/tag/0.6.2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ding-libs/Config.in      | 2 +-
 package/ding-libs/ding-libs.hash | 8 +++++---
 package/ding-libs/ding-libs.mk   | 5 ++---
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index 64b111e6a1..e4f869728a 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_DING_LIBS
 	  initialization format (INI) into a library collection data
 	  structure (libini_config).
 
-	  https://pagure.io/SSSD/ding-libs
+	  https://github.com/SSSD/ding-libs
 
 comment "ding-libs needs NLS enabled"
 	depends on BR2_SYSTEM_ENABLE_NLS
diff --git a/package/ding-libs/ding-libs.hash b/package/ding-libs/ding-libs.hash
index 2ac5bd8eee..d5d87faccd 100644
--- a/package/ding-libs/ding-libs.hash
+++ b/package/ding-libs/ding-libs.hash
@@ -1,4 +1,6 @@
+# From https://github.com/SSSD/ding-libs/releases/download/0.6.2/ding-libs-0.6.2.tar.gz.sha256sum
+sha256  e5f07f34f5921bcb5ccccfe3751c28497879a6451cd7b395e99e24d9b5728e8d  ding-libs-0.6.2.tar.gz
+
 # Locally computed
-sha256 ad3c573641701f67d4b6bd8a5a71f0b65d45fd39fe961495ef5f5d3c57fc0963 ding-libs-ding_libs-0_6_1.tar.gz
-sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
-sha256 6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58 COPYING.LESSER
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58  COPYING.LESSER
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index 1e8fa59d69..a4ee7351b5 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-DING_LIBS_VERSION = 0.6.1
-DING_LIBS_SOURCE = ding-libs-ding_libs-$(subst .,_,$(DING_LIBS_VERSION)).tar.gz
+DING_LIBS_VERSION = 0.6.2
 DING_LIBS_SITE = \
-	https://pagure.io/SSSD/ding-libs/archive/ding_libs-$(subst .,_,$(DING_LIBS_VERSION))
+	https://github.com/SSSD/ding-libs/releases/download/$(DING_LIBS_VERSION)
 DING_LIBS_DEPENDENCIES = host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
