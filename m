Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E25C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 21:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA67C81DE1;
	Wed, 16 Nov 2022 21:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA67C81DE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlHrBPEmjnFd; Wed, 16 Nov 2022 21:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC2681CA7;
	Wed, 16 Nov 2022 21:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAC2681CA7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3991BF8C7
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 21:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CB8641743
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 21:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CB8641743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-yg7dcnEQ1D for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 21:21:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E3B141742
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E3B141742
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 21:21:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 9CBD81C0006;
 Wed, 16 Nov 2022 21:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 22:21:04 +0100
Message-Id: <20221116212105.702408-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1668633667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=t0GstKt5E4stToPl4X0JuWZP+UbAwUupNBbyDZmzjhc=;
 b=Q7WFCzDBOB82yAoEe7WIBd53odkIKAG5n6yW7AQShOibo1g0nG7Y4nvlynntcU4TrP5jvj
 m24isE7OOffY1nRke85sAk5pB9NvCnrdhPC8Y1A5H+siMEDv1ZWYJxPuc30JmlR7cBrWpJ
 O07DQZrXyzDHGLqnQNBY6K8xsUiRqmem6BGi3BvFqpiYjBI73qBdcd5PLaqRGBWX+9/rbZ
 oF5IpP80QKRCF4oNitCG+mZx6Ps75E10r7GCIRxFJ+bObEgglNWyCrQqCswC/Oh8Q+EOMZ
 CGbjNXgTfQO//z6nK5EeguTye1ApsNPp/y+DvF8E9ZhCkhW4gz8eRVnksWFBIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Q7WFCzDB
Subject: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump to latest Git
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
