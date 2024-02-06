Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A57C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB0B0612C0;
	Tue,  6 Feb 2024 17:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB0B0612C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zR2CMelqO6uy; Tue,  6 Feb 2024 17:05:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C09461142;
	Tue,  6 Feb 2024 17:05:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C09461142
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E0571BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB61D4046D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB61D4046D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0BVFNZ7I-HX for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:05:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34AE3402C5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:05:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34AE3402C5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2087287185; Tue,  6 Feb 2024 17:05:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:03:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0e7a1d3d15727a2f14db83b7c651db73f2a50f1
X-Git-Newrev: fc3d2bcb40e5cc47b4d6a3dd73fc145c1f00db50
X-Patchwork-Hint: ignore
Message-Id: <20240206170513.2087287185@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/contribute.adoc: mention sr.ht
 as a fallback for sending patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=fc3d2bcb40e5cc47b4d6a3dd73fc145c1f00db50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[yann.morin.1998@free.fr: make it explicit it is not the official way]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/contribute.adoc | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 684e9f4809..6ff6c15314 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -375,6 +375,15 @@ If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
 
+https://sr.ht also has a light-weight UI for
+https://man.sr.ht/git.sr.ht/#sending-patches-upstream[preparing patchseries]
+and can also send out the patches for you. There are a few drawbacks to
+this, as you cannot edit your patches' status in Patchwork and you
+currently can't edit your display name with which the match emails are
+sent out but it is an option if you cannot get git send-email to work
+with your mail provider (i.e. O365); it shall not be considered the
+official way of sending patches, but just a fallback.
+
 ==== Cover letter
 
 If you want to present the whole patch set in a separate mail, add
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
