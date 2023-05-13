Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22265C7EE24
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C601A614E6;
	Sat, 13 May 2023 19:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C601A614E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NENTe3PoTQeX; Sat, 13 May 2023 19:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07C7360B3D;
	Sat, 13 May 2023 19:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07C7360B3D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7D51BF86B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1121741C54
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:48:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1121741C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IN_t-XLWj4cT for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:48:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10DC041BEA
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:48:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10DC041BEA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2B20865C0; Sat, 13 May 2023 19:48:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 May 2023 21:48:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a650d714341c0e2900dac492c02d3b5701c87c8d
X-Git-Newrev: 952fdd8fb1561f123480c781a60f7f4c597f331f
X-Patchwork-Hint: ignore
Message-Id: <20230513194848.F2B20865C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mupdf: drop CVE ignores
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
Content-Type: multipart/mixed; boundary="===============3251409108153504347=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3251409108153504347==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=952fdd8fb1561f123480c781a60f7f4c597f331f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Back in commit 1fb64680bffb (package/mupdf: bump to version 1.20.3), we
no longer carry the two patches that were fixing two CVEs. But the
commit forgot to rop the exclusion of those two CVEs.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
[yann.morin.1998@free.fr: offload to its own commit, write commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

--===============3251409108153504347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3251409108153504347==--
