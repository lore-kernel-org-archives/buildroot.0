Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD5DC3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 07:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D713781973;
	Wed,  3 Jan 2024 07:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D713781973
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFkZ7W6CpahZ; Wed,  3 Jan 2024 07:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2102F81AA7;
	Wed,  3 Jan 2024 07:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2102F81AA7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 628C51BF27E
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39F9140A5F
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 07:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39F9140A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UHi2epX0-5wU for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 07:11:20 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8347840503
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 07:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8347840503
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 597C7A4C07F3;
 Wed,  3 Jan 2024 08:11:16 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58818)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rKvPH-000000001ed-3VEE;
 Wed, 03 Jan 2024 08:11:15 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jan 2024 08:11:15 +0100
Message-Id: <20240103071115.6131-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704265876;
 bh=b80PEeXcepxshUlAnGhLwImsxWB4yrbCQC7bY7Hy1EU=;
 h=From:To:Cc:Subject:Date:From;
 b=pGouA5LT4G78njoBfp0Ylo/3Xf7aUe4o4ImSMFLDubYwjcb+elLs3/PVNDCEq9nZp
 pg3qx3U3rxlBtwn0TWinuM7rrdg01vSURRexRTAuKxQjpp/84ofsLkwBULptBA2oal
 9JIpTv9ZM7DRdhXh4YWfkKv58XEg7nzgRCspoHR9x6B5eWfaUFkWZO9QpLYrLkzUtx
 iDCU/6NLPc1nNllhPygKbfNWA9KPEy6Vr84LYVKSWkT/YAFfEsLIxHCZdoC77R7nj/
 +WkJ7DvhH3oZgxAyYXeVKDohQQdqJQKVgkywcaE3L6TZKwijkFJMpC5o8e3fGmqNap
 /yrBtQgGXGLyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=pGouA5LT
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.28.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://cmake.org/cmake/help/v3.28/release/3.28.html

Release notes:
https://www.kitware.com/cmake-3-28-0-available-for-download/
https://www.kitware.com/cmake-3-28-1-available-for-download/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index fbf0786232..51fff6c3ef 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.27/cmake-3.27.9-SHA-256.txt
-sha256  609a9b98572a6a5ea477f912cffb973109ed4d0a6a6b3f9e2353d2cdc048708e  cmake-3.27.9.tar.gz
+# From https://cmake.org/files/v3.28/cmake-3.28.1-SHA-256.txt
+sha256  15e94f83e647f7d620a140a7a5da76349fc47a1bfed66d0f5cdee8e7344079ad  cmake-3.28.1.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 7506e964a9..f56be9ba5c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.27
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
+CMAKE_VERSION_MAJOR = 3.28
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
