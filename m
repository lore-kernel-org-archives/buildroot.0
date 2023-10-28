Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3F8C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EAE142F15;
	Sat, 28 Oct 2023 21:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EAE142F15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PEB1yjwZndZh; Sat, 28 Oct 2023 21:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 419A242EFD;
	Sat, 28 Oct 2023 21:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 419A242EFD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 87C111BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C8C442860
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C8C442860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlrvW985-E6v for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A35EF42851
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A35EF42851
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 917058607B; Sat, 28 Oct 2023 21:03:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 22:49:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c70374c4f0f9f77875eac26a5e51ab662575c1c
X-Git-Newrev: e96b1c4b0b06d65c54a764fe4a59d886afc70df5
X-Patchwork-Hint: ignore
Message-Id: <20231028210321.917058607B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tiff: security bump to version
 4.6.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=e96b1c4b0b06d65c54a764fe4a59d886afc70df5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop --without-x (now unrecognized)
- Fix CVE-2023-40745: LibTIFF is vulnerable to an integer overflow. This
  flaw allows remote attackers to cause a denial of service (application
  crash) or possibly execute an arbitrary code via a crafted tiff image,
  which triggers a heap-based buffer overflow.
- Fix CVE-2023-41175: A vulnerability was found in libtiff due to
  multiple potential integer overflows in raw2tiff.c. This flaw allows
  remote attackers to cause a denial of service or possibly execute an
  arbitrary code via a crafted tiff image, which triggers a heap-based
  buffer overflow.

https://libtiff.gitlab.io/libtiff/releases/v4.6.0.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/tiff/tiff.hash | 2 +-
 package/tiff/tiff.mk   | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/tiff/tiff.hash b/package/tiff/tiff.hash
index 0fa503a02a..3aae7dc4d5 100644
--- a/package/tiff/tiff.hash
+++ b/package/tiff/tiff.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d7f38b6788e4a8f5da7940c5ac9424f494d8a79eba53d555f4a507167dca5e2b  tiff-4.5.1.tar.gz
+sha256  88b3979e6d5c7e32b50d7ec72fb15af724f6ab2cbf7e10880c360a77e4b5d99a  tiff-4.6.0.tar.gz
 sha256  0780558a8bfba0af1160ec1ff11ade4f41c0d7deafd6ecfc796b492a788e380d  LICENSE.md
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 0006f461a0..e384e8b814 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIFF_VERSION = 4.5.1
+TIFF_VERSION = 4.6.0
 TIFF_SITE = http://download.osgeo.org/libtiff
 TIFF_LICENSE = tiff license
 TIFF_LICENSE_FILES = LICENSE.md
@@ -17,14 +17,12 @@ TIFF_INSTALL_STAGING = YES
 TIFF_CONF_OPTS = \
 	--disable-contrib \
 	--disable-tests \
-	--disable-webp \
-	--without-x
+	--disable-webp
 
 TIFF_DEPENDENCIES = host-pkgconf
 
 HOST_TIFF_CONF_OPTS = \
 	--disable-cxx \
-	--without-x \
 	--disable-zlib \
 	--disable-libdeflate \
 	--disable-lzma \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
