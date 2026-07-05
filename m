Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88987C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 08:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4687480EDD;
	Sun,  5 Jul 2026 08:15:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HU5SRR_zthp5; Sun,  5 Jul 2026 08:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66C8F80EE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783239330;
	bh=HCPbJLQAFBac79kitnUKP1Ps63ttYu+lPH8g4hCMuBM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=di227bLJQlYTsWBoHMQt1DVAeu4xtXjco9QN1JZrUg3Cr6vIlYdyUa542iqxMmm0d
	 Jie80rSSWt43ViTAB+J1Xl1o7R3Iy5GLnjFhxLZwdCBdL8mtOSlqFgVOW12b46enru
	 GDz2GNRBJkEQuy/83fEXlBfmlMnrbIIYO8lnn12mBF9Og+DCHfSHfH9lYcea9T9Rhd
	 9XqrCKYQq2X7ry1iryyFzAzgIHruUNn2J9zxM4HMgy3uHgpr+6A98JiNkbPKtCTdeh
	 VMK42QefMzieJnxxco7fq0ZiDPIICDCu9+K8uG+FTltyOJZbclZo+HeVgSaUOBYQPt
	 VNOF0WhibzxpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66C8F80EE0;
	Sun,  5 Jul 2026 08:15:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFEADF2
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C68C4400AA
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0jorAWT_vFPc for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 08:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA13C400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA13C400A4
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 08:15:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6804A8845F; Sun,  5 Jul 2026 08:14:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Jul 2026 10:10:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c5728ff5af9898ab1db967d7e13af2b17825ed25
X-Git-Newrev: 85a98f81488914ddbdb2be56c7f44a6c37c6a513
X-Patchwork-Hint: ignore
Message-Id: <20260705081457.6804A8845F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: security bump version to
 4.7.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85a98f81488914ddbdb2be56c7f44a6c37c6a513
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.com/libtiff/libtiff/-/releases/v4.7.2

Fixes CVE-2026-36849: https://seclists.org/oss-sec/2026/q2/952

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/tiff/tiff.hash | 4 ++--
 package/tiff/tiff.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index ff0b698345..5c9031bfb4 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking pgp signature
-# https://download.osgeo.org/libtiff/tiff-4.7.1.tar.xz.sig
+# https://download.osgeo.org/libtiff/tiff-4.7.2.tar.xz.sig
 # with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
-sha256  b92017489bdc1db3a4c97191aa4b75366673cb746de0dce5d7a749d5954681ba  tiff-4.7.1.tar.xz
+sha256  4996f0c4f93094719b1ca5c6279b20e588773ba8a247533e486416fb662ddb88  tiff-4.7.2.tar.xz
 sha256  0e27c2382d7b8147972bbb746e04059a1152c8d0fda9d03ef1399d1a433c4ade  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index e64a6baf83..b1efa5be5a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.7.1
+TIFF_VERSION = 4.7.2
 TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
 TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
