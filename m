Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDFC6CDB470
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 18:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52C760B00;
	Wed, 11 Oct 2023 18:01:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A52C760B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wIFJw-A0HyIr; Wed, 11 Oct 2023 18:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D9160EED;
	Wed, 11 Oct 2023 18:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D9160EED
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 33D101BF3D6
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 18:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 18F4A40160
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 18:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18F4A40160
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuxiZ8Ms61_o for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 18:01:43 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED7CA40004
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 18:01:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED7CA40004
Received: from fli4l.lan.fli4l (p54a1b15c.dip0.t-ipconnect.de [84.161.177.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E86EA4C00BC
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 20:01:41 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59508)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.1)
 (envelope-from <bernd@kuhls.net>) id 1qqdWe-0005Kp-2r
 for buildroot@buildroot.org; Wed, 11 Oct 2023 20:01:40 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 20:01:40 +0200
Message-Id: <20231011180140.74551-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697047301;
 bh=+PndjnkrTvsq8L4b35h7xX1Xyx3RbC0sX7or3iUnbcY=;
 h=From:To:Subject:Date:From;
 b=mAHkZIhovAVii8ldotZe7oSPbV0m63M/943MCw5LDpKODIiCYl1NfCNe00q4ooKzE
 eAIlAXIINszOgoCCfw/Yn94lBOrk5UXeeLHzOpr490tqTI9RUFl62Xiqo+j+Sl8VXC
 cZ8kN+0+P6u69Suw9uk2Vrz0TknVRT2fQNAGa9RvWD54m/0NJN6oUM9pX0yjkl0EUK
 oyMQqVCIo4Qxda83R1CSF6EWfUEWCmM32OHaXwMD4A5ae7ASG77xRqPsH1d8hYtHuS
 EnpwWSK3Kq4ZqB3+LODkG13/6FHeP4c/6DziSAUonnBKZjY5AnMt3naDQcu1OrprVl
 uGKa57GMtV0nQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=mAHkZIho
Subject: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.3.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dav1d/dav1d.hash | 4 ++--
 package/dav1d/dav1d.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
index 68757060bf..0b2c53ec21 100644
--- a/package/dav1d/dav1d.hash
+++ b/package/dav1d/dav1d.hash
@@ -1,4 +1,4 @@
-# From https://download.videolan.org/pub/videolan/dav1d/1.2.1/dav1d-1.2.1.tar.xz.sha256
-sha256  4e33eb61ec54c768a16da0cf8fa0928b4c4593f5f804a3c887d4a21c318340b2  dav1d-1.2.1.tar.xz
+# From https://download.videolan.org/pub/videolan/dav1d/1.3.0/dav1d-1.3.0.tar.xz.sha256
+sha256  6d8be2741c505c47f8f1ced3c9cc427759243436553d01d1acce201f87b39e71  dav1d-1.3.0.tar.xz
 # Locally computed
 sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
index e90f53dc1a..3650f28730 100644
--- a/package/dav1d/dav1d.mk
+++ b/package/dav1d/dav1d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAV1D_VERSION = 1.2.1
+DAV1D_VERSION = 1.3.0
 DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
 DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
 DAV1D_LICENSE = BSD-2-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
