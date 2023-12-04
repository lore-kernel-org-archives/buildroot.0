Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68DBC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:19:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CE9741466;
	Mon,  4 Dec 2023 21:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CE9741466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d6Is_0w3irDT; Mon,  4 Dec 2023 21:19:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 519DD419E4;
	Mon,  4 Dec 2023 21:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 519DD419E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 85DB11BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CAA74096D
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:19:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CAA74096D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eT616P-Eb-Rb for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:19:09 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DC3E40983
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC3E40983
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32DA3A4C0EB0;
 Mon,  4 Dec 2023 22:18:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60278)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGL5-0007Y7-31;
 Mon, 04 Dec 2023 22:18:51 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:18:51 +0100
Message-Id: <20231204211851.12781-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724732;
 bh=XTKfrvH2SA4zAjk7tIiEeR3ffarOLp5t6DPxKY7ZRW8=;
 h=From:To:Cc:Subject:Date:From;
 b=XaZ6rsXEtEnHEDNZegElKWfUm5fZTAgF8AnmhQEYHVbVi+T60p0Vn33HOJEOfFMiL
 4S1QnFjInFGFJGkRn000qFi4WaY14HbqtT8yPZ/B00MH+xC7IETltOitKAAm1qNb2q
 JknIYL/5KWspAc3zCFbW4G3nrowLY1DVIta5m6MReZ6zvMpognZcyls/SOMCjvuKDo
 1/2c40Lh0o7JBmE4mt4b934DQl/wtNJOz3XyTEd8iI2nke1CKPk6GkYl0rDX2rErzM
 8tfDVG5IqSzxzs52KstDfZ9uAANe9d9l/DVoHNNJAGAP2kk4Fo1zTn2q8s3Ayz346v
 F3P5AB7DxhanQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=XaZ6rsXE
Subject: [Buildroot] [PATCH 1/1] package/cmake: bump version to 3.27.9
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

Release notes:
https://www.kitware.com/cmake-3-27-8-available-for-download/
https://www.kitware.com/cmake-3-27-9-available-for-download/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index e495061bae..fbf0786232 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.27/cmake-3.27.7-SHA-256.txt
-sha256  08f71a106036bf051f692760ef9558c0577c42ac39e96ba097e7662bd4158d8e  cmake-3.27.7.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.9-SHA-256.txt
+sha256  609a9b98572a6a5ea477f912cffb973109ed4d0a6a6b3f9e2353d2cdc048708e  cmake-3.27.9.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 41278bf6db..7506e964a9 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.27
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).7
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).9
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
