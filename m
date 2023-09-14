Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BBDEEAA71
	for <buildroot@archiver.kernel.org>; Thu, 14 Sep 2023 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79B6F41499;
	Thu, 14 Sep 2023 21:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79B6F41499
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UvzkkLWH5uP; Thu, 14 Sep 2023 21:33:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A47594191B;
	Thu, 14 Sep 2023 21:33:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47594191B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 83E4D1BF855
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D6AE4086A
 for <buildroot@lists.busybox.net>; Thu, 14 Sep 2023 21:33:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D6AE4086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqsIqXOlRTyY for <buildroot@lists.busybox.net>;
 Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6700440743
 for <buildroot@buildroot.org>; Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6700440743
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5009F87022; Thu, 14 Sep 2023 21:33:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Sep 2023 23:30:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ce78e1909a507e66cb8208f8660752be861fca0
X-Git-Newrev: c8672a8b600f2781b54cf4750f1c0eeca264ec14
X-Patchwork-Hint: ignore
Message-Id: <20230914213332.5009F87022@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libspdm: fix legal info
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8672a8b600f2781b54cf4750f1c0eeca264ec14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Hash of license file is wrong since the addition of the package in
commit a837a609a83428b56fa03e18c439b3878d14fdb6

Fixes:
 - http://autobuild.buildroot.org/results/2f9007ee40126cd57753bc97ae2d81c922d9f9f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libspdm/libspdm.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libspdm/libspdm.hash b/package/libspdm/libspdm.hash
index d06af29397..5095d3c3b8 100644
--- a/package/libspdm/libspdm.hash
+++ b/package/libspdm/libspdm.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  3a40daa59f32843062c3d2699acee09bd0ee217eb8ebf0378ae12b60b6db0636  libspdm-3.0.0.tar.gz
-sha256  337130631a714eeae017556cad101d5324c2961214120b6214741d3d43667086  LICENSE.md
+sha256  7dc072bff163df39209bbb63e0916f4667c2a84cf3c36ccc84ec7425bc3e4779  LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
