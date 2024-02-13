Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB151C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 10:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 594DD82052;
	Tue, 13 Feb 2024 10:58:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjx-LGz_OUVz; Tue, 13 Feb 2024 10:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F9508205A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9508205A;
	Tue, 13 Feb 2024 10:58:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD7791BF47E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 10:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BACE34094D
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 10:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j0LIG3RsT12z for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 10:58:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5EB2A4094C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EB2A4094C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EB2A4094C
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 10:58:44 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C05E12C80CDA;
 Tue, 13 Feb 2024 11:58:41 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 11:58:40 +0100
Message-Id: <20240213105841.2410425-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707821921; bh=+IBJGmiCS/deJ4L2cItsM7km7fccc7lvdWe0ZMbKhQM=;
 h=From:To:Cc:Subject:Date;
 b=I3lX/WoZmyEjpMcklPWsS4KD1gBe4fSiAgjFKUh4e83IP8znD/dlPPnPzTXWEdzx5
 6GROSdWZcYMUi/fWRThBBR0Ncb20AFyZt+1k+8uRtnMmHXQYTNdrkc57CnHeWNnE4w
 KXKdOGMg8smuh9H2y8BnGxIli+u88wJDl0fp08QkM3xo+6FzXhWpFT89HCOrzpYZik
 BLl1iYwUkElnAjyVsuWeV66Djb0tI7Lbm+kkXxkLXiXMgkJNI8F56lZZJXnqsoJ26J
 GFppGEbNvmzXfVLCPTU7Wj3ztAhlJq5Z1N/B1lY+xQe3XSf5sfLD3dQlFwrBRTb/SB
 cyXxddP50D9pA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=I3lX/WoZ
Subject: [Buildroot] [PATCH] package/rauc: bump to 1.11.1
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

This fixes an incompatibility with openssl 3.2 when using codesign
certificate purpose [1].

[1] https://github.com/rauc/rauc/releases/tag/v1.11.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 8de309f8c7..63aa4715e0 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a28f415c580390dd9e65016a5d90a63ee1cfd7e1b3e864cbb13cb3ac3513391f  rauc-1.11.tar.xz
+sha256  391d13d709abb630c459e79e62e474e68224c5d07c816355784bba75a86a2507  rauc-1.11.1.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index aff5ead281..fbdea4e235 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.11
+RAUC_VERSION = 1.11.1
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
