Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A1BD6554C
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 19:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 553744059D;
	Tue, 26 Nov 2024 19:11:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t3IKg2ERdRj2; Tue, 26 Nov 2024 19:11:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37478405A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37478405A2;
	Tue, 26 Nov 2024 19:11:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C9FDB3
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 755946FA92
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SbzfqWfsw7hu for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 19:11:31 +0000 (UTC)
X-Greylist: delayed 540 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 26 Nov 2024 19:11:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63B626FAA6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B626FAA6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.248.234.2;
 helo=mail.xes-mad.com; envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63B626FAA6
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 19:11:30 +0000 (UTC)
Received: from vfazio4.xes-mad.com (vfazio4.xes-mad.com [10.52.19.201])
 by mail.xes-mad.com (Postfix) with ESMTP id 34693202AC;
 Tue, 26 Nov 2024 13:02:29 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 13:02:14 -0600
Message-Id: <20241126190214.2092202-1-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1732647749; bh=jjePENT3spJ5//6j19fjSGDEVNpqq7ejh7hlpLav8WA=;
 h=From:To:Cc:Subject:Date:From;
 b=E4vMGhdwWrbOitOps2b0885+6ZanemmkvMTsYJR8usroYzVZYnWyAppFSfBtoil/5
 WVPRCnHSEp9FVllGvRvZI5AEqhpP4INZIK1M9MEiIPE7yhOLsEv8yKSK/S9liBrsvp
 QJAxdn1ki9C9JBYISG/vmPbztj6U5JOpQ2Hh2TV0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=mail header.b=E4vMGhdw
Subject: [Buildroot] [PATCH] package/mmc-utils: bump to 523d8f3cfb21
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream commit f884bfe684f2c31e1f5b7c9247b364178fa20ea3 changed the
default build behavior to run `sparse` which is problematic if the tool
is not available on the host during builds.

Update the build command to not define `C` so `sparse` is skipped.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 package/mmc-utils/mmc-utils.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index fec7533d16..48bfd7bc04 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4547b5f0f8a43857dcfb516b8b9c987d07febfecbe3d27987f43064db46ca8f9  mmc-utils-e1281d4de9166b7254ba30bb58f9191fc2c9e7fb-git4.tar.gz
+sha256  1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131  mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
 sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
diff --git a/package/mmc-utils/mmc-utils.mk b/package/mmc-utils/mmc-utils.mk
index 48c347d846..28ac62678b 100644
--- a/package/mmc-utils/mmc-utils.mk
+++ b/package/mmc-utils/mmc-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MMC_UTILS_VERSION = e1281d4de9166b7254ba30bb58f9191fc2c9e7fb
+MMC_UTILS_VERSION = 523d8f3cfb219d800f45860892e742e3a355f1bb
 MMC_UTILS_SITE = https://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git
 MMC_UTILS_SITE_METHOD = git
 MMC_UTILS_LICENSE = GPL-2.0
@@ -25,7 +25,7 @@ endif
 # let's do this here otherwise it won't be automatically set and build
 # will fail
 define MMC_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) C= \
 		CFLAGS="$(MMC_UTILS_CFLAGS)" \
 		AM_CFLAGS='-DVERSION=\"$(shell echo $(MMC_UTILS_VERSION) | head -c 6)\"'
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
