Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3686AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Dec 2021 14:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2E2240173;
	Wed, 22 Dec 2021 14:08:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6EHIFHFC1zbZ; Wed, 22 Dec 2021 14:08:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3C854037E;
	Wed, 22 Dec 2021 14:08:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6C3E1BF9AF
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 14:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B38F660BC3
 for <buildroot@lists.busybox.net>; Wed, 22 Dec 2021 14:08:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9_iTbrzn26Qr for <buildroot@lists.busybox.net>;
 Wed, 22 Dec 2021 14:08:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8182960DFC
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 14:08:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v11so5132597wrw.10
 for <buildroot@buildroot.org>; Wed, 22 Dec 2021 06:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=enOvsj9mgkTkcqwhHeVdn9q2aDeE+ie+e2MQ5OiR7Mc=;
 b=OayTClmWhVUlmHxREuOwBN60NdCLdrACKtI/m+wO8yzG0aO6+/UbhIVy7LLzs3ht5P
 fLIrZpBxSgxTnj5GeLCJ7bpniWAZm2UtSSXV7zU9sOf7HaIO1EEUthCt88h021IbftSa
 CT4dLFE6TC5gt0bfwBXhdfkI1gm61SjNLb9cPDzgDlAjjyxmycWbw9guzUjXxOtfqJMt
 2rZkO87O4znS1cfDgzD8mcrSxnQ4QnNPxcjzW2R10+TPeb0tzeMICATHmY72uGy6nv/o
 IGzt4jnOXqh1nwrbknI6xQcGLOnsTGrbO8xKtZ6+y3d0BtaMaeCVuRhhmo5rtULm3WZE
 Wv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=enOvsj9mgkTkcqwhHeVdn9q2aDeE+ie+e2MQ5OiR7Mc=;
 b=7rURragIA7NHxIR6m07OGm860HhBdLluVFks9nRR9SOXwclVl6xvg2WVwTOomVqrni
 C2cfAKAC6KTt8Qc2zc346+vvDkH30AH9vMQBmEGuoMjJstASFII/NgAp9MJiuhfhYwx0
 s9LK3HIPXwO1K4g5eK0q0heoj97aWYDVJlb+sS4q8AXWf2lsiBLpHSrXbIic/zzeKpLZ
 yjP0mjDpAIPFG8mtsE/joGCPVpwo3+eNE2PPMFvecteV+G+x/YIi7nKmvMAz2DREulHR
 Byc43FGgeDcIlNoBqeQUJVIkoEvhvYVchiMmvdJ6rdtXg6mduaoq4PJKolhXwhqxxxwn
 O1wg==
X-Gm-Message-State: AOAM532Tpmj+kcGs3tYhnNxgT1jg6dFTn+KSgT9rp3t/wZhZpkzQ+gIx
 lBvtNDQewimhYVrH3uG67emcAgzsrl8IzQ==
X-Google-Smtp-Source: ABdhPJxugbQqwW5wsYvOj0EPm5KqeWUaixi12J9ESMUtlfube7nqQGT3elUvtykkHeZGmOMqtiQrYA==
X-Received: by 2002:a5d:64ac:: with SMTP id m12mr2280378wrp.659.1640182095498; 
 Wed, 22 Dec 2021 06:08:15 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id g9sm195011wmq.22.2021.12.22.06.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 06:08:14 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Dec 2021 15:07:37 +0100
Message-Id: <20211222140737.1179968-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nodejs: force host-python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build of nodejs fails if python 3.10 is installed on host.
As suggested by Arnout in
https://bugs.buildroot.org/show_bug.cgi?id=14451, use the same
workaround than in qt5webkit to force host-python3 (which is in version
3.9)

It should be noted that python 3.10 support has been added in version
14.18.2: https://github.com/nodejs/node/releases/tag/v14.18.2

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14451

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nodejs/nodejs.mk | 54 +++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 25 deletions(-)

diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 42ef1baa64..322eed6d19 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -27,6 +27,30 @@ NODEJS_CONF_OPTS = \
 	--cross-compiling \
 	--dest-os=linux
 
+HOST_NODEJS_MAKE_OPTS = \
+	$(HOST_CONFIGURE_OPTS) \
+	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
+	LDFLAGS.host="$(HOST_LDFLAGS)" \
+	NO_LOAD=cctest.target.mk \
+	PATH=$(@D)/bin:$(BR_PATH)
+
+NODEJS_MAKE_OPTS = \
+	$(TARGET_CONFIGURE_OPTS) \
+	NO_LOAD=cctest.target.mk \
+	PATH=$(@D)/bin:$(BR_PATH) \
+	LDFLAGS="$(NODEJS_LDFLAGS)" \
+	LD="$(TARGET_CXX)"
+
+# nodejs's build system uses python which can be a symlink to an unsupported
+# python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
+# forcing host-python3 early in the PATH, via a python->python3 symlink.
+define NODEJS_PYTHON3_SYMLINK
+	mkdir -p $(@D)/bin
+	ln -sf $(HOST_DIR)/bin/python3 $(@D)/bin/python
+endef
+HOST_NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
+NODEJS_PRE_CONFIGURE_HOOKS += NODEJS_PYTHON3_SYMLINK
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NODEJS_DEPENDENCIES += openssl
 NODEJS_CONF_OPTS += --shared-openssl
@@ -75,21 +99,13 @@ HOST_NODEJS_CXXFLAGS = $(HOST_CXXFLAGS) -DU_DISABLE_RENAMING=1
 define HOST_NODEJS_BUILD_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
-		$(HOST_CONFIGURE_OPTS) \
-		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-		LDFLAGS.host="$(HOST_LDFLAGS)" \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH)
+		$(HOST_NODEJS_MAKE_OPTS)
 endef
 
 define HOST_NODEJS_INSTALL_CMDS
 	$(HOST_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
-		$(HOST_CONFIGURE_OPTS) \
-		CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
-		LDFLAGS.host="$(HOST_LDFLAGS)" \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH)
+		$(HOST_NODEJS_MAKE_OPTS)
 
 	$(foreach f,$(NODEJS_HOST_TOOLS), \
 		$(INSTALL) -m755 -D $(@D)/out/Release/$(f) $(HOST_DIR)/bin/$(f)
@@ -195,11 +211,7 @@ endef
 define NODEJS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) \
-		$(TARGET_CONFIGURE_OPTS) \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)"
+		$(NODEJS_MAKE_OPTS)
 endef
 
 #
@@ -236,22 +248,14 @@ define NODEJS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(STAGING_DIR) \
-		$(TARGET_CONFIGURE_OPTS) \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)"
+		$(NODEJS_MAKE_OPTS)
 endef
 
 define NODEJS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) PYTHON=$(HOST_DIR)/bin/python3 \
 		$(MAKE) -C $(@D) install \
 		DESTDIR=$(TARGET_DIR) \
-		$(TARGET_CONFIGURE_OPTS) \
-		NO_LOAD=cctest.target.mk \
-		PATH=$(@D)/bin:$(BR_PATH) \
-		LDFLAGS="$(NODEJS_LDFLAGS)" \
-		LD="$(TARGET_CXX)"
+		$(NODEJS_MAKE_OPTS)
 	$(NODEJS_INSTALL_MODULES)
 endef
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
