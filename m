Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75710C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248B4818CA;
	Mon, 20 Feb 2023 23:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 248B4818CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C25TfSAcCvwP; Mon, 20 Feb 2023 23:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 484538200E;
	Mon, 20 Feb 2023 23:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 484538200E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A5F41BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3AA96129A
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3AA96129A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zJ7_LS8zkzpD for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13599611DC
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13599611DC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 116D18648F; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 11:32:08 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c2baa583c350b9d594e87f9cab1db597789904df
X-Git-Newrev: 1975c531764828fbdaff673e4cf1f25ea009aa2c
X-Patchwork-Hint: ignore
Message-Id: <20230220205211.116D18648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/arp-scan: bump to
 version 1.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1975c531764828fbdaff673e4cf1f25ea009aa2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Use official tarball and so drop autoreconf
- libcap is an optional dependency since
  https://github.com/royhills/arp-scan/commit/923f123a281139f1ec3daceb1db4bc7317ec6978

https://github.com/royhills/arp-scan/releases/tag/1.10.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/arp-scan/arp-scan.hash |  2 +-
 package/arp-scan/arp-scan.mk   | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/arp-scan/arp-scan.hash b/package/arp-scan/arp-scan.hash
index b18c6ceb38..3a2977f906 100644
--- a/package/arp-scan/arp-scan.hash
+++ b/package/arp-scan/arp-scan.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b9b75ceaef6348f5951b06c773ec7a243a9e780e160eafebc369f9c27f6a7d3f  arp-scan-1.9.8.tar.gz
+sha256  a078fe8711ecbb8b99121c3d8be26ae7e7f339f11010ef61318be4f33394d012  arp-scan-1.10.0.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 73d1b99bc7..89644be9d3 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-ARP_SCAN_VERSION = 1.9.8
-ARP_SCAN_SITE = $(call github,royhills,arp-scan,$(ARP_SCAN_VERSION))
+ARP_SCAN_VERSION = 1.10.0
+ARP_SCAN_SITE = https://github.com/royhills/arp-scan/releases/download/$(ARP_SCAN_VERSION)
 ARP_SCAN_LICENSE = GPL-3.0+
 ARP_SCAN_LICENSE_FILES = COPYING
 ARP_SCAN_DEPENDENCIES = libpcap
-ARP_SCAN_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),y)
 ARP_SCAN_CONF_OPTS += LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
@@ -17,4 +16,11 @@ endif
 
 ARP_SCAN_CONF_ENV = pgac_cv_snprintf_long_long_int_format='%lld'
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+ARP_SCAN_DEPENDENCIES += libcap
+ARP_SCAN_CONF_OPTS += --with-libcap
+else
+ARP_SCAN_CONF_OPTS += --without-libcap
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
