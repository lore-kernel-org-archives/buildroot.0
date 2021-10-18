Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABD3C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:01:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FB66108E
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61FB66108E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E96284051B;
	Mon, 18 Oct 2021 20:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w0NP_bDodohr; Mon, 18 Oct 2021 20:01:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B4C40644;
	Mon, 18 Oct 2021 20:01:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 422051BF97A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 321D860654
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgIeWZVDMKxX for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:00:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D2E7605FB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:00:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CB065878E1; Mon, 18 Oct 2021 19:57:46 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 22:00:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa66ccfabc51592e788d1dd0fbe1fff5c11d993b
X-Git-Newrev: e37e93c7d56da76f722b43a075ccf2b0bb54dba7
X-Patchwork-Hint: ignore
Message-Id: <20211018195746.CB065878E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpam-nfc: bump to
 64a8b30ba2cfd634342ded8c096c7cfc5c8fa22a
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

commit: https://git.buildroot.net/buildroot/commit/?id=e37e93c7d56da76f722b43a075ccf2b0bb54dba7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure raised since bump of
automake to version 1.16.4 in commit
fe90272b5128987ee7492fff950660e05324838d thanks to
https://github.com/nfc-tools/pam_nfc/commit/1b3d33c23f77c6f2a244f04f00f9140f8fa28155:

make[1]: Entering directory '/home/giuliobenetti/autobuild/run/instance-2/output-1/build/libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437'
  CC       pam-nfc-add.o
  CCLD     pam-nfc-add
/home/giuliobenetti/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/9.3.0/../../../../i686-buildroot-linux-uclibc/bin/ld: cannot find -lnfcauth

Fixes:
 - http://autobuild.buildroot.org/results/4f6018cb44770ea8fb9a9eb24c161239c2d04c27

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libpam-nfc/libpam-nfc.hash | 2 +-
 package/libpam-nfc/libpam-nfc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpam-nfc/libpam-nfc.hash b/package/libpam-nfc/libpam-nfc.hash
index 27896ef4b1..543db86960 100644
--- a/package/libpam-nfc/libpam-nfc.hash
+++ b/package/libpam-nfc/libpam-nfc.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  f44273944f1ecc78b10b65147328860836b60fe4bb8c39819e32199f2870d48b  libpam-nfc-bb762e0e649195110e015ffb605c4375e927c437.tar.gz
+sha256  042049cecaacd9274f444d69f756b9499eb2d2436136f576eef375531ac25157  libpam-nfc-64a8b30ba2cfd634342ded8c096c7cfc5c8fa22a.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libpam-nfc/libpam-nfc.mk b/package/libpam-nfc/libpam-nfc.mk
index d4f6d446cf..7cf0a51e00 100644
--- a/package/libpam-nfc/libpam-nfc.mk
+++ b/package/libpam-nfc/libpam-nfc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPAM_NFC_VERSION = bb762e0e649195110e015ffb605c4375e927c437
+LIBPAM_NFC_VERSION = 64a8b30ba2cfd634342ded8c096c7cfc5c8fa22a
 LIBPAM_NFC_SITE = $(call github,nfc-tools,pam_nfc,$(LIBPAM_NFC_VERSION))
 LIBPAM_NFC_LICENSE = GPL-2.0
 LIBPAM_NFC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
