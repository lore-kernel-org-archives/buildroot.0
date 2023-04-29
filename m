Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D4BC77B60
	for <buildroot@archiver.kernel.org>; Sat, 29 Apr 2023 20:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A27F560B96;
	Sat, 29 Apr 2023 20:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A27F560B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qruE2RAlsoVd; Sat, 29 Apr 2023 20:01:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C926F60EF3;
	Sat, 29 Apr 2023 20:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C926F60EF3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C9F7C1BF2B6
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B02EC84196
 for <buildroot@lists.busybox.net>; Sat, 29 Apr 2023 20:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B02EC84196
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBWmK7JAmQNo for <buildroot@lists.busybox.net>;
 Sat, 29 Apr 2023 20:01:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B39B81EAA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B39B81EAA
 for <buildroot@busybox.net>; Sat, 29 Apr 2023 20:01:40 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f1cfed93e2so9921775e9.3
 for <buildroot@busybox.net>; Sat, 29 Apr 2023 13:01:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682798498; x=1685390498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+V2iY4WzQptfQfYRgXRi7jTu3DhKHTXLFQ/e0eZv5RU=;
 b=g9rklRNWvJYKtDqNG0vNpYXV/RkVhjC++LBmRWjvNFaMnOf30qkI+IHnhYBusSM/IZ
 MNkDofQ8z6nLlof32Nw5IBUyyjIMfBN1uVbx6ULK2C3qehPdgOF+n3h1A0AUIL/Rr83U
 Q5ef0W+ZqMGrQmQI2+HmRnkc1VZcPMQyNTtJgK8fmtvEcNsTn7Z++HpeKoRT07DeArPT
 1QvIH6ZpOrd/NVuk6lsqPqFtIMeevjknCeubtEqwJQYFH1G8H/wJ6ranHbckhsC7Jceq
 o7qrb6ftRQbMQqo5qRkyDaDrbLzRbv9xlKhOkRhV+Med9LAP6T5Si4blnm80P8OCnZHk
 n8uQ==
X-Gm-Message-State: AC+VfDyiGYFoLGWfJRw0KrXIiKSc5ecfdOLgdl81lSakBc35XfrUx0KZ
 cXz/qOrVMrYWBwGJsHCYw0sLgrcPEdQ=
X-Google-Smtp-Source: ACHHUZ5gHjdzb/KDyhqFrhBQkN8C7jsRVaH+haBsavTqT5A+NTgu3inu82lYxxvupes9T3imc7927A==
X-Received: by 2002:a7b:cb85:0:b0:3f1:7136:dd45 with SMTP id
 m5-20020a7bcb85000000b003f17136dd45mr6628512wmi.30.1682798498186; 
 Sat, 29 Apr 2023 13:01:38 -0700 (PDT)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c4fc200b003f1738e64c0sm31622787wmq.20.2023.04.29.13.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 13:01:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat, 29 Apr 2023 22:01:33 +0200
Message-Id: <20230429200133.152499-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682798498; x=1685390498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+V2iY4WzQptfQfYRgXRi7jTu3DhKHTXLFQ/e0eZv5RU=;
 b=LtOAKPGUpjTslBBO/DiQOZA4kXl/8hsIQnK5JOEUVDvLvAno4eWrV8nMqSBmOvwbzk
 Hvju0bQIolaQ4bdDgv6v1b2Z2SREQBOea8qnmPcVxmk/NT9z7s5X2zkdga4DnIV++TzO
 5Z7ZrAsWb/aGjjnu5mb6fpAwA48ilvgXDPkvdFtdHtUBKjTMfZTTxUEAYI9A/npwbUzi
 /nnZOXLkUiEOts7LHQgLUa+dDI0y1JYEV6u2LyaTUltF41brKWwV7qz23NkUtPiv9ymQ
 FNItdzdIY0uLb0YqK1qU9XTqSrk80ZyUV06ekdVzuqI9+MVic/RGoeg153wYQdLXdYmJ
 nPfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LtOAKPGU
Subject: [Buildroot] [PATCH] package/lua: bump to version 5.4.5
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
 package/lua/5.4.4/lua.hash                                  | 6 ------
 package/lua/{5.4.4 => 5.4.5}/0001-root-path.patch           | 2 +-
 package/lua/{5.4.4 => 5.4.5}/0002-shared-libs-for-lua.patch | 2 +-
 package/lua/{5.4.4 => 5.4.5}/0011-linenoise.patch           | 2 +-
 package/lua/5.4.5/lua.hash                                  | 5 +++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 9 insertions(+), 10 deletions(-)
 delete mode 100644 package/lua/5.4.4/lua.hash
 rename package/lua/{5.4.4 => 5.4.5}/0001-root-path.patch (95%)
 rename package/lua/{5.4.4 => 5.4.5}/0002-shared-libs-for-lua.patch (96%)
 rename package/lua/{5.4.4 => 5.4.5}/0011-linenoise.patch (97%)
 create mode 100644 package/lua/5.4.5/lua.hash

diff --git a/package/lua/5.4.4/lua.hash b/package/lua/5.4.4/lua.hash
deleted file mode 100644
index b55b17f25..000000000
--- a/package/lua/5.4.4/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-md5  bd8ce7069ff99a400efd14cf339a727b  lua-5.4.4.tar.gz
-sha1  03c27684b9d5d9783fb79a7c836ba1cdc5f309cd  lua-5.4.4.tar.gz
-
-# Locally computed
-sha256  2556ac7198243f9f83130b9c81016e1904f7b30351481f1c28e02475dbd237fb  doc/readme.html
diff --git a/package/lua/5.4.4/0001-root-path.patch b/package/lua/5.4.5/0001-root-path.patch
similarity index 95%
rename from package/lua/5.4.4/0001-root-path.patch
rename to package/lua/5.4.5/0001-root-path.patch
index c4f6e312e..5e3037b78 100644
--- a/package/lua/5.4.4/0001-root-path.patch
+++ b/package/lua/5.4.5/0001-root-path.patch
@@ -6,7 +6,7 @@ Index: b/src/luaconf.h
 ===================================================================
 --- a/src/luaconf.h
 +++ b/src/luaconf.h
-@@ -217,7 +217,7 @@
+@@ -223,7 +223,7 @@
  
  #else			/* }{ */
  
diff --git a/package/lua/5.4.4/0002-shared-libs-for-lua.patch b/package/lua/5.4.5/0002-shared-libs-for-lua.patch
similarity index 96%
rename from package/lua/5.4.4/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.5/0002-shared-libs-for-lua.patch
index 4ff204429..388aa9966 100644
--- a/package/lua/5.4.4/0002-shared-libs-for-lua.patch
+++ b/package/lua/5.4.5/0002-shared-libs-for-lua.patch
@@ -31,7 +31,7 @@ Index: b/src/Makefile
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -33,6 +33,7 @@
- PLATS= guess aix bsd c89 freebsd generic linux linux-readline macosx mingw posix solaris
+ PLATS= guess aix bsd c89 freebsd generic ios linux linux-readline macosx mingw posix solaris
  
  LUA_A=	liblua.a
 +LUA_SO=	liblua.so
diff --git a/package/lua/5.4.4/0011-linenoise.patch b/package/lua/5.4.5/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.4.4/0011-linenoise.patch
rename to package/lua/5.4.5/0011-linenoise.patch
index 68316e108..5054ae19e 100644
--- a/package/lua/5.4.4/0011-linenoise.patch
+++ b/package/lua/5.4.5/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -428,6 +428,14 @@
+@@ -438,6 +438,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.5/lua.hash b/package/lua/5.4.5/lua.hash
new file mode 100644
index 000000000..5526cd512
--- /dev/null
+++ b/package/lua/5.4.5/lua.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://www.lua.org/ftp/
+sha256  59df426a3d50ea535a460a452315c4c0d4e1121ba72ff0bdde58c2ef31d6f444  lua-5.4.5.tar.gz
+
+# Locally computed
+sha256  0d4ee721cf740f9cd878ef82ef75f4f2724dcf0403e56cd0b5643ad88f9de337  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 16086e7bf..ecb86c11e 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.4
+LUA_VERSION = 5.4.5
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
