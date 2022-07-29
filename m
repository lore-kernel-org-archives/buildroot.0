Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299CCC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 19:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9885D8472D;
	Fri, 29 Jul 2022 19:58:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9885D8472D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ezVX9xVjhqo; Fri, 29 Jul 2022 19:58:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8882846E7;
	Fri, 29 Jul 2022 19:58:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8882846E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E7551BF33A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A42460EDB
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 19:58:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A42460EDB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnNeLW4WetGn for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 19:58:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8122A60DE5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 19:58:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8122A60DE5
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2918C86953; Fri, 29 Jul 2022 19:44:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 21:57:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c28b27032b926c2e5ce70a6feefbad34fb753772
X-Git-Newrev: 43daab350d633512df07159b7ba3f90673335c0f
X-Patchwork-Hint: ignore
Message-Id: <20220729194423.2918C86953@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: update gcc version
 for gcc bug 68485
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43daab350d633512df07159b7ba3f90673335c0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 6071342d01..3cc747c1cc 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -139,7 +139,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=68485. This bug still
-# exists in gcc 9.x
+# exists in gcc 12.x
 config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
