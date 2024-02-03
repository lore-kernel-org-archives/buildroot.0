Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64103C4828D
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142BF40620;
	Sat,  3 Feb 2024 18:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 142BF40620
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yALkdSuOJYen; Sat,  3 Feb 2024 18:43:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA227405C3;
	Sat,  3 Feb 2024 18:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA227405C3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12F031BF33E
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:03:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D22382140
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 10:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PHrOJLYHtxDk for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 10:03:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 93AB282125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93AB282125
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93AB282125
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 10:03:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E1CA865AA; Sat,  3 Feb 2024 10:03:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 3 Feb 2024 11:02:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 62a5510c219e2b45fa6bb6c21b543d7a78c4fbdf
X-Git-Newrev: 7251775773011e7da38e3a33c6817eceab6a9dfa
X-Patchwork-Hint: ignore
Message-Id: <20240203100313.6E1CA865AA@busybox.osuosl.org>
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 spf=fail smtp.mailfrom=osuosl.org
Subject: [Buildroot] [git commit] package/libjwt: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=7251775773011e7da38e3a33c6817eceab6a9dfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

JSON Web Tokens are an open, industry standard RFC 7519
method for representing claims securely between two parties.

This Library is used by Asterisk 20.6.0 and newer.
We need to use autotools to install pkgconfig file.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Peter: drop _SOURCE, add host-pkgconf, add to DEVELOPERS]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libjwt/Config.in   |  9 +++++++++
 package/libjwt/libjwt.hash |  3 +++
 package/libjwt/libjwt.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cc9bc5b5cc..02b7516a92 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3116,6 +3116,7 @@ F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
 F:	package/asterisk/
+F:	package/libjwt/
 F:	package/mksh/
 F:	package/ruby/
 F:	package/uclibc/
diff --git a/package/Config.in b/package/Config.in
index 426bd7d090..75a94177eb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1846,6 +1846,7 @@ menu "JSON/XML"
 	source "package/libbson/Config.in"
 	source "package/libfastjson/Config.in"
 	source "package/libjson/Config.in"
+	source "package/libjwt/Config.in"
 	source "package/libroxml/Config.in"
 	source "package/libucl/Config.in"
 	source "package/libxml2/Config.in"
diff --git a/package/libjwt/Config.in b/package/libjwt/Config.in
new file mode 100644
index 0000000000..fa042d67ef
--- /dev/null
+++ b/package/libjwt/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBJWT
+	bool "libjwt"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_JANSSON
+	help
+	  JSON Web Tokens are an open, industry standard RFC 7519
+	  method for representing claims securely between two parties.
+
+	  https://github.com/benmcollins/libjwt
diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
new file mode 100644
index 0000000000..47e8b2c506
--- /dev/null
+++ b/package/libjwt/libjwt.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cb2fd95123689e7d209a3a8c060e02f68341c9a5ded524c0cd881a8cd20d711f  libjwt-1.15.3.tar.gz
+sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
new file mode 100644
index 0000000000..6ae1717b7d
--- /dev/null
+++ b/package/libjwt/libjwt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libjwt
+#
+################################################################################
+
+LIBJWT_VERSION = 1.15.3
+LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
+LIBJWT_DEPENDENCIES = host-pkgconf jansson openssl
+LIBJWT_AUTORECONF = YES
+LIBJWT_INSTALL_STAGING = YES
+LIBJWT_LICENSE = MPL-2.0
+LIBJWT_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
