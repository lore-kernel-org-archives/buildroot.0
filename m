Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7D9C02191
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 11:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA4960739;
	Sat, 14 Sep 2024 11:26:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zGKCWJ2cAMG; Sat, 14 Sep 2024 11:26:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A581606D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A581606D9;
	Sat, 14 Sep 2024 11:26:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D1C61BF2C8
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B4F8407C6
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 11:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DzV6RvW5Dqp for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D58A40520
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D58A40520
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 499628284B; Sat, 14 Sep 2024 11:26:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 12:07:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8662264eb6316334d77bb189bd6057976ef5876
X-Git-Newrev: 322e64ead41d4e1184c9cbad32831cd519c2d8e7
X-Patchwork-Hint: ignore
Message-Id: <20240914112645.499628284B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6tools: separate host and
 target options
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

commit: https://git.buildroot.net/buildroot/commit/?id=322e64ead41d4e1184c9cbad32831cd519c2d8e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Config.in.host to allow separating options affecting host and target
builds.

Move/copy parts of Config.in into Config.in.host.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/Config.in.host                         |  1 +
 package/qt6/qt6tools/Config.in                     |  8 ++------
 package/qt6/qt6tools/{Config.in => Config.in.host} | 12 +++++-------
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
index dfe7865c57..fa5c39cce1 100644
--- a/package/qt6/Config.in.host
+++ b/package/qt6/Config.in.host
@@ -1,5 +1,6 @@
 if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in.host"
+source "package/qt6/qt6tools/Config.in.host"
 
 endif
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in
index 5f52c5644f..1828e5f043 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in
@@ -1,12 +1,8 @@
 config BR2_PACKAGE_QT6TOOLS
 	bool "qt6tools"
+	# The Qt Network module is required
 	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6tools needs host-qt6tools, and host-qt6tools needs
-	# network support in qt6base. In addition, we also need
-	# host-qt6base with Sql support to build the qhelpgenerator
-	# tool, if target support for Sql is present
-	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
-	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
+	select BR2_PACKAGE_HOST_QT6TOOLS
 	help
 	  Qt is a cross-platform application and UI framework for
 	  developers using C++.
diff --git a/package/qt6/qt6tools/Config.in b/package/qt6/qt6tools/Config.in.host
similarity index 58%
copy from package/qt6/qt6tools/Config.in
copy to package/qt6/qt6tools/Config.in.host
index 5f52c5644f..4fd28172b9 100644
--- a/package/qt6/qt6tools/Config.in
+++ b/package/qt6/qt6tools/Config.in.host
@@ -1,11 +1,9 @@
-config BR2_PACKAGE_QT6TOOLS
-	bool "qt6tools"
-	select BR2_PACKAGE_QT6BASE_NETWORK
-	# qt6tools needs host-qt6tools, and host-qt6tools needs
-	# network support in qt6base. In addition, we also need
-	# host-qt6base with Sql support to build the qhelpgenerator
-	# tool, if target support for Sql is present
+config BR2_PACKAGE_HOST_QT6TOOLS
+	bool "host qt6tools"
+	# The Qt Qt Network module is required
 	select BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	# Requires the Qt Sql module to build the qhelpgenerator
+	# tool, if target support for Sql is present
 	select BR2_PACKAGE_HOST_QT6BASE_SQL if BR2_PACKAGE_QT6BASE_SQL
 	help
 	  Qt is a cross-platform application and UI framework for
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
