Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9FAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 19:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C3AF41725;
	Wed, 13 Apr 2022 19:10:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ZqoIeDKgced; Wed, 13 Apr 2022 19:10:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48D3C416EB;
	Wed, 13 Apr 2022 19:10:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0F311BF405
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 19:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF96F82A3B
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 19:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnVlvkyf1P6X for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 19:10:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9D8CB829FD
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 19:10:16 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i20so3960047wrb.13
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xM55QEo0/Tl8pw9sgzoEPxypPT4xUwYfzW5i7ZTwupc=;
 b=hWxYj7u/y68mREew9TAXWUnBmHjrapIqF1efAlVr5SX6RbWha03pipIv0SDFjoP/PK
 vjjTcEvX/ZAgaCRCvr9jR0r26UZG5p7tQ3odFDvXjdf2U/0QhCr/TAbe03lfcbjAAf3p
 KzzTFmRavzuP0GwKReey9artXiURTT4pSMumMkPD36QcTQMGOs0T+JT50c/6hyhSqR2v
 +AfXC9dfVGbZeOthBoDQAhxmoQi69ZUanpLHMHjKZFs8FKWViIk2bOnPZDkct6GfUhEQ
 oV2AFGjG+TQWpe0xgefeHkCg98CJpuPcAi4xIN5zzL9wPC2I7rSUH7H8dFei/2X00XKV
 ktsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xM55QEo0/Tl8pw9sgzoEPxypPT4xUwYfzW5i7ZTwupc=;
 b=b5p4GaCuyZyv55CYxWOSwT7CBTRSbEDYZm0CFisg4Gx6l689bRt5m46MdgLsvJuVb/
 fcueGA9SIhDVPlVcxOFPEgeOo5eVRwJ0MxSTGTF30hek1PMJl6VdJ7KoSy7nQ6/N7bN5
 Uu8QsvIZQuZ5Y2IzLD/+yRcfiJPKvDTYTaADS0fr/lXtiQI6Stwe8HZwWvfldwlbu/cu
 7KD8hBYLR8PDHqDSvYh521pRo6mRrtUfqPd6FFufkz+azw6xRB5rIlJC3HRPEt8mJDaF
 jn4BKPTSEvV9QV8DF1na85IQwtVIvWhNk6jxD2/N0VzkJlRoJPXxqr+o0hR/2l1A81Dv
 VOpA==
X-Gm-Message-State: AOAM531qbS/1QVlL2rLF7yAD0SkmvtUJAs3OoY8CzreNtT03X0j7E4IS
 BbwPQxSUPkGj5nOuTuWvPJhTnF1u5v0=
X-Google-Smtp-Source: ABdhPJzZ4e84kDpRCDOQf/lsQalQOwVfd7x/sfLRKv65H/mEldHaERoRQMTtG32KtnTbnxK4AOQogQ==
X-Received: by 2002:a5d:584a:0:b0:205:a10c:dbd1 with SMTP id
 i10-20020a5d584a000000b00205a10cdbd1mr278130wrf.8.1649877014493; 
 Wed, 13 Apr 2022 12:10:14 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 bi26-20020a05600c3d9a00b0038ed39dbf00sm2974893wmb.0.2022.04.13.12.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 12:10:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 21:08:15 +0200
Message-Id: <20220413190815.888854-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: fix build without C++
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure without C++ raised since bump to version
4.3.1 in commit 3a9cf51ab38b6a3a095241b8e87eab7e5b5bd617 and
https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:

CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
  The C++ compiler

    "/usr/bin/clang++"

  is not able to compile a simple test program.

Fixes:
 - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-fix-build-without-C.patch | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch

diff --git a/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
new file mode 100644
index 0000000000..c6d6d07dcc
--- /dev/null
+++ b/package/libwebsockets/0001-CMakeLists.txt-fix-build-without-C.patch
@@ -0,0 +1,44 @@
+From 726b36eca158063d8871c91ad99a29113ea35aea Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 13 Apr 2022 21:03:26 +0200
+Subject: [PATCH] CMakeLists.txt: fix build without C++
+
+Fix the following build failure without C++ raised since version 4.2.0
+and
+https://github.com/warmcat/libwebsockets/commit/962e9ee345bc28749577c1fca2542a273404627d:
+
+CMake Error at /nvmedata/autobuild/instance-11/output-1/per-package/libwebsockets/host/share/cmake-3.18/Modules/CMakeTestCXXCompiler.cmake:59 (message):
+  The C++ compiler
+
+    "/usr/bin/clang++"
+
+  is not able to compile a simple test program.
+
+Fixes:
+ - http://autobuild.buildroot.org/results/550e7f7d54adf74f8cc078be5b91b3567d622ede
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/warmcat/libwebsockets/pull/2613]
+---
+ CMakeLists.txt | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 08aaf8c6..96e3ad18 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -71,7 +71,10 @@ if (ESP_PLATFORM)
+ endif()
+ 
+ # it's at this point any toolchain file is brought in
+-project(libwebsockets C CXX)
++project(libwebsockets C)
++if (LWS_WITH_SECURE_STREAMS_CPP)
++	enable_language(CXX)
++endif()
+ include(CTest)
+ 
+ if (PICO_SDK_PATH)
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
