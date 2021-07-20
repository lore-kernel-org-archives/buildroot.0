Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9A9C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:39:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06A4A60FD7
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06A4A60FD7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEB0C402BC;
	Tue, 20 Jul 2021 21:39:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 84ts_xqfeg-g; Tue, 20 Jul 2021 21:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 102114018D;
	Tue, 20 Jul 2021 21:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 291B31BF3E9
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1764F82F6C
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:38:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X237KKWrA10F for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:38:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 57B7082D75
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:38:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E92148867D; Tue, 20 Jul 2021 21:04:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:34:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fade40dfc36a2ca604f12add79013b047eae59fe
X-Git-Newrev: f6628763eb302f15f861e0ce7bfc44b34b066bea
X-Patchwork-Hint: ignore
Message-ID: <20210720210408.E92148867D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gumbo-parser: new package
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
Content-Type: multipart/mixed; boundary="===============3362640586761549652=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720213419.c3G5fLdS_hOYySxMJ8Ne9rLuUsDFvihVJx9uaJef5ck@z>

--===============3362640586761549652==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f6628763eb302f15f861e0ce7bfc44b34b066bea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Gumbo is an implementation of the HTML5 parsing algorithm implemented
as a pure C99 library with no outside dependencies.

Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/gumbo-parser/Config.in         | 10 ++++++++++
 package/gumbo-parser/gumbo-parser.hash |  5 +++++
 package/gumbo-parser/gumbo-parser.mk   | 14 ++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1e1a30bac9..e77ceb2a95 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2255,6 +2255,7 @@ N:	Ramon Fried <rfried.dev@gmail.com>
 F:	package/bitwise/
 
 N:	Raphaël Mélotte <raphael.melotte@mind.be>
+F:	package/gumbo-parser/
 F:	package/jbig2dec/
 F:	package/mupdf/
 F:	package/python-boto3/
diff --git a/package/Config.in b/package/Config.in
index de9378e11c..95ad1a29f7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1903,6 +1903,7 @@ menu "Other"
 	source "package/gobject-introspection/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
+	source "package/gumbo-parser/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
 	source "package/libabseil-cpp/Config.in"
diff --git a/package/gumbo-parser/Config.in b/package/gumbo-parser/Config.in
new file mode 100644
index 0000000000..04bb2294bb
--- /dev/null
+++ b/package/gumbo-parser/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GUMBO_PARSER
+	bool "gumbo-parser"
+	help
+	  Gumbo is an implementation of the HTML5 parsing algorithm
+	  implemented as a pure C99 library with no outside
+	  dependencies. It's designed to serve as a building block for
+	  other tools and libraries such as linters, validators,
+	  templating languages, and refactoring and analysis tools.
+
+	  https://github.com/google/gumbo-parser
diff --git a/package/gumbo-parser/gumbo-parser.hash b/package/gumbo-parser/gumbo-parser.hash
new file mode 100644
index 0000000000..c4af33072c
--- /dev/null
+++ b/package/gumbo-parser/gumbo-parser.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  28463053d44a5dfbc4b77bcf49c8cee119338ffa636cc17fc3378421d714efad  gumbo-parser-0.10.1.tar.gz
+
+# Hash for license files:
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  COPYING
diff --git a/package/gumbo-parser/gumbo-parser.mk b/package/gumbo-parser/gumbo-parser.mk
new file mode 100644
index 0000000000..aedc56cef1
--- /dev/null
+++ b/package/gumbo-parser/gumbo-parser.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# gumbo-parser
+#
+################################################################################
+
+GUMBO_PARSER_VERSION = 0.10.1
+GUMBO_PARSER_SITE = $(call github,google,gumbo-parser,v$(GUMBO_PARSER_VERSION))
+GUMBO_PARSER_LICENSE = Apache-2.0
+GUMBO_PARSER_LICENSE_FILES = COPYING
+GUMBO_PARSER_INSTALL_STAGING = YES
+GUMBO_PARSER_AUTORECONF = YES
+
+$(eval $(autotools-package))

--===============3362640586761549652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3362640586761549652==--
