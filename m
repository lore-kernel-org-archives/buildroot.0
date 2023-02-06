Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED55C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 365F870081;
	Tue, 21 Feb 2023 01:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 365F870081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-fTDkc17C5r; Tue, 21 Feb 2023 01:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 675677007C;
	Tue, 21 Feb 2023 01:36:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 675677007C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 72AA01BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EBDB6FC2D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EBDB6FC2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QRrhXIQGT0da for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A4E06FBE4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A4E06FBE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7FBC781979; Mon, 20 Feb 2023 20:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 18:54:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: aeec8faf3189b5dde90c465a9b14897406b1fc08
X-Git-Newrev: efccb2a7dd909f8f9b316d809859b9434a2737b0
X-Patchwork-Hint: ignore
Message-Id: <20230220205250.7FBC781979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] docs/manual: check-package
 before submitting patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=efccb2a7dd909f8f9b316d809859b9434a2737b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add 'utils/docker-run make check-package' to the default workflow of
submitting patches, just after the rebase and before using format-patch.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/contribute.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index e588c69be6..94f1c64496 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -294,6 +294,12 @@ $ git fetch --all --tags
 $ git rebase origin/master
 ---------------------
 
+Now check the coding style for the changes you committed:
+
+---------------------
+$ utils/docker-run make check-package
+---------------------
+
 Now, you are ready to generate then submit your patch set.
 
 To generate it, run:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
