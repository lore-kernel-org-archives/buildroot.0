Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8EAC5B543
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1921160A89;
	Wed,  4 Jun 2025 18:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pYxczz8XQM3; Wed,  4 Jun 2025 18:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A30460855
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A30460855;
	Wed,  4 Jun 2025 18:46:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92BDC1A6
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 797A0608D1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e53XIKdYkNzj for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D58E760855
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D58E760855
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2ACD87935; Wed,  4 Jun 2025 18:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Jun 2025 20:42:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd255e9e9c2bfe17525766fa6d61367787c30c00
X-Git-Newrev: 1fad08d32f9f029cb0d11f4dcd805b479df7ab59
X-Patchwork-Hint: ignore
Message-Id: <20250604184642.C2ACD87935@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: remove unused hidden
 host option
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1fad08d32f9f029cb0d11f4dcd805b479df7ab59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The previous commit removed its only user. It was a blind option so no
legacy handling is needed.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/qt6/qt6base/Config.in.host |  5 -----
 package/qt6/qt6base/qt6base.mk     | 10 +---------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index e38e99fbaf..bc605c6821 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -16,10 +16,5 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
 
-# Select this if you need host qt6 tools that require the Qt::Sql module
-# (e.g. qhelpgenerator).
-config BR2_PACKAGE_HOST_QT6BASE_SQL
-	bool
-
 config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
 	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 39fb440be7..51a4f1b5be 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -89,6 +89,7 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
+	-DFEATURE_sql=OFF \
 	-DFEATURE_system_doubleconversion=ON \
 	-DFEATURE_system_libb2=ON \
 	-DFEATURE_system_pcre2=ON \
@@ -139,15 +140,6 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
-# We need host qt6base with Sql support for host-qt6tools to generate the
-# qhelpgenerator host tool. qt6tools will fail to build if qhelpgenerator is not
-# available.
-ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
-else
-HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
-endif
-
 # We need host-qt6base with Testlib support when building host-qt6declarative
 # with QuickTest support. QuickTest support is further required for building the
 # qmltestrunner host tool. qt6declarative will fail to build if qmltestrunner is
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
