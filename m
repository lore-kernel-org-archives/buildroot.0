Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A0AC7EE29
	for <buildroot@archiver.kernel.org>; Tue, 13 Jun 2023 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BAE941707;
	Tue, 13 Jun 2023 12:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BAE941707
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hXN-yqyeR1oC; Tue, 13 Jun 2023 12:55:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A714416F7;
	Tue, 13 Jun 2023 12:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A714416F7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7E41BF966
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7E714089E
 for <buildroot@lists.busybox.net>; Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7E714089E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gjr9UiZTLBr5 for <buildroot@lists.busybox.net>;
 Tue, 13 Jun 2023 12:54:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4CE34088A
 for <buildroot@buildroot.org>; Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4CE34088A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C21D682906; Tue, 13 Jun 2023 12:54:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 13 Jun 2023 14:49:37 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 24905d4d935d643e27754e4d550c43475b342ae9
X-Git-Newrev: 4adbdb65c33ccb95a70dabeba6af8f71ba8b0eb7
X-Patchwork-Hint: ignore
Message-Id: <20230613125451.C21D682906@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/mupdf: drop CVE
 ignores
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
Content-Type: multipart/mixed; boundary="===============3388373221774130764=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3388373221774130764==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4adbdb65c33ccb95a70dabeba6af8f71ba8b0eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Back in commit 1fb64680bffb (package/mupdf: bump to version 1.20.3), we
no longer carry the two patches that were fixing two CVEs. But the
commit forgot to rop the exclusion of those two CVEs.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[yann.morin.1998@free.fr: offload to its own commit, write commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 952fdd8fb1561f123480c781a60f7f4c597f331f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mupdf/mupdf.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index d6cc407c49..4c35ba500e 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -22,12 +22,6 @@ MUPDF_DEPENDENCIES = \
 	xlib_libX11 \
 	zlib
 
-# 0002-Bug-703366-Fix-double-free-of-object-during-linearization.patch
-MUPDF_IGNORE_CVES += CVE-2021-3407
-
-# 0003-Bug-703791-Stay-within-hash-table-max-key-size-in-cached-color-converter.patch
-MUPDF_IGNORE_CVES += CVE-2021-37220
-
 # The pkg-config name for gumbo-parser is `gumbo`.
 MUPDF_PKG_CONFIG_PACKAGES = \
 	freetype2 \

--===============3388373221774130764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3388373221774130764==--
