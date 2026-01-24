Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D832D715DE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 11:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F0F260A59;
	Sat, 24 Jan 2026 11:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jW_H7z2JeNTm; Sat, 24 Jan 2026 11:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18E3D60A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769253809;
	bh=Q7yZEL9oNb6W/cdVOAwARuMPnOvtaaVpnSgUFq9HEsU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sJdENXOSOyBD3/6g3vXDAJe+sEis6vUbHG0ErrvXHcZEjGB8gVDJD2gZdNXaEnxLJ
	 FLLb42xn8ZV31N96K1Vp+H8CvumfjD3yrjln3s6XeeJl4+JSRNKu1ykhbeS/cyXRe/
	 AiWIEVsJrjXAojDuyYjo5tG05FoQ+Olbt9xxd1SCv/N0NYYT/qKwWtkXl+pv7YsFxl
	 ZUinEMuN7YeDJUIzSnglchgMkwV+T8NYT98TQJ25HhOaWrw5MUTGO0Q0SV0EXeWjN/
	 S346jMLzTKCAT6ln38O/oGmK9atJDCtMS4OBrfNJrrzy0GEEmsbFBteaCgiXA8ETpa
	 Lsv2WxpcvurmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18E3D60A5A;
	Sat, 24 Jan 2026 11:23:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1BF171F
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D642640A35
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0YV_DDS-Uf5 for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 11:23:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0339940A16
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0339940A16
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 11:23:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1F28875A8; Sat, 24 Jan 2026 11:23:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 11:46:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b64a2da6e028308d9b06e77d1d1471382f6f6bb7
X-Git-Newrev: f93a91c7ae3c189055d9f5cdb61b2fbfde33d19c
X-Patchwork-Hint: ignore
Message-Id: <20260124112326.E1F28875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f93a91c7ae3c189055d9f5cdb61b2fbfde33d19c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fe00d10c31..933f7ab731 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.3
+MESA3D_HEADERS_VERSION = 25.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9ff2a9d82d..f76043488e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html
-sha256  05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b  mesa-25.3.3.tar.xz
-sha512  232b39f5035f8a65c8f815c8b524e3570f229673a85cd3591fbab9136c80b4ab922dc959f51a9d0a11e91cc66f8cf7f30cd9b846bb9e1607e3a6c820d5c8045a  mesa-25.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html
+sha256  3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb  mesa-25.3.4.tar.xz
+sha512  3043bebebebc90ba443bbc96d71fbae41c76504d54ff6a44a48ad7c3a132db09e3ad1ae607c49f1d58b724a8b6e4263b68ee5722f8b98328481eb2e82164ac3a  mesa-25.3.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e41bf68d8e..2468310413 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.3
+MESA3D_VERSION = 25.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
