Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E88DCDB47E
	for <buildroot@archiver.kernel.org>; Sun, 15 Oct 2023 18:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4577402BC;
	Sun, 15 Oct 2023 18:53:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4577402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zv1U7iwHsLWU; Sun, 15 Oct 2023 18:53:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80A9341497;
	Sun, 15 Oct 2023 18:53:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80A9341497
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD8CD1BF83A
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9433E6117D
 for <buildroot@lists.busybox.net>; Sun, 15 Oct 2023 18:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9433E6117D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tBV0mKnZKlwY for <buildroot@lists.busybox.net>;
 Sun, 15 Oct 2023 18:53:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67A3361173
 for <buildroot@buildroot.org>; Sun, 15 Oct 2023 18:53:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A3361173
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 474B085638; Sun, 15 Oct 2023 18:53:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Oct 2023 20:33:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25e60fbe1cabb678952330a8d8d48efe7f8e5048
X-Git-Newrev: 0aaeae26f69be2e3e0586dbb6d7243e229239f25
X-Patchwork-Hint: ignore
Message-Id: <20231015185349.474B085638@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cutekeyboard: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0aaeae26f69be2e3e0586dbb6d7243e229239f25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CuteKeyboard is a Qt virtual keyboard plugin for embedded applications

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Acked-by: Andrea Ricchi <andrea.ricchi@amarulasolutions.com>
[Arnout:
 - add DEVELOPERS entry;
 - fixed the title in the .mk file;
 - use select instead of depends on;
 - with the above, add depends on QT5 and QT5_JSCORE.
]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/cutekeyboard/Config.in         | 21 +++++++++++++++++++++
 package/cutekeyboard/cutekeyboard.hash |  3 +++
 package/cutekeyboard/cutekeyboard.mk   | 18 ++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3fffc4346c..01e9777be6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -183,6 +183,7 @@ F:	package/apparmor/
 F:	package/corkscrew/
 F:	package/cups/
 F:	package/cups-filters/
+F:	package/cutekeyboard/
 F:	package/fail2ban/
 F:	package/grep/
 F:	package/htpdate/
diff --git a/package/Config.in b/package/Config.in
index 009f7ba186..4e489c4706 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1589,6 +1589,7 @@ menu "Graphics"
 	source "package/cairomm/Config.in"
 	source "package/cairomm1_14/Config.in"
 	source "package/chipmunk/Config.in"
+	source "package/cutekeyboard/Config.in"
 	source "package/exempi/Config.in"
 	source "package/exiv2/Config.in"
 	source "package/fltk/Config.in"
diff --git a/package/cutekeyboard/Config.in b/package/cutekeyboard/Config.in
new file mode 100644
index 0000000000..bd661b0cd4
--- /dev/null
+++ b/package/cutekeyboard/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_CUTEKEYBOARD
+	bool "cutekeyboard"
+	depends on BR2_PACKAGE_QT5
+	depends on BR2_PACKAGE_QT5_JSCORE_AVAILABLE # qt5declarative
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	select BR2_PACKAGE_QT5QUICKCONTROLS2
+	help
+	  CuteKeyboard is a Qt virtual keyboard plugin for
+	  embedded applications.
+
+	  https://amarula.github.io/cutekeyboard/
+
+if BR2_PACKAGE_CUTEKEYBOARD
+
+config BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES
+	bool "cutekeyboard examples"
+	help
+	  Compile also application example
+
+endif
diff --git a/package/cutekeyboard/cutekeyboard.hash b/package/cutekeyboard/cutekeyboard.hash
new file mode 100644
index 0000000000..3d3ec2f858
--- /dev/null
+++ b/package/cutekeyboard/cutekeyboard.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  8cbaddc5fbf479d5e20fc88228e9af5928fa5e588052ee496c2f2efbe2afc510  cutekeyboard-afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7.tar.gz
+sha256  bdde6ec2ae2686623c0bb414bfb8bd731b314beff2264c602116ea60dd65964d  LICENSE
diff --git a/package/cutekeyboard/cutekeyboard.mk b/package/cutekeyboard/cutekeyboard.mk
new file mode 100644
index 0000000000..a7b3ba7a1d
--- /dev/null
+++ b/package/cutekeyboard/cutekeyboard.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# cutekeyboard
+#
+################################################################################
+
+CUTEKEYBOARD_VERSION = afacc3210b75d7e0de27dcc4c0f2bed0212cc4c7
+CUTEKEYBOARD_SITE = $(call github,amarula,cutekeyboard,$(CUTEKEYBOARD_VERSION))
+CUTEKEYBOARD_DEPENDENCIES = qt5declarative qt5quickcontrols2
+CUTEKEYBOARD_INSTALL_STAGING = YES
+CUTEKEYBOARD_LICENSE = MIT
+CUTEKEYBOARD_LICENSE_FILES = LICENSE
+
+ifeq ($(BR2_PACKAGE_CUTEKEYBOARD_EXAMPLES),y)
+CUTEKEYBOARD_CONF_OPTS += CONFIG+=BUILD_EXAMPLES
+endif
+
+$(eval $(qmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
