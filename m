Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B52ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 16:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F242C6111E;
	Sat, 17 Sep 2022 16:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F242C6111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aOOp7IJT5Ur5; Sat, 17 Sep 2022 16:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2593F607C1;
	Sat, 17 Sep 2022 16:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2593F607C1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 97A641BF48D
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8010583F66
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 16:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8010583F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G2uqa4I2oiBk for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 16:11:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C79CF83F56
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 16:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C79CF83F56
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B33A9845A2; Sat, 17 Sep 2022 16:11:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 17:57:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b71d1015e26f9815968a0e58e55aa31dbb115d5
X-Git-Newrev: ca9fbfd5eeab5ecd63b9e2a0ee882723105ba706
X-Patchwork-Hint: ignore
Message-Id: <20220917161148.B33A9845A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/test-pkg: show default build dir in
 help test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ca9fbfd5eeab5ecd63b9e2a0ee882723105ba706
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid the "Where did it put my builds?" step.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/test-pkg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/test-pkg b/utils/test-pkg
index ce6e43b965..4ebfd9af66 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -257,6 +257,7 @@ Options:
 
     -d DIR, --build-dir DIR
         Do the builds in directory DIR, one sub-dir per toolchain.
+        If not specified, defaults to \${HOME}/br-test-pkg
 
     -p PKG, --package PKG
         Test-build the package PKG, by running 'make PKG'; if not specified,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
