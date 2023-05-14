Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26EEC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 14:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1907583B53;
	Sun, 14 May 2023 14:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1907583B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q1CgQWgl16XO; Sun, 14 May 2023 14:45:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F11783B5D;
	Sun, 14 May 2023 14:45:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F11783B5D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BF4B1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5532483B5D
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:45:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5532483B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDPSl6NqDYal for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 14:45:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3E583B53
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED3E583B53
 for <buildroot@busybox.net>; Sun, 14 May 2023 14:45:19 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f42769a0c1so74284085e9.2
 for <buildroot@busybox.net>; Sun, 14 May 2023 07:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684075518; x=1686667518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kDWfpPDI6XqljQ7zt7cTsMeiTHqQrsf+FQ0RNio94Lk=;
 b=I/MmbyOLy2uiKEKVGxWkcoA8yFW06uyBLQeIFSSncVSZaMU/7JhyLezLBYJLLDVRkk
 iSz4cbi5kfRwfHIinzqLKIS/jtxmn9Y4ZtsR8QTLSgjzRtZqgvjWUGULLh9nnJFCXWjw
 a7BT+3W+YMcXJvZUfwiVBGq1YZncR7I8YZW/SIMDIX0zC8EUKlXx/jHqP9tswAwrPGT0
 dfvEU0x04gxkUFxAiv8/cR00vuf7Glcg00zw+Ri9hoPyWCTN58kcoxfsX08qDm0KiGRB
 HgUgtKVS9TGD5RWL7PTdT5CBxVcqU5ffv6wPKcMPuuiUnAmArkYvC8+fR6DZJIjiJmNW
 hAGw==
X-Gm-Message-State: AC+VfDwoTDcY7s/o62uFz2dMtVS8mBfeHhkS8zV+6/s1adfyhONt1c3h
 Tj8C5PgQqECWT9tN31oAsGHjpVhr6PI=
X-Google-Smtp-Source: ACHHUZ5lf+RnWqPzZkyZA/k0jz42gI55shUjvy02V2HpZQKvdVomOwWra2f3K3llHQgQ0r1cW8xgtg==
X-Received: by 2002:a1c:7713:0:b0:3f4:2297:630c with SMTP id
 t19-20020a1c7713000000b003f42297630cmr17371171wmi.24.1684075517785; 
 Sun, 14 May 2023 07:45:17 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05600c474c00b003f07ef4e3e0sm24906706wmo.0.2023.05.14.07.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 May 2023 07:45:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 May 2023 16:45:12 +0200
Message-Id: <20230514144512.9794-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684075518; x=1686667518;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kDWfpPDI6XqljQ7zt7cTsMeiTHqQrsf+FQ0RNio94Lk=;
 b=dCpr/QInieDyb8uvrs6o7lZix4KFdwhvgF3IaQeKO84IOpXPvCVOVujigt5Uy2qPYi
 KvJKHvUVcusdDH+OzebxMl3njJ2dWC8WkWTIt/yL3cii5Oe9Jk9fNtvGpIxMLVUwtoFp
 9+nx8cP4agzuXE1/Rz5TmDNTWfR/cFXMJshB4RcL5yD5WZUrZn7B8EHSbAGztkvWDX/1
 hZAcH0Fqy2LN99gCVsJek5183gG3Inycr07/xHkwannSXKo0uIeiF/smWNwb6Tm3Xmqb
 OtV7iLBNvHPMwvJFylPZg5rrLTRTy6GEC3NN7DpeU6TGWdGslHzqNUnHK7SLG0sk8OYL
 tcxg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=dCpr/QIn
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.4.6
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
 .checkpackageignore                                         | 6 +++---
 package/lua/5.4.5/lua.hash                                  | 5 -----
 package/lua/{5.4.5 => 5.4.6}/0001-root-path.patch           | 0
 package/lua/{5.4.5 => 5.4.6}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.5 => 5.4.6}/0011-linenoise.patch           | 0
 package/lua/5.4.6/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)
 delete mode 100644 package/lua/5.4.5/lua.hash
 rename package/lua/{5.4.5 => 5.4.6}/0001-root-path.patch (100%)
 rename package/lua/{5.4.5 => 5.4.6}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.4.5 => 5.4.6}/0011-linenoise.patch (100%)
 create mode 100644 package/lua/5.4.6/lua.hash

diff --git a/.checkpackageignore b/.checkpackageignore
index 13f67695f5..947f4606aa 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -949,9 +949,9 @@ package/lua/5.1.5/0012-fix-reader-at-eoz.patch Upstream
 package/lua/5.3.6/0001-root-path.patch Upstream
 package/lua/5.3.6/0002-shared-libs-for-lua.patch Upstream
 package/lua/5.3.6/0003-linenoise.patch Upstream
-package/lua/5.4.5/0001-root-path.patch Upstream
-package/lua/5.4.5/0002-shared-libs-for-lua.patch Upstream
-package/lua/5.4.5/0011-linenoise.patch Upstream
+package/lua/5.4.6/0001-root-path.patch Upstream
+package/lua/5.4.6/0002-shared-libs-for-lua.patch Upstream
+package/lua/5.4.6/0011-linenoise.patch Upstream
 package/luajit/0001-no-bin-symlink.patch Upstream
 package/luajit/0002-install-inc.patch Upstream
 package/luasyslog/0001-remove-AX_LUA_LIBS.patch Upstream
diff --git a/package/lua/5.4.5/lua.hash b/package/lua/5.4.5/lua.hash
deleted file mode 100644
index 5526cd5125..0000000000
--- a/package/lua/5.4.5/lua.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-sha256  59df426a3d50ea535a460a452315c4c0d4e1121ba72ff0bdde58c2ef31d6f444  lua-5.4.5.tar.gz
-
-# Locally computed
-sha256  0d4ee721cf740f9cd878ef82ef75f4f2724dcf0403e56cd0b5643ad88f9de337  doc/readme.html
diff --git a/package/lua/5.4.5/0001-root-path.patch b/package/lua/5.4.6/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.5/0001-root-path.patch
rename to package/lua/5.4.6/0001-root-path.patch
diff --git a/package/lua/5.4.5/0002-shared-libs-for-lua.patch b/package/lua/5.4.6/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.5/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.6/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.5/0011-linenoise.patch b/package/lua/5.4.6/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.4.5/0011-linenoise.patch
rename to package/lua/5.4.6/0011-linenoise.patch
diff --git a/package/lua/5.4.6/lua.hash b/package/lua/5.4.6/lua.hash
new file mode 100644
index 0000000000..0b03fd563c
--- /dev/null
+++ b/package/lua/5.4.6/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  7d5ea1b9cb6aa0b59ca3dde1c6adcb57ef83a1ba8e5432c0ecd06bf439b3ad88  lua-5.4.6.tar.gz
+
+# Locally computed
+sha256  8f1bff27c5b0585ab679dbe4e37e75a1014af0f79732f42a79f86728321a0c6d  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index ecb86c11ed..93d4803812 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.5
+LUA_VERSION = 5.4.6
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
