Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223DEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2C2F4035D;
	Sun,  6 Feb 2022 10:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y581dvNFUucg; Sun,  6 Feb 2022 10:24:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E70CC403A8;
	Sun,  6 Feb 2022 10:24:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82ACF1BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716CE81295
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:24:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hFRvwhJedsme for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:24:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF49181286
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9A5648267F; Sun,  6 Feb 2022 10:16:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:24:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 550ab032881e1aacde344c575f1fce586d9ce243
X-Git-Newrev: 3d24fb7e7b013e6cbbac91abe7c45ca9ed788756
X-Patchwork-Hint: ignore
Message-Id: <20220206101652.9A5648267F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netcat-openbsd: bump to version
 1.218
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d24fb7e7b013e6cbbac91abe7c45ca9ed788756
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball so NETCAT_OPENBSD_VERSION will match what is
  returned by https://release-monitoring.org
- Use netcat.c as the license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netcat-openbsd/netcat-openbsd.hash | 9 ++++++---
 package/netcat-openbsd/netcat-openbsd.mk   | 9 +++++----
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/package/netcat-openbsd/netcat-openbsd.hash b/package/netcat-openbsd/netcat-openbsd.hash
index b70cae8860..e55dea53e7 100644
--- a/package/netcat-openbsd/netcat-openbsd.hash
+++ b/package/netcat-openbsd/netcat-openbsd.hash
@@ -1,3 +1,6 @@
-# Locally calculated
-sha256  55e578f652cbf6ffc95f75ea3e2645ab335fab63649568bd7cdb0a6331ca87de  netcat-openbsd-debian_1.195-2-br1.tar.gz
-sha256  e2e86d58c38f044a49f51e45515747585db58a2305419c73323eaad88fcaef5c  debian/copyright
+# From http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd/netcat-openbsd_1.218-3.dsc
+sha256  a28a5d39abaf481747b1e78b4b50e96d0cdab0ffef289cba156dc11941c64857  netcat-openbsd_1.218.orig.tar.gz
+sha256  19229ebc825d12cd805843228c498cc881dcef127a9d680fcfbd8cb2da966161  netcat-openbsd_1.218-3.debian.tar.xz
+
+# Hash for license file
+sha256  acfd1d822ee2e8e0b196c7a369383d0cb9bc131b56c3c95976a32498728fe1e3  netcat.c
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index a2333531c0..311f8aa819 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-NETCAT_OPENBSD_VERSION = debian/1.195-2
-NETCAT_OPENBSD_SITE = https://salsa.debian.org/debian/netcat-openbsd.git
-NETCAT_OPENBSD_SITE_METHOD = git
+NETCAT_OPENBSD_VERSION = 1.218
+NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
+NETCAT_OPENBSD_PATCH = netcat-openbsd_$(NETCAT_OPENBSD_VERSION)-3.debian.tar.xz
+NETCAT_OPENBSD_SITE = http://snapshot.debian.org/archive/debian/20211206T030211Z/pool/main/n/netcat-openbsd
 NETCAT_OPENBSD_LICENSE = BSD-3-Clause
-NETCAT_OPENBSD_LICENSE_FILES = debian/copyright
+NETCAT_OPENBSD_LICENSE_FILES = netcat.c
 NETCAT_OPENBSD_DEPENDENCIES = host-pkgconf libbsd
 
 define NETCAT_OPENBSD_APPLY_DEBIAN_PATCHES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
