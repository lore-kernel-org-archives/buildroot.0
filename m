Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56772D3B990
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 13:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287C5403F6;
	Tue, 26 Nov 2024 13:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNYBzNVtr3hg; Tue, 26 Nov 2024 13:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E84AC4C7AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E84AC4C7AB;
	Tue, 26 Nov 2024 13:26:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 785BA4E94
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0642B6F4A3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lQes7CVKoEWZ for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0651D61B39
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0651D61B39
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 01EF486647; Tue, 26 Nov 2024 13:26:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 14:22:35 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: f35c5ad48ce8a0ecc730697654f6394992ddb3a0
X-Git-Newrev: 48e79150bac997a7f7dbfd90be16a9cbb46d6775
X-Patchwork-Hint: ignore
Message-Id: <20241126132639.01EF486647@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/tiff: security
 bump to version 4.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=48e79150bac997a7f7dbfd90be16a9cbb46d6775
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

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
(cherry picked from commit d571951c67d63824fcdf96cba8b59c80876a827a)
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
