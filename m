Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EECD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8484A85AAF;
	Tue,  9 Jun 2026 13:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJHu3ZWx7ENk; Tue,  9 Jun 2026 13:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2301B85A7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010220;
	bh=0NX7CHD90/aGJQ2Haar82moIHoZ2DF5x2sR2NVX/Gy4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CbAUzQVJjSPvw90bdXdzkWB3CZLhBlkl3igkWmuiJN46y1pUPxi3kQBA3Va6tXnnk
	 IqiBBpKSwYHIaASsVPTUyADffzYOGkAQ/mZG+7o2LmCgb6PaW1RTw9vT8kdKJp/aR3
	 tASNKewAchz7/JbsFZ2uNy14lAY3sIq9s/KKVnYGczzhNpbrDW3/HKzxdxyqtwS17O
	 Snnvxurts3TLgnF5LSHvmkr77R4b9edd8tzj8I6BqcgM3U1K2xdGYla5rLBzViOlPz
	 3oAPoajIIcOMDYaO3NtlHumBDkg058UYkJlCL1Mlh5MjaFYQtxIvAroVwoPVmN8d1h
	 UcvqUvgRiho5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2301B85A7E;
	Tue,  9 Jun 2026 13:03:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B5E1196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B27D4270D
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UrkhknUFV7Mz for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EED26426F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EED26426F6
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3673B87E7E; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:21:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd151e7a1096260e128ec6ea7e7fcc4fbfd8e32c
X-Git-Newrev: d5c28aa439b6b4774efaaf02ef53a58481006996
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.3673B87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-cgi: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5c28aa439b6b4774efaaf02ef53a58481006996
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a description:
https://metacpan.org/pod/CGI

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-cgi/Config.in                     | 12 ++++++++++
 package/perl-cgi/perl-cgi.hash                 |  6 +++++
 package/perl-cgi/perl-cgi.mk                   | 14 +++++++++++
 support/testing/tests/package/test_perl_cgi.py | 33 ++++++++++++++++++++++++++
 6 files changed, 67 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index fea3311076..28fe821a6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3437,6 +3437,7 @@ F:	package/evilwm/
 F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
+F:	package/perl-cgi/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 1c0f6d8a29..c4f279efbb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -814,6 +814,7 @@ menu "Perl libraries/modules"
 	source "package/perl-apache-logformat-compiler/Config.in"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
+	source "package/perl-cgi/Config.in"
 	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
 	source "package/perl-class-method-modifiers/Config.in"
diff --git a/package/perl-cgi/Config.in b/package/perl-cgi/Config.in
new file mode 100644
index 0000000000..1c4292483c
--- /dev/null
+++ b/package/perl-cgi/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PERL_CGI
+	bool "perl-cgi"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_HTML_PARSER # runtime
+	select BR2_PACKAGE_PERL_URI # runtime
+	help
+	  Handle Common Gateway Interface requests and responses.
+
+	  https://metacpan.org/module/CGI
+
+comment "perl-cgi needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-cgi/perl-cgi.hash b/package/perl-cgi/perl-cgi.hash
new file mode 100644
index 0000000000..fa4544493c
--- /dev/null
+++ b/package/perl-cgi/perl-cgi.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from http://cpan.metacpan.org/
+md5  ea0c7b5b002f100f23b11ac9487088a9  CGI-4.72.tar.gz
+sha256  babc1ca72db188083a1c3812debe88c4473b943b1f7c662281cd57c580a8bdd9  CGI-4.72.tar.gz
+
+# computed by scancpan
+sha256  55a4d9005df91f82cd19aab29c3ad64c1a2e2d69a069f76570ee679bedd6b351  LICENSE
diff --git a/package/perl-cgi/perl-cgi.mk b/package/perl-cgi/perl-cgi.mk
new file mode 100644
index 0000000000..ca6968125c
--- /dev/null
+++ b/package/perl-cgi/perl-cgi.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-cgi
+#
+################################################################################
+
+PERL_CGI_VERSION = 4.72
+PERL_CGI_SOURCE = CGI-$(PERL_CGI_VERSION).tar.gz
+PERL_CGI_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEEJO
+PERL_CGI_LICENSE = Artistic-2.0
+PERL_CGI_LICENSE_FILES = LICENSE
+PERL_CGI_DISTNAME = CGI
+
+$(eval $(perl-package))
diff --git a/support/testing/tests/package/test_perl_cgi.py b/support/testing/tests/package/test_perl_cgi.py
new file mode 100644
index 0000000000..a6657ba78d
--- /dev/null
+++ b/support/testing/tests/package/test_perl_cgi.py
@@ -0,0 +1,33 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlCGI(TestPerlBase):
+    """
+    package:
+        CGI
+    direct dependencies:
+        HTML-Parser   XS
+        URI
+    indirect dependencies:
+        Clone   XS
+        Encode-Locale
+        HTML-Tagset
+        HTTP-Date
+        HTTP-Message
+        IO-HTML
+        LWP-MediaTypes
+        MIME-Base32
+        TimeDate
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_CGI=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Clone")
+        self.module_test("HTML::Parser")
+        self.module_test("CGI")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
