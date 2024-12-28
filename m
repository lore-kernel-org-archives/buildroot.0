Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5572E77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:32:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91280405C3;
	Sat, 28 Dec 2024 22:32:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQTgtzsbekcI; Sat, 28 Dec 2024 22:32:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69D01405C9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69D01405C9;
	Sat, 28 Dec 2024 22:32:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 875E7C8
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31ABF4045A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mvaJeOsrvODU for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E0740995
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20E0740995
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CD018711D; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 23:23:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3eaccb3eb1a2b07e40b26c44492dc0294107ced1
X-Git-Newrev: b2788c63a9620ca8dbdadea9acd09c357908cb0c
X-Patchwork-Hint: ignore
Message-Id: <20241228223235.0CD018711D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add blind host option
 for selecting 'Qt Concurrent'
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b2788c63a9620ca8dbdadea9acd09c357908cb0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by new package qt6quick3d.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in.host | 3 +++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 46fb668817..a6dfb40c34 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -1,3 +1,6 @@
+config BR2_PACKAGE_HOST_QT6BASE_CONCURRENT
+	bool
+
 # Select this if you need host qt6 tools that require the Qt::Gui module (e.g.
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 888654a216..153fe1abfa 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -83,8 +83,8 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-libb2 \
 	host-pcre2 \
 	host-zlib
+
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
@@ -94,6 +94,12 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_CONCURRENT),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_concurrent=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_concurrent=OFF
+endif
+
 # We need host-qt6base with Gui support when building host-qt6shadertools,
 # otherwise the build is skipped and no qsb host tool is generated.
 # qt6shadertools fail to build if qsb is not available.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
