Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B437C7EE2F
	for <buildroot@archiver.kernel.org>; Sat, 10 Jun 2023 13:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84B1E60AB5;
	Sat, 10 Jun 2023 13:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84B1E60AB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kpk8RS6dUc0b; Sat, 10 Jun 2023 13:33:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2419C60EAB;
	Sat, 10 Jun 2023 13:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2419C60EAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84D911BF343
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F81340289
 for <buildroot@lists.busybox.net>; Sat, 10 Jun 2023 13:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F81340289
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hgtzuac9hoU for <buildroot@lists.busybox.net>;
 Sat, 10 Jun 2023 13:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CDC84010D
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CDC84010D
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 13:32:59 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-977c88c9021so452406266b.3
 for <buildroot@buildroot.org>; Sat, 10 Jun 2023 06:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686403977; x=1688995977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N/vHh1P7sY7RJoBAJHpsJFzjEBa8YXAU7LzSzW5RI/8=;
 b=YDPk4247nPTEg6CwvsKUDB+rynCdBPGzHuwxq2ACFNBtBGoMoAde2srpyJWu7c91xE
 XT0xK+zHrqmYM8y8i7VHmPVr7OvMivKYHuddUkqCo7LvMBj7KA5IBjEhwzU5uc82nYXR
 yOVvlhlTJwiWwGCbt5Emg4j6gPcvdJOwN1owIh2IUlD937sjy5mQ6NHOa1UguqA0ijYv
 20xM6f2r+j7fs+YM+lE4RDtuvLlmaKt9xjDjLB8NRwpmwTQtw5myi7VJGoMmiBWv0eX3
 iAmdpARplvRtJoIPfqYegh+Tdecmcp0JAc2ZdXhgTNHHAL4hBWmigYDETlW4Dr8g9jQq
 JaIg==
X-Gm-Message-State: AC+VfDxyezKik7YSvM0eWSAS4RfoDYsxiNoP4ccBLj4IscKEchGodh3E
 2zLqMpDjtAOpRnHcgMHL9Jm87VPxESPEjQ==
X-Google-Smtp-Source: ACHHUZ4xsci52l7wNJARQFUvRx9UO7DmVHr2CsbjBRGS9Jv/JEWo8EHoHUswnHb2W/0ZKiUUgON+KA==
X-Received: by 2002:a17:907:318d:b0:96f:f6a6:58dd with SMTP id
 xe13-20020a170907318d00b0096ff6a658ddmr5381683ejb.5.1686403976742; 
 Sat, 10 Jun 2023 06:32:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:9ac8:47a3:9e97:6ffe])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a1709061cd700b0094f07545d40sm2559774ejh.220.2023.06.10.06.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jun 2023 06:32:56 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Sat, 10 Jun 2023 15:32:49 +0200
Message-Id: <20230610133251.97022-2-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230610133251.97022-1-thomas@devoogdt.com>
References: <20230610133251.97022-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/4] package/fluent-bit: use the system
 provided LuaJIT
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luajit was not used at all when it was selected, instead fluent-bit
recompiled it without taking care of the complexities that were
handled in the luajit package. Fix this by linking dynamically to the
buildroot provided version.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2: No change.
---
 ...-the-system-provided-LuaJIT-if-found.patch | 62 +++++++++++++++++++
 package/fluent-bit/fluent-bit.mk              |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch

diff --git a/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
new file mode 100644
index 0000000000..9f6f4d0ebb
--- /dev/null
+++ b/package/fluent-bit/0001-build-use-the-system-provided-LuaJIT-if-found.patch
@@ -0,0 +1,62 @@
+From 4f8eb7bb5a39d83374806928b7a5b622136ef055 Mon Sep 17 00:00:00 2001
+From: Thomas Devoogdt <thomas@devoogdt.com>
+Date: Fri, 28 Apr 2023 10:25:16 +0200
+Subject: [PATCH] build: use the system provided LuaJIT if found
+
+e.g. buildroot has logic to build luajit,
+so if pkg_check_modules can find a suitable version,
+then use that one if -DFLB_PREFER_SYSTEM_LIBS=Yes.
+
+Upstream: https://github.com/fluent/fluent-bit/pull/7286
+Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
+---
+ CMakeLists.txt     | 12 +++++++++++-
+ src/CMakeLists.txt |  2 +-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 9af783c79..0601b7c18 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -123,6 +123,7 @@ option(FLB_TESTS_INTERNAL_FUZZ "Enable internal fuzz tests"    No)
+ option(FLB_TESTS_OSSFUZZ       "Enable OSS-Fuzz build"         No)
+ option(FLB_MTRACE              "Enable mtrace support"         No)
+ option(FLB_POSIX_TLS           "Force POSIX thread storage"    No)
++option(FLB_PREFER_SYSTEM_LIBS  "Prefer system installed libraries" No)
+ option(FLB_INOTIFY             "Enable inotify support"       Yes)
+ option(FLB_SQLDB               "Enable SQL embedded DB"       Yes)
+ option(FLB_HTTP_SERVER         "Enable HTTP Server"           Yes)
+@@ -1003,7 +1004,16 @@ endif()
+ # LuaJIT (Scripting Support)
+ # ==========================
+ if(FLB_LUAJIT)
+-  include(cmake/luajit.cmake)
++  if(FLB_PREFER_SYSTEM_LIBS)
++    find_package(PkgConfig)
++    pkg_check_modules(LUAJIT luajit>=2.1.0)
++  endif()
++  if(LUAJIT_FOUND)
++    include_directories(${LUAJIT_INCLUDE_DIRS})
++  else()
++    include(cmake/luajit.cmake)
++    set(LUAJIT_LIBRARIES "libluajit")
++  endif()
+   FLB_DEFINITION(FLB_HAVE_LUAJIT)
+ endif()
+ 
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index 06a206dd4..8b66ddd22 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -220,7 +220,7 @@ endif()
+ if(FLB_LUAJIT)
+   set(extra_libs
+     ${extra_libs}
+-    "libluajit")
++    ${LUAJIT_LIBRARIES})
+ endif()
+ 
+ if(FLB_SQLDB)
+-- 
+2.34.1
+
diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index a6080b0aab..2949c5cdd0 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -20,6 +20,7 @@ FLUENT_BIT_CONF_OPTS += \
 	-DFLB_RELEASE=Yes \
 	-DFLB_EXAMPLES=No \
 	-DFLB_CHUNK_TRACE=No \
+	-DFLB_PREFER_SYSTEM_LIBS=Yes \
 	-DFLB_BACKTRACE=No
 
 ifeq ($(BR2_PACKAGE_FLUENT_BIT_WASM),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
