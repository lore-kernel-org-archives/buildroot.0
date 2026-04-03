Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4E8E8538B
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5726180D50;
	Fri,  3 Apr 2026 17:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeNauSiZgLIA; Fri,  3 Apr 2026 17:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A092827AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775238679;
	bh=KVrP0u/0af809aZprglEOqS2z5DgbSAnm4MPcMmAfAE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m2iu+DOwqCQxFERP0w/sjw5wXV7Az5BFY8r7DEEJHHi4htVjP3JIRBLiIUlkgFlXY
	 GG46LK0g0WDb60dEuvQACdkjnN2NBzCL/TbrXfTKMvaYjsX9mgiBNAJdMYJNEmBkRD
	 qA7rfRTW2SRpnHHQk7cwTX6ya7KjSeuBM8GJuMTMXc7HyXvfaFRib7S8fj5nmZyn+2
	 gONzk1qrc+KajMQr8UcAuprfBMUnNo01simqL0r0zBDk+kACKiaURneysTmQdXaPR7
	 3TDuylzlP6mvX8SUZEpdqDQRZgquGY5tBrE6AUVZTgbNdYohbwWBJSvaQX5mBu1kZ4
	 tPKtjbpHMovwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A092827AA;
	Fri,  3 Apr 2026 17:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E8981AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FE9840226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 06m90d8goSC3 for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA96A40202
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA96A40202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:51:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54795801B2; Fri,  3 Apr 2026 17:51:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:48:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2bd0c9b25910c1f9cca1ada593be10642d8375a
X-Git-Newrev: d6a06ef2af694809f311538a807e2c000e1c5fdb
X-Patchwork-Hint: ignore
Message-Id: <20260403175116.54795801B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bmap-writer: bump to version 1.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6a06ef2af694809f311538a807e2c000e1c5fdb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since 1.0.2, see:
https://github.com/embetrix/bmap-writer/releases/tag/1.0.4
https://github.com/embetrix/bmap-writer/releases/tag/1.0.3

This version includes upstream fixes for static linking issues
related to libarchive. In previous versions, CMake's
FindLibArchive module did not propagate private dependencies,
leading to link-time errors (e.g. missing zlib, bzip2, lz4,
liblzma, zstd) in static build environments such as Buildroot.

The upstream build system has been updated to correctly handle
these dependencies, allowing us to drop the downstream patch.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
[Julien: add links to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bmap-writer/bmap-writer.hash | 2 +-
 package/bmap-writer/bmap-writer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bmap-writer/bmap-writer.hash b/package/bmap-writer/bmap-writer.hash
index 0b0e8de46a..e2936525e8 100644
--- a/package/bmap-writer/bmap-writer.hash
+++ b/package/bmap-writer/bmap-writer.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a86ade2c70304574f200c048bd8a728ed27b04b7ece62cf0f696366e37fed6e7  bmap-writer-1.0.2.tar.gz
+sha256  121832c4ab44d30828489a6620c21d0fcc05904bb85cde71e82ea383acc12d1d  bmap-writer-1.0.4.tar.gz
 sha256  8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b  LICENSE
diff --git a/package/bmap-writer/bmap-writer.mk b/package/bmap-writer/bmap-writer.mk
index 19ccd3afbc..e6d85f2279 100644
--- a/package/bmap-writer/bmap-writer.mk
+++ b/package/bmap-writer/bmap-writer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BMAP_WRITER_VERSION = 1.0.2
+BMAP_WRITER_VERSION = 1.0.4
 BMAP_WRITER_SITE = $(call github,embetrix,bmap-writer,$(BMAP_WRITER_VERSION))
 BMAP_WRITER_LICENSE = GPL-3.0
 BMAP_WRITER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
