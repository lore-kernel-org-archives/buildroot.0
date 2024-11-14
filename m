Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAC4C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE2F42D24;
	Fri, 28 Feb 2025 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LenR1gWXNcCD; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B45542D1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B45542D1C;
	Fri, 28 Feb 2025 16:30:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C741DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 000CE4198B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7BjlqYys6sr0 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DA6F417FC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DA6F417FC
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 480B387A71; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Nov 2024 19:52:43 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ed4348d1c5657aae1b3f167471470f2eef82e7fa
X-Git-Newrev: d571951c67d63824fcdf96cba8b59c80876a827a
X-Patchwork-Hint: ignore
Message-Id: <20250228162929.480B387A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/tiff: security bump to
 version 4.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d571951c67d63824fcdf96cba8b59c80876a827a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

For the release note, see:
http://www.simplesystems.org/libtiff/releases/v4.7.0.html

This commit also adds the _SOURCE variable, to switch to the xz
archive, which saves ~1.5MB. The _SITE url is also updated to switch
to the https protocol.

This commit also adds a comment in the hash file about pgp signature
veritication.

Fixes:
- https://nvd.nist.gov/vuln/detail/CVE-2023-6277
- https://nvd.nist.gov/vuln/detail/CVE-2023-52356
- https://nvd.nist.gov/vuln/detail/CVE-2024-7006

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tiff/tiff.hash | 6 ++++--
 package/tiff/tiff.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 3aae7dc4d5..5e2dcca73c 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a  tiff-4.6.0.tar.gz
+# Locally computed after checking pgp signature
+# https://download.osgeo.org/libtiff/tiff-4.7.0.tar.xz.sig
+# with key: B1FA7D81EEB8E66399178B9733EBBFC47B3DD87D
+sha256  273a0a73b1f0bed640afee4a5df0337357ced5b53d3d5d1c405b936501f71017  tiff-4.7.0.tar.xz
 sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 0e5e0dd48a..5d7219d7da 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.6.0
-TIFF_SITE = http://download.osgeo.org/libtiff
+TIFF_VERSION = 4.7.0
+TIFF_SOURCE = tiff-$(TIFF_VERSION).tar.xz
+TIFF_SITE = https://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = LICENSE.md
 TIFF_CPE_ID_VENDOR = libtiff
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
