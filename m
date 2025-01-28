Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDEEC282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 327FD40845;
	Fri, 28 Feb 2025 17:06:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOBlTUD5vZKc; Fri, 28 Feb 2025 17:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB26440779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB26440779;
	Fri, 28 Feb 2025 17:06:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07BE268
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2022B4250A
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 229S9jx879sG for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8F4542EE1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8F4542EE1
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9912D87635; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 21:52:51 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6732f4df7cc495f7971bc508c1aafe1c395a47b4
X-Git-Newrev: f110a78825def7a3496e797d41186371be430e77
X-Patchwork-Hint: ignore
Message-Id: <20250228163022.9912D87635@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fp16: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f110a78825def7a3496e797d41186371be430e77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/fp16/Config.in |  8 ++++++++
 package/fp16/fp16.hash |  4 ++++
 package/fp16/fp16.mk   | 20 ++++++++++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f56d2eb38b..a5d0b2ddb3 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3034,6 +3034,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fp16/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index beb6f08064..cccb95b869 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2187,6 +2187,7 @@ menu "Other"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
 	source "package/flatcc/Config.in"
+	source "package/fp16/Config.in"
 	source "package/fxdiv/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
diff --git a/package/fp16/Config.in b/package/fp16/Config.in
new file mode 100644
index 0000000000..e07c6ebb8a
--- /dev/null
+++ b/package/fp16/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_FP16
+	bool "fp16"
+	select BR2_PACKAGE_PSIMD
+	help
+	  Header-only library for conversion to/from half-precision
+	  floating point formats.
+
+	  https://github.com/Maratyszcza/FP16
diff --git a/package/fp16/fp16.hash b/package/fp16/fp16.hash
new file mode 100644
index 0000000000..a2b7d83c41
--- /dev/null
+++ b/package/fp16/fp16.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  e7b509c76a2ea162ebdda77fb6b6f51f2f37dedee0866077d428e214516f0c2b  fp16-98b0a46bce017382a6351a19577ec43a715b6835.tar.gz
+# License files, locally calculated
+sha256  17e4f539024be2749ee729d1e2f01d24cef12ece8c9bf18e91a4349be29c80bf  LICENSE
diff --git a/package/fp16/fp16.mk b/package/fp16/fp16.mk
new file mode 100644
index 0000000000..d50d84366d
--- /dev/null
+++ b/package/fp16/fp16.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# fp16
+#
+################################################################################
+
+FP16_VERSION = 98b0a46bce017382a6351a19577ec43a715b6835
+FP16_SITE = $(call github,Maratyszcza,FP16,$(FP16_VERSION))
+FP16_LICENSE = MIT
+FP16_LICENSE_FILES = LICENSE
+FP16_INSTALL_STAGING = YES
+# Only installs a header
+FP16_INSTALL_TARGET = NO
+FP16_DEPENDENCIES = psimd
+FP16_CONF_OPTS = \
+	-DFP16_BUILD_TESTS=OFF \
+	-DFP16_BUILD_BENCHMARKS=OFF \
+	-DPSIMD_SOURCE_DIR="$(PSIMD_DIR)"
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
