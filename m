Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10097C55822
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7F3A607A6;
	Tue,  4 Aug 2026 21:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I8YjC4qoAkOp; Tue,  4 Aug 2026 21:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 689F16061A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877444;
	bh=DOIR0yyIkQL7vboP8KbcQIYNvLCa1cj5JwOlYuedI18=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LqjqWlCBImjTTW2+DDUri9f+apx0YbyphMeJE+uGOE6kKfvcF7JAPidg2RP33fwJm
	 vQLgDilfnf/0wnLDD2zxD42fQLADTUx36pfvztlK94S1ieWj3CVEGG7bxiYtR7CDrb
	 RkKfP5ra/WCNdXrjirCmkJAxTfl/Ry8btlIq96ltdtjs6fMvqtmc/w2w/BDYB6lk5Q
	 gyWZNKXVruZ0XVHnkqgNgZl33GJW7IpCTAtgt13tZi5FTRBcMCmxgSCZTeGKAXFOwO
	 psAFJi3afdowWeQ+29FGy3JAzrXYvLtiW/vUjigXIcqfnReJRuFcadPSLs2FXk0HAs
	 hC0XZiUJkDAdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 689F16061A;
	Tue,  4 Aug 2026 21:04:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 04BEB270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAC2F80C94
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bvclBAZr_es6 for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF0980C93
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF0980C93
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E144A8C584; Tue,  4 Aug 2026 21:03:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:45:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42bc2e2ac1a3f322c9aba08d8193d44fec6f5765
X-Git-Newrev: 639353897d81ed87b5ae6c67c618a834e001efec
X-Patchwork-Hint: ignore
Message-Id: <20260804210315.E144A8C584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-log-message-simple: new
 package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/639353897d81ed87b5ae6c67c618a834e001efec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a description:
https://metacpan.org/pod/Log::Message::Simple

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                                 |  1 +
 package/Config.in                                          |  1 +
 package/perl-log-message-simple/Config.in                  |  7 +++++++
 .../perl-log-message-simple/perl-log-message-simple.hash   |  6 ++++++
 package/perl-log-message-simple/perl-log-message-simple.mk | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cdb92d1a12..eb949bf0f1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3443,6 +3443,7 @@ F:	package/mksh/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
+F:	package/perl-log-message-simple/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 993d1c7b08..99d5b0e3b9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -878,6 +878,7 @@ menu "Perl libraries/modules"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-locale-maketext-lexicon/Config.in"
 	source "package/perl-log-message/Config.in"
+	source "package/perl-log-message-simple/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-lwp-protocol-https/Config.in"
 	source "package/perl-mail-dkim/Config.in"
diff --git a/package/perl-log-message-simple/Config.in b/package/perl-log-message-simple/Config.in
new file mode 100644
index 0000000000..498c0abb6b
--- /dev/null
+++ b/package/perl-log-message-simple/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_LOG_MESSAGE_SIMPLE
+	bool "perl-log-message-simple"
+	select BR2_PACKAGE_PERL_LOG_MESSAGE # runtime
+	help
+	  Simplified interface to Log::Message.
+
+	  https://metacpan.org/release/Log-Message-Simple
diff --git a/package/perl-log-message-simple/perl-log-message-simple.hash b/package/perl-log-message-simple/perl-log-message-simple.hash
new file mode 100644
index 0000000000..80264e47a7
--- /dev/null
+++ b/package/perl-log-message-simple/perl-log-message-simple.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0a0f9df6bc1148cc2aae4cb2882c0664  Log-Message-Simple-0.10.tar.gz
+sha256  aa12d1a4c0ac260b94d448fa01feba242a8a85cb6cbfdc66432e3b5b468add96  Log-Message-Simple-0.10.tar.gz
+
+# computed by scancpan
+sha256  f7dd6d58fbfe01f28775735bbfc48da1035ab3880eca872ba446ac5a55df9278  README
diff --git a/package/perl-log-message-simple/perl-log-message-simple.mk b/package/perl-log-message-simple/perl-log-message-simple.mk
new file mode 100644
index 0000000000..4aaae54d1f
--- /dev/null
+++ b/package/perl-log-message-simple/perl-log-message-simple.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-log-message-simple
+#
+################################################################################
+
+PERL_LOG_MESSAGE_SIMPLE_VERSION = 0.10
+PERL_LOG_MESSAGE_SIMPLE_SOURCE = Log-Message-Simple-$(PERL_LOG_MESSAGE_SIMPLE_VERSION).tar.gz
+PERL_LOG_MESSAGE_SIMPLE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BI/BINGOS
+PERL_LOG_MESSAGE_SIMPLE_LICENSE = Artistic or GPL-1.0+
+PERL_LOG_MESSAGE_SIMPLE_LICENSE_FILES = README
+PERL_LOG_MESSAGE_SIMPLE_DISTNAME = Log-Message-Simple
+
+$(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
