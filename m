Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE7CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 08:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49598275A;
	Tue, 21 Feb 2023 08:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C49598275A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id STvU1bnpYKVT; Tue, 21 Feb 2023 08:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05C0D8275C;
	Tue, 21 Feb 2023 08:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05C0D8275C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6351BF292
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2457361089
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 08:28:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2457361089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CO762MFM_XgM for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 08:28:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53963611B8
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 08:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53963611B8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FA5586561; Tue, 21 Feb 2023 08:28:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 09:23:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3927054736881e5807b86fe9b1e5b275d941d6fd
X-Git-Newrev: 6ab0431b70e3d963ff3bbc8f10a1871d9f628789
X-Patchwork-Hint: ignore
Message-Id: <20230221082849.3FA5586561@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{mesa3d,
 mesa3d-headers}: bump version to 22.3.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ab0431b70e3d963ff3bbc8f10a1871d9f628789
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-February/000705.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 9177adceda..ad1999a30d 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 22.3.4
+MESA3D_HEADERS_VERSION = 22.3.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index e4de997f0e..50c5bcc7fc 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-January/000703.html
-sha256  37a1ddaf03f41919ee3c89c97cff41e87de96e00e9d3247959cc8279d8294593  mesa-22.3.4.tar.xz
-sha512  6af340153244d3e95d0e155a45d6db134335654d62590797ae0ef6ba44c2ccfe91ebf95f70ff82c67cee108ac35536767b1f6848d6d1129f52eb9e8414ee321d  mesa-22.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-February/000705.html
+sha256  3eed2ecae2bc674494566faab9fcc9beb21cd804c7ba2b59a1694f3d7236e6a9  mesa-22.3.5.tar.xz
+sha512  a4cad9b7e6501678fac279bd88a37e522633c7128afa8df04982f469c930e3557bb1d05b4b0f5ae16704d8d04e50c90a7489943a48861df17dd947704c329b85  mesa-22.3.5.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index cf2352a355..1e919d73f2 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 22.3.4
+MESA3D_VERSION = 22.3.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
