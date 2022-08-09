Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAF6C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79CCF404A3;
	Tue,  9 Aug 2022 11:28:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79CCF404A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsBPrLQgTpbU; Tue,  9 Aug 2022 11:28:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 312CD4035D;
	Tue,  9 Aug 2022 11:28:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 312CD4035D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8C21BF9B4
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36E43819E6
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E43819E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s3Vht48V2dfa for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:28:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CD3E814BA
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CD3E814BA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D791386FD4; Tue,  9 Aug 2022 11:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Aug 2022 13:27:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61360da1051f30d232fd136fbb0edf4bba69e9ab
X-Git-Newrev: 1b677db703dc0b976a707942bbc94ecd3f7b4b4b
X-Patchwork-Hint: ignore
Message-Id: <20220809111348.D791386FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ocrad: bump to version 0.28
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b677db703dc0b976a707942bbc94ecd3f7b4b4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add libpng mandatory dependency

https://lists.gnu.org/archive/html/bug-ocrad/2022-01/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ocrad/Config.in  | 1 +
 package/ocrad/ocrad.hash | 2 +-
 package/ocrad/ocrad.mk   | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/ocrad/Config.in b/package/ocrad/Config.in
index 38d37c612a..b6c4300f86 100644
--- a/package/ocrad/Config.in
+++ b/package/ocrad/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OCRAD
 	bool "ocrad"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_LIBPNG
 	help
 	  GNU Ocrad is an OCR (Optical Character Recognition) program
 	  based on a feature extraction method.
diff --git a/package/ocrad/ocrad.hash b/package/ocrad/ocrad.hash
index b8db1723a3..cd5b0039ea 100644
--- a/package/ocrad/ocrad.hash
+++ b/package/ocrad/ocrad.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  a9bfe67e9a040907aff5640dca56392476b6a89e48e37dc94ba846c5b6733b36  ocrad-0.27.tar.lz
+sha256  34ccea576dbdadaa5979e6202344c3ff68737d829ca7b66f71c8497d36bbbf2e  ocrad-0.28.tar.lz
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index 914d53a59c..78638b770a 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-OCRAD_VERSION = 0.27
+OCRAD_VERSION = 0.28
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
 OCRAD_LICENSE = GPL-2.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
+OCRAD_DEPENDENCIES = libpng
 
 # This is not a true autotools package.
 define OCRAD_CONFIGURE_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
