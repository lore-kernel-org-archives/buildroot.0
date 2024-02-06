Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D987FC48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 08:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F1140357;
	Tue,  6 Feb 2024 08:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93F1140357
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tkNYO40y6Asm; Tue,  6 Feb 2024 08:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DF740345;
	Tue,  6 Feb 2024 08:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DF740345
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39F281BF2BC
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1105A4032F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 08:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1105A4032F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xH3c8qbgOEeA for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 08:57:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15D0F40318
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 08:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D0F40318
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3E0586EEF; Tue,  6 Feb 2024 08:57:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 09:56:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 71d971fa3bba0528011b4c6419ebbdcd420cf493
X-Git-Newrev: 0a1f2fce0494388080af0a4130e62522c26fe4a9
X-Patchwork-Hint: ignore
Message-Id: <20240206085701.F3E0586EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rlwrap: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a1f2fce0494388080af0a4130e62522c26fe4a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Silva <dev@matt-silva.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/rlwrap/Config.in   | 42 ++++++++++++++++++++++++++++++++++++++++++
 package/rlwrap/rlwrap.hash |  6 ++++++
 package/rlwrap/rlwrap.mk   | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d3d2cdda8..c18ae46054 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2122,6 +2122,9 @@ F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
+N:	Matt Silva <dev@matt-silva.com>
+F:	package/rlwrap/
+
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
 F:	package/python-autobahn/
diff --git a/package/Config.in b/package/Config.in
index 7fc383da83..97f590e2b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2690,6 +2690,7 @@ comment "Utilities"
 	source "package/pinentry/Config.in"
 	source "package/qprint/Config.in"
 	source "package/ranger/Config.in"
+	source "package/rlwrap/Config.in"
 	source "package/rtty/Config.in"
 	source "package/screen/Config.in"
 	source "package/screenfetch/Config.in"
diff --git a/package/rlwrap/Config.in b/package/rlwrap/Config.in
new file mode 100644
index 0000000000..0cb3e33fa7
--- /dev/null
+++ b/package/rlwrap/Config.in
@@ -0,0 +1,42 @@
+config BR2_PACKAGE_RLWRAP
+	bool "rlwrap"
+	select BR2_PACKAGE_READLINE
+	help
+	  rlwrap is a 'readline wrapper', a small utility that uses the
+	  GNU Readline library to allow the editing of keyboard input
+	  for any command.
+
+	  https://github.com/hanslub42/rlwrap
+
+if BR2_PACKAGE_RLWRAP
+
+config BR2_PACKAGE_RLWRAP_SPY_ON_READLINE
+	bool "spy on readline"
+	default y
+	help
+	  If we want to keep the display tidy when re-sizing the
+	  terminal window or printing multi-line prompts, we have to
+	  know whether or not readline is in horizontal-scroll-mode
+	  (i.e. wheter long lines are scrolled or wrapped). At present,
+	  this involves a look at a private readline variable - if you
+	  feel guilty about that, disable this option
+
+config BR2_PACKAGE_RLWRAP_HOMEGROWN_REDISPLAY
+	bool "homegrown redisplay"
+	help
+	  Some people report double echoing of user input. Enabling this
+	  option will cure the problem - though the display will then
+	  flicker over slow connections (cf. BUGS)
+
+config BR2_PACKAGE_RLWRAP_MULTIBYTE_AWARE
+	bool "multibyte awareness"
+	default y
+	depends on BR2_USE_WCHAR
+	help
+	  Prevent rlwrap from seeing multibyte characters as multiple
+	  characters
+
+comment "rlwrap multibyte awareness needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
+
+endif
diff --git a/package/rlwrap/rlwrap.hash b/package/rlwrap/rlwrap.hash
new file mode 100644
index 0000000000..b7005e860e
--- /dev/null
+++ b/package/rlwrap/rlwrap.hash
@@ -0,0 +1,6 @@
+# from https://github.com/hanslub42/rlwrap/releases/tag/0.46.1
+sha256  2711986a1248f6ac59e2aecf5586205835970040d300a42b4bf8014397e73e37  rlwrap-0.46.1.tar.gz
+
+# license files, locally calculated
+sha256  656d25fab58016ac6ac11bb126709e4f860ea063d11795232eb55987172f78ff  AUTHORS
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/rlwrap/rlwrap.mk b/package/rlwrap/rlwrap.mk
new file mode 100644
index 0000000000..e3973e841b
--- /dev/null
+++ b/package/rlwrap/rlwrap.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# rlwrap
+#
+################################################################################
+
+RLWRAP_VERSION = 0.46.1
+RLWRAP_SITE = https://github.com/hanslub42/rlwrap/releases/download/$(RLWRAP_VERSION)
+RLWRAP_LICENSE = GPL-2.0+
+RLWRAP_LICENSE_FILES = AUTHORS COPYING
+
+RLWRAP_DEPENDENCIES = readline
+
+ifeq ($(BR2_PACKAGE_RLWRAP_SPY_ON_READLINE),y)
+RLWRAP_CONF_OPTS += --enable-spy-on-readline
+else
+RLWRAP_CONF_OPTS += --disable-spy-on-readline
+endif
+
+ifeq ($(BR2_PACKAGE_RLWRAP_HOMEGROWN_REDISPLAY),y)
+RLWRAP_CONF_OPTS += --enable-homegrown-redisplay
+else
+RLWRAP_CONF_OPTS += --disable-homegrown-redisplay
+endif
+
+ifeq ($(BR2_PACKAGE_RLWRAP_MULTIBYTE_AWARE),y)
+RLWRAP_CONF_OPTS += --enable-multibyte-aware
+else
+RLWRAP_CONF_OPTS += --disable-multibyte-aware
+endif
+
+define RLWRAP_REMOVE_FILTERS
+	$(RM) -rf $(TARGET_DIR)/usr/share/rlwrap/filters
+endef
+RLWRAP_POST_INSTALL_TARGET_HOOKS += RLWRAP_REMOVE_FILTERS
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
