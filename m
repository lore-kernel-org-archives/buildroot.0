Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50933C43602
	for <buildroot@archiver.kernel.org>; Wed,  1 Jul 2026 20:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A9DB4084F;
	Wed,  1 Jul 2026 20:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q0GUkZW-bsOl; Wed,  1 Jul 2026 20:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B5E40899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782936484;
	bh=kJyCS+5RR9QaKKVq9KruqsKngyuOZPh51rTH7JV5y6A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OMTHNSYBn3BpV62IqqS1fsi+rKSZr1mN+SZ9drE4eYd59lkhbE12t6E3O7M0GQgKA
	 NhuzfdGnKLNLOhzt8fP/cOcmYFfOkSwJ/iSzvaaZGA6x3B9Z7YY+fV37IQcNHbbD9Q
	 dVrgFCD8qWhXidOQQq6pcYYRheqbO3V1MQC9df3KKBEehr7ecbUFRKXnapmYhXAqdu
	 6gqbON1b1i8WwNOb5TXQ6Pz8OaTZlZa4+9+mLbP5xITD5Jo+oYZf5kUL4FmThtJwyr
	 zp8NeCNLfDlyfMMpiX8tB3grAu6xYciPlHDhWciGp7bqhVUwLD239NeQdVm1w7F7JT
	 xlqe442GAClAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B5E40899;
	Wed,  1 Jul 2026 20:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EE421127
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFE3561046
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MfjMjEhhG2oo for <buildroot@buildroot.org>;
 Wed,  1 Jul 2026 20:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD93F61043
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD93F61043
 for <buildroot@buildroot.org>; Wed,  1 Jul 2026 20:08:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58344879B3; Wed,  1 Jul 2026 20:07:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 Jul 2026 22:02:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bd4b9f434af91b088e527b90f1f01dca77f1557
X-Git-Newrev: 9f1c7f7db28595cc2ecc9345a296501a7797ba12
X-Patchwork-Hint: ignore
Message-Id: <20260701200733.58344879B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sigsum-c: bump version to 1.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f1c7f7db28595cc2ecc9345a296501a7797ba12
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This release now includes our local patch so we can drop it.

Changelog: https://git.glasklar.is/sigsum/core/sigsum-c/-/blob/v1.1.0/NEWS?ref_type=tags#L1-28

Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Make-command-line-tools-optional.patch    | 71 ----------------------
 package/sigsum-c/sigsum-c.hash                     |  2 +-
 package/sigsum-c/sigsum-c.mk                       |  2 +-
 3 files changed, 2 insertions(+), 73 deletions(-)

diff --git a/package/sigsum-c/0001-Make-command-line-tools-optional.patch b/package/sigsum-c/0001-Make-command-line-tools-optional.patch
deleted file mode 100644
index 3ce986b8bd..0000000000
--- a/package/sigsum-c/0001-Make-command-line-tools-optional.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 5c74c6d0dd2dd1707b178083815f3a165e3e7dc3 Mon Sep 17 00:00:00 2001
-From: Florian Larysch <fl@n621.de>
-Date: Fri, 22 May 2026 14:36:02 +0200
-Subject: [PATCH] Make command line tools optional
-
-When only using the sigsum-c library in another program, the
-dedicated sigsum-c-verify tool might be redundant.
-
-Allow disabling it to save space/avoid littering /bin.
-
-Upstream: https://git.glasklar.is/sigsum/core/sigsum-c/-/commit/5c74c6d0dd2dd1707b178083815f3a165e3e7dc3
-Signed-off-by: Florian Larysch <fl@n621.de>
----
- Makefile.in  |  4 ++--
- configure.ac | 11 +++++++++++
- 2 files changed, 13 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 0648adb..771551a 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -12,7 +12,7 @@ lib:
- tools: lib
- 	cd tools && $(MAKE) all
- 
--all:	lib @IF_PARSERS@ tools
-+all:	lib @IF_TOOLS@ tools
- 
- clean distclean:
- 	cd lib && $(MAKE) $@
-@@ -34,7 +34,7 @@ install-lib: lib
- install-tools: tools
- 	cd tools && $(MAKE) install
- 
--install: install-lib @IF_PARSERS@ install-tools
-+install: install-lib @IF_TOOLS@ install-tools
- 
- # Remake configure-generated files.
- # From the autoconf manual (4.8.5 Automatic Remaking)
-diff --git a/configure.ac b/configure.ac
-index 37a18b7..8305789 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -19,6 +19,16 @@ else
-    IF_PARSERS='#'
- fi
- 
-+AC_ARG_ENABLE(tools,
-+	AS_HELP_STRING([--disable-tools], [Do not build or install command-line tools.]),,
-+	[enable_tools="$enable_parsers"])
-+
-+if test "$enable_tools" = yes ; then
-+   IF_TOOLS=''
-+else
-+   IF_TOOLS='#'
-+fi
-+
- AC_ARG_ENABLE(static,
-   AS_HELP_STRING([--disable-static], [Do not build any static library]),,
-   [enable_static=yes])
-@@ -47,6 +57,7 @@ if test -z "$PIC_CFLAGS" ; then
- fi
- 
- AC_SUBST(IF_PARSERS)
-+AC_SUBST(IF_TOOLS)
- AC_SUBST(IF_STATIC)
- AC_SUBST(IF_SHARED)
- AC_SUBST(IF_NOT_SHARED)
--- 
-2.54.0
-
diff --git a/package/sigsum-c/sigsum-c.hash b/package/sigsum-c/sigsum-c.hash
index 5941eafc5d..4abfae3b9d 100644
--- a/package/sigsum-c/sigsum-c.hash
+++ b/package/sigsum-c/sigsum-c.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  147ab839b22c5584aa9982c912bdb629cc717dcd978528233889789544e5fe51  sigsum-c-v1.0.0-git4.tar.gz
+sha256  f0c4d070c4ffb417c65f3b376c6f8ce0b81d148dd1d4ce9964508f1b70bc9cb0  sigsum-c-v1.1.0-git4.tar.gz
 sha256  f592312f5d5756846c43becd06fc1d826eafe05b1b45f88e95af460d59d24ad0  LICENSE
diff --git a/package/sigsum-c/sigsum-c.mk b/package/sigsum-c/sigsum-c.mk
index a6021f0587..b7c8fb2b15 100644
--- a/package/sigsum-c/sigsum-c.mk
+++ b/package/sigsum-c/sigsum-c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SIGSUM_C_VERSION = v1.0.0
+SIGSUM_C_VERSION = v1.1.0
 SIGSUM_C_SITE = https://git.glasklar.is/sigsum/core/sigsum-c
 SIGSUM_C_SITE_METHOD = git
 SIGSUM_C_LICENSE = BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
