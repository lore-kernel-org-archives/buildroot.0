Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877D6EE57C2
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 22:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52E7460A56;
	Tue, 30 Dec 2025 22:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zlxhZslYux0; Tue, 30 Dec 2025 22:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F49C60BB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767133597;
	bh=jRiiPua0xh/5Q7dkZeiMs2LGfCc3pJFHGccY3ojUBkI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BB6LqVnEkxg8JlpS+aHgIx64h3E1QzNI/Pp56E1iXYJwEJhgTLWHw7yzzVCbt/y5M
	 qBZF1Eg/kq3SgoJzDZOl9m28tU/x+yEK9cLknpFMcxh4ONfNxPZjGEHUXGCA1bmal5
	 cE3T7Qui0NLx5QGLbLK3GnqOF1SHVbXyhjE/hqtlONcj1bZw/lXM6PJVWzbHAtycct
	 Q5MR+f51RCrSxtSFMC21NLXQybSuEC+kLK+RYcjYnyKn7W3ZcAkLsTlct/EechUZ+a
	 buo7SqscT5gPUdSpRWaReZI2DXPxQ9TcakdKeTT4EGGj69HUV4WOwY4Arqwzq8qiH2
	 Y4wuESbY8WrNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F49C60BB0;
	Tue, 30 Dec 2025 22:26:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 143A4177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0DAB340333
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2uoipyPdlf8 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 650A440388
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 650A440388
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 518BA80714; Tue, 30 Dec 2025 22:26:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c91fbaef27c88f97f2b822ade42e2b80947821b5
X-Git-Newrev: 787678be5937e4274dfedc18297156a41bf4c4fe
X-Patchwork-Hint: ignore
Message-Id: <20251230222628.518BA80714@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: drop rpi-userland
 support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=787678be5937e4274dfedc18297156a41bf4c4fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the rpi-userland package, drop support for it
from package/libcamera-apps.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcamera-apps/libcamera-apps.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 06efb9a960..df7be41496 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -19,7 +19,8 @@ LIBCAMERA_APPS_DEPENDENCIES = \
 
 LIBCAMERA_APPS_CONF_OPTS = \
 	-Denable_opencv=disabled \
-	-Denable_tflite=disabled
+	-Denable_tflite=disabled \
+	-Ddisable_rpi_features=true
 
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 LIBCAMERA_APPS_DEPENDENCIES += libdrm
@@ -35,12 +36,6 @@ else
 LIBCAMERA_APPS_CONF_OPTS += -Denable_libav=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
-LIBCAMERA_APPS_CONF_OPTS += -Ddisable_rpi_features=false
-else
-LIBCAMERA_APPS_CONF_OPTS += -Ddisable_rpi_features=true
-endif
-
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBCAMERA_APPS_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_LIBEPOXY),libepoxy) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
