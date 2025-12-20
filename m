Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11CAE668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4722440850;
	Sat, 20 Dec 2025 15:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIMh1mmIve8B; Sat, 20 Dec 2025 15:45:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7707C408E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245512;
	bh=R9dFVKHCcuxEL1zQ2LTl+dk5b2zwBSNvyTb1Z19k4qw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CNfC6OZernHnZaigjuGdObQBzjgAK8ZtYT7uiTWO0JJTgPbtWPAHZI4QKw1rKuUxo
	 qHfw7iy1jWXlqn4LtKhj/GXss3ngzySBPoZEVay26aK5klbZIRHdTH3Y0DYdr8pQ3G
	 km/ZVWf7kHNagntK1O1vdQLPbtCyp4/EcqJaQCJcaTgdoG2EmbY4a5FZZ99glsJzJ+
	 f86H6cQcCmGiZ6fyUlA+SIwzLw6PrK5ucBoVES4L4/B65SIg0riv7Xh/9ilOcyS5+E
	 jCiFdnFOIZeOFN4Dp/1kOBOKxGaieCeGJXhqOqNBwkQNt/cQPXtUdnwIPrZZjCbFWk
	 iLD3epnsSebLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7707C408E4;
	Sat, 20 Dec 2025 15:45:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 928BE1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79141408E4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R8oR7UqxGVOc for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B47A40850
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B47A40850
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8941A8751B; Sat, 20 Dec 2025 15:45:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 12:52:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50285fff825ef3772f99a251632418e177d4c69b
X-Git-Newrev: 0a4beae7a59ed2261ecc249d83c04882ccb33f5b
X-Patchwork-Hint: ignore
Message-Id: <20251220154508.8941A8751B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a4beae7a59ed2261ecc249d83c04882ccb33f5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 39564b6af3..88fd71f987 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.1
+MESA3D_HEADERS_VERSION = 25.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 4bfc1d4584..f045d37f91 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html
-sha256  059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da  mesa-25.3.1.tar.xz
-sha512  7e2f7295f1f4df129935b60d75c890f6ae585ecc511f69f55a61826df5f2434ffdb4109c632af9842a986bf9beed430a0404d377e8335b71fa36682bd10533ba  mesa-25.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html
+sha256  e69dab0d0ea03e3e8cb141b032f58ea9fcf3b9c1f61b31f6592cb4bbd8d0185d  mesa-25.3.2.tar.xz
+sha512  499cb0aa254b5a706fb6c2414c23b9d5d03d9397475f7ad16744b982303a2a2bf643ef7adc64870645ee4355b5f95695becd6caff7d7f7caf698e6269589aa13  mesa-25.3.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6fcbf96c80..41b72dd08e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.1
+MESA3D_VERSION = 25.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
