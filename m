Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD9DC41513
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 19:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6F1B60B13;
	Thu, 17 Aug 2023 19:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6F1B60B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xYOsnzXRsdwT; Thu, 17 Aug 2023 19:15:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 205DE60B5A;
	Thu, 17 Aug 2023 19:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 205DE60B5A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 55C601BF37F
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B32E41694
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 19:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B32E41694
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hueDkqFkw_zp for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 19:15:35 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D517A40999
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 19:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D517A40999
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03EA7A4C0368;
 Thu, 17 Aug 2023 21:15:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44174)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qWiSy-0004Kt-2Y;
 Thu, 17 Aug 2023 21:15:32 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 17 Aug 2023 21:15:32 +0200
Message-Id: <20230817191532.106855-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692299733;
 bh=1cLOdCe5U6wRId9Jp5mFRWkVDF/B8JLQlp8xKtAyQ/4=;
 h=From:To:Cc:Subject:Date:From;
 b=E2iORXUZShz8VkaDEQh133m5NlLp+35NXi9fHJ2byNCRpq5MdkI+6TjwT1u3wqM1h
 NK2CJEGNxOGYn2KTixWCxIZu3XrsQqejgPfDUF0c5+JLYAyRB3r+c9cZfTGesDMP96
 SeMbgvn0go+mwghlx2W3DBlzJYPosHmaTEJtT1EJIQSKwqr+yZqHjGP3YBJaWDzKCL
 PENcaq1TBn08q/55P2/FeK87r7iWXl4zfNZ+sMZlkqxOs4pCx4JsgQBlSus41ydHgX
 b18tYQD0HYb3wGSUOtgqSv4kAmtKVoadvHv2SO4RdZRvqqrtU7miQsjYIoppKyBTUY
 6SDSQTpZ22eRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=E2iORXUZ
Subject: [Buildroot] [PATCH/next 1/1] package/cmake: bump version to 3.27.3
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
index e5a047e7d3..35f25c0066 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.27/cmake-3.27.1-SHA-256.txt
-sha256  b1a6b0135fa11b94476e90f5b32c4c8fad480bf91cf22d0ded98ce22c5132004  cmake-3.27.1.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.3-SHA-256.txt
+sha256  66afdc0f181461b70b6fedcde9ecc4226c5cd184e7203617c83b7d8e47f49521  cmake-3.27.3.tar.gz
 
 # Locally calculated
 sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 1e29e25471..a0c775e37c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.27
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
