Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC108C3DA50
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 08:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B3C845EE;
	Fri, 12 Jul 2024 08:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muOp6J7Sjsqa; Fri, 12 Jul 2024 08:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED6F0845F6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED6F0845F6;
	Fri, 12 Jul 2024 08:44:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B57D1BF584
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 693EE60F96
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 08:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kwJRaT330oJ for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EE1060AE3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE1060AE3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9855F85CC8; Fri, 12 Jul 2024 08:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 10:44:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4e4fd4aeaf4bcd8a98d2fec8d59ce66a2dc4b93
X-Git-Newrev: f7692d6533f377f102a27f11cde23d09b9aca16e
X-Patchwork-Hint: ignore
Message-Id: <20240712084455.9855F85CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add blind option to
 enable Network support on host
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7692d6533f377f102a27f11cde23d09b9aca16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Network module is explicitly required by qt6tools.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 57f88e7779..8ab4d408bb 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -88,7 +88,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -123,6 +122,13 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+# The Network module is explicitly required by qt6tools.
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
