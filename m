Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4865EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 20:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BFC4404AB;
	Fri, 14 Jul 2023 20:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BFC4404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1CarOHhMb3qf; Fri, 14 Jul 2023 20:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 399C0404B4;
	Fri, 14 Jul 2023 20:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 399C0404B4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87C531BF3EF
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 20:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60F73404AB
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 20:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60F73404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_gmIFRYRutr for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 20:54:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 357C5400D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 357C5400D1
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 20:54:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6FE5FA4C029A;
 Fri, 14 Jul 2023 22:54:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36612)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKPo7-0002J4-0O;
 Fri, 14 Jul 2023 22:54:31 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 22:54:31 +0200
Message-Id: <20230714205431.783961-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689368071;
 bh=cvBsKuHql1FhX0w0xA0pazcfCQH0E4gDeMpr71pG7QQ=;
 h=From:To:Cc:Subject:Date:From;
 b=SexD26vmYeLLfjHja2DpANmyPeissRelY1mwx+H/gF/zAYh4ZqSj9F9H5RYNdtfSu
 rlrgwcI35E5WoqBcQD38k9PB2FlY+rB3YPcPgHTkyTAfWuFcZSz9qU2NL8xsV+nb8y
 dU+LwWjYL5/9wr/h0v0JoQyCRjc42M3fp3OCKe+YyRmG0uwk0MnjBwTQuye2dcvXXT
 318QrSbblgwku7vHYoffnS1Mq9u+Q94V1F5W17PueOuCKlE/chirnr0IyHISZi9Xi4
 UZVvdsXMy46VoneBjj/iD1AL6+zhR2v+Q5XzsJeO5SndxqrfjitCpDK12H5BiLxhjS
 Y6ukz03qnTzCg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SexD26vm
Subject: [Buildroot] [PATCH 1/1] package/tovid: remove package
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
Cc: Steve Kenton <skenton@ou.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Build is broken:
"It seems that you are using `distutils.command.build` to add
new subcommands. Using `distutils` directly is considered deprecated,
please use `setuptools.command.build`.

By 2023-Dec-13, you need to update your project and remove deprecated
calls or your builds will no longer be supported."

The last commit for this package occured on May, 30th, 2016.
The last issue was opened Jan, 31st, 2017 and was unanswered.

Fixes:
http://autobuild.buildroot.net/results/b57/b571d7838950e0b5ca67106cbcd9ba61b4f04a48/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                 |  6 ++++
 DEVELOPERS                       |  1 -
 package/Config.in                |  1 -
 package/tovid/0001-manpage.patch | 25 ----------------
 package/tovid/Config.in          | 50 --------------------------------
 package/tovid/tovid.hash         |  3 --
 package/tovid/tovid.mk           | 13 ---------
 7 files changed, 6 insertions(+), 93 deletions(-)
 delete mode 100644 package/tovid/0001-manpage.patch
 delete mode 100644 package/tovid/Config.in
 delete mode 100644 package/tovid/tovid.hash
 delete mode 100644 package/tovid/tovid.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 9cf138f429..5c7e13fd5d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2023.08"
 
+config BR2_PACKAGE_TOVID
+	bool "tovid removed"
+	select BR2_LEGACY
+	help
+	  tovid was removed
+
 config BR2_PACKAGE_LIBASPLIB
 	bool "libasplib removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 1021e5c6ba..555d597b00 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2728,7 +2728,6 @@ F:	package/dvdauthor/
 F:	package/dvdrw-tools/
 F:	package/memtest86/
 F:	package/mjpegtools/
-F:	package/tovid/
 F:	package/udftools/
 F:	package/xorriso/
 
diff --git a/package/Config.in b/package/Config.in
index 3a7466d575..57d3646566 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -54,7 +54,6 @@ menu "Audio and video applications"
 	source "package/speechd/Config.in"
 	source "package/squeezelite/Config.in"
 	source "package/tinycompress/Config.in"
-	source "package/tovid/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
 	source "package/udpxy/Config.in"
diff --git a/package/tovid/0001-manpage.patch b/package/tovid/0001-manpage.patch
deleted file mode 100644
index 21669c9d55..0000000000
--- a/package/tovid/0001-manpage.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-setup.py: disable man page to kill txt2tags SVN checkout dependency
-
-Signed-off-by: Steve Kenton <skenton@ou.edu>
-
-+diff -pruN tovid-3534.ori/setup.py tovid-3534/setup.py
---- tovid-3534.ori/setup.py	2013-04-14 09:52:08.000000000 -0500
-+++ tovid-3534/setup.py	2015-03-21 09:39:14.880173176 -0500
-@@ -186,7 +186,7 @@ class BuildTovidInit (Command):
- 
- # Build tovid-init with regular 'build' command
- build.sub_commands.append(('build_tovid_init', None))
--build.sub_commands.append(('build_docs', None))
-+#build.sub_commands.append(('build_docs', None))
- 
- # The actual setup
- setup(
-@@ -244,8 +244,6 @@ setup(
-             'src/tovid.ini',
-         ]),
-         # Manual page
--        ('share/man/man1',
--         ['docs/man/tovid.1']),
-         # Desktop shortcut
-         ('share/applications',
-          ['tovidgui.desktop',
diff --git a/package/tovid/Config.in b/package/tovid/Config.in
deleted file mode 100644
index c263acdd62..0000000000
--- a/package/tovid/Config.in
+++ /dev/null
@@ -1,50 +0,0 @@
-config BR2_PACKAGE_TOVID
-	bool "tovid"
-	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mpv
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_PYTHON3
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mpv
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC # mpv
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mpv
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC # mpv
-	# The below dependencies are runtime dependencies only
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps_ng
-	select BR2_PACKAGE_DVDAUTHOR
-	select BR2_PACKAGE_DVDRW_TOOLS
-	select BR2_PACKAGE_FFMPEG
-	select BR2_PACKAGE_IMAGEMAGICK
-	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_MJPEGTOOLS
-	select BR2_PACKAGE_MPV
-	select BR2_PACKAGE_PROCPS_NG # pgrep and pkill
-	select BR2_PACKAGE_SOX
-	help
-	  The tovid suite, also known simply as tovid, is a collection
-	  of shell and Python scripts for creating DVDs and
-	  (S)VCDs. It is pronounced "to vid" (because it converts to
-	  video disc formats).
-
-	  http://tovid.wikia.com/wiki/Installing_tovid
-
-comment "tovid needs a toolchain w/ NPTL, C++, wchar, gcc >= 4.9"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
-		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_USE_WCHAR
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-
-comment "tovid depends on python3"
-	depends on !BR2_PACKAGE_PYTHON3
-	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
-	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
diff --git a/package/tovid/tovid.hash b/package/tovid/tovid.hash
deleted file mode 100644
index 430ea52c1b..0000000000
--- a/package/tovid/tovid.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  c03a746a3592a656bab0be4045da114a4231eb0f858d6c18503dac64049fbe48  tovid-87c676f4aadb7303d2cd921380b054bafa4b85bb.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/tovid/tovid.mk b/package/tovid/tovid.mk
deleted file mode 100644
index 4c5c60aa7f..0000000000
--- a/package/tovid/tovid.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# tovid
-#
-################################################################################
-
-TOVID_VERSION = 87c676f4aadb7303d2cd921380b054bafa4b85bb
-TOVID_SITE = $(call github,tovid-suite,tovid,$(TOVID_VERSION))
-TOVID_LICENSE = GPL-2.0+
-TOVID_LICENSE_FILES = COPYING
-TOVID_SETUP_TYPE = distutils
-
-$(eval $(python-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
