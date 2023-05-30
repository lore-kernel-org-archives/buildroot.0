Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6478AC7EE2F
	for <buildroot@archiver.kernel.org>; Tue, 30 May 2023 18:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7EE74016C;
	Tue, 30 May 2023 18:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7EE74016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zG30IMhlaKdC; Tue, 30 May 2023 18:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA280405F5;
	Tue, 30 May 2023 18:53:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA280405F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F21621BF966
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 18:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9088607F1
 for <buildroot@lists.busybox.net>; Tue, 30 May 2023 18:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9088607F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j07GhM3OlWgO for <buildroot@lists.busybox.net>;
 Tue, 30 May 2023 18:53:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E36CA60736
 for <buildroot@buildroot.org>; Tue, 30 May 2023 18:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36CA60736
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB5D086A7E; Tue, 30 May 2023 18:53:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 May 2023 20:51:04 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 42448495973b06225253b52e0cbc3cfb9188f39b
X-Git-Newrev: 5250b33c7b0cbcefcc43a67c204767f5f46e0d49
X-Patchwork-Hint: ignore
Message-Id: <20230530185341.CB5D086A7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/perl-clone: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5250b33c7b0cbcefcc43a67c204767f5f46e0d49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

perl-clone is a new mandatory dependency of perl-http-message v6.44
that is already available in Buildroot since commit [1].

[1] 79e8aad721099eb05e60b449432136691275022f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0ac6713cee7e683b08234df14fff652cfbfef91b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                  |  1 +
 package/perl-clone/Config.in       | 10 ++++++++++
 package/perl-clone/perl-clone.hash |  6 ++++++
 package/perl-clone/perl-clone.mk   | 14 ++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index c7bb52d278..4da083d35f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -796,6 +796,7 @@ menu "Perl libraries/modules"
 	source "package/perl-class-method-modifiers/Config.in"
 	source "package/perl-class-std/Config.in"
 	source "package/perl-class-std-fast/Config.in"
+	source "package/perl-clone/Config.in"
 	source "package/perl-convert-asn1/Config.in"
 	source "package/perl-cookie-baker/Config.in"
 	source "package/perl-crypt-blowfish/Config.in"
diff --git a/package/perl-clone/Config.in b/package/perl-clone/Config.in
new file mode 100644
index 0000000000..78f13dfe6b
--- /dev/null
+++ b/package/perl-clone/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PERL_CLONE
+	bool "perl-clone"
+	depends on !BR2_STATIC_LIBS
+	help
+	  recursively copy Perl datatypes.
+
+	  https://metacpan.org/release/Clone
+
+comment "perl-clone needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/perl-clone/perl-clone.hash b/package/perl-clone/perl-clone.hash
new file mode 100644
index 0000000000..7b69b97d06
--- /dev/null
+++ b/package/perl-clone/perl-clone.hash
@@ -0,0 +1,6 @@
+# retrieved by scancpan from https://cpan.metacpan.org/
+md5  cafa8984a2c2e005e54b27dd1e3f0afe  Clone-0.46.tar.gz
+sha256  aadeed5e4c8bd6bbdf68c0dd0066cb513e16ab9e5b4382dc4a0aafd55890697b  Clone-0.46.tar.gz
+
+# computed by scancpan
+sha256  40aa7eb133e97b075024380640528760a54aefc344781741ed02539a375db5ac  README.md
diff --git a/package/perl-clone/perl-clone.mk b/package/perl-clone/perl-clone.mk
new file mode 100644
index 0000000000..9e04329eab
--- /dev/null
+++ b/package/perl-clone/perl-clone.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# perl-clone
+#
+################################################################################
+
+PERL_CLONE_VERSION = 0.46
+PERL_CLONE_SOURCE = Clone-$(PERL_CLONE_VERSION).tar.gz
+PERL_CLONE_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GARU
+PERL_CLONE_LICENSE = Artistic or GPL-1.0+
+PERL_CLONE_LICENSE_FILES = README.md
+PERL_CLONE_DISTNAME = Clone
+
+$(eval $(perl-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
