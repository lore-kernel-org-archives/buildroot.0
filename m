Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660CBC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 14:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFCF940301;
	Sun,  6 Feb 2022 14:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SduNdwd1c8Gn; Sun,  6 Feb 2022 14:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F2EC402E2;
	Sun,  6 Feb 2022 14:59:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8651BF36F
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C0CE60804
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 14:59:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3HE8cAgNpgLw for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 14:59:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E64460590
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 14:59:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so4033669wml.0
 for <buildroot@buildroot.org>; Sun, 06 Feb 2022 06:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ovyZqY3/CL5W/0tEcUxGlDDGYm1brGV2KScCCYa2OcI=;
 b=qx+yTSnYaR3XhDtaL8fWIAw8wOyskAJKGjvUItZCnu2OTqcniMXAOyI0ZM9e9lPQU8
 SmnQhn2DGw/YnPEwBojgdwVwnkIehR3RsafvpQSlhiCdw8ZwfWfXIy2GJfvPgElkanqX
 IsoqdKQYhqzKtPczO4WLdzCxAEQ/vRBX9NNLmgY7e7mP0eIJVIz9bYYyYU45CXayOLLy
 bxhS60uefG6A9n1mxJMQ9hUj+NsRAxOn+fnGpPEIff+NmEkaObuI4MRSmexwZB5NobVF
 VBIxvoplfNRpkH5RBL7iK9xqLk6YZXmiTO/FfAEVkPeA98Fnt0GauNWkT3dey6wVwg4G
 rvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ovyZqY3/CL5W/0tEcUxGlDDGYm1brGV2KScCCYa2OcI=;
 b=6pBMHO7pYhFtJZzGYQf98audcKrBrVQ01fABKAJYmyPsTPN0QSY6b0qjkwidrav/uQ
 ySBw2Sw1WiuQruvV1eNTkAJU93Dud25wORFzcTRBB/X5Ahzl3NzVJ07HQ4/iKhBqrRWi
 PwArHHw3gGURFVY5rONZRYHaBa4vbVrTAQX4PzskmH7GcR8YRmGUcMeZhoN0lq5DeUfx
 ZrCsyYEJ0mwUX8fw/FyNkMpfgP5kULHa108EBQBRrz0uEHlomMXzR69koIPtCOp7832g
 9L5JDyIPfyhAqIqoyr5PsF2BtrG77sC34kcQWZbO5jSRPLYNh9lXl9d7sfuOIXDavB6K
 fFyg==
X-Gm-Message-State: AOAM531SGkxrdP6Nr+beKl7XdIVJ28KqFyiF2iOciDSmC3cy6OzI8V0+
 GHiSoRroHXsjGGntgXzDPfV3Qjvbwek=
X-Google-Smtp-Source: ABdhPJyOALzZ6RKscYFNotXt9R5iDzvqEHkbhcC3LE615KyU2RWTeMRAnkPt+WqDw/MLy1VxrpicvQ==
X-Received: by 2002:a7b:c318:: with SMTP id k24mr7342589wmj.0.1644159589122;
 Sun, 06 Feb 2022 06:59:49 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id o20sm6849541wmq.35.2022.02.06.06.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 06:59:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 15:57:40 +0100
Message-Id: <20220206145740.1765660-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/protozero: bump to version 1.7.1
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/mapbox/protozero/releases/tag/v1.7.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...CMakeLists.txt-respect-BUILD_TESTING.patch | 47 -------------------
 package/protozero/protozero.hash              |  2 +-
 package/protozero/protozero.mk                |  2 +-
 3 files changed, 2 insertions(+), 49 deletions(-)
 delete mode 100644 package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch

diff --git a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch b/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
deleted file mode 100644
index d0267e3283..0000000000
--- a/package/protozero/0001-CMakeLists.txt-respect-BUILD_TESTING.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 03daae49c8fa94513b508bd12f1597e8e5e086f2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 17 Apr 2021 13:06:44 +0200
-Subject: [PATCH] CMakeLists.txt: respect BUILD_TESTING
-
-Don't build tests if the standard cmake BUILD_TESTING variable is set to
-OFF.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mapbox/protozero/pull/105]
----
- CMakeLists.txt | 9 +++++----
- 1 file changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index f9702d6..7a40212 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -23,6 +23,7 @@ set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
- 
- #-----------------------------------------------------------------------------
- 
-+option(BUILD_TESTING "Build tests" ON)
- option(WERROR "Add -Werror flag to build (turns warnings into errors)" ON)
- 
- if(MSVC)
-@@ -134,13 +135,13 @@ install(DIRECTORY include/protozero DESTINATION include)
- 
- #-----------------------------------------------------------------------------
- 
--enable_testing()
--
- add_subdirectory(doc)
- 
- add_subdirectory(tools)
- 
--add_subdirectory(test)
--
-+if(BUILD_TESTING)
-+    enable_testing()
-+    add_subdirectory(test)
-+endif()
- 
- #-----------------------------------------------------------------------------
--- 
-2.30.2
-
diff --git a/package/protozero/protozero.hash b/package/protozero/protozero.hash
index 5453e01ecf..f0b8e39009 100644
--- a/package/protozero/protozero.hash
+++ b/package/protozero/protozero.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  beffbdfab060854fd770178a8db9c028b5b6ee4a059a2fed82c46390a85f3f31  protozero-1.7.0.tar.gz
+sha256  27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99  protozero-1.7.1.tar.gz
 sha256  1f4d477e3c2d74d8706c8f05437bd86804abe46853b1f233ce1549a4de76fa49  LICENSE.md
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.from_folly
diff --git a/package/protozero/protozero.mk b/package/protozero/protozero.mk
index 80d16192e3..a46e37d69b 100644
--- a/package/protozero/protozero.mk
+++ b/package/protozero/protozero.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROTOZERO_VERSION = 1.7.0
+PROTOZERO_VERSION = 1.7.1
 PROTOZERO_SITE = $(call github,mapbox,protozero,v$(PROTOZERO_VERSION))
 PROTOZERO_LICENSE = BSD-2-Clause, Apache-2.0
 PROTOZERO_LICENSE_FILES = LICENSE.md LICENSE.from_folly
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
