Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBC8ECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 13:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B88EE60FC0;
	Tue, 30 Aug 2022 13:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B88EE60FC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIIgR0Oed9EU; Tue, 30 Aug 2022 13:40:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E2460FB5;
	Tue, 30 Aug 2022 13:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E2460FB5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75D3E1BF5B5
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 13:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E19B81551
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 13:40:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E19B81551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVo4haB83J4Y for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 13:40:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F516813E9
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F516813E9
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 13:40:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 456341814B9; Tue, 30 Aug 2022 15:40:02 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 15:38:57 +0200
Message-Id: <20220830133857.25406-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1661866806; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4UFAPLzQTWem54Gg5kxNxRyxN/o/pVFbQJ+2hxpR17g=;
 b=WTBCV+zHNec+1N6PScXWFBQN3dFGcdQ39cYCK+ydRbuQGVTMq5uZxToRyTAZmaTugZDHjW
 vgWH5CgmjgVREld9Y7laGAiMJmC6XcJtDsqcJmiYYqWZgrC4vqRqRNM0A32KPLWdkX4rmr
 DT2mmcsPXMNfsLdLBd/lN85l5L/kmA4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=WTBCV+zH
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 31.5
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fixes:
- Fixed comparison of maps in Python.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 9dc0f9ff07..8e5ba09c9d 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  a9fd8043fef746e8d8cca9f023fb7ba6d3d102eab6dd35a04ce7157d1928726b  protobuf-cpp-3.21.4.tar.gz
+sha256  58c8a18b4ec22655535c493155c5465a8903e8249094ceead87e00763bdbc44f  protobuf-cpp-3.21.5.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index ffbc39347f..199e423d71 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.4
+PROTOBUF_VERSION = 21.5
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index ae2e07d637..1b106445a5 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32d8a37271f42aaa0f40659f77040484d6048b187e4a98dac09eb9ed592a91dc  protobuf-python-4.21.4.tar.gz
+sha256  4b384ad2bc6832ede8703b4567c47498bccf104cb79fd20d2d2e3069066ae245  protobuf-python-4.21.5.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
