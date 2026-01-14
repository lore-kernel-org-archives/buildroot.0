Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9CED39019
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 20:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A60280F3B;
	Wed, 14 Jan 2026 20:40:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O1FiAhzJmJLW; Wed, 14 Jan 2026 20:40:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 218EE80C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768423213;
	bh=wY8EMZrBqcvc6BkBLnR/0+gZyQHqX5Nhj1i29cjqrgc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WWSfHzLQ1nQajIQHHNZ9D7MewMkbkbMQGwdThI579UDpOLk+piN73Jonq+9TXEapv
	 WkAilKzzjLa1zfZDUoHCV1rqGRppNJ8xUaSZqMrnlfnHNkiCxHlL7/A83u2UJWEU7L
	 SOv8AAu1ijZeXiuSe2jBwnx0AaWLPt2mbcGl9OCXwmLkYO98nUY/5Oy/Bb+aSnqVIc
	 PhEhlawZeGzucuS+JFchVfXADFmtCUcj3uQSb/wKt6ltGMCB5IXHzlL2I5m+csrYY2
	 3/GMyzyniJg3tQx8xX+OSyDtldX8FMQDQOyXSa5tS3yMfMbuV1oXYZye7a+MvdGQk/
	 +7o5J7mM806QA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 218EE80C5D;
	Wed, 14 Jan 2026 20:40:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C08D1C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C9AA40B73
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dz2utQhhzF0y for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE0BD403F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE0BD403F5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2FCB885C0; Wed, 14 Jan 2026 20:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 21:24:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b748550e5fbd52a63ff9a784701e17d4c0a870f
X-Git-Newrev: 517af4da0194e1e6d207c323014d062dcb54498b
X-Patchwork-Hint: ignore
Message-Id: <20260114204010.B2FCB885C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/leptonica: bump to version 1.87.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=517af4da0194e1e6d207c323014d062dcb54498b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
http://www.leptonica.org/source/version-notes.html

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/leptonica/leptonica.hash | 2 +-
 package/leptonica/leptonica.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/leptonica/leptonica.hash b/package/leptonica/leptonica.hash
index 293eef4741..6cd3ed3459 100644
--- a/package/leptonica/leptonica.hash
+++ b/package/leptonica/leptonica.hash
@@ -1,3 +1,3 @@
 # locally computed hash
-sha256  1fa08e40bb37fd45802d5e6e7b43927449a5c47d4608ef99d3bd3f0fa76baedc  leptonica-1.86.0.tar.gz
+sha256  c73363397f96eb1295602bf44d708a994ad42046c791bf03ea0505d829bdb6a7  leptonica-1.87.0.tar.gz
 sha256  87829abb5bbb00b55a107365da89e9a33f86c4250169e5a1e5588505be7d5806  leptonica-license.txt
diff --git a/package/leptonica/leptonica.mk b/package/leptonica/leptonica.mk
index a957e05616..88467c1b14 100644
--- a/package/leptonica/leptonica.mk
+++ b/package/leptonica/leptonica.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LEPTONICA_VERSION = 1.86.0
+LEPTONICA_VERSION = 1.87.0
 LEPTONICA_SITE = https://github.com/DanBloomberg/leptonica/releases/download/$(LEPTONICA_VERSION)
 LEPTONICA_LICENSE = BSD-2-Clause
 LEPTONICA_LICENSE_FILES = leptonica-license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
