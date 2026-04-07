Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353E9FF513C
	for <buildroot@archiver.kernel.org>; Tue,  7 Apr 2026 20:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9E8781799;
	Tue,  7 Apr 2026 20:02:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7LpZl7sPlsa; Tue,  7 Apr 2026 20:02:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5095E81763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775592171;
	bh=sn6AeOsltOZBI3YYvb7vS5ScBbkeAqJxKczn0Xkcxao=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AhQ16+it2FZoVGoxB/Ac//KZn8LaNJzF23QQbmrmCk7kQ80q1a9wG2I/ZPk/VSUkC
	 vZZP6gr5mQn0AQ7LxFLex1lyBkBestDsuql2dD+X24Mp7cRtg9i8UGqeT9kBfVhXhd
	 SNITTItCdsqvDF9MWe5p/dQfbxKWPJoDYfXz9iXqyMehDfTOqUQhFRjUaoqCsE9AC6
	 LqgQvNedh71DrmwJhBArUpMk/G2oaH1vu2XfNsbHuKudIgzlU71jiutIlnZPueBfGM
	 VkQXTCjE0mLOT0Vp1v44sY5oLJ/TuBKvYkPukKIClr+Iyml27V7u+XtJzNiUFCHImy
	 3IUesMDc3MG2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5095E81763;
	Tue,  7 Apr 2026 20:02:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 030E62C7
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1589D60E1E
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C56bSquBRHlg for <buildroot@buildroot.org>;
 Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2712460E15
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2712460E15
 for <buildroot@buildroot.org>; Tue,  7 Apr 2026 20:02:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A65A5807ED; Tue,  7 Apr 2026 20:02:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Apr 2026 21:49:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d24b2517894195fa4625dcda245c78f90ac3c720
X-Git-Newrev: f0ebeaf888241f3bb6b8e3e177c1ac097c38de33
X-Patchwork-Hint: ignore
Message-Id: <20260407200239.A65A5807ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sphinxbase: remove package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f0ebeaf888241f3bb6b8e3e177c1ac097c38de33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The upstream github repo https://github.com/cmusphinx/sphinxbase
"was archived by the owner on Jun 9, 2022."

Remove an unmaintained package which also causes build errors due to
changes to a released tarball.

Jonathan Ben-Avraham answered by email, which maybe is still sitting in
a queue on the buildroot mailinglist, on Feb, 21st, 2026:
"I was the package submitter. Please remove the package."

Fixes:
https://autobuild.buildroot.net/results/b45/b45eebbcc86f33741053bb6f9b89e16c7041c470/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Config.in.legacy                   |  7 +++++++
 DEVELOPERS                         |  1 -
 package/Config.in                  |  1 -
 package/sphinxbase/Config.in       | 13 -------------
 package/sphinxbase/sphinxbase.hash |  3 ---
 package/sphinxbase/sphinxbase.mk   | 19 -------------------
 6 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 64112f97c5..d13d4ee88f 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05"
 
+config BR2_PACKAGE_SPHINXBASE
+	bool "sphinxbase removed"
+	select BR2_LEGACY
+	help
+	  sphinxbase was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_OPENSWAN
 	bool "openswan removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6fd01545c5..f2548f676b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1740,7 +1740,6 @@ F:	package/dawgdic/
 F:	package/libphidget/
 F:	package/phidgetwebservice/
 F:	package/rapidxml/
-F:	package/sphinxbase/
 
 N:	Joris Offouga <offougajoris@gmail.com>
 F:	package/python-colorlog/
diff --git a/package/Config.in b/package/Config.in
index 774f77c106..3e330b2fcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2278,7 +2278,6 @@ endif
 	source "package/ruy/Config.in"
 	source "package/shapelib/Config.in"
 	source "package/skalibs/Config.in"
-	source "package/sphinxbase/Config.in"
 	source "package/startup-notification/Config.in"
 	source "package/tbb/Config.in"
 	source "package/tensorflow-lite/Config.in"
diff --git a/package/sphinxbase/Config.in b/package/sphinxbase/Config.in
deleted file mode 100644
index 00a19f6178..0000000000
--- a/package/sphinxbase/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_SPHINXBASE
-	bool "sphinxbase"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	help
-	  CMUSphinx toolkit is a leading speech recognition toolkit
-	  with various tools used to build speech applications. CMU
-	  Sphinx toolkit has a number of packages for different tasks
-	  and applications.
-
-	  http://cmusphinx.sourceforge.net/
-
-comment "sphinxbase needs a toolchain with threads"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
deleted file mode 100644
index 433fba685d..0000000000
--- a/package/sphinxbase/sphinxbase.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64  sphinxbase-5prealpha.tar.gz
-sha256  26f12e0152a5d58c69904e439761a1b2fbb9267b5f04674dbf93667e3e6dd043  src/libsphinxbase/util/bio.c
diff --git a/package/sphinxbase/sphinxbase.mk b/package/sphinxbase/sphinxbase.mk
deleted file mode 100644
index 86f9089b48..0000000000
--- a/package/sphinxbase/sphinxbase.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# sphinxbase
-#
-################################################################################
-
-SPHINXBASE_VERSION = 5prealpha
-SPHINXBASE_SITE = http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/5prealpha
-SPHINXBASE_LICENSE = BSD-2-Clause
-# Note http://sourceforge.net/p/cmusphinx/bugs/441/ "LICENSE file missing in"
-# 5prealpha tarballs". The license is contained in the copyright notice at the
-# top of each source file. For example:
-SPHINXBASE_LICENSE_FILES = src/libsphinxbase/util/bio.c
-
-SPHINXBASE_DEPENDENCIES = host-bison
-
-SPHINXBASE_CONF_OPTS = --without-python --without-lapack
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
