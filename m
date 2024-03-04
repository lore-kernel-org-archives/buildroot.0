Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719CCC54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 13:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1924B81F57;
	Mon,  4 Mar 2024 13:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZ1lJSgmFZNO; Mon,  4 Mar 2024 13:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 280F181F59
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 280F181F59;
	Mon,  4 Mar 2024 13:10:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 145671BF36D
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F7A7605E4
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 13:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1zHV5C7N67H for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 13:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A3B41600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3B41600D4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3B41600D4
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 13:10:38 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1A9E42C80CC2;
 Mon,  4 Mar 2024 14:10:35 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  4 Mar 2024 14:10:33 +0100
Message-Id: <20240304131034.71220-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1709557835; bh=+9HfUsPsUpqEaeFRN2TPIOam2FLaG6FbOxa/jqsiMro=;
 h=From:To:Cc:Subject:Date;
 b=hpNcOBLSCnYdS5O18NLu0a0vEfhzcsGxao1hC6e189tCzs6TDWgrbEd675RBWLKE1
 fW57/hgi03r+HNYSJTnbIJiMg69BD+e2lRjqVN10tQHOv3JuZyWKvC/yD2h6Klk6y6
 bGNx3WRMbcCaMGPlfztLOJMI/DuvdxKjt8SIoPIcVnWuajGUwAiSfc6AsA+NycvzBu
 JiwoE7pTdbX586/vaY9/cyx0lSxz7BNgtqRpdRXoT5c71noMZo1jJ2YUuKXFdwKR8c
 ow0G5YZGfpNzaZEWxB34Ypgx8LzivSFShMZoELw2MCsXL4Ag+j4eore60AjwJYXQVR
 wIgUIZVJjKnXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=hpNcOBLS
Subject: [Buildroot] [PATCH] package/rauc: bump to version 1.11.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release Notes: https://github.com/rauc/rauc/releases/tag/v1.11.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/rauc/rauc.hash | 4 ++--
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 63aa4715e0..6899ca94fe 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
-# Locally calculated
-sha256  391d13d709abb630c459e79e62e474e68224c5d07c816355784bba75a86a2507  rauc-1.11.1.tar.xz
+# Locally calculated after checking pgp signature
+sha256  e47070e97f89136ca8d0b2b044c40e68ac0f44432046176d08d66717320df4a7  rauc-1.11.2.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index fbdea4e235..7bb374259f 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.11.1
+RAUC_VERSION = 1.11.2
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
