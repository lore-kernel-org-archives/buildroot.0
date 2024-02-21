Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EE6C48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66B1F60F84;
	Wed, 21 Feb 2024 21:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RE8Ex6_P40LA; Wed, 21 Feb 2024 21:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A594060FF1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A594060FF1;
	Wed, 21 Feb 2024 21:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46C501BF36F
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0C7540259
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8So3fiZl_1VS for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.106;
 helo=smtpcmd02106.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F08A6402B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F08A6402B3
Received: from smtpcmd02106.aruba.it (smtpcmd02106.aruba.it [62.149.158.106])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F08A6402B3
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuK2rhA6J; Wed, 21 Feb 2024 22:40:10 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:40:05 +0100
Message-Id: <20240221214005.176433-10-giulio.benetti@benettiengineering.com>
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
 t=1708551610; bh=MGA02+T+s66BGa/+Flq+CcLI58fqJzNiuIkfOFogmew=;
 h=From:To:Subject:Date:MIME-Version;
 b=heXutxyfkSAnNx+pGo+Yf9RkCXLmBTCVH2ChJ/r/ZuwgZ3Lh7X4bkbu5HsSpFI6su
 L5vAaM469GPpcJn+cYiX4EPp/pMgfL9CSWQZ7naLcGC8zvFNNUY4nZoVGOdlkWXBw1
 RQWE7DZkEYxrdXu4MuymyBPvp5bCuJ5kRlhwy/CuSVC2gkFP+zU6e2jXmn+HZ2t80M
 9G4V3+Gxh7ZlAhfU7olELQD3vYFAsaCKVXrWxdU7wakT957cWAPN3gGWmfuIUWT0WP
 5yYIcxiuboPFmSQyjPKZFj1ALCqrwekrCSK3tA42AP2d65YaAvbOHLoO+PYObAI7JR
 o3EVftId8daaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=heXutxyf
Subject: [Buildroot] [PATCH v2 9/9] toolchain: remove binutils bug 27597
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

Binutils bug 27597 is not present anymore in Buildroot so let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 407a03c42e..9e6cff1950 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
 
 comment "Toolchain Generic Options"
 
-# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
-# Affect toolchains built with binutils 2.36.1, still not fixed.
-config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
-	bool
-	default y if BR2_nios2
-
 # https://sourceware.org/bugzilla/show_bug.cgi?id=30730
 # Affect toolchains built with binutils 2.40, still not fixed.
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
