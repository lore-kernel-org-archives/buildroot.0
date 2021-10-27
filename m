Return-Path: <SRS0=x9kH=PP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B14C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:31:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FED610A0
	for <buildroot@archiver.kernel.org>; Wed, 27 Oct 2021 20:31:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2FED610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE3C081D7C;
	Wed, 27 Oct 2021 20:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GwpEqJoKHe7; Wed, 27 Oct 2021 20:31:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4033D81D70;
	Wed, 27 Oct 2021 20:31:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 334FB1BF9C2
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0689F40283
 for <buildroot@lists.busybox.net>; Wed, 27 Oct 2021 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A7aymlljbbfP for <buildroot@lists.busybox.net>;
 Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4411740272
 for <buildroot@buildroot.org>; Wed, 27 Oct 2021 20:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E62C389043; Wed, 27 Oct 2021 20:27:03 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Oct 2021 22:28:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0a9edb64cafeebfb20dfacbf0fd7ec88feb861c
X-Git-Newrev: 63b3a3c6d7bf43a4f1c7adb5541c07298b419b02
X-Patchwork-Hint: ignore
Message-Id: <20211027202703.E62C389043@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: bump to version 249.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=63b3a3c6d7bf43a4f1c7adb5541c07298b419b02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove efi-ldsdir meson config option which is no longer used.

Meson config variable systemd-analyze is renamed to analyze.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index baab5304e6..a83ff7d989 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  f3df809bbe777fcb5ffe2b29aaf6f871de764ef22706940960f88b8a850e9278  systemd-249.4.tar.gz
+sha256  773ee546ad6df0921ea6f9e12294eb102bf68c1ac9eb3dcaca1764f8306d6e13  systemd-249.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index c403896759..8c187d2ec3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 249.4
+SYSTEMD_VERSION = 249.5
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
 SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
@@ -507,7 +507,6 @@ SYSTEMD_CONF_OPTS += \
 	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=$(TARGET_LD) \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
-	-Defi-ldsdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
 
 SYSTEMD_BOOT_EFI_ARCH = $(call qstrip,$(BR2_PACKAGE_SYSTEMD_BOOT_EFI_ARCH))
@@ -728,7 +727,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dinitrd=false \
 	-Dxdg-autostart=false \
 	-Dkernel-install=false \
-	-Dsystemd-analyze=false \
+	-Danalyze=false \
 	-Dlibcryptsetup=false \
 	-Daudit=false \
 	-Dzstd=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
