Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0147C561E6
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E10A406E0;
	Tue,  4 Aug 2026 21:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2YlLiESBO5RI; Tue,  4 Aug 2026 21:04:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92FA840733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877446;
	bh=03JSN83SoTqp/zZOANz7tOw/r6aBgLZ0MWyKLfg3Gcs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mOrmBGWu7NNAhJ2N1FD19IC4FjzbJAaF5tRgJVPWqDwNR7uTl0tynWeKRWNmtluaB
	 r1ECivUjCN3Qd3vQvSharrsXNR8tMMEbjVcUU7gLJ1Kz5rVX/IPKioKbJO30RjtxET
	 Qj2hyLPRiuWy6OGhWhBoUKwQVIQs+9bYhlcgaH9yyyVM9DUl0z/nLW7bPhDHLalblE
	 jUgvJ1PufGJIABg99uSl0PzL+TH4nNvsbbeggZrPORg4KtgVez14A23hNVjIMRvGXM
	 GA8mCixrQJ9ZWfstFswAt6j85sLfsjZ6MzcwWujCnR+I7kSrE1//Ewy5o1r07nYxY5
	 4jKON/4gZ/ojw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92FA840733;
	Tue,  4 Aug 2026 21:04:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E6CC3DF
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 00DE8401DD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lnh4h4IQcupD for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A93401DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16A93401DE
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5C378C581; Tue,  4 Aug 2026 21:03:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:45:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b822ef5009bbed5760f6317d5627cc337cc957c
X-Git-Newrev: 42bc2e2ac1a3f322c9aba08d8193d44fec6f5765
X-Patchwork-Hint: ignore
Message-Id: <20260804210315.D5C378C581@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-log-message: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42bc2e2ac1a3f322c9aba08d8193d44fec6f5765
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a description:
https://metacpan.org/pod/Log::Message

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/perl-log-message/Config.in             |  6 ++++++
 package/perl-log-message/perl-log-message.hash |  6 ++++++
 package/perl-log-message/perl-log-message.mk   | 14 ++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 984f946786..cdb92d1a12 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3442,6 +3442,7 @@ F:	package/libpam-pkcs11/
 F:	package/mksh/
 F:	package/perl-cgi/
 F:	package/perl-cgi-session/
+F:	package/perl-log-message/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 2207e6c481..993d1c7b08 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -877,6 +877,7 @@ menu "Perl libraries/modules"
 	source "package/perl-json-tiny/Config.in"
 	source "package/perl-libwww-perl/Config.in"
 	source "package/perl-locale-maketext-lexicon/Config.in"
+	source "package/perl-log-message/Config.in"
 	source "package/perl-lwp-mediatypes/Config.in"
 	source "package/perl-lwp-protocol-https/Config.in"
 	source "package/perl-mail-dkim/Config.in"
diff --git a/package/perl-log-message/Config.in b/package/perl-log-message/Config.in
new file mode 100644
index 0000000000..4834117afd
--- /dev/null
+++ b/package/perl-log-message/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_LOG_MESSAGE
+	bool "perl-log-message"
+	help
+	  Powerful and flexible message logging mechanism.
+
+	  https://metacpan.org/release/Log-Message
diff --git a/package/perl-log-message/perl-log-message.hash b/package/perl-log-message/perl-log-message.hash
new file mode 100644
index 0000000000..7024d994e2
--- /dev/null
+++ b/package/perl-log-message/perl-log-message.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  406fe7d1e37980afa105b663c436c4af  Log-Message-0.08.tar.gz
+sha256  bd697dd62aaf26d118e9f0a0813429deb1c544e4501559879b61fcbdfe99fe46  Log-Message-0.08.tar.gz
+
+# computed by scancpan
+sha256  88ba1a4e4836eb179a5c93ba34d9549024b2c7cae923b6e8263df8f525f168cd  README
diff --git a/package/perl-log-message/perl-log-message.mk b/package/perl-log-message/perl-log-message.mk
new file mode 100644
index 0000000000..f4018e4cf2
--- /dev/null
+++ b/package/perl-log-message/perl-log-message.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-log-message
+#
+################################################################################
+
+PERL_LOG_MESSAGE_VERSION = 0.08
+PERL_LOG_MESSAGE_SOURCE = Log-Message-$(PERL_LOG_MESSAGE_VERSION).tar.gz
+PERL_LOG_MESSAGE_SITE = $(BR2_CPAN_MIRROR)/authors/id/B/BI/BINGOS
+PERL_LOG_MESSAGE_LICENSE = Artistic or GPL-1.0+
+PERL_LOG_MESSAGE_LICENSE_FILES = README
+PERL_LOG_MESSAGE_DISTNAME = Log-Message
+
+$(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
