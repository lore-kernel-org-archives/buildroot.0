Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D31CD6E53
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C233812D8;
	Sat, 30 May 2026 21:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEyn_xbqS1Jx; Sat, 30 May 2026 21:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F701812F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780176879;
	bh=iggXX0sSq3OxBo5WHviRBAv3TzAB2AfsTgKx9b+o2oo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KF3qdGvJtLKw9BaNq19nS/MPZKzCQQfOY00A2n0jM3ZEqmH8iq9FDQRYb5ywAvVEB
	 8N29nFqvSXwEILDs043xfScMIoSBXv3VnK/6IQhlKDRzB1oj6NAXvSLqGQBzouJXJf
	 1SuV//6FDHq1/vql1IEMSqYznfwm2ozU2M+xGKpO6EgZXx2Q9ps9pVV+7uQkcRmkwu
	 6dLcAA4Ajo6S8AczwMLo4Zvshh17VEm2HbbZZFHf20LKKyFx1uGpqr2j4odRlVbmH1
	 l78UBXRIlTbFY9Syn+ZJDN0KJnEMNp3ujxqZgicK5JJgPe8B9CCOxAT5qp6ofdpumm
	 +UmvPeyVA0JtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F701812F1;
	Sat, 30 May 2026 21:34:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A155F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E42378129A
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vXlPjyow4iVj for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7AB6812A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7AB6812A3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:34:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B96C987624; Sat, 30 May 2026 21:34:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 23:33:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0c9e239bd364f63ff4df5b36c77285e1708924a5
X-Git-Newrev: c58fb5f97b7cc6177c1ac675467f0ec43de44b8e
X-Patchwork-Hint: ignore
Message-Id: <20260530213422.B96C987624@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/sigsum-c: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c58fb5f97b7cc6177c1ac675467f0ec43de44b8e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add the sigsum-c library, which is a more lightweight alternative to
sigsum-go when only proof verification is needed or needs to be embedded
in some other program.

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Make-command-line-tools-optional.patch    | 71 ++++++++++++++++++++++
 package/sigsum-c/Config.in                         | 17 ++++++
 package/sigsum-c/sigsum-c.hash                     |  3 +
 package/sigsum-c/sigsum-c.mk                       | 21 +++++++
 6 files changed, 114 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index beabe134b9..c71640b6b5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1146,6 +1146,7 @@ F:	package/cpulimit/
 
 N:	Florian Larysch <fl@n621.de>
 F:	package/casync-nano/
+F:	package/sigsum-c/
 F:	package/sigsum-go/
 
 N:	Floris Bos <bos@je-eigen-domein.nl>
diff --git a/package/Config.in b/package/Config.in
index ed003562da..166b666ad8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1661,6 +1661,7 @@ menu "Crypto"
 	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
+	source "package/sigsum-c/Config.in"
 	source "package/tinydtls/Config.in"
 	source "package/tpm2-openssl/Config.in"
 	source "package/tpm2-pkcs11/Config.in"
diff --git a/package/sigsum-c/0001-Make-command-line-tools-optional.patch b/package/sigsum-c/0001-Make-command-line-tools-optional.patch
new file mode 100644
index 0000000000..3ce986b8bd
--- /dev/null
+++ b/package/sigsum-c/0001-Make-command-line-tools-optional.patch
@@ -0,0 +1,71 @@
+From 5c74c6d0dd2dd1707b178083815f3a165e3e7dc3 Mon Sep 17 00:00:00 2001
+From: Florian Larysch <fl@n621.de>
+Date: Fri, 22 May 2026 14:36:02 +0200
+Subject: [PATCH] Make command line tools optional
+
+When only using the sigsum-c library in another program, the
+dedicated sigsum-c-verify tool might be redundant.
+
+Allow disabling it to save space/avoid littering /bin.
+
+Upstream: https://git.glasklar.is/sigsum/core/sigsum-c/-/commit/5c74c6d0dd2dd1707b178083815f3a165e3e7dc3
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ Makefile.in  |  4 ++--
+ configure.ac | 11 +++++++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 0648adb..771551a 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -12,7 +12,7 @@ lib:
+ tools: lib
+ 	cd tools && $(MAKE) all
+ 
+-all:	lib @IF_PARSERS@ tools
++all:	lib @IF_TOOLS@ tools
+ 
+ clean distclean:
+ 	cd lib && $(MAKE) $@
+@@ -34,7 +34,7 @@ install-lib: lib
+ install-tools: tools
+ 	cd tools && $(MAKE) install
+ 
+-install: install-lib @IF_PARSERS@ install-tools
++install: install-lib @IF_TOOLS@ install-tools
+ 
+ # Remake configure-generated files.
+ # From the autoconf manual (4.8.5 Automatic Remaking)
+diff --git a/configure.ac b/configure.ac
+index 37a18b7..8305789 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -19,6 +19,16 @@ else
+    IF_PARSERS='#'
+ fi
+ 
++AC_ARG_ENABLE(tools,
++	AS_HELP_STRING([--disable-tools], [Do not build or install command-line tools.]),,
++	[enable_tools="$enable_parsers"])
++
++if test "$enable_tools" = yes ; then
++   IF_TOOLS=''
++else
++   IF_TOOLS='#'
++fi
++
+ AC_ARG_ENABLE(static,
+   AS_HELP_STRING([--disable-static], [Do not build any static library]),,
+   [enable_static=yes])
+@@ -47,6 +57,7 @@ if test -z "$PIC_CFLAGS" ; then
+ fi
+ 
+ AC_SUBST(IF_PARSERS)
++AC_SUBST(IF_TOOLS)
+ AC_SUBST(IF_STATIC)
+ AC_SUBST(IF_SHARED)
+ AC_SUBST(IF_NOT_SHARED)
+-- 
+2.54.0
+
diff --git a/package/sigsum-c/Config.in b/package/sigsum-c/Config.in
new file mode 100644
index 0000000000..afc5942e83
--- /dev/null
+++ b/package/sigsum-c/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SIGSUM_C
+	bool "sigsum-c"
+	select BR2_PACKAGE_NETTLE
+	help
+	  C library and command-line utility for verifying Sigsum
+	  proofs.
+
+	  https://git.glasklar.is/sigsum/core/sigsum-c/
+
+if BR2_PACKAGE_SIGSUM_C
+
+config BR2_PACKAGE_SIGSUM_C_TOOLS
+	bool "Enable tools"
+	help
+	  Build CLI tools like sigsum-c-verify.
+
+endif
diff --git a/package/sigsum-c/sigsum-c.hash b/package/sigsum-c/sigsum-c.hash
new file mode 100644
index 0000000000..5941eafc5d
--- /dev/null
+++ b/package/sigsum-c/sigsum-c.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  147ab839b22c5584aa9982c912bdb629cc717dcd978528233889789544e5fe51  sigsum-c-v1.0.0-git4.tar.gz
+sha256  f592312f5d5756846c43becd06fc1d826eafe05b1b45f88e95af460d59d24ad0  LICENSE
diff --git a/package/sigsum-c/sigsum-c.mk b/package/sigsum-c/sigsum-c.mk
new file mode 100644
index 0000000000..a6021f0587
--- /dev/null
+++ b/package/sigsum-c/sigsum-c.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# sigsum-c
+#
+################################################################################
+
+SIGSUM_C_VERSION = v1.0.0
+SIGSUM_C_SITE = https://git.glasklar.is/sigsum/core/sigsum-c
+SIGSUM_C_SITE_METHOD = git
+SIGSUM_C_LICENSE = BSD-2-Clause
+SIGSUM_C_LICENSE_FILES = LICENSE
+SIGSUM_C_INSTALL_STAGING = YES
+SIGSUM_C_DEPENDENCIES = nettle
+
+SIGSUM_C_AUTORECONF = YES
+
+ifneq ($(BR2_PACKAGE_SIGSUM_C_TOOLS),y)
+SIGSUM_C_CONF_OPTS += --disable-tools
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
