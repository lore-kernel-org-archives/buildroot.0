Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA65C3526D
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 14:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B0360F5C;
	Wed, 26 Jan 2022 14:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZh4ptpN0dul; Wed, 26 Jan 2022 14:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D52B060D77;
	Wed, 26 Jan 2022 14:55:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9C2601BF577
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AAFE83332
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 14:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJlUGF_tTFOg for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 14:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 916D4829F2
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 14:55:20 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1990333wmb.1
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoIHvmvGc6WefZIYq1gAlhNVSAk0bxW3UOa32oMasyw=;
 b=O2S1U3Pm45Eud/GZ7j6VhF6E1VEFt7u+8TntZNqS/aQHxBJs1E1YN/TequWXIhyxKA
 Y6uwxn79yP4QeJzydc8HAXL6nOV5nst5tVbRbHwLQAj6rIZBWGD4LWxQYj0JbYAQ6P/X
 8sWvsdsN/YDe5uasDEZ9ZKYSjckx0jOZD26G59dvxzZx4q4KhJZmrN9JLmCbQkuYfgaS
 WEIC+D8NjsFtQ6ISQemQRJcjccKtzAm9GAMLiBOOpmplwszJV/cXPlajgD7Lx30lexEC
 VWTiEhgpDRYIa54H+joDQc22hvI4A3l1W1tqNqk+b7sKfEK6kmY3z257l555JRXein58
 Dt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OoIHvmvGc6WefZIYq1gAlhNVSAk0bxW3UOa32oMasyw=;
 b=keBFormhgMcFo25GKUV7sAaO9wi3Cd4mWF3iuMmj2jwRKyn/gJdxZIjxXbuQjrI+pO
 NoXLyLDknpoFE7I3juKb6g+ERiwFVxKso6iMxA6JViOLs+fbAG32kizlKvtNZdJpsOAg
 W44ER3AE/BMVeEkon7HTDxcoQGZ/xnEcmxeIW0pl8ToWoNsOUKwWeaexsyA38kPhgyT1
 aiDGYTbNdnc8pUTz69PtznYO8QJ5O8CqqVsblz5qYLvAKc6I+iiI4jDEKnUKgbNulEIX
 I/ncbLgDVTJAUyBcUDEnWMK9s/dDQpvytIW4fnqucYsulvXEn7k3qsi+qa8gtqJFYvRk
 ZIjQ==
X-Gm-Message-State: AOAM533RECOQZXJJDxriwevDoO+HtBf9p4pS9MFEasrfGsaDFbEly796
 b//8cmc16bitB4BjBfdxVvZcs5HaXyQ=
X-Google-Smtp-Source: ABdhPJy3g0xBQ3XTFi09fv1XsYPV8SarZ5dnNFWjphSFETmKOPrIpyPU8aGcsJiyaLTGKzIQO0EOBQ==
X-Received: by 2002:a1c:cc08:: with SMTP id h8mr7711046wmb.156.1643208918525; 
 Wed, 26 Jan 2022 06:55:18 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id g5sm16396591wri.108.2022.01.26.06.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 06:55:18 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 26 Jan 2022 15:55:02 +0100
Message-Id: <20220126145503.1032630-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/lua: bump to version 5.4.4
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
 package/lua/5.4.3/lua.hash                                  | 6 ------
 package/lua/{5.4.3 => 5.4.4}/0001-root-path.patch           | 0
 package/lua/{5.4.3 => 5.4.4}/0002-shared-libs-for-lua.patch | 0
 package/lua/{5.4.3 => 5.4.4}/0011-linenoise.patch           | 2 +-
 package/lua/5.4.4/lua.hash                                  | 6 ++++++
 package/lua/lua.mk                                          | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 package/lua/5.4.3/lua.hash
 rename package/lua/{5.4.3 => 5.4.4}/0001-root-path.patch (100%)
 rename package/lua/{5.4.3 => 5.4.4}/0002-shared-libs-for-lua.patch (100%)
 rename package/lua/{5.4.3 => 5.4.4}/0011-linenoise.patch (97%)
 create mode 100644 package/lua/5.4.4/lua.hash

diff --git a/package/lua/5.4.3/lua.hash b/package/lua/5.4.3/lua.hash
deleted file mode 100644
index be3604837..000000000
--- a/package/lua/5.4.3/lua.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Hashes from: https://www.lua.org/ftp/
-md5  ef63ed2ecfb713646a7fcc583cf5f352  lua-5.4.3.tar.gz
-sha1  1dda2ef23a9828492b4595c0197766de6e784bc7  lua-5.4.3.tar.gz
-
-# Locally computed
-sha256  d205bfea131113bcdd64d4ebe4a50ce34063b42bad24b93e44b4b0d853ae4d49  doc/readme.html
diff --git a/package/lua/5.4.3/0001-root-path.patch b/package/lua/5.4.4/0001-root-path.patch
similarity index 100%
rename from package/lua/5.4.3/0001-root-path.patch
rename to package/lua/5.4.4/0001-root-path.patch
diff --git a/package/lua/5.4.3/0002-shared-libs-for-lua.patch b/package/lua/5.4.4/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.4.3/0002-shared-libs-for-lua.patch
rename to package/lua/5.4.4/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.4.3/0011-linenoise.patch b/package/lua/5.4.4/0011-linenoise.patch
similarity index 97%
rename from package/lua/5.4.3/0011-linenoise.patch
rename to package/lua/5.4.4/0011-linenoise.patch
index 7b9d6d76f..68316e108 100644
--- a/package/lua/5.4.3/0011-linenoise.patch
+++ b/package/lua/5.4.4/0011-linenoise.patch
@@ -8,7 +8,7 @@ Index: b/src/lua.c
 ===================================================================
 --- a/src/lua.c
 +++ b/src/lua.c
-@@ -421,6 +421,14 @@
+@@ -428,6 +428,14 @@
  #define lua_saveline(L,line)	((void)L, add_history(line))
  #define lua_freeline(L,b)	((void)L, free(b))
  
diff --git a/package/lua/5.4.4/lua.hash b/package/lua/5.4.4/lua.hash
new file mode 100644
index 000000000..b55b17f25
--- /dev/null
+++ b/package/lua/5.4.4/lua.hash
@@ -0,0 +1,6 @@
+# Hashes from: https://www.lua.org/ftp/
+md5  bd8ce7069ff99a400efd14cf339a727b  lua-5.4.4.tar.gz
+sha1  03c27684b9d5d9783fb79a7c836ba1cdc5f309cd  lua-5.4.4.tar.gz
+
+# Locally computed
+sha256  2556ac7198243f9f83130b9c81016e1904f7b30351481f1c28e02475dbd237fb  doc/readme.html
diff --git a/package/lua/lua.mk b/package/lua/lua.mk
index 844e165df..09e7b34f7 100644
--- a/package/lua/lua.mk
+++ b/package/lua/lua.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 ifeq ($(BR2_PACKAGE_LUA_5_4),y)
-LUA_VERSION = 5.4.3
+LUA_VERSION = 5.4.4
 else ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 LUA_VERSION = 5.3.6
 else
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
