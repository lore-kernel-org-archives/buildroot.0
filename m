Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50160C531F9
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 09:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E00B6065F;
	Sat, 25 Jul 2026 09:45:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaHauNkHUolP; Sat, 25 Jul 2026 09:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8546066F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784972753;
	bh=2guzo4yGoenKlMZFlC+la0WbQuzjXznSocqKGdM92Ug=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Az+Hsua0nad+dEsu8L7+B8T5A3s5obKd9muueow+4nMyGGJDnA0ELja0vhzIS+kff
	 YuY/O5Xgt+tEpjoUq96rUnbhF9Xk0Gjz0C2kYCyZ+VQJfEuoOVjOW+wlxRFaX3zs+5
	 Zn1YKfiMt6DDwVg/hiKgoS+4cLH5gtiqx1snF9p7Esvvm9gtQdePTkU1Q0/yyjNqNi
	 LLOBFv1eNX8qBPNq5MX2yZdIeBKY/ZVHBwy6PLqzg348KZ2HcGjnfVwQ4+2EJeFtk9
	 2RDNC01CzF+ewt+Su9q+H5u45mCVMyVWnXo+B3G8Ve8ndvY04j+eTPf9YCq9JYYmwD
	 NE1a3amnGLUQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D8546066F;
	Sat, 25 Jul 2026 09:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B615026C
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BDF24005E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y1bDEd42nGKj for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 09:45:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1AE4400A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A1AE4400A4
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 09:45:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6EAAA8A450; Sat, 25 Jul 2026 09:45:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:36:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6ca8d4f5f27232f439bb3e68ace6f7baf20d5cd
X-Git-Newrev: bcb48623faecb73e7b14469b31f4cec73c979cb9
X-Patchwork-Hint: ignore
Message-Id: <20260725094510.6EAAA8A450@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: security bump version to
 1.23.1
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
Content-Type: multipart/mixed; boundary="===============5857491994251957895=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5857491994251957895==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bcb48623faecb73e7b14469b31f4cec73c979cb9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============5857491994251957895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5857491994251957895==--
