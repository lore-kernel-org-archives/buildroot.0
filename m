Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0F0C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 16:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0F4B40443;
	Tue, 22 Mar 2022 16:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9SMrL1xA9ln; Tue, 22 Mar 2022 16:07:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B207B40B3A;
	Tue, 22 Mar 2022 16:07:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B25BC1BF357
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 16:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEFAF84784
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 16:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fqg8M_lFxwVS for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 16:07:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7952084778
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:07:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso2257355wmz.4
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6dekLTxIntbz4ViCFsDcGi7AYb+gk62vCv92uVQRg8=;
 b=ml4Ewjoc2+ImbF5bt+LhwktppZzCDOa7fpwt4a3Mni6cG8yJe1gqCIw2rnfcaVVQ8R
 aWSKy7Ca/tBwcmpPN8gLGMkmv8GWmLsbFennm0NQWBxa8Ug3AQ0+WQ/zl8zTLuxPYdXY
 egy5u1xq+ZkXGCfEQFoieDnd+ZV88IGdV5JSlYRL+hVe2CdNaS87QBPT8rUX0eFpWhoE
 3wobOENbUTNEStM1Ri6qO+LfS/0VnzJ7bv5trlcA7VbWqAykGB/JWBSd3CqrL8nkQDeH
 MuntxRjrB3Vt2l8+LhCysxhT6qQr2UyC0cF4pB8OzRi/FOohbKDpvhBawb0qfFnEzg9/
 tHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6dekLTxIntbz4ViCFsDcGi7AYb+gk62vCv92uVQRg8=;
 b=tzkjkEVd20pCW1DSwRiBQI9Z+q9g5j/lqoSMDGV3EVGKucl+bs2P8zApgoedqsaPph
 r7VIuBarxirdSnS6tl2mmrrvU8weJWELroRRvA1DiqFRgqZxPxGwIVLZE2e7UMyrUL9n
 Ti78YuTvdxXL55Um8Ua7wdgpNWsRiAZFCRgoBOTXg47tjm/sXli9DgxRnXQPM5CdT3wU
 cgaKiruwFqjwEWw0XzbR6RHUBue0ZIfyRhkoOOwzi8qqy1tEEizjOhyKnEyEac8d4RK7
 JaDldGbU7rxH1KZPDtVOLnHrK19u9Jybh/v3i8RCl5VIVasKQ1Nln0v0zCGuEryJTqs9
 GLiQ==
X-Gm-Message-State: AOAM531SJKBEVKshH2q3W9FAMG3LXd2oCNKt4ER0m36FMYXAGv4Qa5u3
 1iSgu88HZ7WjZRw0hoQ5pbYD3uKXtGCvpg==
X-Google-Smtp-Source: ABdhPJzelH3MYov7lWi758Tv0SSuVAorx2FLNXA2pPg/qmDAmy+IaTfwZqF4kz1zOeZ9XgHAOZxXYg==
X-Received: by 2002:a05:600c:3b8c:b0:38c:b365:7220 with SMTP id
 n12-20020a05600c3b8c00b0038cb3657220mr4518703wms.120.1647965265016; 
 Tue, 22 Mar 2022 09:07:45 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f7-20020a0560001a8700b00203c23e55e0sm16014516wry.78.2022.03.22.09.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 09:07:41 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:07:25 +0100
Message-Id: <20220322160725.636205-1-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/forge: new package
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A native implementation of TLS (and various other cryptographic tools)
in JavaScript.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/forge/Config.in  |  7 +++++++
 package/forge/forge.hash |  3 +++
 package/forge/forge.mk   | 23 +++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/forge/Config.in
 create mode 100644 package/forge/forge.hash
 create mode 100644 package/forge/forge.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 942bb8fe9c..5830b45018 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1475,6 +1475,7 @@ F:	package/erlang-p1-xmpp/
 F:	package/erlang-p1-yaml/
 F:	package/erlang-p1-yconf/
 F:	package/erlang-p1-zlib/
+F:	package/forge/
 F:	package/nginx-dav-ext/
 F:	package/vuejs/
 
diff --git a/package/Config.in b/package/Config.in
index 0d5d763180..f2587b5c66 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1653,6 +1653,7 @@ endif
 	source "package/duktape/Config.in"
 	source "package/explorercanvas/Config.in"
 	source "package/flot/Config.in"
+	source "package/forge/Config.in"
 	source "package/jquery/Config.in"
 if BR2_PACKAGE_JQUERY
 menu "External jQuery plugins"
diff --git a/package/forge/Config.in b/package/forge/Config.in
new file mode 100644
index 0000000000..86d4832101
--- /dev/null
+++ b/package/forge/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FORGE
+	bool "forge"
+	help
+	  A native implementation of TLS (and various other
+	  cryptographic tools) in JavaScript.
+
+	  https://github.com/digitalbazaar/forge
diff --git a/package/forge/forge.hash b/package/forge/forge.hash
new file mode 100644
index 0000000000..256ac5b451
--- /dev/null
+++ b/package/forge/forge.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  97f0276c32b39411ad85c5762bf546ca281451eeaa93bdd383ff082e8e0181b4  node-forge-1.3.0.tgz
+sha256  f63ff0e4e239244aa79280da2dd4811a0469e5e201caf5cbc0d97c3a1dff8e82  LICENSE
diff --git a/package/forge/forge.mk b/package/forge/forge.mk
new file mode 100644
index 0000000000..1872cb4e70
--- /dev/null
+++ b/package/forge/forge.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# forge
+#
+################################################################################
+
+FORGE_VERSION = 1.3.0
+FORGE_SOURCE = node-forge-$(FORGE_VERSION).tgz
+FORGE_SITE = https://registry.npmjs.org/node-forge/-
+FORGE_LICENSE = BSD-3-Clause, GPL-2.0
+FORGE_LICENSE_FILES = LICENSE
+
+# Install .min.js as .js
+define FORGE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/forge.all.min.js \
+		$(TARGET_DIR)/var/www/forge.all.js
+	$(INSTALL) -m 644 -D $(@D)/dist/forge.min.js \
+		$(TARGET_DIR)/var/www/forge.js
+	$(INSTALL) -m 644 -D $(@D)/dist/prime.worker.min.js \
+		$(TARGET_DIR)/var/www/prime.worker.js
+endef
+
+$(eval $(generic-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
