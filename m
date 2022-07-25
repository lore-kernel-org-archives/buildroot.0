Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29B6C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 07:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49FE0410B9;
	Mon, 25 Jul 2022 07:58:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49FE0410B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMVSBY1y2Jda; Mon, 25 Jul 2022 07:58:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D405E4091A;
	Mon, 25 Jul 2022 07:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D405E4091A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 679AF1BF85D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4267E83443
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 07:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4267E83443
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sbm6L3Rh4aTI for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 07:58:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ED7283409
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 07:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3ED7283409
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4839585CCB; Mon, 25 Jul 2022 07:44:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 09:58:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6e99c0bc6cd045cd451a1c186bae0bdd5c4a903
X-Git-Newrev: fa917d0ca96baf4ef877a80e57d438bfbb8cdf2d
X-Patchwork-Hint: ignore
Message-Id: <20220725074442.4839585CCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt5/qt5doc: add package with qt
 quick demos
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
Content-Type: multipart/mixed; boundary="===============4583683672782877581=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4583683672782877581==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fa917d0ca96baf4ef877a80e57d438bfbb8cdf2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since qt 5.12, quick demos are moved in the qt5doc package.
In order to use quick demos, qt5doc has to be built.
qt5doc is a bit misleading name for the package, while it's
basic content are the quick demos. qdoc tool itself is a part
of qt5tools.

The examples need to be enabled for this package to do anything (because
we don't build the docs themselves), so select it

Signed-off-by: Goran Rađenović <gradenovic@ultratronik.de>
[Arnout:
 - fix check-package warnings;
 - update to Jan 31 2022 version of kde/5.15 branch;
 - add select of BR2_PACKAGE_QT5BASE_EXAMPLES;
 - add hash for license file]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/Config.in          |  1 +
 package/qt5/qt5doc/Config.in   | 16 ++++++++++++++++
 package/qt5/qt5doc/qt5doc.hash |  3 +++
 package/qt5/qt5doc/qt5doc.mk   | 28 ++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 3052ab408b..6dc9cfa148 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -40,6 +40,7 @@ source "package/qt5/qt5charts/Config.in"
 source "package/qt5/qt5coap/Config.in"
 source "package/qt5/qt5connectivity/Config.in"
 source "package/qt5/qt5declarative/Config.in"
+source "package/qt5/qt5doc/Config.in"
 source "package/qt5/qt5enginio/Config.in"
 source "package/qt5/qt5graphicaleffects/Config.in"
 source "package/qt5/qt5imageformats/Config.in"
diff --git a/package/qt5/qt5doc/Config.in b/package/qt5/qt5doc/Config.in
new file mode 100644
index 0000000000..1ab5f8d333
--- /dev/null
+++ b/package/qt5/qt5doc/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_QT5DOC
+	bool "qt5doc (includes quick demos)"
+	select BR2_PACKAGE_QT5BASE_EXAMPLES
+	select BR2_PACKAGE_QT5DECLARATIVE
+	select BR2_PACKAGE_QT5DECLARATIVE_QUICK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  Qtdoc contains the main Qt Reference Documentation, which
+	  includes overviews, Qt topics, and examples not specific to
+	  any Qt module. The configuration files are located in
+	  qtdoc/doc/config and the articles in qtdoc/doc/src. Note that
+	  QDoc itself is located in qtbase.
+
+	  https://doc.qt.io/qt-5/overviews.html
diff --git a/package/qt5/qt5doc/qt5doc.hash b/package/qt5/qt5doc/qt5doc.hash
new file mode 100644
index 0000000000..ec84ecdcb5
--- /dev/null
+++ b/package/qt5/qt5doc/qt5doc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  87ef0ba72ede78148dfae8fbe78c839f0e9966e1ab4a58d7725041144c0de70f  qtdoc-897e90fe304d844beaf694b82a93a50237fa8b9e.tar.bz2
+sha256  ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d  LICENSE.FDL
diff --git a/package/qt5/qt5doc/qt5doc.mk b/package/qt5/qt5doc/qt5doc.mk
new file mode 100644
index 0000000000..77845a347f
--- /dev/null
+++ b/package/qt5/qt5doc/qt5doc.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# qt5doc
+#
+################################################################################
+
+QT5DOC_VERSION = 897e90fe304d844beaf694b82a93a50237fa8b9e
+QT5DOC_SITE = $(QT5_SITE)/qtdoc/-/archive/$(QT5DOC_VERSION)
+QT5DOC_SOURCE = qtdoc-$(QT5DOC_VERSION).tar.bz2
+QT5DOC_DEPENDENCIES = qt5declarative
+QT5DOC_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS),y)
+QT5DOC_DEPENDENCIES += qt5quickcontrols
+endif
+
+ifeq ($(BR2_PACKAGE_QT5QUICKCONTROLS2),y)
+QT5DOC_DEPENDENCIES += qt5quickcontrols2
+endif
+
+ifeq ($(BR2_PACKAGE_QT5XMLPATTERNS),y)
+QT5DOC_DEPENDENCIES += qt5xmlpatterns
+endif
+
+QT5DOC_LICENSE = GFDL-1.3
+QT5DOC_LICENSE_FILES = LICENSE.FDL
+
+$(eval $(qmake-package))

--===============4583683672782877581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4583683672782877581==--
