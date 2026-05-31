Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F5FCD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 14:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB47960BE2;
	Sun, 31 May 2026 14:05:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ttWGq3iC17QA; Sun, 31 May 2026 14:05:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AC1860C0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780236323;
	bh=mERMyGzWwKKlTzlfL3gwfMvVCWaNaLp0C9vqV6YiaOM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bn7sFEOMNjljHUXwbyrpd00DEVrR4xRZSG4HszFtdUB5ECLsjPwvt7DsQkeIVyJz1
	 zJ+MiqZlfMRujM+EbMWKlZ1Y/TNn1WwocYEEwHYEay64iCG0tsf/XNINC1BgISbfye
	 bw3rhseMZCLs6ZRBoieqf4tjWdZX4591NmqozI5ekXHfSRhee2QNPqy9KZrt4szAha
	 DcMu18vwK9Vfpg4BWfXHVi+Y6Gta6OmqFuHyxfdcT1/fP8nLNEEFENnpwQKdeA3alu
	 5KWfAqlwaEz6cZPinnSCn9w7fw2pmONruB2NJDjfyZZzSyAl70cYXnALEBdagitWss
	 sXNou//ktukrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AC1860C0D;
	Sun, 31 May 2026 14:05:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5F5A2AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB69440183
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:05:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1VArXsT2W-Z for <buildroot@buildroot.org>;
 Sun, 31 May 2026 14:05:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02E17400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02E17400C4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 14:05:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8280D876D6; Sun, 31 May 2026 14:05:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 16:04:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1d6a0cab454f319524f8f17278a600ce134d1f70
X-Git-Newrev: e16546abbc2b17abe3cd5b0fd68235b3247d01db
X-Patchwork-Hint: ignore
Message-Id: <20260531140507.8280D876D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lensfun: bump version
 to git commit 268821c024
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e16546abbc2b17abe3cd5b0fd68235b3247d01db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Last release dates back to Jul 2023 with >3000 commits since then:
https://github.com/lensfun/lensfun/issues/2634

Removed patch which is included in this version.

Renamed CMake option PYTHON to INSTALL_PYTHON_MODULE:
Upstream renamed PYTHON to PYTHONINTERP_FOUND with commit
https://github.com/lensfun/lensfun/commit/824b9d36c13f97b415a94d271e35c815ea576b21
and later guarded the python code with a new CMake option
INSTALL_PYTHON_MODULE which we now use.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lensfun/0001-cmake4.patch | 29 -----------------------------
 package/lensfun/lensfun.hash      |  2 +-
 package/lensfun/lensfun.mk        |  8 +++++---
 3 files changed, 6 insertions(+), 33 deletions(-)

diff --git a/package/lensfun/0001-cmake4.patch b/package/lensfun/0001-cmake4.patch
deleted file mode 100644
index d7973f4cb7..0000000000
--- a/package/lensfun/0001-cmake4.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 011de2e85813ff496a85404b30891352555de077 Mon Sep 17 00:00:00 2001
-From: Jonas <git@jonas-ott.de>
-Date: Fri, 17 Feb 2023 18:26:01 +0100
-Subject: [PATCH] cmake: use FindPython3 (#1983)
-
-@jonas-ott Thank you for contributing!
-
-Upstream: https://github.com/lensfun/lensfun/commit/011de2e85813ff496a85404b30891352555de077
-
-[Bernd: partial backport to version 0.3.4]
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt       |  4 ++--
- apps/CMakeLists.txt  | 55 +++++++++++++++++++++-----------------------
- tests/CMakeLists.txt |  4 ++--
- 3 files changed, 30 insertions(+), 33 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5ccb9976d..7bb7a6878 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,5 +1,5 @@
--# require at least cmake 2.8.12
--CMAKE_MINIMUM_REQUIRED(VERSION 2.8.12 FATAL_ERROR )
-+# require at least cmake 3.12
-+CMAKE_MINIMUM_REQUIRED(VERSION 3.12 FATAL_ERROR)
- 
- # path for helper modules
- set(CMAKE_MODULE_PATH "${CMAKE_MODULE_PATH}" "${CMAKE_SOURCE_DIR}/cmake/modules")
diff --git a/package/lensfun/lensfun.hash b/package/lensfun/lensfun.hash
index 5cb4fe37cd..f73ea46e17 100644
--- a/package/lensfun/lensfun.hash
+++ b/package/lensfun/lensfun.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  dafb39c08ef24a0e2abd00d05d7341b1bf1f0c38bfcd5a4c69cf5f0ecb6db112  lensfun-0.3.4.tar.gz
+sha256  656fb82a0501616b4024854fc716f004cf07d28443ee09fcf436afb6722da561  lensfun-268821c02495c0ffff8332417f0d59bdbefa545d.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  docs/gpl-3.0.txt
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  docs/lgpl-3.0.txt
diff --git a/package/lensfun/lensfun.mk b/package/lensfun/lensfun.mk
index 59f008ce6d..d9b4faa8d5 100644
--- a/package/lensfun/lensfun.mk
+++ b/package/lensfun/lensfun.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LENSFUN_VERSION = 0.3.4
-LENSFUN_SITE = $(call github,lensfun,lensfun,v$(LENSFUN_VERSION))
+LENSFUN_VERSION = 268821c02495c0ffff8332417f0d59bdbefa545d
+LENSFUN_SITE = $(call github,lensfun,lensfun,$(LENSFUN_VERSION))
 LENSFUN_LICENSE = LGPL-3.0+ (libraries), GPL-3.0+ (programs)
 LENSFUN_LICENSE_FILES = docs/gpl-3.0.txt docs/lgpl-3.0.txt
 LENSFUN_INSTALL_STAGING = YES
@@ -42,6 +42,8 @@ endif
 
 # Don't install helper scripts (which require python3 and gksudo).
 # Don't run setup.py on the host.
-LENSFUN_CONF_OPTS += -DINSTALL_HELPER_SCRIPTS=OFF -DPYTHON=OFF
+LENSFUN_CONF_OPTS += \
+	-DINSTALL_HELPER_SCRIPTS=OFF \
+	-DINSTALL_PYTHON_MODULE=OFF
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
