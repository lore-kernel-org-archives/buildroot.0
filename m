Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E48CD5BBB
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 10:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E22B8606F0;
	Thu, 13 Nov 2025 10:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jsLJZ4hbzEqK; Thu, 13 Nov 2025 10:58:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08B2C60F89
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08B2C60F89;
	Thu, 13 Nov 2025 10:58:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87365158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 10:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70AE482A72
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 10:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8x1wYJ1i1lcq for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 10:58:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A266C80398
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A266C80398
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A266C80398
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 10:58:26 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id JV1zvnZh7lZ8PJV1zvySD2; Thu, 13 Nov 2025 11:58:23 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Date: Thu, 13 Nov 2025 11:58:22 +0100
Message-ID: <20251113105822.3985902-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOBuDNDXFWfvugLR15/Ed0sT3m1fCVrQB5Y5Iq6SZ7jl9h2WG6gMokzElnmdVF9Odto1dpekicwBTBMLc7j7xLeJbUK5nPzC2lVVdhevZ2T9HbyksFLN
 xaJ6d1Jg+r6qnupWIA9oNfRkAp6AFnORBmzgJhrsZErHQuLQ1GKXu4AYzYZi1UFB4BB349heO4Dd2+ztSXx4JaPiqdebyx75PWKF/vQVvMTcuqizZyPm2jsF
 cTsHxO3kRpL97ZEUSrFFP/kNpjXBmkFZXakB9W6v4+A/HExrhBxS50snXlCajUhHTGdfEYsoJYlzbCAyxmGo8Ewax+mZ3iypq5uF3zofQlA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1763031503; bh=LfTSjRDm+oBOJYDJyN68jkivLy+tU5za1QoY4aABIFE=;
 h=From:To:Subject:Date:MIME-Version;
 b=gL8hAbgfoXd6td0gR1K+3tTgbTq/yDaJWFoBZ9Pl/78YH0VlscDAZn1ERb7cJWuBq
 Ykv1iQ4a52LfXnd7bdp1VXGJNEyF8EX/l9lsDViGX7P0S9el8rpoS9124sKtxRWQNV
 yXYZH+/OZUKIZsTfBPiYwvkbCVDzcLlnut1ZpiVaKM+cf7IHrjp/DteBDX56RnN/kp
 puB/8yKHMLVmy/nW2OIH6MluhcNzMs6UhExgGV028YDopLplRYp0QaZ6v8ukkIEPcL
 4QCTLD0uzo90yqBmvGT63pTp+6suyhhZt5o/6keczOBQ3F/90dMabIzM3WE0ghYsWt
 oWO1CQvyMiedw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=gL8hAbgf
Subject: [Buildroot] [PATCH] package/libtraceevent: bump to version 1.8.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index c0738de4e7..8830a5e998 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  dc456d4d2bf4b4cd4d0c737d3374a8093f9e5ca18c1d7fc2279a4bf41e613121  libtraceevent-1.8.4.tar.gz
+sha256  1f2f5b8981818638ed51cdafc9b5e95316b5602255aa8ae19a3a5c8abede0e9a  libtraceevent-1.8.5.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index 8c3514f265..d25f6b520e 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.4
+LIBTRACEEVENT_VERSION = 1.8.5
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
