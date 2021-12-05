Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58169C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10AC640452;
	Mon,  6 Dec 2021 18:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFXNdPaE7cOX; Mon,  6 Dec 2021 18:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 380CC40124;
	Mon,  6 Dec 2021 18:45:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13E331BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 447A341C36
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gm0S3bWRNkRa for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 340F641C54
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C305881503; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 11:11:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 736932c71552adc4dfa95c5236d1064860900e8a
X-Git-Newrev: 22ea19e8f952b290991b977870170f4d6ac0f24b
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.C305881503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-userland: fix download hash
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

commit: https://git.buildroot.net/buildroot/commit/?id=22ea19e8f952b290991b977870170f4d6ac0f24b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 'package/rpi-userland: bump version to bab9bf8'
(76875989326d9122db272c1a0f49b92961c3f2af) forgot to adjust the
download hash.

Fixes:

  - http://autobuild.buildroot.net/results/49a27362e36bad6076a727877bccb6e28edb06bd

  ERROR: rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz has wrong sha256 hash:
  ERROR: expected: e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8
  ERROR: got     : 16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41
  ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpi-userland/rpi-userland.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpi-userland/rpi-userland.hash b/package/rpi-userland/rpi-userland.hash
index da573f3eae..8ea184a4f6 100644
--- a/package/rpi-userland/rpi-userland.hash
+++ b/package/rpi-userland/rpi-userland.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e1ac871911e52b9fe07b3daa080b21bcdec3f1d2926cc98c934794780a4bf8d8  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
+sha256  16c01befff64ebc11a0554e487b00939ed7a716f68dc795db4880b35bb25fa41  rpi-userland-bab9bf8790cd69660d443ce43b4e372999f3f7ac.tar.gz
 sha256  bee6f1249175683d8610651706e1aa7dffcbfd3f9c4c05bc1e5ab34f313c2db5  LICENCE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
