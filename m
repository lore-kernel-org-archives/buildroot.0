Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7672CD6E6B
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF9C461AED;
	Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQSuFvhk8vGh; Wed,  3 Jun 2026 18:49:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D94C06157F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780512588;
	bh=uDSMV2qlWMK6Lr7ryvoskONrCqJoFfWaE2Q1QQdkVBw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qXb3/7JX8tHc94bZkz/AJpXwrh/SHvCcbEq5ly/CrCNg5Bh93GrpI5m9x5SuwosBv
	 mo3e8e4WxENk+xQil1FdGJNBapCVWR8xmzaB/XCmCi/rP3itG+MkkWty/e1jHStTXx
	 8PziO/EdV/4g+b6KSyPxOBBjA5kXjFjgK2Yh7pL66djZqaKDNUXOE439hytAQzEETU
	 15jiuvzx5h/ptQ6Ot7+xOQvJBATMvHIGxmVoGnpGEYNE2rSpNiCdZAXHibB1qL0Lqb
	 +kSh/4r0rabb5yOu7DuV27mffsEuZ+WLuRp0YPUtM8AItKImcbuOGnDXYbxUSViLJ3
	 kQp/MPtYSci6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D94C06157F;
	Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08544192
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E274D427F3
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s28025__JyAK for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4377C427E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4377C427E1
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 18:49:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40BEE87992; Wed,  3 Jun 2026 18:49:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 20:26:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd72456fc6af3266319f5ff15c5530d7e7097b10
X-Git-Newrev: b9ccc1109c955f86e95afa0656220de6d7a4ebe3
X-Patchwork-Hint: ignore
Message-Id: <20260603184932.40BEE87992@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9ccc1109c955f86e95afa0656220de6d7a4ebe3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 83e0d6a5c7..3c6f2ee1f2 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.1
+MESA3D_HEADERS_VERSION = 26.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 93a9680a1b..deb7ea7f7b 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-May/000851.html
-sha256  8bd36c031cc6d0edfec04617527609454ee3a09ad53bdf983b45fc2c1e129b2e  mesa-26.1.1.tar.xz
-sha512  384a7db33d2f06e287337329f2f17503082ba6b1cd876a1884e940fdb6193ffae6d6b14344625256f3b3b39972ad697130a4d2ea25c40979f7aa76c2176f7988  mesa-26.1.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html
+sha256  bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0  mesa-26.1.2.tar.xz
+sha512  08e7b6357c27bf6e13f59e6fb0f84b73ec25c2d1a01cd09ffcc35ab263f278f10f3bd36fde419f60e78e781abcb315a432d0d5ceb3bab0bca26b8a2a39758e03  mesa-26.1.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b229b02378..905afece1b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.1
+MESA3D_VERSION = 26.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
