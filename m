Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94264C4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:12:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 380C0436EF;
	Wed, 10 Jan 2024 21:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 380C0436EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WgpGGfkLOCZI; Wed, 10 Jan 2024 21:12:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36305436E5;
	Wed, 10 Jan 2024 21:12:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36305436E5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2609B1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F25E861536
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:12:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F25E861536
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwHHkQuV899L for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:12:27 +0000 (UTC)
Received: from smtpcmd11116.aruba.it (smtpcmd11116.aruba.it [62.149.156.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 49BF861515
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49BF861515
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Nfs8rVGdOnb7jNfs9rhRt4; Wed, 10 Jan 2024 22:12:25 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:12:23 +0100
Message-Id: <20240110211223.791548-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
References: <20240110211223.791548-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJCNQuiw48y4aCsbOT02MhBJdrN1x+dbShA0N4DiFAiErFLSX0rNCu60pAkS9No4qSOuFEiNhaC65NOi5PdXfNXCouHjh6XtDWep8Ucn0rkBkXoI8ZIg
 JFIrFBesJQpT6pP418lr2VwNCLLXtVUYJ5f4PsdaYx29KtToZD5hkT7EUTNsc24LyvwbG8OM4BvVEiG9xbcot3pb/APme9Cbg3dDM0P1CQycXJnU94SIWOEV
 aS6pNZCJdI/Mr6d5dCpZxJzWe/GBSdqptLYKYndn85yM6DJ0PKj3mVEhvX8085f/D/KIGNGFFenNZ24VgYa4sfQscRpkRXkwwCkTR+4BxPu0e8o6KGdGb6Lb
 1PzAcoHp
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1704921145; bh=j3WGnKINdgdR4Tw0WMcqBoVMzXm/iKE9j3X2vB+DJ6U=;
 h=From:To:Subject:Date:MIME-Version;
 b=YMSMftCRcX55TVOI7R09C/yjV2LOYdpuMWntk7YUUulGv1QlD+Yl0thizo1ePuEQG
 1e79siZCPkMOrusxxroi1ipc1BKqU4WsglzJ8OXImBxY3h81qWzZJ1wmmoCIZPHFIB
 X5tY9Zd8rt3VfapxnSAWOdboJ0FUv/z2uWKxb5UB+A6Gf+I7wZzK24by4RUO7gAFCI
 iWZy4QJbQ+jc1VAFR/GtoRnotBp1l38+mW6zTLDLzgPEY01LJ8kjf2WXWAfbkNqHb3
 z0AeqE6Zb+nFNhFU0f7Y0ugviOWvnbsZpng1Qeecs5JdJzCC/qW30chcuLbv78fuYm
 WUf+qruCE8Ktw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=YMSMftCR
Subject: [Buildroot] [PATCH v2 3/3] package/trace-cmd: bump to version 3.2
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Floury <pierre.floury@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* no changes
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index 6edcaf0e1c..30b0c48de6 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  e496d41e599f8ef3c9a74675da05f86be0d8d48d524f0182c73ab98cd16da0b0  trace-cmd-v3.1.7.tar.gz
+sha256  62af2c6062eeb434925921bb5936774b0a0e17a5f86671fa2ea2f40704a080cd  trace-cmd-v3.2.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index ab8e9149f7..e02eb79530 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.1.7
+TRACE_CMD_VERSION = 3.2
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
