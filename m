Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC412C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 18:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A17821B5;
	Sat, 27 Jan 2024 18:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3A17821B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJRUFxjuTHq5; Sat, 27 Jan 2024 18:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4E09821BE;
	Sat, 27 Jan 2024 18:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4E09821BE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7A871BF388
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDB0D4167E
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 18:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB0D4167E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDJ5xo3RfGCr for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 18:20:08 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 652D4416CE
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 18:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 652D4416CE
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3871FA4C06CF;
 Sat, 27 Jan 2024 19:20:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38296)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rTnHh-000000004Ud-3sGv;
 Sat, 27 Jan 2024 19:20:05 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 19:20:05 +0100
Message-Id: <20240127182005.16087-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1706379606;
 bh=ioXqhurfL0HL6+so7fZvb7wFfosgtFGKAzb3o/o2Yq8=;
 h=From:To:Cc:Subject:Date:From;
 b=IyIIts5jkqT8kukWS5PUZLw3bS6wAs1bfdPW4kOZilc5ggTSov1pBzXnY8SEISIrj
 8PkhFRtO2araV8QPle+sZ3IoDSdNqmaQqmH+RrP1KrlSrNP6jZevq9I1MxiPrSXnmx
 eTdlOYNKsgw5B2tcYwbQBNPKK3q/DI4WJsr7o7lUbzQbBIV+Vmvkbk7G8ssnJzsSu0
 zL011FmWsO8uEFY8W10ICrXx9syTGVz1ja9uQnXtYJgAGYxeFslSdfAPnFp81bIx51
 IXAHmTLT9PA2oW2wA7pUuRedICvnrTc8xtHDMlyf+8GFsNSWrScq5grT3QodigeKwi
 JgcHilS6GDdkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=IyIIts5j
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 23.3.4
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
https://lists.freedesktop.org/archives/mesa-announce/2024-January/000745.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0ca8d07e73..d04fa10342 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.3.3
+MESA3D_HEADERS_VERSION = 23.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 706911a809..e99027c013 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-January/000742.html
-sha256  518307c0057fa3cee8b58df78be431d4df5aafa7edc60d09278b2d7a0a80f3b4  mesa-23.3.3.tar.xz
-sha512  bed23e8324b026edd5d2b16a381ec563cf2fa9be9c8fbe8d9fb907cab9d87eef91f493fb9d4e3973d4b679e271d2a85ce48af491585638ab97f087532fc63c30  mesa-23.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-January/000745.html
+sha256  df12d765be4650fe532860b18aa18e6da1d0b07d1a21dfdfe04660e6b7bac39a  mesa-23.3.4.tar.xz
+sha512  026c424989a594dd840dc158ca09e0f57e604f0b1bd2a3981110b4b2b5a47c6cd9c7241c7f48957a781e2dd9f9760cc9db79b2fb7c7fe39b64eddb18dcf18412  mesa-23.3.4.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1ee5047f24..d3bc7020b1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.3.3
+MESA3D_VERSION = 23.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
