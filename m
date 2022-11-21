Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B774C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B838260F67;
	Mon, 21 Nov 2022 21:20:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B838260F67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKbwp2ktk47G; Mon, 21 Nov 2022 21:20:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E268D60F58;
	Mon, 21 Nov 2022 21:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E268D60F58
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E231BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C537402F5
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:20:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C537402F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jlkbaln-rAPu for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:20:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DC2840179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2DC2840179
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1915684095; Mon, 21 Nov 2022 21:20:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Nov 2022 22:20:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5852fee868c318f0864bed3238b46348156422b6
X-Git-Newrev: ea3e1696776187b55bbcaa49072cda49a43c32f5
X-Patchwork-Hint: ignore
Message-Id: <20221121212053.1915684095@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: bump to latest Git
 commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=ea3e1696776187b55bbcaa49072cda49a43c32f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current version 1.5.2 dates back from 2013, so it is extremely
old. The latest master branch of igh-ethercat contains numerous fixes,
including fixes to ensure that it builds with recent Linux kernel
releases. Backporting the individual patches fixing those issues on a
9 year old release would be too much effort, so we propose to simply
bump the version to the latest available in the Git master branch.

Fixes:

  http://autobuild.buildroot.net/results/4dc9b71c805a8156bcf8f398edd3a30f2b6ac6da/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/igh-ethercat/igh-ethercat.hash |  3 +--
 package/igh-ethercat/igh-ethercat.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index c77627ee56..88548bf23e 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,5 +1,4 @@
-# From http://etherlab.org/download/ethercat/ethercat-1.5.2.tar.bz2.md5
-md5  6b4001f8d975865d74a0b108b3bdda3d  ethercat-1.5.2.tar.bz2
 # Locally computed
+sha256  eb13a0f7f073ad54589c4f41829d9e995b37b26fbc7fcd05e3adb5e201e6feb4  igh-ethercat-2e2cef6131895336f87c57c18fe78ae01a90d3de.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 9fcfb4f6f2..1041ba0758 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.5.2
-IGH_ETHERCAT_SITE = http://etherlab.org/download/ethercat
-IGH_ETHERCAT_SOURCE = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
+IGH_ETHERCAT_VERSION = 2e2cef6131895336f87c57c18fe78ae01a90d3de
+IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
+# Fetching from Git
+IGH_ETHERCAT_AUTORECONF = YES
 
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
@@ -21,5 +22,11 @@ IGH_ETHERCAT_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
 
+# Needed to make autoreconf happy
+define IGH_ETHERCAT_CREATE_CHANGELOG
+	touch $(@D)/ChangeLog
+endef
+IGH_ETHERCAT_POST_PATCH_HOOKS += IGH_ETHERCAT_CREATE_CHANGELOG
+
 $(eval $(kernel-module))
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
