Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF92C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 09:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B64AE40350;
	Sun,  9 Jan 2022 09:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1JP8tnvvFdA; Sun,  9 Jan 2022 09:01:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C7F402C5;
	Sun,  9 Jan 2022 09:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D97321BF3AD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C81AA402C5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 09:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiJR6i21DOa8 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 09:00:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF1A40275
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 09:00:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D6F6E8269E; Sun,  9 Jan 2022 08:54:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 09:58:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 787f7b58a7fb7c68e1f54573b6c0a29defdc5dcb
X-Git-Newrev: 32ecd0242de75a1c01e295d30f78f155a8da1d17
X-Patchwork-Hint: ignore
Message-Id: <20220109085442.D6F6E8269E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/simple-mail: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=32ecd0242de75a1c01e295d30f78f155a8da1d17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
[Thomas:
- bump to 2.3.0
- don't build demos, they need QtWidgets]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/simple-mail/Config.in        |  9 +++++++++
 package/simple-mail/simple-mail.hash |  5 +++++
 package/simple-mail/simple-mail.mk   | 15 +++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3b544cae6b..ed65c74319 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3017,4 +3017,5 @@ F:	package/python-iniparse/
 F:	package/qjson/
 F:	package/quazip/
 F:	package/shapelib/
+F:	package/simple-mail/
 F:	package/tinc/
diff --git a/package/Config.in b/package/Config.in
index 378d6e8c0c..2d3ca6a3b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,7 @@ comment "QT libraries and helper libraries"
 	source "package/qjson/Config.in"
 	source "package/quazip/Config.in"
 	source "package/qwt/Config.in"
+	source "package/simple-mail/Config.in"
 endif
 	source "package/tekui/Config.in"
 	source "package/weston/Config.in"
diff --git a/package/simple-mail/Config.in b/package/simple-mail/Config.in
new file mode 100644
index 0000000000..681a8410db
--- /dev/null
+++ b/package/simple-mail/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_SIMPLE_MAIL
+	bool "simple-mail"
+	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT5BASE_NETWORK
+	select BR2_PACKAGE_OPENSSL
+	help
+	  An SMTP library written in C++ for Qt.
+
+	  https://github.com/cutelyst/simple-mail
diff --git a/package/simple-mail/simple-mail.hash b/package/simple-mail/simple-mail.hash
new file mode 100644
index 0000000000..67d6caff87
--- /dev/null
+++ b/package/simple-mail/simple-mail.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  2026f2017662508b0f25da72694f1dd13ab3ccf82c0454f7c40f8a6cc450c410  simple-mail-2.3.0.tar.gz
+
+# Hash for license file
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
new file mode 100644
index 0000000000..68484f79b0
--- /dev/null
+++ b/package/simple-mail/simple-mail.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# simple-mail
+#
+################################################################################
+
+SIMPLE_MAIL_VERSION = 2.3.0
+SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
+SIMPLE_MAIL_INSTALL_STAGING = YES
+SIMPLE_MAIL_LICENSE = LGPL-2.1+
+SIMPLE_MAIL_LICENSE_FILES = LICENSE
+SIMPLE_MAIL_DEPENDENCIES = qt5base
+SIMPLE_MAIL_CONF_OPTS = -DBUILD_DEMOS=OFF
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
