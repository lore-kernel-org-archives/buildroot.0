Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA02CC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FFC581E30;
	Thu, 11 Jan 2024 18:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FFC581E30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id or3R4pwrZV5P; Thu, 11 Jan 2024 18:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 660BB81EB5;
	Thu, 11 Jan 2024 18:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 660BB81EB5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 595471BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 321C360C31
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 321C360C31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgOBGrupDkNY for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:20:56 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F52A60BCF
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F52A60BCF
Received: from fli4l.lan.fli4l (p5b3a0630.dip0.t-ipconnect.de [91.58.6.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7803BA4C0818;
 Thu, 11 Jan 2024 19:20:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48812)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rNzfg-000000002ZX-0Fhx;
 Thu, 11 Jan 2024 19:20:52 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 19:20:52 +0100
Message-Id: <20240111182052.68172-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1704997252;
 bh=sx6U7FUs6BeOhqksgN5OUFUFrbN2tD85i12oDXacgys=;
 h=From:To:Cc:Subject:Date:From;
 b=WHQmi67+iwHLvF1GwIOHFeJok35iVF2vf0FKkadvi1Q9q3PZjbEi651esyJ+kYymM
 rQenNdLzXuqBg3jQ7iBu39yaO8u3SPfK/bDJ3IPIDDmZvS8IXunhTrY+/3Z1TPKgnG
 21shpCykHpJ9UFO428q30Ig/vEJk3k7LIfRFkdmXBVbld3+unf/q6daYwyZR0IVXdt
 qp31XAId8+FPjIFUSlOdODmIu8LaFsL1nU6P+Fs3+6FBKpmWt5cLYJ6GrcY/4r++Sg
 RWyOrKT9ho9ZBg2I0IPM1UhKq/USWiXqS6eRTyCCwhebvMKySS11xrN02NoB6WrQpo
 jE4oga9IQBAlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=WHQmi67+
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.3.3
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
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-January/000742.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 8e870ac030..0ca8d07e73 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.3.2
+MESA3D_HEADERS_VERSION = 23.3.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index b6c36f1c55..706911a809 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-December/000741.html
-sha256  3cfcb81fa16f89c56abe3855d2637d396ee4e03849b659000a6b8e5f57e69adc  mesa-23.3.2.tar.xz
-sha512  634d2b67ade2121de3f19f2cccd4bf7ceb2ac391b9366587ed1c2412444e010de8ec14a25529fdec1f43f943096422eb23cefcb8a89d2f8b20286850188b65c3  mesa-23.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-January/000742.html
+sha256  518307c0057fa3cee8b58df78be431d4df5aafa7edc60d09278b2d7a0a80f3b4  mesa-23.3.3.tar.xz
+sha512  bed23e8324b026edd5d2b16a381ec563cf2fa9be9c8fbe8d9fb907cab9d87eef91f493fb9d4e3973d4b679e271d2a85ce48af491585638ab97f087532fc63c30  mesa-23.3.3.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 30e4b385dd..1ee5047f24 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.3.2
+MESA3D_VERSION = 23.3.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
