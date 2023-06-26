Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16840EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 06:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A261B60E1B;
	Mon, 26 Jun 2023 06:54:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A261B60E1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nda9-1kkkG0F; Mon, 26 Jun 2023 06:54:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03FE060B8A;
	Mon, 26 Jun 2023 06:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03FE060B8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E8B31BF3BC
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 06:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47C5060B8A
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 06:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47C5060B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDaZWVrrkMgC for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 06:54:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BCA2606EC
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 06:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BCA2606EC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0865883B3D; Mon, 26 Jun 2023 06:54:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 08:53:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3223a34ee546ca1e15d022cf0ae6253187a79af9
X-Git-Newrev: 5ae444e380da0f9c2c15f2d39c9ae90d757fb325
X-Patchwork-Hint: ignore
Message-Id: <20230626065428.0865883B3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcgroup: remove empty line at
 end of file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ae444e380da0f9c2c15f2d39c9ae90d757fb325
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit 9d58b525fcfd0d92fcdd3c66d7858213c4b139c6 the newline at the
end got accidentally removed. Commit
fd6b33426962727b97e2ea2a63bfb7a018adcfaf re-added the newline, but
accidentally added an empty line as well. Remove the empty line.

Reported by check-package.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libcgroup/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcgroup/Config.in b/package/libcgroup/Config.in
index 9326b967ed..b9333be2a2 100644
--- a/package/libcgroup/Config.in
+++ b/package/libcgroup/Config.in
@@ -19,4 +19,3 @@ endif
 
 comment "libcgroup needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
