Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17334C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 17:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD7A844C9;
	Fri, 16 Aug 2024 17:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SSwM_HiMpz-v; Fri, 16 Aug 2024 17:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C097E844CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C097E844CC;
	Fri, 16 Aug 2024 17:33:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B808D1BF84C
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6090844CC
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 17:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tgEqpzJ-d2X1 for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 17:33:17 +0000 (UTC)
X-Greylist: delayed 533 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 16 Aug 2024 17:33:15 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C9024844C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9024844C9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.84.136;
 helo=mail.desaster-games.net; envelope-from=jubalh@iodoru.org;
 receiver=<UNKNOWN> 
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9024844C9
 for <buildroot@busybox.net>; Fri, 16 Aug 2024 17:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id F19121300C;
 Fri, 16 Aug 2024 19:24:19 +0200 (CEST)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VCLqLlyU6Lm6; Fri, 16 Aug 2024 19:24:06 +0200 (CEST)
Received: from ymir.nue2.suse.org (unknown [81.95.8.245])
 by mail.desaster-games.net (Postfix) with ESMTPSA id A1D9F13006;
 Fri, 16 Aug 2024 19:24:06 +0200 (CEST)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Fri, 16 Aug 2024 19:23:44 +0200
Message-Id: <20240816172344.13041-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=iodoru.org
Subject: [Buildroot] [PATCH 1/1] package/shadow: bump to version 4.16.0
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
Cc: jubalh@iodoru.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/shadow/shadow.hash | 2 +-
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 1d83272cec..7155baff07 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
 # Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
 # with key 66D0387DB85D320F8408166DB175CFA98F192AF2
-sha256  bb5f70639a0581f9d626f227ce45b31ac137daa7c451c0f672ce14f2731a96ee  shadow-4.15.1.tar.xz
+sha256  b78e3921a95d53282a38e90628880624736bf6235e36eea50c50835f59a3530b  shadow-4.16.0.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 59771b9182..f0a2b57b4d 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.15.1
+SHADOW_VERSION = 4.16.0
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
