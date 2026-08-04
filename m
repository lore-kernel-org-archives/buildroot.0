Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFEBC55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4846B605EB;
	Tue,  4 Aug 2026 21:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4bdUFJSCXTd; Tue,  4 Aug 2026 21:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BE5C6061A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877443;
	bh=AD5lJgGzsnfzJHQNbkZ3IJxz0RpGmuyjctFPChBs2iE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KFz/qDyH7KZGiYCFYMttLOpG1trEtpFEB7rE2a4VI2DW/R7hOKuUQwTSNqwl2VJJ+
	 CXbQ8HJygY71+qIresAbSgCovAec1dlX+4xERk+b81t6q99cOBtrYD75sWwnwqdyKp
	 wuVOLjPn5nkqzrFKbZ1jcjpYUdFrhIh81IDunDc5E/xHUFFfEdqMEZgUQ0GIQIbP9k
	 T1N9Hdjot8ZxMyBUYyE27lz0BT8vJg9hovMp1m+2bNO7kiQzongHSk46syY9fHBbGn
	 eg3tANYVfTWGt6HLUdZKVFqxYBpVQDFOqp9ENa4WAXA5SMrHraUewKflb9b62VjqL6
	 MJvypZNw+RUOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BE5C6061A;
	Tue,  4 Aug 2026 21:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D83270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDBBA401E0
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VK9aNFQcNANp for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D3F4401DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3F4401DD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CADCD8C56B; Tue,  4 Aug 2026 21:03:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:44:39 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35d3927e85645d0dbfe608bd5954bfa6704200e8
X-Git-Newrev: 7b822ef5009bbed5760f6317d5627cc337cc957c
X-Patchwork-Hint: ignore
Message-Id: <20260804210315.CADCD8C56B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-cgi-session: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b822ef5009bbed5760f6317d5627cc337cc957c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a description:
https://metacpan.org/pod/CGI::Session

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/perl-cgi-session/Config.in                 | 11 +++++++
 package/perl-cgi-session/perl-cgi-session.hash     |  6 ++++
 package/perl-cgi-session/perl-cgi-session.mk       | 15 ++++++++++
 .../testing/tests/package/test_perl_cgi_session.py | 34 ++++++++++++++++++++++
 6 files changed, 68 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f85eac9798..984f946786 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3441,6 +3441,7 @@ F:	package/fbv/
 F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/perl-cgi/
+F:	package/perl-cgi-session/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 9be569fe0a..2207e6c481 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -815,6 +815,7 @@ menu "Perl libraries/modules"
 	source "package/perl-appconfig/Config.in"
 	source "package/perl-astro-suntime/Config.in"
 	source "package/perl-cgi/Config.in"
+	source "package/perl-cgi-session/Config.in"
 	source "package/perl-class-inspector/Config.in"
 	source "package/perl-class-load/Config.in"
 	source "package/perl-class-method-modifiers/Config.in"
diff --git a/package/perl-cgi-session/Config.in b/package/perl-cgi-session/Config.in
new file mode 100644
index 0000000000..42559cb2b3
--- /dev/null
+++ b/package/perl-cgi-session/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PERL_CGI_SESSION
+	bool "perl-cgi-session"
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_PERL_CGI # runtime
+	help
+	  Persistent session data in CGI applications.
+
+	  https://metacpan.org/release/CGI-Session
+
+comment "perl-cgi-session needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-cgi-session/perl-cgi-session.hash b/package/perl-cgi-session/perl-cgi-session.hash
new file mode 100644
index 0000000000..1c5b7d2541
--- /dev/null
+++ b/package/perl-cgi-session/perl-cgi-session.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  7f8983aaeb92a0ba77eca8bca6d8d43a  CGI-Session-4.48.tar.gz
+sha256  46756461c24ce7666b8108ddb96dbab612699df3012c80ef11016619fe1554f7  CGI-Session-4.48.tar.gz
+
+# computed by scancpan
+sha256  b9e52465669f1fc29b38ffbc4f39425654611982cbee971aef07f3070446ab28  README
diff --git a/package/perl-cgi-session/perl-cgi-session.mk b/package/perl-cgi-session/perl-cgi-session.mk
new file mode 100644
index 0000000000..bd9f6ccb93
--- /dev/null
+++ b/package/perl-cgi-session/perl-cgi-session.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# perl-cgi-session
+#
+################################################################################
+
+PERL_CGI_SESSION_VERSION = 4.48
+PERL_CGI_SESSION_SOURCE = CGI-Session-$(PERL_CGI_SESSION_VERSION).tar.gz
+PERL_CGI_SESSION_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MA/MARKSTOS
+PERL_CGI_SESSION_DEPENDENCIES = host-perl-module-build
+PERL_CGI_SESSION_LICENSE = Artistic-1.0
+PERL_CGI_SESSION_LICENSE_FILES = README
+PERL_CGI_SESSION_DISTNAME = CGI-Session
+
+$(eval $(perl-package))
diff --git a/support/testing/tests/package/test_perl_cgi_session.py b/support/testing/tests/package/test_perl_cgi_session.py
new file mode 100644
index 0000000000..ad722b008e
--- /dev/null
+++ b/support/testing/tests/package/test_perl_cgi_session.py
@@ -0,0 +1,34 @@
+from tests.package.test_perl import TestPerlBase
+
+
+class TestPerlCGISession(TestPerlBase):
+    """
+    package:
+        CGI-Session
+    direct dependencies:
+        CGI
+    indirect dependencies:
+        Clone   XS
+        Encode-Locale
+        HTML-Parser   XS
+        HTML-Tagset
+        HTTP-Date
+        HTTP-Message
+        IO-HTML
+        LWP-MediaTypes
+        MIME-Base32
+        TimeDate
+        URI
+    """
+
+    config = TestPerlBase.config + \
+        """
+        BR2_PACKAGE_PERL=y
+        BR2_PACKAGE_PERL_CGI_SESSION=y
+        """
+
+    def test_run(self):
+        self.login()
+        self.module_test("Clone")
+        self.module_test("HTML::Parser")
+        self.module_test("CGI::Session")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
