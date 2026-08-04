Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFEAC55ABA
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 21:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8807E607C3;
	Tue,  4 Aug 2026 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 68nf3akzZeyP; Tue,  4 Aug 2026 21:04:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C8396079F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785877447;
	bh=zRB226EHblzychU2XRWwdsYPsNu+6ysIkmMtDNoUaCw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jkCYvAekVhJZqyAuBq+mxkh7N2WE3YY68PTmD7mRndnYUkGfpgOlry6cq046IRXrD
	 lFoQG2bWHwIeTxvUY9fTFutEELUVfMYL7AO75QdCzdLDJsvSgO9xxucCSOpBOe/wA1
	 gakIO2u3Xf1BFB2OH4mzj46eu2jzFW67d0T4tmAwchXqxA83LGUh20jL5LbMOdzyx5
	 1T5fYehGi0wKoiNdL7XuvCy0oyrz+bkFXTl63eV8Y89QeODNNomIjzn25vnuLIfimW
	 JrLdpH4usS4ZZD8ZGu7TQGTbmKmurRrT2waBPDJgc7o3DLBdcydgqxAlbkq7P+QKmP
	 tmb9dGHSAH3ZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C8396079F;
	Tue,  4 Aug 2026 21:04:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACEEF270
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93E99401DD
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSotBouja2BF for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39902401DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39902401DF
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 21:04:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED4F98C56B; Tue,  4 Aug 2026 21:03:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Aug 2026 22:46:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 639353897d81ed87b5ae6c67c618a834e001efec
X-Git-Newrev: 3c323d714afbc772050fbf665d67700f9a869d79
X-Patchwork-Hint: ignore
Message-Id: <20260804210315.ED4F98C56B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-switch: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3c323d714afbc772050fbf665d67700f9a869d79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See here for a description:
https://metacpan.org/pod/Switch

Signed-off-by: Deividas Puplauskas <deividas.puplauskas@gmail.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/perl-switch/Config.in        |  7 +++++++
 package/perl-switch/perl-switch.hash |  6 ++++++
 package/perl-switch/perl-switch.mk   | 14 ++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index eb949bf0f1..56dd9f3943 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3444,6 +3444,7 @@ F:	package/perl-cgi/
 F:	package/perl-cgi-session/
 F:	package/perl-log-message/
 F:	package/perl-log-message-simple/
+F:	package/perl-switch/
 F:	package/ruby/
 F:	package/uclibc/
 F:	package/uclibc-ng-test/
diff --git a/package/Config.in b/package/Config.in
index 99d5b0e3b9..2e845f98db 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -917,6 +917,7 @@ menu "Perl libraries/modules"
 	source "package/perl-sub-exporter-progressive/Config.in"
 	source "package/perl-sub-install/Config.in"
 	source "package/perl-sub-quote/Config.in"
+	source "package/perl-switch/Config.in"
 	source "package/perl-sys-cpu/Config.in"
 	source "package/perl-sys-meminfo/Config.in"
 	source "package/perl-sys-mmap/Config.in"
diff --git a/package/perl-switch/Config.in b/package/perl-switch/Config.in
new file mode 100644
index 0000000000..1aee9ea13d
--- /dev/null
+++ b/package/perl-switch/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PERL_SWITCH
+	bool "perl-switch"
+	help
+	  A switch statement for Perl, do not use if you can use
+	  given/when.
+
+	  https://metacpan.org/release/Switch
diff --git a/package/perl-switch/perl-switch.hash b/package/perl-switch/perl-switch.hash
new file mode 100644
index 0000000000..41c29b00f1
--- /dev/null
+++ b/package/perl-switch/perl-switch.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  34e2b6dac0a43384505b4e036633cff0  Switch-2.17.tar.gz
+sha256  31354975140fe6235ac130a109496491ad33dd42f9c62189e23f49f75f936d75  Switch-2.17.tar.gz
+
+# computed by scancpan
+sha256  a2fa55566d0d94278ba43480b8f1bfa93f51e56088000a058ca34bd3a89893d7  README
diff --git a/package/perl-switch/perl-switch.mk b/package/perl-switch/perl-switch.mk
new file mode 100644
index 0000000000..e09f4d3c7d
--- /dev/null
+++ b/package/perl-switch/perl-switch.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-switch
+#
+################################################################################
+
+PERL_SWITCH_VERSION = 2.17
+PERL_SWITCH_SOURCE = Switch-$(PERL_SWITCH_VERSION).tar.gz
+PERL_SWITCH_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CH/CHORNY
+PERL_SWITCH_LICENSE = Artistic or GPL-1.0+
+PERL_SWITCH_LICENSE_FILES = README
+PERL_SWITCH_DISTNAME = Switch
+
+$(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
