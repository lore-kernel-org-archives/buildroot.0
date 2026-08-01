Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A759AC55172
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDAEC40831;
	Sat,  1 Aug 2026 11:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U8SqN27tfL7Z; Sat,  1 Aug 2026 11:11:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCABB40818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785582684;
	bh=rmEQuCa45uU3hxl4iYmwaj0fST37beKeOn28gdmyIOQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sN+SgZQvjAIX1B+4JiCY80/z1zUPWGlQTfvbfqdjDIV/PaFRLJ5hoNj3c3i3aQpJz
	 kz2gUmcPxL+6Tz/ZdLpQYWQxUn2VZVClY/dIsG/Ti1RVJedKvHYSE0fWsVNA3E43b/
	 4QwWDf5Aboh2pyZ9f3QunecGrHChkKFvk28U45gzgfVXuXlA/PQdan906D88Gdo1/4
	 cNjfBtesedrvy0h7hqghiM/liIUdhye4On3A+2lB1GAMvj9OXL+h7xvdcixW2fCcYA
	 vGdKGwqfgbbXFEhVsGnW1HaXHPnmurKd2GsCLeETmq6LhMw8wZQQHWAeG3HJMsOyed
	 ouT2DqFet4NCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCABB40818;
	Sat,  1 Aug 2026 11:11:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8FCF138B
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D0D2607BC
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMivgRst0R_s for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDF036079D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF036079D
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BE6B86BDB; Sat,  1 Aug 2026 11:10:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 12:35:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd8161a374464431514a72c50c7b12a0d9577800
X-Git-Newrev: 3b5eadbf1f2c1657b16de8dc8099e83df08bb636
X-Patchwork-Hint: ignore
Message-Id: <20260801111037.4BE6B86BDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openblas: bump to version v0.3.34
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3b5eadbf1f2c1657b16de8dc8099e83df08bb636
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log since v0.3.33, see:
https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.34

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openblas/openblas.hash | 6 +++---
 package/openblas/openblas.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
index 37685185b8..e4b14cda50 100644
--- a/package/openblas/openblas.hash
+++ b/package/openblas/openblas.hash
@@ -1,5 +1,5 @@
-# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.33
-md5  96c5cd9013013faefc294bc57830c77d  openblas-0.3.33.tar.gz
-sha256  6761af1d9f5d353ab4f0b7497be2643313b36c8f31caec0144bfef198e71e6ab  openblas-0.3.33.tar.gz
+# From https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.34
+md5  ae9a0c2945f91b6f91747fd89a301d36  openblas-0.3.34.tar.gz
+sha256  cd7e129868320cc2d033afa920e31202dfe0b8066a5b66661900ccc0f197dfed  openblas-0.3.34.tar.gz
 # Locally calculated
 sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
index 9a3bb42496..64e3b00691 100644
--- a/package/openblas/openblas.mk
+++ b/package/openblas/openblas.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENBLAS_VERSION = 0.3.33
+OPENBLAS_VERSION = 0.3.34
 OPENBLAS_SITE = https://github.com/OpenMathLib/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
 OPENBLAS_LICENSE = BSD-3-Clause
 OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
