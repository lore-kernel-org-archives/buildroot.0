Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF2BC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D630B6F9C8;
	Tue, 21 Feb 2023 01:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D630B6F9C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MTbexRWAb8Z; Tue, 21 Feb 2023 01:21:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B2F06FBBF;
	Tue, 21 Feb 2023 01:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B2F06FBBF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B7B81BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:02:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 274556FBC4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 274556FBC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qw39rP4ye7k3 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AF7C6FBE4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AF7C6FBE4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02B0A81979; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 22:57:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 730e50f520d15c6522153381e8fba57421e78d79
X-Git-Newrev: ee399a868957fbf963db525adeeb4ab2dd3f04fb
X-Patchwork-Hint: ignore
Message-Id: <20230220205244.02B0A81979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/neon-2-sse: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=ee399a868957fbf963db525adeeb4ab2dd3f04fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This package is required by tensorflow-lite.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                         |  1 +
 package/Config.in                  |  1 +
 package/neon-2-sse/Config.in       |  9 +++++++++
 package/neon-2-sse/neon-2-sse.hash |  4 ++++
 package/neon-2-sse/neon-2-sse.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d0a51086cd..8a652c7c12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1344,6 +1344,7 @@ F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
 F:	package/lilv/
 F:	package/lv2/
+F:	package/neon-2-sse/
 F:	package/pipewire/
 F:	package/python-aioconsole/
 F:	package/python-aiodns/
diff --git a/package/Config.in b/package/Config.in
index fc468148df..96a44a3623 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2107,6 +2107,7 @@ endif
 	source "package/msgpack/Config.in"
 	source "package/musl-compat-headers/Config.in"
 	source "package/musl-fts/Config.in"
+	source "package/neon-2-sse/Config.in"
 	source "package/openblas/Config.in"
 	source "package/orc/Config.in"
 	source "package/p11-kit/Config.in"
diff --git a/package/neon-2-sse/Config.in b/package/neon-2-sse/Config.in
new file mode 100644
index 0000000000..25613c5ec4
--- /dev/null
+++ b/package/neon-2-sse/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NEON_2_SSE
+	bool "neon-2-sse"
+	help
+	  The platform independent header allowing to compile any
+	  C/C++ code containing ARM NEON intrinsic functions for
+	  x86 target systems using SIMD up to SSE4 intrinsic
+	  functions.
+
+	  https://github.com/intel/ARM_NEON_2_x86_SSE
diff --git a/package/neon-2-sse/neon-2-sse.hash b/package/neon-2-sse/neon-2-sse.hash
new file mode 100644
index 0000000000..ded20d58f5
--- /dev/null
+++ b/package/neon-2-sse/neon-2-sse.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  019fbc7ec25860070a1d90e12686fc160cfb33e22aa063c80f52b363f1361e9d  neon-2-sse-a15b489e1222b2087007546b4912e21293ea86ff.tar.gz
+# License files, locally calculated
+sha256  7022f51b439a5915e933ecc270c83e24ca0cb2cceeb08b0132dcd4dbb03ed2dc  LICENSE
diff --git a/package/neon-2-sse/neon-2-sse.mk b/package/neon-2-sse/neon-2-sse.mk
new file mode 100644
index 0000000000..0e9d066abd
--- /dev/null
+++ b/package/neon-2-sse/neon-2-sse.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# neon-2-sse
+#
+################################################################################
+
+NEON_2_SSE_VERSION = a15b489e1222b2087007546b4912e21293ea86ff
+NEON_2_SSE_SITE = $(call github,intel,ARM_NEON_2_x86_SSE,$(NEON_2_SSE_VERSION))
+NEON_2_SSE_LICENSE = BSD-2-Clause
+NEON_2_SSE_LICENSE_FILES = LICENSE
+NEON_2_SSE_INSTALL_STAGING = YES
+NEON_2_SSE_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
