Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6514C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36A1C70989;
	Fri, 28 Feb 2025 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z8fCB6HgjLBE; Fri, 28 Feb 2025 17:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D8E70392
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D8E70392;
	Fri, 28 Feb 2025 17:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A8568
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F00DB42EE9
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TckdkiXxYB8H for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BDE419E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92BDE419E7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 89671867B4; Fri, 28 Feb 2025 16:30:22 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 28 Jan 2025 21:52:48 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f2486a6cf962669e4088421cf68fe862665d5477
X-Git-Newrev: 6732f4df7cc495f7971bc508c1aafe1c395a47b4
X-Patchwork-Hint: ignore
Message-Id: <20250228163022.89671867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/psimd: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6732f4df7cc495f7971bc508c1aafe1c395a47b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/psimd/Config.in  |  6 ++++++
 package/psimd/psimd.hash |  4 ++++
 package/psimd/psimd.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b7d4958aec..f56d2eb38b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
 
diff --git a/package/Config.in b/package/Config.in
index 13caddec34..beb6f08064 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2297,6 +2297,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/psimd/Config.in"
 	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
diff --git a/package/psimd/Config.in b/package/psimd/Config.in
new file mode 100644
index 0000000000..c5c51ca2ef
--- /dev/null
+++ b/package/psimd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PSIMD
+	bool "psimd"
+	help
+	  Portable 128-bit SIMD intrinsics.
+
+	  https://github.com/Maratyszcza/psimd
diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
new file mode 100644
index 0000000000..5692e79bd6
--- /dev/null
+++ b/package/psimd/psimd.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+# License files, locally calculated
+sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
new file mode 100644
index 0000000000..be0090a32f
--- /dev/null
+++ b/package/psimd/psimd.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# psimd
+#
+################################################################################
+
+PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
+PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_LICENSE = MIT
+PSIMD_LICENSE_FILES = LICENSE
+PSIMD_INSTALL_STAGING = YES
+# Only installs a header
+PSIMD_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
