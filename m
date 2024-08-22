Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C6DC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 10:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A36CF60AF9;
	Thu, 22 Aug 2024 10:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UUi4hdHzetXy; Thu, 22 Aug 2024 10:39:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB44860B29
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB44860B29;
	Thu, 22 Aug 2024 10:39:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 626B21BF346
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C21181464
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 10:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Mb2Mo3e_3Yh for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 10:39:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E494F81462
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E494F81462
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E494F81462
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 10:38:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4369540006;
 Thu, 22 Aug 2024 10:38:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 12:38:53 +0200
Message-ID: <20240822103854.2114748-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724323137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=KBqv0ioLxXAgj8Tf/kiv0YXRqqY3bLv41KL2TMwm18A=;
 b=N5/hNUU4qeJIcFBVR1u8MQHEdYuv3Yc5PpDz+THqOGzShxfUMsPrWDCEQn9tItl7/jHGlw
 BAb2++f84wpr4g0t0WDNpC0us7ESXiJfSWXf1jStuF+QQaIBOeXwxh+26um3FLx88Qg820
 wf/hOu/RpMGumYNICXDkVkQeYsV1T7+Q9M8CAhQw1+scXUVq8el3zdVT3dkcB3c7DdVSof
 I9cLNfuPopwv7YGJJ7fQzA5ymsW7id6dUeI/QTJYYuoknVvp6hNDTpR5JOuEE3n3pD05sE
 b17439drwXBtuCayt2RvFs8ykxuF+8gJ0+ByhNvQnyXVi//C+8K8y5AXY9zbRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=N5/hNUU4
Subject: [Buildroot] [PATCH next] package/cmake: bump to 3.30.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is minor release. According to
https://cmake.org/cmake/help/latest/release/3.30.html#updates:

3.30.1, 3.30.2

These versions made no changes to documented features or
interfaces. Some implementation updates were made to support ecosystem
changes and/or fix regressions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/cmake.hash | 4 ++--
 package/cmake/cmake.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index ee6dab551c..1a59c3fe89 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.30/cmake-3.30.0-SHA-256.txt
-sha256  157e5be6055c154c34f580795fe5832f260246506d32954a971300ed7899f579  cmake-3.30.0.tar.gz
+# From https://cmake.org/files/v3.30/cmake-3.30.2-SHA-256.txt
+sha256  46074c781eccebc433e98f0bbfa265ca3fd4381f245ca3b140e7711531d60db2  cmake-3.30.2.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 842457eb34..e7d2d86791 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
 CMAKE_VERSION_MAJOR = 3.30
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).2
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
