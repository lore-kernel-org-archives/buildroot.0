Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDC0C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D132641796;
	Mon, 27 Mar 2023 14:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D132641796
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLAYxCNvamr8; Mon, 27 Mar 2023 14:12:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E2141729;
	Mon, 27 Mar 2023 14:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4E2141729
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 852AE1BF31A
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F75840327
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 14:11:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F75840327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hUM8-vrrp7p for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 14:11:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AA62400C6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AA62400C6
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 14:11:40 +0000 (UTC)
Received: from booty.fritz.box (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id CCBD5E0005;
 Mon, 27 Mar 2023 14:11:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 16:11:22 +0200
Message-Id: <20230327141122.103829-2-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
References: <20230327141122.103829-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1679926299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IOtJ6QJltk/lG8ySVLWyDrNbOua9f4Gj/AiIShBSQHg=;
 b=i3Xn1AqUOZ2cxATsxzGJi5xEoXnlbbMvArQj8szR7M4sXVMDRw4U097VNx8bu7Nq3EuiPn
 /1wnN672zO28Ah2GIgNqjJBTNkXiJvK/b8pdlpBQPQZ70cl0yg9nZc+u9mD/WAX2+a3k7j
 RIvWK1XSpZqbdAu8N7mHXkeU0xrYwrVg9ZmVFZTC5syMFpI4QPKRJbJuTto9uPZ0dOvY/h
 qnhaKJMj23UwvWCNRyYI0PslXWykkP+QLZqMQ/jqKBPrxLQR9QW53ps5cIYh0pUKgXCmfP
 KfeIWHhfz3zl5KIrOt13SAPFpGBFiuO4bqccnNOrwZ0k/UCM3qYKmd8App894A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i3Xn1AqU
Subject: [Buildroot] [PATCH 2/2] docs/manual: ditch redundant -f 'rm' flag
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The value of the RM variable in make is 'rm -f', thus the additional -f is
redundant. Avoid it on the docs to avoid developers taking it as a good
example to follow.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 docs/manual/writing-rules.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index 758965d80a0a..13b7fd5bea6a 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -78,7 +78,7 @@ Do not align the +=+ signs.
 +
 ---------------------
 define LIBFOO_REMOVE_DOC
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/doc \
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/doc \
 		$(TARGET_DIR)/usr/share/man/man3/libfoo*
 endef
 ---------------------
@@ -118,7 +118,7 @@ YES:
 ---------------------
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
 define LIBFOO_REMOVE_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
 endef
 LIBFOO_POST_INSTALL_TARGET_HOOKS += LIBFOO_REMOVE_DATA
 endif
@@ -128,7 +128,7 @@ NO:
 +
 ---------------------
 define LIBFOO_REMOVE_DATA
-	$(RM) -fr $(TARGET_DIR)/usr/share/libfoo/data
+	$(RM) -r $(TARGET_DIR)/usr/share/libfoo/data
 endef
 
 ifneq ($(BR2_LIBFOO_INSTALL_DATA),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
