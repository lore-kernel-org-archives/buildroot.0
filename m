Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB11C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 07:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 391356087C;
	Tue, 20 Feb 2024 07:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4tH8ckuKo0V; Tue, 20 Feb 2024 07:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F1260886
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32F1260886;
	Tue, 20 Feb 2024 07:33:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2C5711BF317
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 07:33:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14A2C81F0B
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 07:33:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u15qGiHRaQlz for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 07:33:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.67.36.65;
 helo=mout01.posteo.de; envelope-from=martink@posteo.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0A1A981F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A1A981F58
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A1A981F58
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 07:33:05 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 67E64240027
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 08:33:03 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4TfB2k5jl0z6tvb;
 Tue, 20 Feb 2024 08:33:02 +0100 (CET)
From: Martin Kepplinger <martink@posteo.de>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 07:32:51 +0000
Message-Id: <20240220073251.251521-1-martink@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=posteo.de; s=2017; 
 t=1708414383; bh=9OOqmLowKVjxT17o4L2CF/ly4csIObMr6u9KDRhdZd4=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
 Content-Transfer-Encoding:From;
 b=JTud12AWfEpByyHDAWPyNqscpLlGHjDSK7y1p4WxKS7wP66NO0qHqX7V8qsOyj0ut
 leEXpGKjhJ8dD1O62JNlAnOWfFqVl48KB+YnJLjgGIVWheZcXXRMLt/SM7kMmNV+YV
 slzueZEy+5T53ds0lBY+kgyBSRLvBWw4sNnfEudyk2wjHh91d7D8Yk9Wsl63bi+w1T
 RTgBGv3cRAVLxmhPkdrADcWLFTXmIZh5hiKj/tVNcDT1PRj57OmoWmRxuCZkpqM6S7
 2gJ3eVGMHoWf5tkL91/kaLDZCGQ5x5ZtcKNs2CahFOB8CQ0XWtwJTotvfZlbv8tSK4
 z1d+9cBod9Haw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=posteo.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=posteo.de header.i=@posteo.de header.a=rsa-sha256
 header.s=2017 header.b=JTud12AW
Subject: [Buildroot] [PATCH 1/1] package/tslib: bump version to 1.23
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
Cc: Martin Kepplinger <martink@posteo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes from https://github.com/libts/tslib/releases :

This release includes libts version 0.10.5 and the following changes:

 *  new filter module: module crop
 *  some build and security fixes
 *  improved release procedure

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 package/tslib/tslib.hash | 4 ++--
 package/tslib/tslib.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
index 762fbebb26..6fe35633aa 100644
--- a/package/tslib/tslib.hash
+++ b/package/tslib/tslib.hash
@@ -1,5 +1,5 @@
-# https://github.com/libts/tslib/releases/download/1.22/tslib-1.22.tar.xz.sha256
-sha256  aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a  tslib-1.22.tar.xz
+# https://github.com/libts/tslib/releases/download/1.23/tslib-1.23.tar.xz.sha256
+sha256  9b489a54d48006201f2fe955a88c3f857535ac93b6cf8e5a16c7b166c8991dac  tslib-1.23.tar.xz
 
 # Locally computed
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  COPYING
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 45e29808bd..e8eb3beeaf 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TSLIB_VERSION = 1.22
+TSLIB_VERSION = 1.23
 TSLIB_SITE = https://github.com/libts/tslib/releases/download/$(TSLIB_VERSION)
 TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
@@ -29,7 +29,8 @@ TSLIB_CONF_OPTS += \
 	--enable-skip=static \
 	--enable-lowpass=static \
 	--enable-invert=static \
-	--enable-evthres=static
+	--enable-evthres=static \
+	--enable-crop=static
 endif
 
 $(eval $(autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
