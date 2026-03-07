Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28EFFF55111
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 22:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB4FE41BBD;
	Sat,  7 Mar 2026 22:42:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M4cftETZmEc; Sat,  7 Mar 2026 22:42:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEB2E4193C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772923374;
	bh=np2SebnxLaSG4pAK3607kJeTBBLW1x6jMdM72tVgszI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XszIP3m8L8LT3mDLg76kyUbKsaJj0wu6xsJw7J1SkJsa9Kt0z14eZ1/kf+CcE98Oj
	 zK2ixGeiYkdLU+JuUOYWD7/9fAhldbe91vnpVhNKpWEklceLL+3W0266sbN+dyUBux
	 NpjSD4YnXPO0ATwvJ8T+TPEbWCPRa2Df+MntfjpeHOsm9zSqbrqSe5f03g9KY97g9C
	 iE4fLU5KwboxSIX3Wskcham/cV9PVsf1JzrQ6MdNH/VDbpl/eyMIOB0OuRgu4c5Cic
	 nBNU2/w6LdSthllH74A0a0cEx013RwwnTOwEC5SOciX9uAhBzI1O1mCzlkFc/b2JbX
	 NE5ENsY3foB7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEB2E4193C;
	Sat,  7 Mar 2026 22:42:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94058169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8577083C8F
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuwSw0qMA4-V for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 22:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C5C83C8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82C5C83C8D
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 22:42:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BC8C844F9; Sat,  7 Mar 2026 22:42:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 7 Mar 2026 23:39:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6019875dd2da189a8063130983e1dcd297de2e83
X-Git-Newrev: f983411b57a0be2c34b0b03a33a3750fa5b77c95
X-Patchwork-Hint: ignore
Message-Id: <20260307224251.8BC8C844F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ftxui: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f983411b57a0be2c34b0b03a33a3750fa5b77c95
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

FTXUI is a simple cross-platform C++ library for terminal
based user interfaces.

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
[Julien: remove FTXUI_SOURCE to use the default archive name]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/ftxui/Config.in  | 14 ++++++++++++++
 package/ftxui/ftxui.hash |  3 +++
 package/ftxui/ftxui.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 835be1f6a3..106510ea84 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1262,6 +1262,7 @@ F:	package/cctz/
 F:	package/clpeak/
 F:	package/faad2/
 F:	package/fdk-aac/
+F:	package/ftxui/
 F:	package/httping/
 F:	package/iozone/
 F:	package/leptonica/
diff --git a/package/Config.in b/package/Config.in
index 5c7ab57101..fab482c52f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2303,6 +2303,7 @@ menu "Text and terminal handling"
 	source "package/fcft/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
+	source "package/ftxui/Config.in"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
 	source "package/iniparser/Config.in"
diff --git a/package/ftxui/Config.in b/package/ftxui/Config.in
new file mode 100644
index 0000000000..88cd77e42e
--- /dev/null
+++ b/package/ftxui/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_FTXUI
+	bool "ftxui"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_WCHAR # std::wstring()
+	help
+	  FTXUI is a simple cross-platform C++ library
+	  for terminal based user interfaces
+
+	  https://arthursonzogni.github.io/FTXUI/
+
+comment "ftxui needs a toolchain w/ C++, wchar and threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
diff --git a/package/ftxui/ftxui.hash b/package/ftxui/ftxui.hash
new file mode 100644
index 0000000000..78ea321e0d
--- /dev/null
+++ b/package/ftxui/ftxui.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  45819c1e54914783d4a1ca5633885035d74146778a1f74e1213cdb7b76340e71  ftxui-6.1.9.tar.gz
+sha256  0224d97639ad37047d719a5ed5c0acc98de1c58ae63be0c27183dcad1328fc61  LICENSE
diff --git a/package/ftxui/ftxui.mk b/package/ftxui/ftxui.mk
new file mode 100644
index 0000000000..72d5c64236
--- /dev/null
+++ b/package/ftxui/ftxui.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# ftxui
+#
+################################################################################
+
+FTXUI_VERSION = 6.1.9
+FTXUI_SITE = $(call github,ArthurSonzogni,FTXUI,v$(FTXUI_VERSION))
+FTXUI_LICENSE = MIT
+FTXUI_LICENSE_FILES = LICENSE
+
+FTXUI_INSTALL_STAGING = YES
+
+FTXUI_CONF_OPTS = \
+	-DFTXUI_BUILD_DOCS=OFF \
+	-DFTXUI_BUILD_EXAMPLES=OFF \
+	-DFTXUI_BUILD_TESTS=OFF \
+	-DFTXUI_BUILD_TESTS_FUZZER=OFF \
+	-DFTXUI_CLANG_TIDY=OFF \
+	-DFTXUI_DEV_WARNINGS=OFF \
+	-DFTXUI_ENABLE_COVERAGE=OFF \
+	-DFTXUI_ENABLE_INSTALL=ON \
+	-DFTXUI_QUIET=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
