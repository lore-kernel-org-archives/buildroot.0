Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C6A0C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:37:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEFB6109F
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FEFB6109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28C7E406B3;
	Sat, 11 Sep 2021 14:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oqbkz1vpf_Ne; Sat, 11 Sep 2021 14:37:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3603D406AE;
	Sat, 11 Sep 2021 14:37:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87E901BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7780D607BD
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:37:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdf9ValimFBT for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:37:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7F7A607D0
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:37:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9CD218902D; Sat, 11 Sep 2021 14:35:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:24:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e311e6b62ab717d7710e31b7bdaa06a3ffc751bc
X-Git-Newrev: 3f81aa885de833805999b168465042071ba831ad
X-Patchwork-Hint: ignore
Message-Id: <20210911143551.9CD218902D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: bump version to v2.5.2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3f81aa885de833805999b168465042071ba831ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Upstream has changed to tar.gz
 - Drop _SOURCE, fixes check-package warning
 - setpgrp not used anymore, no need to override configure cache
 - Makefile no longer uses CC?=, drop comment
 - Enable MRDISC build option, must be activated per phyint in
   smcroute.conf, so safe to enable as a default build option

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/smcroute/smcroute.hash | 7 ++++---
 package/smcroute/smcroute.mk   | 7 ++-----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/smcroute/smcroute.hash b/package/smcroute/smcroute.hash
index f79ce167ed..62b72239cc 100644
--- a/package/smcroute/smcroute.hash
+++ b/package/smcroute/smcroute.hash
@@ -1,5 +1,6 @@
+# Upstream .md5 and .sha256 from GitHub
+sha256	7eca88389cc08cbfe75f787e02ab32a390ef806555069a08abe8d7fa925ed094  smcroute-2.5.2.tar.gz
+md5	dc29e6bd3024a1ad3dd0f2d8c2aed16e  smcroute-2.5.2.tar.gz
+
 # Locally generated
-sha256	431be94c46646767f69c85fee445277b7e765a55177d3ee29522416cfe2cc067  smcroute-2.4.4.tar.xz
 sha256	ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-# From https://github.com/troglobit/smcroute/releases/download/2.4.4/smcroute-2.4.4.tar.xz.md5
-md5	a1dc8c54c684e8c8de139444f73a0ba3  smcroute-2.4.4.tar.xz
diff --git a/package/smcroute/smcroute.mk b/package/smcroute/smcroute.mk
index 0db0e084f6..e4ee81db6f 100644
--- a/package/smcroute/smcroute.mk
+++ b/package/smcroute/smcroute.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-SMCROUTE_VERSION = 2.4.4
-SMCROUTE_SOURCE = smcroute-$(SMCROUTE_VERSION).tar.xz
+SMCROUTE_VERSION = 2.5.2
 SMCROUTE_SITE = https://github.com/troglobit/smcroute/releases/download/$(SMCROUTE_VERSION)
 SMCROUTE_LICENSE = GPL-2.0+
 SMCROUTE_LICENSE_FILES = COPYING
 SMCROUTE_CPE_ID_VENDOR = troglobit
 
-SMCROUTE_CONF_OPTS = ac_cv_func_setpgrp_void=yes
-#BUG:The package Makefile uses CC?= even though the package is autotools based
-SMCROUTE_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
+SMCROUTE_CONF_OPTS = --enable-mrdisc
 
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 SMCROUTE_DEPENDENCIES = libcap
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
