Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BBDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4B7181457;
	Mon, 27 Dec 2021 21:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeUr-KUb6ncb; Mon, 27 Dec 2021 21:58:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33DD813BC;
	Mon, 27 Dec 2021 21:58:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DCDD01BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5CF94032E
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgjHVd1QkzIb for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:58:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD3BF4032A
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:58:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0063B1C0004;
 Mon, 27 Dec 2021 21:58:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:58:33 +0100
Message-Id: <20211227215833.1136054-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gcc/Config.in.host: fix
 BR2_GCC_VERSION_ARC select of BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
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
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When the gcc arc version was bumped to a version using gcc
10.x (arc-2020.09-release) in commit
0791abfba0227803b19895ea22326f4e17ac93dc, the select of
BR2_GCC_VERSION_ARC on the appropriate BR2_TOOLCHAIN_GCC_AT_LEAST_xyz
was not updated. This commit fixes this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index aa2665cbee..a1fe192d3a 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -12,7 +12,7 @@ config BR2_GCC_VERSION_ARC
 	bool "gcc arc (10.x)"
 	# Only supported architecture
 	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
