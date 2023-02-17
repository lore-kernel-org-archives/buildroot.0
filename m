Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27162C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6EC461153;
	Tue, 21 Feb 2023 00:58:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D6EC461153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MDFLC3oD-v-a; Tue, 21 Feb 2023 00:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D54D6114E;
	Tue, 21 Feb 2023 00:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D54D6114E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 978D31BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68D6B41809
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D6B41809
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h09fKG_98CtT for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89E804181A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 89E804181A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 876B48648F; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 14:28:47 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d00e437922fb1b611f35c3138b9fbf7bcff62757
X-Git-Newrev: 5336566668bd2ac9cd458a051eb6e8105d4b4544
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.876B48648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dotconf: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5336566668bd2ac9cd458a051eb6e8105d4b4544
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/dotconf/Config.in    |  6 ++++++
 package/dotconf/dotconf.hash |  3 +++
 package/dotconf/dotconf.mk   | 15 +++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f8451c7fec..b9d54feb46 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2297,6 +2297,9 @@ F:	package/wireguard-linux-compat/
 F:	package/wireguard-tools/
 F:	support/testing/tests/package/test_docker_compose.py
 
+N:	Peter Seiderer <ps.report@gmx.net>
+F:	package/dotconf/
+
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
 F:	package/sdl2_gfx/
 F:	package/sdl2_image/
diff --git a/package/Config.in b/package/Config.in
index 0af4adffa5..b2808cc6f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2019,6 +2019,7 @@ menu "Other"
 	source "package/cracklib/Config.in"
 	source "package/dawgdic/Config.in"
 	source "package/ding-libs/Config.in"
+	source "package/dotconf/Config.in"
 	source "package/double-conversion/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
diff --git a/package/dotconf/Config.in b/package/dotconf/Config.in
new file mode 100644
index 0000000000..21a74fa065
--- /dev/null
+++ b/package/dotconf/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_DOTCONF
+	bool "dotconf"
+	help
+	  Configuration file parser.
+
+	  https://github.com/williamh/dotconf
diff --git a/package/dotconf/dotconf.hash b/package/dotconf/dotconf.hash
new file mode 100644
index 0000000000..3233ea62c8
--- /dev/null
+++ b/package/dotconf/dotconf.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  7f1ecf40de1ad002a065a321582ed34f8c14242309c3547ad59710ae3c805653  dotconf-1.3.tar.gz
+sha256  a50cc98d5044a7bbddabe61fc0ec42aa671c73bf414d0c6b50da83ea8ae041c6  COPYING
diff --git a/package/dotconf/dotconf.mk b/package/dotconf/dotconf.mk
new file mode 100644
index 0000000000..26e78b3c7a
--- /dev/null
+++ b/package/dotconf/dotconf.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# dotconf
+#
+################################################################################
+
+DOTCONF_VERSION = 1.3
+DOTCONF_SITE = $(call github,williamh,dotconf,v$(DOTCONF_VERSION))
+DOTCONF_LICENSE = LGPL-2.1
+DOTCONF_LICENSE_FILES = COPYING
+DOTCONF_INSTALL_STAGING = YES
+# dotconf source code is released without configure script
+DOTCONF_AUTORECONF = YES
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
