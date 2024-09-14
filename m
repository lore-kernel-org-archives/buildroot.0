Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257BAC02189
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E058A840AA;
	Sat, 14 Sep 2024 09:29:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ia1MjiRoJlXZ; Sat, 14 Sep 2024 09:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D0553846D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0553846D4;
	Sat, 14 Sep 2024 09:29:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 756661BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 63E06846D4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdRseTclaiso for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:29:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82F1B846B0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82F1B846B0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79CF78118C; Sat, 14 Sep 2024 09:29:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:28:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17642f50323041e4f9fa0cb1d6f703e646ee4548
X-Git-Newrev: d90c669777ebe48eb9ea180e962a8adffc031f91
X-Patchwork-Hint: ignore
Message-Id: <20240914092913.79CF78118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/perl-mime-base32: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d90c669777ebe48eb9ea180e962a8adffc031f91
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                              |  1 +
 package/perl-mime-base32/Config.in             |  6 ++++++
 package/perl-mime-base32/perl-mime-base32.hash |  8 ++++++++
 package/perl-mime-base32/perl-mime-base32.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 40b20201a0..599e3e9c3f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -888,6 +888,7 @@ menu "Perl libraries/modules"
 	source "package/perl-mailtools/Config.in"
 	source "package/perl-math-int64/Config.in"
 	source "package/perl-math-prime-util/Config.in"
+	source "package/perl-mime-base32/Config.in"
 	source "package/perl-mime-base64-urlsafe/Config.in"
 	source "package/perl-mime-tools/Config.in"
 	source "package/perl-module-implementation/Config.in"
diff --git a/package/perl-mime-base32/Config.in b/package/perl-mime-base32/Config.in
new file mode 100644
index 0000000000..e05b96557a
--- /dev/null
+++ b/package/perl-mime-base32/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PERL_MIME_BASE32
+	bool "perl-mime-base32"
+	help
+	  Base32 encoder and decoder.
+
+	  https://metacpan.org/release/MIME-Base32
diff --git a/package/perl-mime-base32/perl-mime-base32.hash b/package/perl-mime-base32/perl-mime-base32.hash
new file mode 100644
index 0000000000..a01e405bef
--- /dev/null
+++ b/package/perl-mime-base32/perl-mime-base32.hash
@@ -0,0 +1,8 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  0c7735fa09e74c7f2ec93d1890b8c6c0  MIME-Base32-1.303.tar.gz
+sha256  ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99  MIME-Base32-1.303.tar.gz
+
+# computed by scancpan
+sha256  08c2ed7589aff3b2076b48b792078d3479c2295559ee7bc4615e93abe0473939  ARTISTIC-1.0
+sha256  3d2fb9b42d1134f39c2e990d66b5e9b77005663fe956db526cc380eb3d9a77d8  GPL-1
+sha256  834c4ebff45be11f35f059b077fdd747dee4b8a747b95049d849fef1c0ccdc62  LICENSE
diff --git a/package/perl-mime-base32/perl-mime-base32.mk b/package/perl-mime-base32/perl-mime-base32.mk
new file mode 100644
index 0000000000..5c5272fe1b
--- /dev/null
+++ b/package/perl-mime-base32/perl-mime-base32.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-mime-base32
+#
+################################################################################
+
+PERL_MIME_BASE32_VERSION = 1.303
+PERL_MIME_BASE32_SOURCE = MIME-Base32-$(PERL_MIME_BASE32_VERSION).tar.gz
+PERL_MIME_BASE32_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RE/REHSACK
+PERL_MIME_BASE32_LICENSE = Artistic or GPL-1.0+
+PERL_MIME_BASE32_LICENSE_FILES = ARTISTIC-1.0 GPL-1 LICENSE
+PERL_MIME_BASE32_DISTNAME = MIME-Base32
+
+$(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
