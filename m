Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A58FCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CB9C41F75;
	Fri, 29 May 2026 08:25:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SjDZqOWYcmw6; Fri, 29 May 2026 08:25:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4807A41F7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043142;
	bh=LZ4JvmhoOoONBhbc4zAMWt+CS/5Cdw/3gGPya4VD67o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tp3Ydun9xorhc2IGyOTDpetlJcNZHl/dG3JOomnbR1jTdra/IXgVDKpUmsnDw4+bn
	 Dzy4nPF5PcyzpsouBkeOLgwvyUOcuxNCE1RqVbt56Q8eL5QUnusm8AjQnlJSFG8KGG
	 Ch9zNGs69VJoJ1MH7/kvbAfWhH166ZzfaSN3gGZvh+A9mCRh0VmNl8FGRUVkzAfukt
	 zKgCAn0QcXeU57WkmRj9EwGKmorAlz73jKjPIw+rFoWYvtM3eukO5DRgCG82zvr/y7
	 AiBq9YzutmVkGxBo2Oox+AahLevrGbS0JxmalIfmRn16ZNFQ5XDTlt2r046wl5S4IO
	 nTMR2I1XLhZBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4807A41F7B;
	Fri, 29 May 2026 08:25:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1086F28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A90F41F66
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WwhltU-QXNAM for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52EAF41F79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52EAF41F79
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6EB887171; Fri, 29 May 2026 08:25:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:42:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 71726bf7ccb15b25b3177d75298472ca17693f9b
X-Git-Newrev: 6fa2e5339a38246dd0366c5140ca1a27ddb2dfc2
X-Patchwork-Hint: ignore
Message-Id: <20260529082506.E6EB887171@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libheif: needs
 gcc >= 10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fa2e5339a38246dd0366c5140ca1a27ddb2dfc2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes build error with gcc 9.x:

output/build/libheif-1.21.1/libheif/nclx.h:128:50: error:
 'bool nclx_profile::operator==(const nclx_profile&)
 const' cannot be defaulted

 using this defconfig:

  BR2_arm=y
  BR2_TOOLCHAIN_EXTERNAL=y
  BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
  BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
  BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2020.11.2.tar.bz2"
  BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
  BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_4=y
  BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
  # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
  BR2_TOOLCHAIN_EXTERNAL_CXX=y
  BR2_STATIC_LIBS=y
  BR2_PACKAGE_LIBHEIF=y

According to https://github.com/strukturag/libheif/issues/1615#issuecomment-3457979167
gcc >= 10 with support for C++20 is needed for the package.

The failing code was introduced upstream in version 0.21.0 with commit
https://github.com/strukturag/libheif/commit/a62f933e380e165dc2c12a879d0ceed1529b3efa
which was added to buildroot with commit
a8aed698c706ec534ddc41cdce651c18016c28ca.

Also removed -std=c++11 from CXXFLAGS.

The build error was not yet recorded by the autobuilders.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 7323bcc1d476e965d31fd3db4046bacf6f7c0e75)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/kodi-imagedecoder-heif/Config.in | 6 +++---
 package/libheif/Config.in                | 6 +++---
 package/libheif/libheif.mk               | 1 -
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
index f41b164ff4..d77f10ee98 100644
--- a/package/kodi-imagedecoder-heif/Config.in
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265, libheif
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # libheif
 	select BR2_PACKAGE_LIBDE265
 	select BR2_PACKAGE_LIBHEIF
 	select BR2_PACKAGE_TINYXML2
@@ -12,7 +12,7 @@ config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 
 	  https://github.com/xbmc/imagedecoder.heif
 
-comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "kodi-imagedecoder-heif needs a toolchain w/ C++, threads, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
index 0ae86a07f4..9e88fb826d 100644
--- a/package/libheif/Config.in
+++ b/package/libheif/Config.in
@@ -2,14 +2,14 @@ config BR2_PACKAGE_LIBHEIF
 	bool "libheif"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libheif is an HEIF and AVIF file format decoder and encoder.
 
 	  https://github.com/strukturag/libheif
 
-comment "libheif needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "libheif needs a toolchain w/ C++, threads, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index acd302d847..c4196f9353 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -11,7 +11,6 @@ LIBHEIF_LICENSE_FILES = COPYING
 LIBHEIF_CPE_ID_VENDOR = struktur
 LIBHEIF_INSTALL_STAGING = YES
 LIBHEIF_CONF_OPTS = \
-	-DCMAKE_CXX_FLAGS="-std=c++11" \
 	-DENABLE_PLUGIN_LOADING=OFF \
 	-DWITH_AOM_DECODER=OFF \
 	-DWITH_AOM_ENCODER=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
