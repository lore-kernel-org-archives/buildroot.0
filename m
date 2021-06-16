Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7C5C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:01:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 987C360ED6
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 987C360ED6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6822940502;
	Tue,  3 Aug 2021 22:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VoPGrCQRpPEa; Tue,  3 Aug 2021 22:01:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07F5404D4;
	Tue,  3 Aug 2021 22:01:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDC71BF9C1
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 427DB6067E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEYkdMbRvOLJ for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89EE1608C5
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D44DF8674F; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Jun 2021 23:11:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 04a0094f0ef0778d1f3c4056ac0005218126147e
X-Git-Newrev: 22864d570dd18d78a77dedab8fbcc5e0122c0acc
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.D44DF8674F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libqb: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=22864d570dd18d78a77dedab8fbcc5e0122c0acc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

libqb is a library providing features for client-server architecture,
such as logging, tracing, inter-process communication (IPC) and polling.

see: https://github.com/ClusterLabs/libqb

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libqb/Config.in  |  7 +++++++
 package/libqb/libqb.hash |  3 +++
 package/libqb/libqb.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2031a40e14..f2047380e3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1503,6 +1503,7 @@ F:	package/dtach/
 N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
+F:	package/libqb/
 
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
diff --git a/package/Config.in b/package/Config.in
index 4cdf796ad9..6e6a9e5784 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1939,6 +1939,7 @@ menu "Other"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
 	source "package/libpwquality/Config.in"
+	source "package/libqb/Config.in"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
diff --git a/package/libqb/Config.in b/package/libqb/Config.in
new file mode 100644
index 0000000000..4ab010ca50
--- /dev/null
+++ b/package/libqb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBQB
+	bool "libqb"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Library for client-server applications
+
+	  https://github.com/ClusterLabs/libqb
diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
new file mode 100644
index 0000000000..0a01a9bbb5
--- /dev/null
+++ b/package/libqb/libqb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f72769c66479c51ac176b56837637b29d200f9dad40d23c5fdcb10f3a53ab1e4  libqb-2.0.2.tar.gz
+sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
new file mode 100644
index 0000000000..9da6d7f900
--- /dev/null
+++ b/package/libqb/libqb.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libqb
+#
+################################################################################
+
+LIBQB_VERSION = 2.0.2
+LIBQB_SITE = $(call github,ClusterLabs,libqb,v$(LIBQB_VERSION))
+LIBQB_LICENSE = LGPL-2.1+
+LIBQB_LICENSE_FILES = COPYING
+LIBQB_INSTALL_STAGING = YES
+LIBQB_AUTORECONF = YES
+LIBQB_DEPENDENCIES = libxml2
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
