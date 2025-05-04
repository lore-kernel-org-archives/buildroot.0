Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A18C369DC
	for <buildroot@archiver.kernel.org>; Sun,  4 May 2025 22:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4356981061;
	Sun,  4 May 2025 22:27:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKsZA7Hcgm2K; Sun,  4 May 2025 22:27:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7506E80FF3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7506E80FF3;
	Sun,  4 May 2025 22:27:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D27FEEA
 for <buildroot@buildroot.org>; Sun,  4 May 2025 22:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B88E2605DE
 for <buildroot@buildroot.org>; Sun,  4 May 2025 22:27:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1r30GBKj7qNB for <buildroot@buildroot.org>;
 Sun,  4 May 2025 22:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 16156605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16156605D4
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16156605D4
 for <buildroot@buildroot.org>; Sun,  4 May 2025 22:27:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id Bhnlu8nkML0IyBhnlu1hM8; Mon, 05 May 2025 00:27:13 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  5 May 2025 00:27:12 +0200
Message-Id: <20250504222712.213695-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGo1c8+jF3MD2d0VLdkUabHwIH7PZDBi9w4lQRgIqa5h8l9eikbyfG8JhltyqcUI6zkH9IypZv8S2BSockBFXRcCEH2eNYxm1C4jzaJ/L/mwxpl+Jy/J
 hxKpJ1v6zwVeDxwGEO0DQAtYXRYKx8f8qvTsC8wNDVDyiROaYqIj4XS8o89sALdNSYTja9+mpN/LSR6wHthJICR8SQpbaUl9UeO1h3WGtqCqVzOCeJWHyDBZ
 W8INImyLRDa9cVvyT/kJNhHlkHbtv+fwCyM5Ao5F+us=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1746397633; bh=UZRnTD6knCteboMmU7qwmF32+ZKxEOSXhYtLpbtOSkU=;
 h=From:To:Subject:Date:MIME-Version;
 b=XCE94F8gbXo+yXvQ+tea5BuiDmd+94IuP0a616nZngUhww4I6zhUxWO8gHeb9Qw7B
 kjSk0hYnTE9u4fUUyuQeTjtkSWip4NXUATNr+qvAwsLxe4K6WIvsR/DbDlHptWGwqE
 Gy0QluG4QQupov0tOTxrqANhJ5+vMrNSzRW5D1KSHVhS2FiCZZhfZVKqgv8GNxmRLV
 fJrS1h3ulNBNYwLrvX/EcIOpf2PZGgTV3KuGFjIP9AadKQ/21RiuHE26edAzC64tz+
 DEHzvyKmjFJqDh+4llBRj/RsI08CP+/OErhO54YAHs8mhnpBFpdbT9yb7Npou0mO2j
 z7o4vTl2/+uYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=XCE94F8g
Subject: [Buildroot] [PATCH v2] package/rtl8812au-aircrack-ng: bump to
 version 2025-03-30 on branch v5.6.4.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version adds support up to Linux version 6.14.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* squashed with previous pending patch
---
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash | 2 +-
 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
index ea5ca3c56b..bb7c4b297d 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d08bad19680047cb178d8984bfdd09d9ff7765b8c9ee35a9f8f87676f0c41a64  rtl8812au-aircrack-ng-b44d288f423ede0fc7cdbf92d07a7772cd727de4.tar.gz
+sha256  d4a1435e29bf4a46a4b0b31cad91f30bb263a899b382f828125437dce3cb4bae  rtl8812au-aircrack-ng-c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
index 3a7c56a3fc..1308508e00 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = b44d288f423ede0fc7cdbf92d07a7772cd727de4
+RTL8812AU_AIRCRACK_NG_VERSION = c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e
 RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
 RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
 RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
