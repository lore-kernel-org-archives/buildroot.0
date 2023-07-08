Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E86EB64DA
	for <buildroot@archiver.kernel.org>; Sat,  8 Jul 2023 15:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C00B60B6F;
	Sat,  8 Jul 2023 15:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C00B60B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ChLYFgSWgYmj; Sat,  8 Jul 2023 15:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3514D60B8C;
	Sat,  8 Jul 2023 15:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3514D60B8C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8491BF25B
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 15:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AD2D40571
 for <buildroot@lists.busybox.net>; Sat,  8 Jul 2023 15:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AD2D40571
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_kwKTwCnsUk for <buildroot@lists.busybox.net>;
 Sat,  8 Jul 2023 15:03:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E93040004
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E93040004
 for <buildroot@buildroot.org>; Sat,  8 Jul 2023 15:03:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cfe4.dip0.t-ipconnect.de [79.214.207.228])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 135CCA4C0286;
 Sat,  8 Jul 2023 17:03:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49676)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qI9T0-0007Vc-2R;
 Sat, 08 Jul 2023 17:03:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  8 Jul 2023 17:03:22 +0200
Message-Id: <20230708150322.1353246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688828603;
 bh=jlUVQuyfBe0gyXnCUYujunbZZpNejB2I+sIJlMdFxd8=;
 h=From:To:Cc:Subject:Date:From;
 b=eirUYGdAySIZx7CZ9vEXT3zHzh+R05czkFUTDUpIK54w5W3q8yKMA8Xm5AcMTUBZu
 U6AnApKfWQuMjkml8fvJHQf/O049GL3X4+1NdgB1VzX/APVv2/EDehy5fme/cFBb1m
 U11EtfdRfklRqPsHnV/vlFWYMEpLiawG823OLfHKNr+F7zBwNNeKreI+LSYuW4/qDI
 6zI+qPwlSi3bhTaYXSG2xB8AsZvYateUOhS9SBvo0jtPuv1jBKSUsSNFeeUDdSZimH
 kyfgESr4UO7D4fLy1CT2jrr4FBELr/AJ9issFeqmNNxEx+p8GmQb/gxDcg+psDK4yC
 djQ2knu1U6f1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=eirUYGdA
Subject: [Buildroot] [PATCH 1/1] package/igh-ethercat: bump to latest Git
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed_POST_PATCH_HOOKS, not needed anymore due to upstream commit
https://gitlab.com/etherlab.org/ethercat/-/commit/3bc8703f5cf021d21730cd3ac3da839973b914e9

This bump will only fix kernel 6.3-related build errors by upstream
commit
https://gitlab.com/etherlab.org/ethercat/-/commit/e35f35b25c43b9f6fa967b2ae92462034a14bc8d

Fixes:
http://autobuild.buildroot.net/results/ffc/ffc00cc9f949bfc692edc287867ca1e3c86edea1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
