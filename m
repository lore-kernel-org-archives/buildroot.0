Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2091E7718F
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 22:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ADCE80F50;
	Sat, 28 Dec 2024 22:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WoMiPnhO0iea; Sat, 28 Dec 2024 22:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5118080F33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5118080F33;
	Sat, 28 Dec 2024 22:32:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C7FF1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F015F608FA
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BnZQR0W8XEmK for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 306E7608F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 306E7608F2
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1C44280D95; Sat, 28 Dec 2024 22:32:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Dec 2024 23:23:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2788c63a9620ca8dbdadea9acd09c357908cb0c
X-Git-Newrev: 64525c4969727ff78f9a7b525749d70e245d6405
X-Patchwork-Hint: ignore
Message-Id: <20241228223235.1C44280D95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qt6/qt6base: add blind host option
 for selecting 'Qt Widgets'
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

commit: https://git.buildroot.net/buildroot/commit/?id=64525c4969727ff78f9a7b525749d70e245d6405
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by new package qt6quick3d.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/Config.in.host | 3 +++
 package/qt6/qt6base/qt6base.mk     | 8 +++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index a6dfb40c34..e38e99fbaf 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -20,3 +20,6 @@ config BR2_PACKAGE_HOST_QT6BASE_TEST
 # (e.g. qhelpgenerator).
 config BR2_PACKAGE_HOST_QT6BASE_SQL
 	bool
+
+config BR2_PACKAGE_HOST_QT6BASE_WIDGETS
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 153fe1abfa..a4c56da601 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -118,10 +118,16 @@ HOST_QT6BASE_CONF_OPTS += \
 	-DFEATURE_printsupport=OFF \
 	-DFEATURE_kms=OFF \
 	-DFEATURE_fontconfig=OFF \
-	-DFEATURE_widgets=OFF \
 	-DFEATURE_libinput=OFF \
 	-DFEATURE_tslib=OFF \
 	-DFEATURE_eglfs=OFF
+
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_WIDGETS),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_widgets=OFF
+endif
+
 else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
