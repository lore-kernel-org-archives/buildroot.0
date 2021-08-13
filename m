Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7CEC4320E
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:07:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C834610E9
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 13:07:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C834610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D4FF80D53;
	Fri, 13 Aug 2021 13:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2dpEi5QmbRTU; Fri, 13 Aug 2021 13:07:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC35080DAB;
	Fri, 13 Aug 2021 13:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44AD21BF2C5
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33ADB60640
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 13:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02tQKqfx7pLh for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 13:07:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3D936060B
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 13:07:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 9025087C27; Fri, 13 Aug 2021 13:07:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 13 Aug 2021 15:07:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 43b69dbac811e509ad38c959b0238d565669de6a
X-Git-Newrev: b7f9192acf4fca94eac40266aa15ffdd1e708ae1
X-Patchwork-Hint: ignore
Message-Id: <20210813130702.9025087C27@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/apparmor: bump to
 version 3.0.3
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b7f9192acf4fca94eac40266aa15ffdd1e708ae1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch bumps apparmor and libapparmor to maintenance release 3.0.3

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/apparmor/apparmor.hash       | 2 +-
 package/apparmor/apparmor.mk         | 2 +-
 package/libapparmor/libapparmor.hash | 2 +-
 package/libapparmor/libapparmor.mk   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/apparmor/apparmor.hash b/package/apparmor/apparmor.hash
index ddbe87c569..88280cbfcf 100644
--- a/package/apparmor/apparmor.hash
+++ b/package/apparmor/apparmor.hash
@@ -1,5 +1,5 @@
 # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  8fada772d9a60989525594346d9aa22af938daafc1781adce9a1acb3c75bdf24  apparmor-3.0.1.tar.gz
+sha256  153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59  apparmor-3.0.3.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 6c23e1bb89..400ea349ae 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, please also update the libapparmor package
 APPARMOR_VERSION_MAJOR = 3.0
-APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).1
+APPARMOR_VERSION = $(APPARMOR_VERSION_MAJOR).3
 APPARMOR_SITE = https://launchpad.net/apparmor/$(APPARMOR_VERSION_MAJOR)/$(APPARMOR_VERSION)/+download
 APPARMOR_DL_SUBDIR = libapparmor
 APPARMOR_LICENSE = GPL-2.0
diff --git a/package/libapparmor/libapparmor.hash b/package/libapparmor/libapparmor.hash
index 37e1ff5228..6a19aef77a 100644
--- a/package/libapparmor/libapparmor.hash
+++ b/package/libapparmor/libapparmor.hash
@@ -1,5 +1,5 @@
 # From: https://gitlab.com/apparmor/apparmor/-/wikis/home#userspace
-sha256  8fada772d9a60989525594346d9aa22af938daafc1781adce9a1acb3c75bdf24  apparmor-3.0.1.tar.gz
+sha256  153db05d8f491e0596022663c19fb1166806cb473b3c6f0a7279feda2ec25a59  apparmor-3.0.3.tar.gz
 
 # locally computed
 sha256  a7e0cdcbea5c14927cedfc600d46526bdcbb1eb0a4d951e2ea53c2a6de159cb4  LICENSE
diff --git a/package/libapparmor/libapparmor.mk b/package/libapparmor/libapparmor.mk
index 255432e455..0d5822a56d 100644
--- a/package/libapparmor/libapparmor.mk
+++ b/package/libapparmor/libapparmor.mk
@@ -6,7 +6,7 @@
 
 # When updating the version here, please also update the apparmor package
 LIBAPPARMOR_VERSION_MAJOR = 3.0
-LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).1
+LIBAPPARMOR_VERSION = $(LIBAPPARMOR_VERSION_MAJOR).3
 LIBAPPARMOR_SOURCE = apparmor-$(LIBAPPARMOR_VERSION).tar.gz
 LIBAPPARMOR_SITE = https://launchpad.net/apparmor/$(LIBAPPARMOR_VERSION_MAJOR)/$(LIBAPPARMOR_VERSION)/+download
 LIBAPPARMOR_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
