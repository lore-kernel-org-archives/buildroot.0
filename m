Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45027EDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F8DF6112D;
	Tue, 10 Sep 2024 20:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrQQkT19wF7q; Tue, 10 Sep 2024 20:53:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24D096113D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24D096113D;
	Tue, 10 Sep 2024 20:53:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1516D1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4320A4097D
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ4WWUDJ5yBj for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F32409F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4F32409F2
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D4B6786F5F; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27277a2bc90326f9bfda3aacc2ef494bf207a8ec
X-Git-Newrev: e009783505e80e80a49f57a0abd9aa2b417063bb
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.D4B6786F5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/genpart: fix typos and grammar in
 patch description
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

commit: https://git.buildroot.net/buildroot/commit/?id=e009783505e80e80a49f57a0abd9aa2b417063bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: also fix grammar]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/genpart/0001-fix-return-code.patch | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/genpart/0001-fix-return-code.patch b/package/genpart/0001-fix-return-code.patch
index ec18c82f8c..6ecf0d9bc2 100644
--- a/package/genpart/0001-fix-return-code.patch
+++ b/package/genpart/0001-fix-return-code.patch
@@ -1,7 +1,7 @@
-genpart: return 0 if partition writen OK, with no do_magic
+genpart: return 0 if partition written OK, with no do_magic
 
-If do_magic is false, we don't won't write the 0xaa55 magic.
-However, if we succesfully wrote the partition entry, we still
+If do_magic is false, we won't write the 0xaa55 magic.
+However, if we successfully wrote the partition entry, we still
 want to return 0 to indicate success.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
