Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A43C54788
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 055C460F75;
	Wed, 21 Feb 2024 21:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KM7ZeMA54pCN; Wed, 21 Feb 2024 21:40:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CAA060F8F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CAA060F8F;
	Wed, 21 Feb 2024 21:40:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D8951BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A81E40259
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zg7rLLAeKS1g for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E252940245
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E252940245
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E252940245
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:11 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuK1rhA5i; Wed, 21 Feb 2024 22:40:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:40:03 +0100
Message-Id: <20240221214005.176433-8-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
References: <20240218230524.639348e6@windsurf>
 <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMCYclXGzSc58kCMYLIuJWOAdsQhQlanLBZWT+YWb1+wAx8wC5ZeTvyAEb3BbuT8HkMvwZTEJ5SBD/d2OYgKiQKQQy1fM+ZmjGkvoYxmGnu7sfk/zKra
 GoPL5GJMSjn6bGws3C9XFCPcg6PL1CQG0tCrpareLV0gySTW51vSY91YrA/jL5wFoKVJEikQdAe0PlRBTrCZ7RKoGT2zQuib2fzu+1DFIREZ4n6ltXYDHfXd
 8N/GJXOHO5Iou3ZG7nNyufj8/rmg1QeuXqA8WDveqSS/P2U3E23eLAZkK30O0zdioHAvc28ArJfMfMlW72jIz4PVZc/VSEXt5hnJQJPZDGZUIZg9KOvuieHP
 KQxyiBy5liRwHoRzf/wgSJXq6Ei6WBtGUN0FjVXCxhE6Qn+/7A4evn0sYRvC/vJYE2/WSN1EnwRmm7yyM0L7rBSVfJNOTAwUgP89wCuFz71KvPXdhVJqvxkO
 xpaXF15pS7LKHnpg90zDXJwmi7NlelUB3gGLEq2tZGQHFrD5WsipvTLyp4Q37/akztWRgUoZckIVlAkSJqgkqLCOMfXaynrvc46mHPbmB51oF26w/B3pzlTR
 1BbiNxjxHfs/eUP5VLaU8MTu2oCQzGh47E+Ny20ASAOHJH+XoLjeRU8EycvnUBK6FOg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708551610; bh=0dGDQMJ+5q6XdAZcrkMg4EHrcmjQEDpOO48yZPxP0Fs=;
 h=From:To:Subject:Date:MIME-Version;
 b=TWvj1rYxFY1ULjLScjiLwzRCgWu6CJdswaHlOR6esiRjYO+xYpVWyShpDsQnjPczT
 Asvgc2QxArI4jlbaM6kPpkVHPakaMtVL9RhQ1sBxINSD7W5jDONT+V7gwbeD185Q4J
 hBYBGRWyvniLgbFkL7DG3QqmLHViz2G19RDVIzrr/OnfLOwmVuOIC71ckqo6Ymmxy1
 eVA/1qJRtbHHNkgFXMecF9FpzX2AQGTg2eB3kYyaTyMHRbg45y7myWmkm1H8ynZyGr
 rILsfg8U6ywFyIWzxvxwbRxNyV9Bz9+1D+q56TQG9R1NURj4yhbHFoM6fyHc+pghqd
 EhCYFOqc14YhQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=TWvj1rYx
Subject: [Buildroot] [PATCH v2 7/9] package/pistache: drop nios2 binutils
 bug 27597 dependency
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that binutils patch has been backported to every Buildroot binutils
version we can drop nios2 binutils bug 27597 dependency.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/pistache/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index 3acf1f53f0..ca2d2833cd 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_PISTACHE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	select BR2_PACKAGE_RAPIDJSON
 	help
 	  Pistache is a modern and elegant HTTP and REST framework
@@ -13,9 +12,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar, not binutils bug 27597"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		   !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_USE_WCHAR || \
-		   BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
+		   !BR2_USE_WCHAR
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
