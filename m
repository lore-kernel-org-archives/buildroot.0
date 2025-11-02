Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4BECCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 385128516A;
	Sun,  2 Nov 2025 13:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JXPu5jjV3FwW; Sun,  2 Nov 2025 13:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60AF88515D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60AF88515D;
	Sun,  2 Nov 2025 13:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B1EF436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C17E61591
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HMa1QEG2JPxP for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BB4B661536
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4B661536
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB4B661536
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:38:09 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C672A4C5F1F;
 Sun,  2 Nov 2025 14:37:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFYHJ-0000000025N-1iqk;
 Sun, 02 Nov 2025 13:37:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Simon Dawson <spdawson@gmail.com>
Date: Sun,  2 Nov 2025 14:37:52 +0100
Message-ID: <20251102133752.2690402-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251102133752.2690402-1-bernd@kuhls.net>
References: <20251102133752.2690402-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762090673;
 bh=lXoeydszcmC9A/mC+52oRq3wFX4GK+Pizuf4UheHthM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bMlMsoRdJroeT996nZ0QILJQAjfqBC//jmxTkKIieIMXengV+AszWPM3Ht90LDZ85
 C+95Pr4UBCNPzcpDasES6fX3DtgYpLuI+PHR8ut0plzCVoa4nA+RNQWDPtwHtWccUC
 EKr2RRsTuyDwy9Paa7OJ5z1OHdotRiwHNbdpkQJmO/kxoKzEExCwxGzXzgQkvwoRwe
 8U0rgGLRRXLAzLx5u9DwB5/kK/WdYWcYro9ls0FwwXfqejdQ5fV8Cu4VEzbn804n54
 Piq4c3/rG6YVIV89L5k2QTBjJUcRmtMg+oFVGmqx+wHeJgR/YENhoy6T+jRtTE34h2
 3RGMYS588I0Gg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=bMlMsoRd
Subject: [Buildroot] [PATCH 2/2] package/live555: bump version to 2025.10.13
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

Added -std=c++20 to enable std::atomic_flag::test which was introduced
in gcc 11.1:
https://gcc.gnu.org/onlinedocs/libstdc++/manual/status.html#status.iso.2020
(see P1135R6)

For older compilers -DNO_STD_LIB=1 can be used to enable a code path
without std::atomic_flag::test, copied from:
https://github.com/DragonFlyBSD/DeltaPorts/commit/cfc388e6a6bf011e28f0cbebaeae74d2bb516a02

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: removed UTF-8 characters (Julien)

 package/live555/live555.hash | 6 +++---
 package/live555/live555.mk   | 9 ++++++++-
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/live555/live555.hash b/package/live555/live555.hash
index d4fa93d029..f0a56bda32 100644
--- a/package/live555/live555.hash
+++ b/package/live555/live555.hash
@@ -1,5 +1,5 @@
-# From http://www.live555.com/liveMedia/public/live555-latest-md5.txt
-md5  3c1992b0e9b871bcad7491a3da541781  live.2021.05.03.tar.gz
+# From http://www.live555.com/liveMedia/public/live555-latest-sha1.txt
+sha1  483146b15c5fdb973b88fc318f2772f022253563  live.2025.10.13.tar.gz
 # Locally generated
-sha256  ae73241f9cc4ab740d60737c0438d62a7635af3822de5d84acf275793de42029  live.2021.05.03.tar.gz
+sha256  44eb6ae4ae02ef68a5028d9fc8b70c45b9ba45c058f846b68bc4d32c74355f49  live.2025.10.13.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/live555/live555.mk b/package/live555/live555.mk
index 1e1531ee53..6d12d1c17c 100644
--- a/package/live555/live555.mk
+++ b/package/live555/live555.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIVE555_VERSION = 2021.05.03
+LIVE555_VERSION = 2025.10.13
 LIVE555_SOURCE = live.$(LIVE555_VERSION).tar.gz
 # upstream site removes older versions, use videolan.org instead
 LIVE555_SITE = https://download.videolan.org/contrib/live555
@@ -29,6 +29,13 @@ LIVE555_LIBRARY_LINK = $(TARGET_CC) -o
 LIVE555_CFLAGS += -fPIC
 endif
 
+# "struct std::atomic_flag" has no member named "test"
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_11),y)
+LIVE555_CFLAGS += -std=c++20
+else
+LIVE555_CFLAGS += -DNO_STD_LIB=1
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIVE555_DEPENDENCIES += host-pkgconf openssl
 LIVE555_CONSOLE_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
