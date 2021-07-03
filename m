Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F3EC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091AC61050
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 091AC61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D81FB423C2;
	Wed,  4 Aug 2021 00:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AO1McS6CVo0a; Wed,  4 Aug 2021 00:03:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18B86423E4;
	Wed,  4 Aug 2021 00:03:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06A1C1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E27DB40E59
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6j2tNFfYAC0s for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FB4A40697
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B7411860D3; Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 3 Jul 2021 22:12:47 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 1054a7aaa238253db8b60e4a520a66ad9e1b1eb1
X-Git-Newrev: 1b4aa6442abc299d19829670eaf69420f5e119cf
X-Patchwork-Hint: ignore
Message-Id: <20210803210958.B7411860D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libconfig: bump to
 version 1.7.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b4aa6442abc299d19829670eaf69420f5e119cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop patch (already in version)
- Use --disable-tests which is available since
  https://github.com/hyperrealm/libconfig/commit/7e2c1e6ac1f7c80a60c77bf1842edd112fe72188

https://github.com/hyperrealm/libconfig/releases/tag/v1.7.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../libconfig/0001-Add-disable-doc-option.patch    | 54 ----------------------
 package/libconfig/libconfig.hash                   |  2 +-
 package/libconfig/libconfig.mk                     |  8 ++--
 3 files changed, 4 insertions(+), 60 deletions(-)

diff --git a/package/libconfig/0001-Add-disable-doc-option.patch b/package/libconfig/0001-Add-disable-doc-option.patch
deleted file mode 100644
index ac323eba24..0000000000
--- a/package/libconfig/0001-Add-disable-doc-option.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From a0301bde126c2b08b50e789fd025a8c513c914c3 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 28 Apr 2018 19:15:22 +0200
-Subject: [PATCH] Add --disable-doc option
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile.am  |  6 +++++-
- configure.ac | 12 ++++++++++++
- 2 files changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 50ef4fa..e94d3ec 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,11 @@
- 
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = lib doc tinytest tests
-+SUBDIRS = lib tinytest tests
-+
-+if BUILDDOC
-+SUBDIRS += doc
-+endif
- 
- if BUILDEXAMPLES
- SUBDIRS += examples
-diff --git a/configure.ac b/configure.ac
-index 62c5c56..8a14855 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -99,6 +99,18 @@ docxx=yes
- 
- AM_CONDITIONAL(BUILDCXX, test x$docxx = xyes)
- 
-+dodoc=yes
-+
-+AC_ARG_ENABLE(doc,
-+AS_HELP_STRING([--disable-doc], [Disable building of the documentation]),
-+[if test "$enableval" = "no"; then dodoc="no"; fi],
-+[
-+dodoc=yes
-+]
-+)
-+
-+AM_CONDITIONAL(BUILDDOC, test x$dodoc = xyes)
-+
- doexamples=yes
- 
- AC_ARG_ENABLE(examples,
--- 
-2.14.1
-
diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index e056a17de3..d359301d6f 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  f67ac44099916ae260a6c9e290a90809e7d782d96cdd462cac656ebc5b685726  libconfig-1.7.2.tar.gz
+sha256  545166d6cac037744381d1e9cc5a5405094e7bfad16a411699bcff40bbb31ee7  libconfig-1.7.3.tar.gz
 sha256  d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f  COPYING.LIB
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index a127f9bcc8..6cdf603185 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.7.2
-LIBCONFIG_SITE = $(call github,hyperrealm,libconfig,v$(LIBCONFIG_VERSION))
+LIBCONFIG_VERSION = 1.7.3
+LIBCONFIG_SITE = https://github.com/hyperrealm/libconfig/releases/download/v$(LIBCONFIG_VERSION)
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
-# From git
-LIBCONFIG_AUTORECONF = YES
-LIBCONFIG_CONF_OPTS = --disable-examples
+LIBCONFIG_CONF_OPTS = --disable-examples --disable-tests
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
 LIBCONFIG_CONF_OPTS += --disable-cxx
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
