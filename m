Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AC1C38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:51:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F26D60B50;
	Tue, 25 Oct 2022 18:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F26D60B50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCIldZ7MOKiS; Tue, 25 Oct 2022 18:51:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 001A160A70;
	Tue, 25 Oct 2022 18:51:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 001A160A70
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE681BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A1C4025A
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A1C4025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVnngMKtVVS2 for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:51:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D765A40250
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D765A40250
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:51:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44E191814B9; Tue, 25 Oct 2022 20:50:56 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 20:50:39 +0200
Message-Id: <20221025185040.317759-1-buildroot@heine.tech>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1666723858; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=HiJlI/+a8Hf/C3ZHcpdQ6ehfds+qGrr86DjfIXUn7OI=;
 b=dKc7r4foKdVyfj9szMqKtswP+B+8ZyeYW8rxhT48XLkkarcEFVO7r6OLyqdiTlUBoB2R0L
 Jc7w9+dKVGmW62qEF4oLonX0IS5GSAUn1hNyaB2cyk85ZDWd2ZDK+49yt4dWgIeK3KHDTm
 eOMpSzHffLAj30OG8p+NDCsAXAzam0c=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=dKc7r4fo
Subject: [Buildroot] [PATCH] package/{python-}protobuf: bump to version 21.8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/protobuf/protobuf.hash               | 2 +-
 package/protobuf/protobuf.mk                 | 2 +-
 package/python-protobuf/python-protobuf.hash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/protobuf/protobuf.hash b/package/protobuf/protobuf.hash
index 03138a59e7..24dbc0f1a1 100644
--- a/package/protobuf/protobuf.hash
+++ b/package/protobuf/protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-sha256  a3c4c104b98a21a577ce5ecc0d9b9f43a359b917d0bcf69467b70dc27416dfdc  protobuf-cpp-3.21.6.tar.gz
+sha256  f6251f2d00aad41b34c1dfa3d752713cb1bb1b7020108168a4deaa206ba8ed42  protobuf-cpp-3.21.8.tar.gz
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
index fbc495c438..88f359f24c 100644
--- a/package/protobuf/protobuf.mk
+++ b/package/protobuf/protobuf.mk
@@ -7,7 +7,7 @@
 # When bumping this package, make sure to also verify if the
 # python-protobuf package still works and to update its hash,
 # as they share the same version/site variables.
-PROTOBUF_VERSION = 21.6
+PROTOBUF_VERSION = 21.8
 PROTOBUF_SOURCE = protobuf-cpp-3.$(PROTOBUF_VERSION).tar.gz
 PROTOBUF_SITE = https://github.com/protocolbuffers/protobuf/releases/download/v$(PROTOBUF_VERSION)
 PROTOBUF_LICENSE = BSD-3-Clause
diff --git a/package/python-protobuf/python-protobuf.hash b/package/python-protobuf/python-protobuf.hash
index b0662124a9..a12c199663 100644
--- a/package/python-protobuf/python-protobuf.hash
+++ b/package/python-protobuf/python-protobuf.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a014a0108e18c06a0c0308d92cdcae6ee106e4b02dd2ab1ff7073c4c80153aea  protobuf-python-4.21.6.tar.gz
+sha256  d81ebc20030fe8d03bceb38f06aba2797c40852e5aab6819481ce808fb305fae  protobuf-python-4.21.8.tar.gz
 sha256  6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d  LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
