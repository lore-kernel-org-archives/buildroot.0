Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A822C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD8A27025C;
	Tue, 21 Feb 2023 02:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD8A27025C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umBlHwZUyfra; Tue, 21 Feb 2023 02:03:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4D4A7011E;
	Tue, 21 Feb 2023 02:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4D4A7011E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F1EE1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7DAE70040
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DAE70040
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCvkWxiHIMzU for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A17CC7001F
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A17CC7001F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FD3C828C8; Mon, 20 Feb 2023 20:53:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Feb 2023 14:47:44 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d
X-Git-Newrev: 4ced0a528ddbffcc130997aaeee7598c82c6cd49
X-Patchwork-Hint: ignore
Message-Id: <20230220205301.9FD3C828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5speech: new
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4ced0a528ddbffcc130997aaeee7598c82c6cd49
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/qt5/Config.in                |  1 +
 package/qt5/qt5speech/Config.in      | 12 ++++++++++++
 package/qt5/qt5speech/qt5speech.hash |  7 +++++++
 package/qt5/qt5speech/qt5speech.mk   | 23 +++++++++++++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 319ea9f4dc..a429f81cc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2299,6 +2299,7 @@ F:	support/testing/tests/package/test_docker_compose.py
 
 N:	Peter Seiderer <ps.report@gmx.net>
 F:	package/dotconf/
+F:	package/qt5/qt5speech/
 F:	package/speechd/
 
 N:	Peter Thompson <peter.macleod.thompson@gmail.com>
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 6dc9cfa148..f1b16ff39b 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -59,6 +59,7 @@ source "package/qt5/qt5scxml/Config.in"
 source "package/qt5/qt5sensors/Config.in"
 source "package/qt5/qt5serialbus/Config.in"
 source "package/qt5/qt5serialport/Config.in"
+source "package/qt5/qt5speech/Config.in"
 source "package/qt5/qt5svg/Config.in"
 source "package/qt5/qt5tools/Config.in"
 source "package/qt5/qt5virtualkeyboard/Config.in"
diff --git a/package/qt5/qt5speech/Config.in b/package/qt5/qt5speech/Config.in
new file mode 100644
index 0000000000..cebd06057e
--- /dev/null
+++ b/package/qt5/qt5speech/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_QT5SPEECH
+	bool "qt5speech"
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qt Speech enables support for accessibility features such as
+	  text-to-speech.
+
+	  For output optional enable flite or speechd.
+
+	  https://doc.qt.io/qt-5/qtspeech-index.html
diff --git a/package/qt5/qt5speech/qt5speech.hash b/package/qt5/qt5speech/qt5speech.hash
new file mode 100644
index 0000000000..595aac9f22
--- /dev/null
+++ b/package/qt5/qt5speech/qt5speech.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  6d0794ab9d5286d04fbac2db44c00ed3306e569c876f84cfd91ac0e79c834b1e  qtspeech-d32f4a479d38a11f547598004b975f4356424a16.tar.bz2
+
+# Hashes for license files:
+sha256  6c3f3c31b93985f1b93bfbb35fb609d37281697d0efc220c9f91cf4b59eaabde  LICENSE.GPLv2
+sha256  75d800e60c8d58c2e7f0338e8552ea6123a9ce7e5dd8e1cdf2095e013b737488  LICENSE.LGPLv3
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5speech/qt5speech.mk b/package/qt5/qt5speech/qt5speech.mk
new file mode 100644
index 0000000000..8cf6fe19c1
--- /dev/null
+++ b/package/qt5/qt5speech/qt5speech.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# qt5speech
+#
+################################################################################
+
+QT5SPEECH_VERSION = d32f4a479d38a11f547598004b975f4356424a16
+QT5SPEECH_SITE = $(QT5_SITE)/qtspeech/-/archive/$(QT5SPEECH_VERSION)
+QT5SPEECH_SOURCE = qtspeech-$(QT5SPEECH_VERSION).tar.bz2
+QT5SPEECH_INSTALL_STAGING = YES
+QT5SPEECH_LICENSE = GPL-2.0+ or LGPL-3.0, GFDL-1.3 (docs)
+QT5SPEECH_LICENSE_FILES = LICENSE.GPLv2 LICENSE.LGPLv3 LICENSE.FDL
+QT5SPEECH_SYNC_QT_HEADERS = YES
+
+ifeq ($(BR2_PACKAGE_FLITE),y)
+QT5SPEECH_DEPENDENCIES += flite
+endif
+
+ifeq ($(BR2_PACKAGE_SPEECHD),y)
+QT5SPEECH_DEPENDENCIES += speechd
+endif
+
+$(eval $(qmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
