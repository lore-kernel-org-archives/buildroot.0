Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B778C0015E
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 07:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E74614157B;
	Thu,  3 Aug 2023 07:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E74614157B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8gIwR3OinHmH; Thu,  3 Aug 2023 07:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 125C940A56;
	Thu,  3 Aug 2023 07:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 125C940A56
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 118841BF995
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 07:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF9FE402C2
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 07:37:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF9FE402C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S7AOt4B3xAq2 for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 07:37:21 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43FA340191
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 07:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FA340191
Received: by mail.gandi.net (Postfix) with ESMTPA id A10D024000F;
 Thu,  3 Aug 2023 07:37:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 09:37:04 +0200
Message-Id: <20230803073704.1379495-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803073704.1379495-1-luca.ceresoli@bootlin.com>
References: <20230803073704.1379495-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691048239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JfzCsTUgFVuIHmo3056HJqiYovlEoACTxU3vO2t9lU8=;
 b=XgZ0MAYQ+JL110fR2C7sR7sbyHlFjsbaXhHuXOECw69eas6EwTrcpRUngicVs7lfhU/KFt
 lbRLHTjGH4b2ZnphyeJibP1mWpzrUO9a35dZd6E9P60MviqvDBoyFFLJgGVEfvqP9KsjSM
 QrLLkmUbmu4RuIpgX/o1Yq5DuC8xhbpCNo0DJsCRnJvnHZ7JdvtGdo4yJSP4k8M1rKvvQY
 y2TmXDdIrPetOA5fMHN1IKn7hdt0sXbn5MaqJ0AhjFGLJlxzLRIcQRwU1GTDwrHpUSRBkD
 QePFL7w0zd1soCwFDy9ACMWqBLh/Rh7pnAErS3bukhh5LkfeqS9usQV0zNWl1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=XgZ0MAYQ
Subject: [Buildroot] [PATCH 2/2] package/systemd: fix wrong variable name in
 comment
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is no such thing as a BR2_TARGET_GENERIC_TTY_PATH variable. The
comment here should mention BR2_TARGET_GENERIC_GETTY_PORT instead.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/systemd/systemd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 86b1715076a9..c8a83ae32f7f 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -674,15 +674,15 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # Systemd defaults to enabling getty@tty1.service
 #
 # What we want to do
-# * Enable a getty on $BR2_TARGET_GENERIC_TTY_PATH
+# * Enable a getty on $BR2_TARGET_GENERIC_GETTY_PORT
 # * Set the baudrate for all units according to BR2_TARGET_GENERIC_GETTY_BAUDRATE
 # * Always enable a getty on the console using systemd-getty-generator
 #   (backward compatibility with previous releases of buildroot)
 #
 # What we do
 # * disable getty@tty1 (enabled by upstream systemd)
-# * enable getty@xxx if  $BR2_TARGET_GENERIC_TTY_PATH is a tty
-# * enable serial-getty@xxx for other $BR2_TARGET_GENERIC_TTY_PATH
+# * enable getty@xxx if  $BR2_TARGET_GENERIC_GETTY_PORT is a tty
+# * enable serial-getty@xxx for other $BR2_TARGET_GENERIC_GETTY_PORT
 # * rewrite baudrates if a baudrate is provided
 define SYSTEMD_INSTALL_SERVICE_TTY
 	mkdir -p $(TARGET_DIR)/usr/lib/systemd/system/getty@.service.d; \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
