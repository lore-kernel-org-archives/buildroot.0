Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921F5D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 671A461066;
	Tue, 13 Jan 2026 21:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwPan0Rdwclb; Tue, 13 Jan 2026 21:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121FA61058
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338035;
	bh=mUFbiy+d9lYQrfjg4gjhBertoMjk/Gk61gxd4KwkJu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fRZucYjlT7M/QS7OLlxK2hndLnJ1Xjzn+ysrNJDoeqNg/qb43EZDbFsEInjbn9Lu3
	 ar3yMb+NHheC/iRVtJGUUdlw3cD/6kIwpdtm+kD/b76fgTANiwj2+1m+mBX0N4NInD
	 oFcZeYcd9DVNeoiKj19Nv795ZPnBdNY9VGG4yfwQo0iPwvmqIgu8bH3RNd8xAeFNye
	 VqT/iNpalbp19f1MCghOpodrSe1rzyH0InNCPB8JExRQ+URBnsgcxlnEAQIiRnHc4b
	 yY49UKtidGexK8anLO16RbXfFdsFTxHrRqj6eHcw+azHiQCoaL10WQqyz4krHCUPLv
	 MFlonjug+/CyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 121FA61058;
	Tue, 13 Jan 2026 21:00:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91D3D1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C024078F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sLWuEBDzsJ6 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C221407D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C221407D5
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A61A81124; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3619e4cfa53f0314ec9c4f734bc29b00f29a916
X-Git-Newrev: fdd7607b53d6baa26d9613380feb10c8f87c599e
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.4A61A81124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_bitmap: bump version to
 1.1.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=fdd7607b53d6baa26d9613380feb10c8f87c599e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-February/003447.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_bitmap/xapp_bitmap.hash | 6 +++---
 package/x11r7/xapp_bitmap/xapp_bitmap.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.hash b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
index 8953bfc5f7..8cfb8e6049 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.hash
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003162.html
-sha256  8e86879c2feeece3f10e189330479cf51da0dd268355d1e3ee8a8497ab833690  bitmap-1.1.0.tar.xz
-sha512  3d6c94675f10772daeb71598c3e0ddcb51569b1bfc4771159e9df89599bfeb8bf49f464c24fef54d30a8f737af32136f859f844be03e088d24ed962f88381193  bitmap-1.1.0.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003447.html
+sha256  63d42eb63fe48198b39344af49949e5e424cc62ce8d722781fdad4a4fa3426e6  bitmap-1.1.1.tar.xz
+sha512  69096a73739019545f2eb44b823e659b84377cf7c497243c89cbf3f26c9623c31fecfa36628022d241a581a5930e9e2394ec116e5c6d9df94097b45661261307  bitmap-1.1.1.tar.xz
 # Locally computed
 sha256  03be44611edac06827bd13c0815a67ecd37ffe8fb1b9e210d6545d79bec89a3a  COPYING
diff --git a/package/x11r7/xapp_bitmap/xapp_bitmap.mk b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
index ccc438560d..6dbccab23e 100644
--- a/package/x11r7/xapp_bitmap/xapp_bitmap.mk
+++ b/package/x11r7/xapp_bitmap/xapp_bitmap.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_BITMAP_VERSION = 1.1.0
+XAPP_BITMAP_VERSION = 1.1.1
 XAPP_BITMAP_SOURCE = bitmap-$(XAPP_BITMAP_VERSION).tar.xz
-XAPP_BITMAP_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_BITMAP_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_BITMAP_LICENSE = MIT
 XAPP_BITMAP_LICENSE_FILES = COPYING
 XAPP_BITMAP_DEPENDENCIES = xlib_libX11 xlib_libXaw xlib_libXmu xdata_xbitmaps
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
