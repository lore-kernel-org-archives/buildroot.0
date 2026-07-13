Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E9C44507
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CAD240904;
	Mon, 13 Jul 2026 10:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkAx3uwvSFVL; Mon, 13 Jul 2026 10:33:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B61B408F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938798;
	bh=5HjYLnoE8KlBvee3i9jfu8s18B69nymuOGZNUtNLc30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Aqj2nu8GISVNiC0hjS+7ex5tPnbpyuKdqJ16N6gkWW8FnPbZddpLlU1HO6JvERuLF
	 heWi8kmRvp3BJA2KC5vnyH0lk0g75fOzn4HZuHP1CLNvxazcHLhGKeNIGdWuKnskx7
	 idHB/3deJZCF9IMPsE96aPoUSJOIeWMHrWFoi8f83ZKa+08cubTyu1uNfJih/rrR9n
	 oZ46mm4zuRVayh6eG/YkJnaSMsQPGepDC9zd4RjFW2smvUfzbbAI50osTmGGVQLaJk
	 VHvLlAFbuGRBmLp4s+VqX6d2OmjYFVEUo9UsTgzSyhmArYzfCCxUtgBbVMxf3JzTQk
	 3joN/kyf3d4xg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B61B408F4;
	Mon, 13 Jul 2026 10:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6F328D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC8B60744
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id liQE51YeMTYB for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10B806075A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10B806075A
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCC7D887BB; Mon, 13 Jul 2026 10:32:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 12:26:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b15bf90f183a8e0e4877a3ffeeff479dd0949d9
X-Git-Newrev: 0d01f6fcee4435651224066e36ac8ae8038ac463
X-Patchwork-Hint: ignore
Message-Id: <20260713103238.BCC7D887BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xwayland: security bump
 version to 24.1.13
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d01f6fcee4435651224066e36ac8ae8038ac463
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-July/003717.html
https://lists.x.org/archives/xorg-announce/2026-July/003716.html

Fixes
-  CVE-2026-55999: glamor Font Atlas Heap Buffer Overflow
-  CVE-2026-56000: GLX contextTags Use-After-Free in CommonMakeCurrent()

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xwayland/xwayland.hash | 6 +++---
 package/x11r7/xwayland/xwayland.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
index 2bf2d19020..c9b931b6e2 100644
--- a/package/x11r7/xwayland/xwayland.hash
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2026-June/003704.html
-sha256  6df02c511b92c1b9848734d9d1b03a4c24f8375ba3cada44e9684a21b5f78e21  xwayland-24.1.12.tar.xz
-sha512  b4ee41761c2caa7332573be07d9143b60015bb4a7910c90b6ae079dde0a1bf6b0b4773ff4e6fba48279cdee83b4de5eb4a19b9369b5753e4147b94fa2deece96  xwayland-24.1.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003717.html
+sha256  173aea3d6f79609164c04528e1c8e4c9b60fcd59391c3c9dad4667297d727fb6  xwayland-24.1.13.tar.xz
+sha512  e06e58025b441892fdd17ac55fd5c7e137bffc941b76ad784dc008047c778c6ee2895fcc47b9e8c74b1d8372491e69c39933c4186aec4df55571614f8ba98e3c  xwayland-24.1.13.tar.xz
 
 # Locally calculated
 sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 2b8513602c..02a21b96c1 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XWAYLAND_VERSION = 24.1.12
+XWAYLAND_VERSION = 24.1.13
 XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
 XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XWAYLAND_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
