Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E01C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059BA6FC7A;
	Fri, 28 Feb 2025 17:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w5WF1utpq10I; Fri, 28 Feb 2025 17:22:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06E2B6FCD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E2B6FCD9;
	Fri, 28 Feb 2025 17:22:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 21CF268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FBFB41A30
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg0QAvTw4XtF for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A12342564
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A12342564
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 627A08017D; Fri, 28 Feb 2025 16:30:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 13:53:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f8fb0b5942421af6f64d061e6384590b7149f400
X-Git-Newrev: 1e8955e12c10e68d9eb119ebae99692dd2432fa0
X-Patchwork-Hint: ignore
Message-Id: <20250228163047.627A08017D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/jbig2dec: bump to
 version 0.20
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1968728035180731073=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1968728035180731073==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1e8955e12c10e68d9eb119ebae99692dd2432fa0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Starting from this version newer releases are only available at a new
dedicated repository, so the site is updated accordingly.

Hash files no longer exist in the new repo, so remove the related
comment.

It turns out that install-sh has been available in the tarball since
version 0.19, so remove JBIG2DEC_AUTORECONF.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jbig2dec/jbig2dec.hash | 4 +---
 package/jbig2dec/jbig2dec.mk   | 6 ++----
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/jbig2dec/jbig2dec.hash b/package/jbig2dec/jbig2dec.hash
index 5a34af37f6..a93e8d8a6d 100644
--- a/package/jbig2dec/jbig2dec.hash
+++ b/package/jbig2dec/jbig2dec.hash
@@ -1,7 +1,5 @@
-# https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530/MD5SUMS
-# and SHA512SUMS are missing the hashes for this file.
 # Locally computed:
-sha256  279476695b38f04939aa59d041be56f6bade3422003a406a85e9792c27118a37  jbig2dec-0.19.tar.gz
+sha256  7b63ff6470289547e7a3a0f145cb8ea6c2afffdd65645b7d87d3b7febc96fb3a  jbig2dec-0.20.tar.gz
 
 # Hash for license files:
 sha256  1bf5258afe453934484fd0cea97508b72301633a6a78b0ae8a9ee44ac78f26d9  LICENSE
diff --git a/package/jbig2dec/jbig2dec.mk b/package/jbig2dec/jbig2dec.mk
index 8d881136ad..8509a609c4 100644
--- a/package/jbig2dec/jbig2dec.mk
+++ b/package/jbig2dec/jbig2dec.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-JBIG2DEC_VERSION = 0.19
+JBIG2DEC_VERSION = 0.20
 JBIG2DEC_SITE = \
-	https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs9530
+	https://github.com/ArtifexSoftware/jbig2dec/releases/download/$(JBIG2DEC_VERSION)
 JBIG2DEC_LICENSE = AGPL-3.0+
 JBIG2DEC_LICENSE_FILES = LICENSE
 JBIG2DEC_CPE_ID_VENDOR = artifex
 JBIG2DEC_INSTALL_STAGING = YES
-# tarball is missing install-sh, install.sh, or shtool
-JBIG2DEC_AUTORECONF = YES
 
 $(eval $(autotools-package))

--===============1968728035180731073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1968728035180731073==--
