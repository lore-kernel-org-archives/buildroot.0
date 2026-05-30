Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF1BCD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 855BC85013;
	Sat, 30 May 2026 09:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yafxqL8M49iE; Sat, 30 May 2026 09:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C2985005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780134025;
	bh=NYPENYSapOIkGj8HwAc64+yj6xCm2aDqef1QrBY8+vc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cxtHw8b/iD4krClvIkerRoGDQ2mqEnVWmbBleGgTZpYG84BOi3yg++Aj6t6w7KhhR
	 9/L5LFPR8+dTNllpNbeYDacHQKAz+6Z8ahaJHQoj8Y4mqU4W9loNWmACz5V5jiksfi
	 jxO4RIsmUuirVQVQwrNG4SQS6QZjeNR0pG53B7mWVZScudwAexVidcLmAsHaANSOlE
	 i1ekpNDz9WNuH2h+jxEkPQkxTVxRziLK/u/m1P0H8DMgR3imYf/HZWvxCTI6uBifTk
	 A2e+IGcZwNzW4q8wMSPzyX37iO+wBRkJVWcLr2hdgkh0bRnwGkavBrFuKpkaJtW2VT
	 YV+YSaIIs9uyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C2985005;
	Sat, 30 May 2026 09:40:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84396D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72B9A42B98
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ce8HPId8LgEA for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9705A42B90
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9705A42B90
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:40:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A808E86E6F; Sat, 30 May 2026 09:40:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:40:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82f1e6f50e95796e474edbd9ba8698ab7f0d47cf
X-Git-Newrev: 60a04a145aa176609bc0fde9e743ea8b5d93a054
X-Patchwork-Hint: ignore
Message-Id: <20260530094009.A808E86E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.33
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/60a04a145aa176609bc0fde9e743ea8b5d93a054
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v0.3.32, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33

This commit reuses the sha256 hash published upstream.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index a1e1cfc851..37685185b8 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32
-md5  021eb76c3fc66290b6ce14fa4c1ff3de  openblas-0.3.32.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33
+md5  96c5cd9013013faefc294bc57830c77d  openblas-0.3.33.tar.gz
+sha256  6761af1d9f5d353ab4f0b7497be2643313b36c8f31caec0144bfef198e71e6ab  openblas-0.3.33.tar.gz
 # Locally calculated
-sha256  f8a1138e01fddca9e4c29f9684fd570ba39dedc9ca76055e1425d5d4b1a4a766  openblas-0.3.32.tar.gz
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index e8836a9d27..9a3bb42496 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.32
+OPENBLAS_VERSION = 0.3.33
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
