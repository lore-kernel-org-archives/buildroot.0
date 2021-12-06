Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB7CC433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6442D60790;
	Mon,  6 Dec 2021 18:48:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58yjxiYD-5PQ; Mon,  6 Dec 2021 18:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3F8960D87;
	Mon,  6 Dec 2021 18:48:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCF701BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA4B684BD4
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGK8GMcBZDe1 for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:42:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB85780BC8
 for <buildroot@busybox.net>; Mon,  6 Dec 2021 18:42:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 133so8957328wme.0
 for <buildroot@busybox.net>; Mon, 06 Dec 2021 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCM2eScgaAA+8pIi6mceZeMidDHPMUHslpKYaQhaIzk=;
 b=oJo8mmNFLBj739NdjHOIHWACnM57hF84AA4eI0tMgzw9fYtQWuYRI58+bDDd4dbJ3l
 jqNeDDNAYjTEduEee94hD9AmQHM56WgYDMch3QNRHEgxJFnbNG299jj4BvPvGH5gRGAu
 bglOM1zIvzWm5YFnOE2Pi5WPMqgtSS22TAykI+jrmPjtrVWPayp1IB+FdrYqVS6i+FX/
 y0KSFeKJW5iRtoICj+IwnLO8qVr2a5mo7gSHeWC1cgbSGJZWArudln0aZk6ODAkn4lI6
 DV2aJvOXhVquc9D1kqZwFCJnRDHGt8z25WOFbXJZcku8qFABoJ+Ua8WKfAHArlA8tSnx
 k7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xCM2eScgaAA+8pIi6mceZeMidDHPMUHslpKYaQhaIzk=;
 b=IRUcCJIUMpqxyEtzaMiMHEtsYVLbj4ooy0yRSfSeieCMlJpzoxiLaeEcoOxQmTPXkN
 4sK4lxRZCEEx7OTgauv7YeSk4hcV3KT0CUU0IqkYmZenbTg8ArWtTSpcIpDPLWk183b4
 9Q7NbLc+pGMoLSKdk2VpGqdPGv4VVspV6z37/1revIvM9u3+BwMUTx+8kdeaMygdLHy5
 JLyRp61B1fe0BeIuyz+6qxDvBqfnh6zw4a5zvus5G5oe5JWNDWkt5f2v2e/9KNN5L6D4
 BKEOWWpNVP7HfW4G9KGcCVZKKy76kE/Nf+Ab585EECRZprQKJvUY6O07mKpaUk0+38Ei
 q4Mg==
X-Gm-Message-State: AOAM531sBkebAxfkFb0331RqPtY2SH7BeVShXBqqnePLhtfBVtPTgcph
 yWzTqV6FjJ+Ex1EO+iB+FQkcKhQiGSk=
X-Google-Smtp-Source: ABdhPJxFUR+rB4i0oqk0ckc5gccLJ3N/pLFjTIdCPpurzd4WxgdxO72m1CIGFt3S3LYVTweoLj4q7w==
X-Received: by 2002:a7b:c194:: with SMTP id y20mr351999wmi.61.1638816140699;
 Mon, 06 Dec 2021 10:42:20 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g5sm15688902wri.45.2021.12.06.10.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 10:42:20 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 Dec 2021 19:42:00 +0100
Message-Id: <20211206184201.2449-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-argon2: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                             |  1 +
 package/lua-argon2/Config.in                  | 13 ++++++++++
 package/lua-argon2/lua-argon2.hash            |  2 ++
 package/lua-argon2/lua-argon2.mk              | 23 +++++++++++++++++
 .../testing/tests/package/test_lua_argon2.py  | 25 +++++++++++++++++++
 5 files changed, 64 insertions(+)
 create mode 100644 package/lua-argon2/Config.in
 create mode 100644 package/lua-argon2/lua-argon2.hash
 create mode 100644 package/lua-argon2/lua-argon2.mk
 create mode 100644 support/testing/tests/package/test_lua_argon2.py

diff --git a/package/Config.in b/package/Config.in
index cb94e30be..ba9eeda23 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -661,6 +661,7 @@ menu "Lua libraries/modules"
 	source "package/lpty/Config.in"
 	source "package/lrandom/Config.in"
 	source "package/lsqlite3/Config.in"
+	source "package/lua-argon2/Config.in"
 	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
diff --git a/package/lua-argon2/Config.in b/package/lua-argon2/Config.in
new file mode 100644
index 000000000..98bdd8819
--- /dev/null
+++ b/package/lua-argon2/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUA_ARGON2
+	bool "lua-argon2"
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_MMU # libargon2
+	select BR2_PACKAGE_LIBARGON2
+	help
+	  Lua C binding for the Argon2 password hashing algorithm.
+
+	  https://github.com/thibaultcha/lua-argon2
+
+comment "lua-argon2 needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
diff --git a/package/lua-argon2/lua-argon2.hash b/package/lua-argon2/lua-argon2.hash
new file mode 100644
index 000000000..cb3404d30
--- /dev/null
+++ b/package/lua-argon2/lua-argon2.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  d109c6e8e93cd9e27e8738567a998a2763d56252cc1abca1f0f2ac36ef8ce0f4  lua-argon2-3.0.1.tar.gz
diff --git a/package/lua-argon2/lua-argon2.mk b/package/lua-argon2/lua-argon2.mk
new file mode 100644
index 000000000..6f787a907
--- /dev/null
+++ b/package/lua-argon2/lua-argon2.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# lua-argon2
+#
+################################################################################
+
+LUA_ARGON2_VERSION = 3.0.1
+LUA_ARGON2_SITE = $(call github,thibaultcha,lua-argon2,$(LUA_ARGON2_VERSION))
+LUA_ARGON2_LICENSE = MIT
+LUA_ARGON2_DEPENDENCIES = luainterpreter libargon2
+
+define LUA_ARGON2_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		CC=$(TARGET_CC) \
+		CFLAGS="$(TARGET_CFLAGS) -fPIC" \
+		PREFIX="$(STAGING_DIR)/usr"
+endef
+
+define LUA_ARGON2_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/argon2.so $(TARGET_DIR)/usr/lib/lua/$(LUAINTERPRETER_ABIVER)/argon2.so
+endef
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/package/test_lua_argon2.py b/support/testing/tests/package/test_lua_argon2.py
new file mode 100644
index 000000000..8a2a57e65
--- /dev/null
+++ b/support/testing/tests/package/test_lua_argon2.py
@@ -0,0 +1,25 @@
+from tests.package.test_lua import TestLuaBase
+
+
+class TestLuaLuaArgon2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUA=y
+        BR2_PACKAGE_LUA_ARGON2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("argon2")
+
+
+class TestLuajitLuaArgon2(TestLuaBase):
+    config = TestLuaBase.config + \
+        """
+        BR2_PACKAGE_LUAJIT=y
+        BR2_PACKAGE_LUA_ARGON2=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("argon2")
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
