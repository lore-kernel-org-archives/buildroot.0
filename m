Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A63C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97C70408E5;
	Mon,  6 Dec 2021 18:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9Vuz-wZ1WXI; Mon,  6 Dec 2021 18:21:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0949541C03;
	Mon,  6 Dec 2021 18:21:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 586421BF989
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB902829EE
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xnY7f-FJ9JXp for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CE1684B8A
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B39F981504; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:05:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 626c7c7912bf0f5bf4fd96a31afb6cc767dfd045
X-Git-Newrev: c63fe7955482ab418a37b8e9d2c22108880adcd2
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.B39F981504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openfpgaloader: bump to version
 0.6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c63fe7955482ab418a37b8e9d2c22108880adcd2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update version to latest release
- change license type and hash
- add zlib dependency

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openfpgaloader/Config.in           | 1 +
 package/openfpgaloader/openfpgaloader.hash | 4 ++--
 package/openfpgaloader/openfpgaloader.mk   | 8 ++++----
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/openfpgaloader/Config.in b/package/openfpgaloader/Config.in
index f1b34ef5dd..c998369bed 100644
--- a/package/openfpgaloader/Config.in
+++ b/package/openfpgaloader/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENFPGALOADER
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libftdi1 -> libusb
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBFTDI1
+	select BR2_PACKAGE_ZLIB
 	help
 	  Universal utility for programming FPGA
 
diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index 990149cded..6c9d8a2b91 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ef3ed60297ab560f15cd4362d61b7da86c44b84e18937e0411023f8d1cf6a606  openfpgaloader-381c67de00a3102cf6e9bb20ca84030a71c7a0f2.tar.gz
-sha256  8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef  LICENSE
+sha256  a862a209d696becff915a77512e6a8c22f92d73480a45cc12273d9ad1db60d23  openfpgaloader-0.6.1.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 1bb3de37fb..73117cb994 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 381c67de00a3102cf6e9bb20ca84030a71c7a0f2
-OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,$(OPENFPGALOADER_VERSION))
-OPENFPGALOADER_LICENSE = AGPL-3.0
+OPENFPGALOADER_VERSION = 0.6.1
+OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
+OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
-OPENFPGALOADER_DEPENDENCIES = libftdi1
+OPENFPGALOADER_DEPENDENCIES = libftdi1 zlib
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 OPENFPGALOADER_DEPENDENCIES += udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
