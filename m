Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0302CFA3738
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 12:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E46607FE;
	Fri,  2 Jan 2026 12:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxt3c74RQpP2; Fri,  2 Jan 2026 12:25:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D702B60628
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767356750;
	bh=3uwmmJXdSHAIsL2tZZUQxBTvINpSq4dqCS0Fqrteweg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EIx+6/fgaZ5miuT4UL7jv7dGauAExDSc5A0b46YwBTwSCgnfv96pJW6AK2cwxXh0l
	 h+7SH/yp9Y113kw91u7UOlGn6bTCn6GPVbpV5ODGo/Eixvk2HogLyB3opPlXT0Li2X
	 8mTDk3PMhVNIFE/tNJ7yF/XtsTRiZ4zrfc6Kq2ueWmB8UosaNrvzp+6OvZzzLDMj8M
	 cutTUZ1kKP/zgau+LXVT+yNNsN1lbNMn8Oko/sxhy0/LTu/Gg8bFQq3gHMPYdVjx/t
	 HSBxR2CHEdBKBRV8q3kH6JTf9MMbR1KoX6lL5EnU4KPQu27ZTj36X+sKzUm3trgd+d
	 Bg9HTfNt71arQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D702B60628;
	Fri,  2 Jan 2026 12:25:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E2F919D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FB1E400A5
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:25:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7y7_Xgh4-SU for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 12:25:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E75504007C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E75504007C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 12:25:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D49C187F72; Fri,  2 Jan 2026 12:25:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 11:29:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 114628419252ed962146465167c18d70a2f0caed
X-Git-Newrev: a058d3561f9edbc404954343cc16fd6c5f872fbf
X-Patchwork-Hint: ignore
Message-Id: <20260102122548.D49C187F72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a058d3561f9edbc404954343cc16fd6c5f872fbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 88fd71f987..fe00d10c31 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.2
+MESA3D_HEADERS_VERSION = 25.3.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f045d37f91..9ff2a9d82d 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html
-sha256  e69dab0d0ea03e3e8cb141b032f58ea9fcf3b9c1f61b31f6592cb4bbd8d0185d  mesa-25.3.2.tar.xz
-sha512  499cb0aa254b5a706fb6c2414c23b9d5d03d9397475f7ad16744b982303a2a2bf643ef7adc64870645ee4355b5f95695becd6caff7d7f7caf698e6269589aa13  mesa-25.3.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html
+sha256  05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b  mesa-25.3.3.tar.xz
+sha512  232b39f5035f8a65c8f815c8b524e3570f229673a85cd3591fbab9136c80b4ab922dc959f51a9d0a11e91cc66f8cf7f30cd9b846bb9e1607e3a6c820d5c8045a  mesa-25.3.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3e48c795c4..e41bf68d8e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.2
+MESA3D_VERSION = 25.3.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
