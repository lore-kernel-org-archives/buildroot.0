Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0449E748A1
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 19:27:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 547074219D;
	Sat, 30 Sep 2023 19:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 547074219D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OL4B-TyLNOVm; Sat, 30 Sep 2023 19:27:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05670421B7;
	Sat, 30 Sep 2023 19:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05670421B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A8BE1BF48D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1ACF41E45
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 19:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1ACF41E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0UIYIfX_Tjma for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 19:27:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8806042152
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 19:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8806042152
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 73D1283CB4; Sat, 30 Sep 2023 19:27:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 21:27:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8c492068bc80f04b8d96df79e7f98b2879877c6
X-Git-Newrev: 3a6e9d2f3fbc1da8b55bc89c5bd9dc0978b0d83c
X-Patchwork-Hint: ignore
Message-Id: <20230930192724.73D1283CB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libucontext: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a6e9d2f3fbc1da8b55bc89c5bd9dc0978b0d83c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides a ucontext.h C API on musl libc.

Architecture support table based on:
https://github.com/kaniini/libucontext/tree/libucontext-1.2#supported-features

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libucontext/Config.in        | 33 +++++++++++++++++++++++++++++++++
 package/libucontext/libucontext.hash |  4 ++++
 package/libucontext/libucontext.mk   | 17 +++++++++++++++++
 5 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c297deedbe..9c1e84fb4b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1413,6 +1413,7 @@ F:	package/fxdiv/
 F:	package/gensio/
 F:	package/lua-std-debug/
 F:	package/lua-std-normalize/
+F:	package/libucontext/
 F:	package/lilv/
 F:	package/lv2/
 F:	package/neon-2-sse/
diff --git a/package/Config.in b/package/Config.in
index 58a7cfb914..b494d8ff83 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2142,6 +2142,7 @@ menu "Other"
 	source "package/libtpl/Config.in"
 	source "package/libubox/Config.in"
 	source "package/libuci/Config.in"
+	source "package/libucontext/Config.in"
 	source "package/libunwind/Config.in"
 	source "package/liburcu/Config.in"
 	source "package/liburing/Config.in"
diff --git a/package/libucontext/Config.in b/package/libucontext/Config.in
new file mode 100644
index 0000000000..84a6e89f23
--- /dev/null
+++ b/package/libucontext/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_aarch64_be
+	default y if BR2_arm
+	default y if BR2_armeb
+	default y if BR2_m68k
+	default y if BR2_mips
+	default y if BR2_mipsel
+	default y if BR2_mips64
+	default y if BR2_mips64el
+	default y if BR2_or1k
+	default y if BR2_powerpc
+	default y if BR2_powerpc64
+	default y if BR2_powerpc64le
+	default y if BR2_riscv && BR2_RISCV_32
+	default y if BR2_riscv && BR2_RISCV_64
+	default y if BR2_s390x
+	default y if BR2_sh4
+	default y if BR2_sh4eb
+	default y if BR2_sh4a
+	default y if BR2_sh4aeb
+	default y if BR2_i386
+	default y if BR2_x86_64
+	depends on BR2_TOOLCHAIN_USES_MUSL
+
+config BR2_PACKAGE_LIBUCONTEXT
+	bool "libucontext"
+	depends on BR2_PACKAGE_LIBUCONTEXT_ARCH_SUPPORTS
+	help
+	  Ucontext implementation featuring glibc-compatible ABI.
+
+	  https://github.com/kaniini/libucontext
diff --git a/package/libucontext/libucontext.hash b/package/libucontext/libucontext.hash
new file mode 100644
index 0000000000..a8e1e23e36
--- /dev/null
+++ b/package/libucontext/libucontext.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  937fba9d0beebd7cf957b79979b19fe3a29bb9c4bfd25e869477d7154bbf8fd3  libucontext-1.2.tar.gz
+# License files, locally calculated
+sha256  ecf4be354bbb6ccebdf150d1a8f2b3caeb10cf7c8a580f278a30799372f9e037  LICENSE
diff --git a/package/libucontext/libucontext.mk b/package/libucontext/libucontext.mk
new file mode 100644
index 0000000000..75c4f9b9e4
--- /dev/null
+++ b/package/libucontext/libucontext.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# libucontext
+#
+################################################################################
+
+LIBUCONTEXT_VERSION = 1.2
+LIBUCONTEXT_SITE = $(call github,kaniini,libucontext,libucontext-$(LIBUCONTEXT_VERSION))
+LIBUCONTEXT_LICENSE = ISC
+LIBUCONTEXT_LICENSE_FILES = LICENSE
+LIBUCONTEXT_INSTALL_STAGING = YES
+
+LIBUCONTEXT_CONF_OPTS = \
+	-Dfreestanding=false \
+	-Dexport_unprefixed=true
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
