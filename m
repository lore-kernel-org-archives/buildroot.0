Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4243DC71133
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 13:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F19EE61465;
	Fri, 25 Aug 2023 13:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F19EE61465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlLWtHb21mtF; Fri, 25 Aug 2023 13:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4193E61450;
	Fri, 25 Aug 2023 13:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4193E61450
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E522B1BF82F
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF3D983BAD
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 13:22:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF3D983BAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0lhT184tKC_1 for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDC8D83BA2
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDC8D83BA2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C49F486318; Fri, 25 Aug 2023 13:22:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 15:21:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 872d1ca1cc15a0f7df924371c7db31d2e64bf5c8
X-Git-Newrev: 5bf4f3e5169c0eaed0593edd4f5bf2495c3ed5f6
X-Patchwork-Hint: ignore
Message-Id: <20230825132221.C49F486318@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/igh-ethercat:
 bump to latest Git commit
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bf4f3e5169c0eaed0593edd4f5bf2495c3ed5f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Removed_POST_PATCH_HOOKS, not needed anymore due to upstream commit
https://gitlab.com/etherlab.org/ethercat/-/commit/3bc8703f5cf021d21730cd3ac3da839973b914e9

This bump will only fix kernel 6.3-related build errors by upstream
commit
https://gitlab.com/etherlab.org/ethercat/-/commit/e35f35b25c43b9f6fa967b2ae92462034a14bc8d

Fixes:
http://autobuild.buildroot.net/results/ffc/ffc00cc9f949bfc692edc287867ca1e3c86edea1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 18a6d6db685e939cb42cb66755668e8f91bc6340)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/igh-ethercat/igh-ethercat.hash | 2 +-
 package/igh-ethercat/igh-ethercat.mk   | 8 +-------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 88548bf23e..67a152c6ae 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  eb13a0f7f073ad54589c4f41829d9e995b37b26fbc7fcd05e3adb5e201e6feb4  igh-ethercat-2e2cef6131895336f87c57c18fe78ae01a90d3de.tar.gz
+sha256  7e4d8f3497c0bc0b64a151c0d074349fe7614767563642d6fedb19567eafa1e1  igh-ethercat-f5dc109176400f540a8682a2c9ee20d411d14d61.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 1041ba0758..5b618ab54a 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 2e2cef6131895336f87c57c18fe78ae01a90d3de
+IGH_ETHERCAT_VERSION = f5dc109176400f540a8682a2c9ee20d411d14d61
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
@@ -22,11 +22,5 @@ IGH_ETHERCAT_CONF_OPTS = \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e) \
 	$(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
 
-# Needed to make autoreconf happy
-define IGH_ETHERCAT_CREATE_CHANGELOG
-	touch $(@D)/ChangeLog
-endef
-IGH_ETHERCAT_POST_PATCH_HOOKS += IGH_ETHERCAT_CREATE_CHANGELOG
-
 $(eval $(kernel-module))
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
