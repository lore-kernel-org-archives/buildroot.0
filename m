Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBBFCDB470
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 17:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC48C60B00;
	Wed, 11 Oct 2023 17:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC48C60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFMnZL8_wd5N; Wed, 11 Oct 2023 17:55:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14DF160BE0;
	Wed, 11 Oct 2023 17:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14DF160BE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FBF11BF3D6
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01E3F40160
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 17:55:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01E3F40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EWBy0_kjFyt for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 17:55:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA71740004
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 17:55:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA71740004
Received: from fli4l.lan.fli4l (p54a1b15c.dip0.t-ipconnect.de [84.161.177.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91480A4C06CE;
 Wed, 11 Oct 2023 19:54:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57354)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qqdQB-0004BX-18;
 Wed, 11 Oct 2023 19:54:59 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 19:54:59 +0200
Message-Id: <20231011175459.72943-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697046899;
 bh=GTVUi+eH7d8gR4ujeajGswlAYkhDcPR8LLzKhUT4500=;
 h=From:To:Cc:Subject:Date:From;
 b=JwlqbsYbM6kRF+dcHg9B7N+oLDQREP2r5CKu5+FWq+144S8zlaLCuorhn7hEcIFk/
 GSpRYzDWifmYHbY4Fh9q0/FZsGV9WLTeJhL11/3D/dAYfC3ly71CTcza00FCgri6qz
 sBY4fce71cdHBtRhivUa3SU6f9TjTs3p7z5rqSU/InrMsOjvzqZTywFYAR/vyFcD86
 2/4n345R4UNTphTXE7Ljrfz4zluiu+42qFj95kNvTvixmqEdwWeCIPdomCEXJ6okge
 CbBxHbnfmeJY6Ht57sgwVd2tSycmrYBksw3xQmeCKTKYMuvCpX+o/aSZTZspcLIfDu
 orQL9sgBOJQ4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=JwlqbsYb
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.27.7
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

Changelog: https://cmake.org/cmake/help/v3.27/release/3.27.html#updates

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 8b1ae5b4a6..e495061bae 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.27/cmake-3.27.6-SHA-256.txt
-sha256  ef3056df528569e0e8956f6cf38806879347ac6de6a4ff7e4105dc4578732cfb  cmake-3.27.6.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.7-SHA-256.txt
+sha256  08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e  cmake-3.27.7.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 3bb2c4bffb..41278bf6db 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.27
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).7
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
