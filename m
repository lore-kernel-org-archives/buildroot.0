Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2721C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 20:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86AE8416A3;
	Tue,  7 Jun 2022 20:37:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1zTv7VgsM4bv; Tue,  7 Jun 2022 20:37:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F248415CC;
	Tue,  7 Jun 2022 20:37:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89D371BF25B
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF7AF41588
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 20:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JLEzBxUQYDGe for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 20:36:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9249415CC
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 20:36:12 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 07B91240002;
 Tue,  7 Jun 2022 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654634171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VHWxOJyqs17t643SDjh2yqdtBsaPpPSmLLqp68a6Mlc=;
 b=S2YIarZ7PPzJzOPLLPmQW6AdxQ+X2fzWgYhv19n2pH1dy6iHxykS+qA1AgxRAXqm5lLOnY
 7pP8GaGcKefCZEY8xLvxepDpDSQKdzPeAWYtADH2b+XGjrZT/l51QSjDicNvM01hQ0ikIs
 KcPCGDP3v2TLzgh91C7KzJ8U6YJIrNMIieVL/C/lIrVQTJlhplTcy1wAo7atgLpTnuUnqB
 BeV1kMcqwMEKlejcenS/ZHGn/VlXdRkcFJ1hUuwC2KVuZqxU1CY32c0nB9cLEPUNNgs7S0
 NJbIXrFbPt6jFysJwWL7HTEq6XuVoNRn7wQ2SXH2wWHv/VJOYWgY2jMB15bvPQ==
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Date: Tue,  7 Jun 2022 22:35:46 +0200
Message-Id: <20220607203553.3307479-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
References: <20220607203553.3307479-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 05/11] support/scripts/gen-bootlin-toolchains:
 adjust dependencies of i686 toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Bootlin i686 toolchain was already made available only on BR2_i386
with !BR2_x86_i486 && !BR2_x86_i586 && !BR2_x86_1000. However, this
was not sufficient as a few other architecture variants of BR2_i386
are "lower" than i686, and they need to be excluded as well.

Allows to fix:

  http://autobuild.buildroot.net/results/56ac1a8fa5b34a9ca10eef98ae9fb090b8c762c4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/gen-bootlin-toolchains | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index df1c000f9b..c96a388f84 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -257,7 +257,12 @@ arches = {
         'conditions': ['BR2_i386',
                        '!BR2_x86_i486',
                        '!BR2_x86_i586',
-                       '!BR2_x86_x1000'],
+                       '!BR2_x86_x1000',
+                       '!BR2_x86_pentium_mmx',
+                       '!BR2_x86_geode',
+                       '!BR2_x86_c3',
+                       '!BR2_x86_winchip_c6',
+                       '!BR2_x86_winchip2'],
         'test_options': ['BR2_i386',
                          'BR2_x86_i686'],
         'prefix': 'i686',
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
