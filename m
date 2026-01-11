Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F105BD25032
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 17:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C385A8130F;
	Sun, 11 Jan 2026 17:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ungLAZGsvcLM; Sun, 11 Jan 2026 17:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88841812EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768152418;
	bh=cl9f1f3LvytNYF3EAKk34tTvRHn8d2vMU4p1zCQcAQQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iCNA/u80xooiAXT0O0ua6XlTtMSEirXmwXn6O0rfb4eSyTnAQjJof+neXvlwlnE/9
	 sZskc7jY9QxgCS2LaBI69qQwr2/GKTNWg0S+7KyZW1JmzBrBUaN459BvCUqHeulb6U
	 0mMy/1+RzmDL5qbCQHO8H9DfcQQwFwgX/zzgbtQpGIcTn2pc17xm6+0R9ubU0piAtZ
	 toIJCNmiBjrck2t/PVqGBrqmBdVCNye/k9HWiyJMZCdklnw/Fp6rKmyJfBh3zj5x+e
	 oV9LnnEVExzVAHsn+ZPNWPGP5KMowGV9gqL1aT47l3eK5dgGuUDmy8TmgtuSrZe/6P
	 9MzA5mFoCLN9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88841812EB;
	Sun, 11 Jan 2026 17:26:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 568C018D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6FF6402A7
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59ruyjAg4Slw for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 018404035A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 018404035A
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 17:26:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2BFB884A1; Sun, 11 Jan 2026 17:26:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 18:23:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a57a35bdd08ec7ff778823efea4c383ef9694040
X-Git-Newrev: 90c8073bd46060e40f90db0b2476a0789554236e
X-Patchwork-Hint: ignore
Message-Id: <20260111172649.F2BFB884A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgeos: bump version to 3.14.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90c8073bd46060e40f90db0b2476a0789554236e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/libgeos/geos/releases/tag/3.14.1

Drop merged upstream patch.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...p-make-floating-point-exceptions-optional.patch | 71 ----------------------
 package/libgeos/libgeos.hash                       |  2 +-
 package/libgeos/libgeos.mk                         |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)

diff --git a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch b/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
deleted file mode 100644
index 6adcd39861..0000000000
--- a/package/libgeos/0001-geosop-make-floating-point-exceptions-optional.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From a6bac7bd506988085fa692ff2e12727ae0e9db84 Mon Sep 17 00:00:00 2001
-From: Maxim Kochetkov <fido_max@inbox.ru>
-Date: Mon, 15 Sep 2025 17:16:08 +0300
-Subject: [PATCH] geosop: make floating-point exceptions optional
-
-commit 26292ce ("geosop: show most floating-point exceptions in verbose mode")
-add fenv.h dependency. Some libc implementations (uclibc-ng )may have no fenv
-support. So make floating-point exceptions optional and detetct fenv.h at
-configure stage.
-
-Upstream: https://github.com/libgeos/geos/pull/1305
-Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
----
- CMakeLists.txt         | 7 +++++++
- util/geosop/GeosOp.cpp | 6 ++++++
- 2 files changed, 13 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 12411e586..a1e2f0c6e 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -558,3 +558,10 @@ if(PROJECT_IS_TOP_LEVEL)
- 
-   unset(_is_multi_config_generator)
- endif()  # PROJECT_IS_TOP_LEVEL
-+
-+include(CheckIncludeFile)
-+check_include_file(fenv.h HAVE_FENV_H)
-+
-+if(HAVE_FENV_H)
-+    target_compile_definitions(geos_cxx_flags INTERFACE HAVE_FENV)
-+endif()
-diff --git a/util/geosop/GeosOp.cpp b/util/geosop/GeosOp.cpp
-index 2cb17f000..05307cf30 100644
---- a/util/geosop/GeosOp.cpp
-+++ b/util/geosop/GeosOp.cpp
-@@ -26,7 +26,9 @@
- #include <geos/io/WKBStreamReader.h>
- #include <geos/io/WKBWriter.h>
- 
-+#if defined(HAVE_FENV)
- #include <cfenv>
-+#endif
- #include <fstream>
- #include <iostream>
- #include <sstream>
-@@ -394,10 +396,13 @@ void GeosOp::run(OpArguments& opArgs) {
-     //------------------------
- 
-     try {
-+#if defined(HAVE_FENV)
-         std::feclearexcept(FE_ALL_EXCEPT); // clear floating-point status flags
-+#endif
- 
-         execute(op, opArgs);
- 
-+#if defined(HAVE_FENV)
-         // Catch everything except for FE_INEXACT, which is usually harmless
-         const int fpexp = std::fetestexcept(FE_ALL_EXCEPT ^ FE_INEXACT);
-         if (args.isVerbose && (fpexp != 0)) {
-@@ -414,6 +419,7 @@ void GeosOp::run(OpArguments& opArgs) {
-                 std::cerr << " FE_UNDERFLOW";
-             std::cerr << std::endl;
-         }
-+#endif
-     }
-     catch (std::exception &e) {
-         std::cerr << "Run-time exception: " << e.what() << std::endl;
--- 
-2.51.0
-
diff --git a/package/libgeos/libgeos.hash b/package/libgeos/libgeos.hash
index 538933873b..0441b89426 100644
--- a/package/libgeos/libgeos.hash
+++ b/package/libgeos/libgeos.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fe85286b1977121894794b36a7464d05049361bedabf972e70d8f9bf1e3ce928  geos-3.14.0.tar.bz2
+sha256  3c20919cda9a505db07b5216baa980bacdaa0702da715b43f176fb07eff7e716  geos-3.14.1.tar.bz2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libgeos/libgeos.mk b/package/libgeos/libgeos.mk
index 0de73e2688..cc34ba2aca 100644
--- a/package/libgeos/libgeos.mk
+++ b/package/libgeos/libgeos.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGEOS_VERSION = 3.14.0
+LIBGEOS_VERSION = 3.14.1
 LIBGEOS_SITE = http://download.osgeo.org/geos
 LIBGEOS_SOURCE = geos-$(LIBGEOS_VERSION).tar.bz2
 LIBGEOS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
