Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310A6C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE3360F8D;
	Thu, 15 Feb 2024 14:32:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X649fDaWws4o; Thu, 15 Feb 2024 14:32:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D6C760F9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D6C760F9A;
	Thu, 15 Feb 2024 14:32:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 609091BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A33AF83BFA
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4gex-WDkdLX for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:32:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.84.136;
 helo=mail.desaster-games.net; envelope-from=jubalh@iodoru.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE1E983BFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE1E983BFC
Received: from mail.desaster-games.net (mail.desaster-games.net [176.9.84.136])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE1E983BFC
 for <buildroot@busybox.net>; Thu, 15 Feb 2024 14:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.desaster-games.net (Postfix) with ESMTP id A7A2D13022;
 Thu, 15 Feb 2024 15:32:29 +0100 (CET)
X-Virus-Scanned: Amavis at mail.desaster-games.com
Received: from mail.desaster-games.net ([127.0.0.1])
 by localhost (mail.desaster-games.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7cTMNo0sTqT; Thu, 15 Feb 2024 15:32:16 +0100 (CET)
Received: from ymir.nue2.suse.org (unknown [81.95.8.245])
 by mail.desaster-games.net (Postfix) with ESMTPSA id 563D013020;
 Thu, 15 Feb 2024 15:32:16 +0100 (CET)
From: Michael Vetter <jubalh@iodoru.org>
To: buildroot@busybox.net
Date: Thu, 15 Feb 2024 15:31:44 +0100
Message-Id: <20240215143144.31911-1-jubalh@iodoru.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=iodoru.org
Subject: [Buildroot] [PATCH 1/1] package/shadow: bump to version 4.14.5
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
Cc: Michael Vetter <jubalh@iodoru.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Omit 4.14.4 since it was broken.

Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 package/shadow/shadow.hash | 4 ++--
 package/shadow/shadow.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/shadow/shadow.hash b/package/shadow/shadow.hash
index 4689a994de..23c292d659 100644
--- a/package/shadow/shadow.hash
+++ b/package/shadow/shadow.hash
@@ -1,4 +1,4 @@
-# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.3/shadow-4.14.3.tar.xz.asc
+# Verified from https://github.com/shadow-maint/shadow/releases/download/4.14.5/shadow-4.14.5.tar.xz.asc
 # with key A9348594CE31283A826FBDD8D57633D441E25BB5
-sha256  6969279236fe3152768573a38c9f83cb9ca109851a5a990aec1fc672ac2cfcd2  shadow-4.14.3.tar.xz
+sha256  cba74bc7b05d89c015afe23131f9159ece38779d40a8af4cf162852e6e85ca23  shadow-4.14.5.tar.xz
 sha256  3d25ab8f43fdc14624296a56ff8dc3e72e499ad35f32ae0c803f4959cfe17c0a  COPYING
diff --git a/package/shadow/shadow.mk b/package/shadow/shadow.mk
index 03eb16a3f4..4b831908a2 100644
--- a/package/shadow/shadow.mk
+++ b/package/shadow/shadow.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SHADOW_VERSION = 4.14.3
+SHADOW_VERSION = 4.14.5
 SHADOW_SITE = https://github.com/shadow-maint/shadow/releases/download/$(SHADOW_VERSION)
 SHADOW_SOURCE = shadow-$(SHADOW_VERSION).tar.xz
 SHADOW_LICENSE = BSD-3-Clause
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
