Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5CDC04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 21:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61F8540902;
	Wed, 28 Sep 2022 21:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61F8540902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vixXcxr2-jqv; Wed, 28 Sep 2022 21:23:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 456C340895;
	Wed, 28 Sep 2022 21:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 456C340895
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1D91BF3DB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58AE760E8A
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 21:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58AE760E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q51gFDPFcpkp for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 21:23:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8322960E2E
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 21:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8322960E2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72AAA86439; Wed, 28 Sep 2022 21:23:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Sep 2022 22:23:59 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: ce7550db525a5370398e0bf550a37f132c13b8d6
X-Git-Newrev: 48b12430fef3f0e15e8ae5c445cb756e31fc54ed
X-Patchwork-Hint: ignore
Message-Id: <20220928212328.72AAA86439@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/test-pkg: show
 default build dir in help test
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

commit: https://git.buildroot.net/buildroot/commit/?id=48b12430fef3f0e15e8ae5c445cb756e31fc54ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Avoid the "Where did it put my builds?" step.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ca9fbfd5eeab5ecd63b9e2a0ee882723105ba706)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
