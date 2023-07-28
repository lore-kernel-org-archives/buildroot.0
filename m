Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F32EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0DC41872;
	Fri, 28 Jul 2023 20:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F0DC41872
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RA2JFbG6_mKx; Fri, 28 Jul 2023 20:23:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C030D41615;
	Fri, 28 Jul 2023 20:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C030D41615
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41E011BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2884E4013D
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:23:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2884E4013D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ToFqzrjnrPfv for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:23:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61038400CF
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61038400CF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C2A7839A8; Fri, 28 Jul 2023 20:23:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:22:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9db6cad86e65075dc3d26c20dac362d3401f13eb
X-Git-Newrev: 599ced8690398ed4f0ecb70a50c0e1c265fc4a5e
X-Patchwork-Hint: ignore
Message-Id: <20230728202319.4C2A7839A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: update after
 package/gcc/10.4.0 is gone
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

commit: https://git.buildroot.net/buildroot/commit/?id=599ced8690398ed4f0ecb70a50c0e1c265fc4a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0091c0d0ca..f3e04b4f49 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -487,11 +487,6 @@ package/fxload/0001-fix-static-build.patch Upstream
 package/gamin/0001-no-abstract-sockets.patch Upstream
 package/gamin/0002-no-const-return.patch Sob Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch Upstream
-package/gcc/10.4.0/0001-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
-package/gcc/10.4.0/0002-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
-package/gcc/10.4.0/0003-or1k-Use-cmodel-large-when-building-crtstuff.patch Upstream
-package/gcc/10.4.0/0004-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch Upstream
-package/gcc/10.4.0/0005-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
 package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
