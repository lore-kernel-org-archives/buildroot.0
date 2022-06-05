Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84853C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 21:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B5B843B9;
	Sun,  5 Jun 2022 21:24:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNgpuyiYFur6; Sun,  5 Jun 2022 21:24:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E73B843B5;
	Sun,  5 Jun 2022 21:24:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D14A1BF290
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B66B40104
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 21:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oIHZuv7j0Tss for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 21:24:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8863640D7A
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 21:24:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D216686C25; Sun,  5 Jun 2022 21:12:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 23:21:13 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 56ba3990c98ac715fd0779307a88c358684f553e
X-Git-Newrev: 707d6e124d5853d57f80dd456cf1ecb9d41115c9
X-Patchwork-Hint: ignore
Message-Id: <20220605211218.D216686C25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cmake: bump version to
 3.22.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6892532273210617561=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6892532273210617561==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=707d6e124d5853d57f80dd456cf1ecb9d41115c9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Version 3.20 is the first one where the following issue is fixed:
https://gitlab.kitware.com/cmake/cmake/-/issues/18299
Was affected by this bug and decide to bump the version to the
latest stable

The Copyright.txt changed with minor changes (see below) and therefore
its hash is updated.

@@ -1,5 +1,5 @@
 CMake - Cross Platform Makefile Generator
-Copyright 2000-2020 Kitware, Inc. and Contributors
+Copyright 2000-2021 Kitware, Inc. and Contributors
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
@@ -65,8 +65,8 @@
 * Jan Woetzel
 * Julien Schueller
 * Kelly Thompson <kgt@lanl.gov>
-* Laurent Montel <montel@kde.org>
 * Konstantin Podsvirov <konstantin@podsvirov.pro>
+* Laurent Montel <montel@kde.org>
 * Mario Bensi <mbensi@ipsquad.net>
 * Martin Gräßlin <mgraesslin@kde.org>
 * Mathieu Malaterre <mathieu.malaterre@gmail.com>

Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/cmake.hash | 6 +++---
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index da514a6d6b..43b5efb0f0 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
-sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
+# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
+sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
 
 # Locally calculated
-sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
+sha256  f1a4326266aada65b307dac05161a9d02d3dba4fb08b50cb26e3c24cc8a86e97  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 4177b119ab..053658fad6 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CMAKE_VERSION_MAJOR = 3.18
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
+CMAKE_VERSION_MAJOR = 3.22
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt

--===============6892532273210617561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6892532273210617561==--
