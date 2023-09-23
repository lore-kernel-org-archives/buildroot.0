Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF1CE7A88
	for <buildroot@archiver.kernel.org>; Sat, 23 Sep 2023 14:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFAC160FC0;
	Sat, 23 Sep 2023 14:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFAC160FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leqKCOISrml4; Sat, 23 Sep 2023 14:03:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 746A561010;
	Sat, 23 Sep 2023 14:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 746A561010
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E2BFE1BF32B
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 14:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9C4A61010
 for <buildroot@lists.busybox.net>; Sat, 23 Sep 2023 14:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9C4A61010
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5Y3q3_-SbaW for <buildroot@lists.busybox.net>;
 Sat, 23 Sep 2023 14:03:27 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A65DF60FC0
 for <buildroot@buildroot.org>; Sat, 23 Sep 2023 14:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A65DF60FC0
Received: from fli4l.lan.fli4l (p5b3a0af9.dip0.t-ipconnect.de [91.58.10.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CAD4AA4C0980;
 Sat, 23 Sep 2023 16:03:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38754)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qk3EC-0007mh-1t;
 Sat, 23 Sep 2023 16:03:24 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 23 Sep 2023 16:03:24 +0200
Message-Id: <20230923140324.3168518-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1695477804;
 bh=wv7LT45wg2wdWWii8L9T6DfqQ+EMabFUKm8uhplRHtA=;
 h=From:To:Cc:Subject:Date:From;
 b=MfR7hh7outUxxnq6goWWE3SQ0mXjksf9t37jx+sqeeX4D1vsKPy/xQwHNyNZJCgSD
 zf19gIFx2GCP8AJt3ndg5CEizjaETuuOzbug2zCV6fjd28VXKq9d1fJQGuKhVHAbU5
 aEkejMj7NSrBhjTWY/LNPIZ40Lv9Vtcpg763fC+2qWKu/JEBe6OFOkbCycuGG35we8
 ZVDEvrErZi1iV4+RkXEOSliwaXh/ay9NwrP6GjlUeSpqP9Hv2KAAAgozydmHZp7nju
 8arlZBRWZy+p8ntKcSqT6/MQ/FuM6VP3ANBeElbkJYb+bb+J55fuZghTkQI4ESDgFf
 9LM5zxn/X+5/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=MfR7hh7o
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.27.6
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
index 35f25c0066..8b1ae5b4a6 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.27/cmake-3.27.3-SHA-256.txt
-sha256  66afdc0f181461b70b6fedcde9ecc4226c5cd184e7203617c83b7d8e47f49521  cmake-3.27.3.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.6-SHA-256.txt
+sha256  ef3056df528569e0e8956f6cf38806879347ac6de6a4ff7e4105dc4578732cfb  cmake-3.27.6.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index a0c775e37c..3bb2c4bffb 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.27
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
