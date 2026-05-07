Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BEFCD37AA
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 20:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FE5A61010;
	Thu,  7 May 2026 20:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf202fTbiJd8; Thu,  7 May 2026 20:27:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 39EE9610BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778185630;
	bh=W9L3evPXS+Fj2lyEEKLXpmj8At2xKs1Hb9gn43iMVNA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T65okhvZ31g2rvx7SgXnBTqgQUrl2/uUtyYIB8R135F9dIDcJEbDUHeAHkDCpnpD+
	 Yw0Jy5EfHN85MuhnoUSRsOOM/etWbQg2RplLmG+PnY/h+/1hoxkoh8zy0aud7MhPOj
	 HK7wFmQ7GcmnA+5uLN7wzoXVycXTJtRIT+Lk8HoB6yx/cs6MmosN75OGmNIozS9zbI
	 wLaQJUPCWIdDjLMdAo0b53PzO//65oq6phS6sRZaD2sbO0sV3znfBdeC7e8pbwCfH6
	 kGAsuIC5RZn/99RZYdZnUpoanuxxZ4JIrNl4NQwtyUdAvF826/ZQhAbcb59M5xqmQJ
	 qRBx06nUf2o2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39EE9610BD;
	Thu,  7 May 2026 20:27:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 826BA2FA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:27:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EEC183CC3
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:27:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmynzMkjyKBB for <buildroot@buildroot.org>;
 Thu,  7 May 2026 20:27:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD14983CB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD14983CB6
 for <buildroot@buildroot.org>; Thu,  7 May 2026 20:27:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC704851A5; Thu,  7 May 2026 20:27:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 May 2026 22:21:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 15fbc52884847dde589aa7a472cdddfe89d1ca06
X-Git-Newrev: 10790098312fc4f3b9a569867719831eb4de69cb
X-Patchwork-Hint: ignore
Message-Id: <20260507202705.DC704851A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openfpgaloader: bump to version
 1.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10790098312fc4f3b9a569867719831eb4de69cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes, see:
https://github.com/trabucayre/openFPGALoader/releases/tag/v1.1.1

Bump openFPGALoader to latest version.
Also adds a patch to fix cmake configuration when the libftdi
version contains rcX.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
[Julien:
 - reformat patch "Upstream:" tag to fix check-package error
 - add link to release notes in commit log
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...txt-uses-regex-to-remove-potential-rcX-in.patch | 32 ++++++++++++++++++++++
 package/openfpgaloader/openfpgaloader.hash         |  2 +-
 package/openfpgaloader/openfpgaloader.mk           |  4 ++-
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch b/package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch
new file mode 100644
index 0000000000..5a184a8e87
--- /dev/null
+++ b/package/openfpgaloader/0001-CMakeLists.txt-uses-regex-to-remove-potential-rcX-in.patch
@@ -0,0 +1,32 @@
+From ed6025645f506c8941ab245f142db701b9f9bf2a Mon Sep 17 00:00:00 2001
+From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Date: Wed, 6 May 2026 18:12:24 +0200
+Subject: [PATCH] CMakeLists.txt: uses regex to remove potential rcX in
+ LIBFTDI_VERSION_MINOR
+
+LIBFTDI_VERSION_XXX is used by FTDI_VERSION to adapts code according
+to libftdi version. But when rcX is present in LIBFTDI_VERSION_MINOR
+cmake fails with the math function.
+This PR adds a REGEX to only keep numeric value and drop rcX
+
+Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+Upstream: https://github.com/trabucayre/openFPGALoader/commit/ed6025645f506c8941ab245f142db701b9f9bf2a
+---
+ CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 442327f..2bf20e1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -200,6 +200,7 @@ if (USE_PKGCONFIG)
+ 			string(REPLACE "." ";" VERSION_LIST ${LIBFTDI_VERSION})
+ 			list(GET VERSION_LIST 0 LIBFTDI_VERSION_MAJOR)
+ 			list(GET VERSION_LIST 1 LIBFTDI_VERSION_MINOR)
++			string(REGEX REPLACE "[^0-9].*" "" LIBFTDI_VERSION_MINOR "${LIBFTDI_VERSION_MINOR}")
+ 		endif()
+ 	else()
+ 		set(LIBFTDI_LIBRARY_DIRS "")
+-- 
+2.53.0
+
diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index 33f798b7d4..b95402c10f 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cf19b596e5dea21891b1be3cb9a04be7a1501926ee0919dcc5c9f1b6d3bd0a96  openfpgaloader-1.0.0.tar.gz
+sha256  ca965f933c52a2a9dbb318df4d4de70fac5f095a8e64523f81036ab467a4b567  openfpgaloader-1.1.1.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 06c8b2face..ca2ef4b97b 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 1.0.0
+OPENFPGALOADER_VERSION = 1.1.1
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
 OPENFPGALOADER_DEPENDENCIES = libftdi1 zlib
 
+OPENFPGALOADER_CONF_OPTS = "-DCMAKE_DISABLE_FIND_PACKAGE_LibFTDI1=ON"
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 OPENFPGALOADER_DEPENDENCIES += udev
 OPENFPGALOADER_CONF_OPTS += -DENABLE_UDEV=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
