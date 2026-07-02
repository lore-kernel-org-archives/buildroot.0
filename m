Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8282C44501
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9229824B4;
	Fri,  3 Jul 2026 14:28:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejmzMWWpfv83; Fri,  3 Jul 2026 14:28:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1252782379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088912;
	bh=0vzBW0P8bFtrd10f92tN3LR6j/Gu1xbuevk2nFT1f+c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiaWnJdCan4oAI2HNFh6RXKn8bj6gz3MSAuEZ/tsRlTpJMXLKwMGMt4T+6LO4KqrR
	 RbeWeSAJxBrameYLC1pO/9ycsizhS31WE7CDRyb2y3vIzM7oYoEKx2y9pizrZTAgwk
	 SvqgdX5Z8aUx4s8Xkngu2VYjMk68mWbIel8H5SF78a/spu2Dm1DtQSqH9lxewsH5Si
	 4hoapWVaivq6QWMDMPd902x/Qx5446bbOMGRQjPlzakvOQgwwEL6xxrH3OimRDFdXT
	 MZtsm+n9lUrshMOTYlRN5DAwtjCumccGdCoJHxeZeQgiVCvnQMcVnVPVvKdIIrK7/Z
	 uvBMVJHCDnxPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1252782379;
	Fri,  3 Jul 2026 14:28:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14A6214F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05E1040EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mymK6zEPyAcb for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4658340FC6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4658340FC6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CF8A6883A2; Fri,  3 Jul 2026 14:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:30:26 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8ecb2fe3fcf820a300ce2fa5def191691df945fb
X-Git-Newrev: 67b13f3c8da2fd6bb9fd8920ed9d52200ed1019b
X-Patchwork-Hint: ignore
Message-Id: <20260703142757.CF8A6883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/libarchive:
 security bump version to 3.8.8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/67b13f3c8da2fd6bb9fd8920ed9d52200ed1019b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://github.com/libarchive/libarchive/releases/tag/v3.8.8
"Libarchive 3.8.8 is a security, bugfix and minor feature release."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit c384895981eb7d98a8ba5067566601772db0258b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libarchive/libarchive.hash | 6 +++---
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index 665259f2b6..dccb2cc4a7 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,6 +1,6 @@
-# From https://github.com/libarchive/libarchive/releases/tag/v3.8.7
+# From https://github.com/libarchive/libarchive/releases/tag/v3.8.8
 # After verifying the pgp signature from:
-# https://www.libarchive.de/downloads/libarchive-3.8.7.tar.xz.asc
-sha256  d3a8ba457ae25c27c84fd2830a2efdcc5b1d40bf585d4eb0d35f47e99e5d4774  libarchive-3.8.7.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.8.tar.xz.asc
+sha256  3873a88801da067d0528a989af06877710529d50ee8fe6f3970cbb4302efb918  libarchive-3.8.8.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index f11f5d8f6f..23cb82f7b5 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.7
+LIBARCHIVE_VERSION = 3.8.8
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
