Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB24C55172
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B8E60BB7;
	Fri, 31 Jul 2026 12:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syYl5qmgqTR8; Fri, 31 Jul 2026 12:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5546760B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500552;
	bh=5/K7aQe4UbsQBY8X38O9aEsMM3M1X9m6UFXshfAcEN8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GtR/6dYnzl+fEkth5Gp81Xtny+5mhrhWvD1iMV27nC1OgpCYYAXpHLD/KuaxY6Nu9
	 GZRLGaWLK0VIxlh1oplXU6mQ+MTyv050II/twiTjI8WcxZ1GUieyd3YcIsy21wdONN
	 Oe4vQwgmMUN7mrfUUXjjyawvnEemCm1zM+Qt59nX0WJ3jWG+kcHmQxiNbQFFZhGPIt
	 jCQzI+tTzdSOxQK7ntfB29AJeq1zD2hSp6LEiZJpcvv+07sxDFTgUx0w/RIriz5/iK
	 nmeZS4cHrCHlf+dtRARhm27jJ3DJR/m1JFCoiSj2aww3UjfCQwolWmg+dvmsWL8MGT
	 xK1t34gz6cTgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5546760B7B;
	Fri, 31 Jul 2026 12:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCBCF2E9
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACC2260B92
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5BHtCF3_Q78 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E956E60B7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E956E60B7B
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C85F38B734; Fri, 31 Jul 2026 12:21:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:14:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: af6fb9e1fb030ecc8cf2f1d564fb1e3a9b5c57f5
X-Git-Newrev: 9a5a2be04b4712c206b6ddd69142273c7041a821
X-Patchwork-Hint: ignore
Message-Id: <20260731122143.C85F38B734@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: security
 bump version to 1.23.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7268243344745508761=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7268243344745508761==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9a5a2be04b4712c206b6ddd69142273c7041a821
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/strukturag/libheif/releases/tag/v1.23.1

Fixes the following CVEs:

CVE-2026-62289 (GHSA-jc8f-p23p-5hjg)
Integer underflow in Fraction constructor via double clap transform
application

CVE-2026-62291 (GHSA-xpw3-9rhw-482x)
Heap out of bounds write in libheif uncompressed encoder when writing
images with mismatched auxiliary alpha dimensions

CVE-2026-62292 (GHSA-73p7-m7gg-w2jv)
Out-of-bounds read in uncompressed unci tile range slicing

CVE-2026-62377 (GHSA-9ww4-9v47-m7pj)
Reachable assertion in HeifContext::get_track() aborts on a valid-but-
empty HEIF sequence file

(GHSA-46rp-pcq2-rpmr)
Heap out-of-bounds write in the uncompressed encoder for RRGGBB images
with interleaved bit-depth ≤ 8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bcb48623faecb73e7b14469b31f4cec73c979cb9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 780059facf..ff8c05c7e4 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.0
-sha256  4c9182b18897617182eed12ab5eb9f9d855b3aa3a736d6bdb31abc034ec7d393  libheif-1.23.0.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.1
+sha256  0de0327f60fcd47de90d5654c6fe152232738d60d84fe084ec3e0f35e03b166a  libheif-1.23.1.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index be97b18bd0..124dba7c24 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.0
+LIBHEIF_VERSION = 1.23.1
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============7268243344745508761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7268243344745508761==--
