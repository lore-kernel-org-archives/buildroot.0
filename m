Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61BF106ACCD
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 18:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159F34074F;
	Thu, 12 Mar 2026 18:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mahy5prscZCM; Thu, 12 Mar 2026 18:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4242D4073F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773340242;
	bh=59wfvnnEbO3Bzxjgl8NeQD71Hcg6kRmOwgzgPCpScao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ktIcYDcHFZlY5GzCRyQ5OcKJXbeYsm+czVKnlprHwf7p4xmRpwFVwVdZwBYWd6kHW
	 uNQT1ihmiJFQeQk2VwfLMzF0nOP6lHzHKQs4Shp3wD9s0qAUy1XUiOBS20Ats7bK+T
	 t2Hyfs2nKH0NrJkK7RjqyXkWbQ2CS9fzrDna5dAmPnEJjVJNfjAjsSfAZNt+/eYD9O
	 CGBKMtXUS9d7eYa9JRak+5YbHOapMSLZforFbFz3rkOr/SL7eC6Q2q+w8Lsh8FW1nZ
	 KJ/SejLy0yZiOJHoefP0iJASuyHfjnoLlH8IXr1AnXc/yVnTRCBZrNAvkf2s6YOXeB
	 ZUvURt3oK/qpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4242D4073F;
	Thu, 12 Mar 2026 18:30:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AEE67786
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 949714073F
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hsv1kpkNAImH for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 18:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B89040737
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B89040737
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 18:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE3678708E; Thu, 12 Mar 2026 18:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 19:23:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccf727ab96af0ad58b432fa9ed2aed8680649f3a
X-Git-Newrev: b08ac7636dc7b2753592989dc5fe73959e0f6507
X-Patchwork-Hint: ignore
Message-Id: <20260312183039.BE3678708E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.31
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b08ac7636dc7b2753592989dc5fe73959e0f6507
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v0.3.30, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 965d7458ba..e97e32271a 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.30
-md5  8db3d57f4d4485c6ae3f21ea465660e7  openblas-0.3.30.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.31
+md5  05050271d9196f65bc4ac3a89c6a3b05  openblas-0.3.31.tar.gz
 # Locally calculated
-sha256  27342cff518646afb4c2b976d809102e368957974c250a25ccc965e53063c95d  openblas-0.3.30.tar.gz
+sha256  6dd2a63ac9d32643b7cc636eab57bf4e57d0ed1fff926dfbc5d3d97f2d2be3a6  openblas-0.3.31.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index edab26493d..d56934e41a 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.30
+OPENBLAS_VERSION = 0.3.31
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
