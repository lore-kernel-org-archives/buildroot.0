Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22663C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 09:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD1CC40210;
	Wed, 14 Aug 2024 09:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq1VZNk68-dT; Wed, 14 Aug 2024 09:55:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A212740186
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A212740186;
	Wed, 14 Aug 2024 09:55:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87CF91BF5A3
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 09:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83AE1605ED
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 09:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gb8yqLvR5h8M for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 09:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61E0B605EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61E0B605EA
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61E0B605EA
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 09:55:45 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 1F2F82C833FB;
 Wed, 14 Aug 2024 11:55:43 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 11:55:40 +0200
Message-Id: <20240814095541.433665-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723629343; bh=WTzBLz9v3am4WdOE0pC94ixZT3u70SFVu8rS5cbpHXs=;
 h=From:To:Cc:Subject:Date;
 b=pQRQCI5uxXqkNW4j8Sx+HNWcJq8AuCo0a1ymTS0f8o5nQRN7aRcp1EzbTAKnfPTKd
 R9f9sKYqB3MvC9iIXTZl/ZVlvaTtvxXibyl/Ygo9IkzGBv/XZ1zbyzRZAKtZx8b/Vy
 marRKlI3dbEjc8VIRpWegq+t344re08dQpY+T/7nYuSOiaMoEY7a3GZX6CvhpEQSxn
 WHJs9Dq7cf1NdDb/IS1yczLzqIKxpzcLBpBpgXrrK5WrXSi1Lp5doPBdZUKk3Nzvo8
 jCDFEwA5MrZgIuRtYyTnqgmmP9NdXayF7gNr7gMhi6W0azAUfUpJidIz2bQ6YLBNKE
 8/lz8RpFQptog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=pQRQCI5u
Subject: [Buildroot] [PATCH] package/rauc: bump to 1.12
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

Changelog: https://github.com/rauc/rauc/releases/tag/v1.12

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/rauc/rauc.hash | 2 +-
 package/rauc/rauc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rauc/rauc.hash b/package/rauc/rauc.hash
index 391d89a8f6..f3ab0a0be9 100644
--- a/package/rauc/rauc.hash
+++ b/package/rauc/rauc.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  ef82ee452939c03a24fd40649afa96497f3cec965994e6c9c0d94239b640bc10  rauc-1.11.3.tar.xz
+sha256  96681e119af8b6b9bb30e856a831e5a5b3292e9a5959d26ffa274b5135bc5031  rauc-1.12.tar.xz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 7239d84cc7..475aee5d89 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAUC_VERSION = 1.11.3
+RAUC_VERSION = 1.12
 RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
 RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
 RAUC_LICENSE = LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
