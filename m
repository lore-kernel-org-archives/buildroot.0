Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A9EC5DF97
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 16:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855856065F;
	Fri, 21 Aug 2026 16:16:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A-pb07LbvY-J; Fri, 21 Aug 2026 16:16:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787328978;
	bh=jTquoRg2r83X5nFeFw3dTCc7mbxpkE8TbLQJaIVrv+Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FqfakBIQhZjiZR/+gVgTM+6UELTUMVfWgTAyoxnYoKGFlGa3+GWTWQl8NYz2Wm71z
	 hgLagR6BQ+kadUDzxgvIomdWUh1a406g2U7Y0S6MOSzK9TIbRllP3J9A3C2PR1RL4O
	 uEKhKmHMUHEUdeEVZKWQ0ocV4au44Ze3GZaJh8UNaTtgv91S4sUIO0lCvQcM4hjsPz
	 BrOfMbEN3q17RAKjs/Wqgd5rX0qGfLOplk7MdfF4ZsLU8sgMUacAmngnUl0fgK9fIA
	 hdmXCqhpHVrYNnAj48yBpcmHleuSnq95ImQUBJpauMHUwUUZZlXlcDt+EXGn10dUJg
	 gM+n4NJiVAg0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3E73607D5;
	Fri, 21 Aug 2026 16:16:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D1C91336
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7ACC607D5
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvAt1MB1jNMp for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 16:16:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 242946065F
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 16:16:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84003843E5; Fri, 21 Aug 2026 16:15:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 18:15:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fcac6c4f2514ea3e100fcbf34b47c6380291ebbc
X-Git-Newrev: 772ff404c5bd114279e08281193f921be69ea10a
X-Patchwork-Hint: ignore
Message-Id: <20260821161523.84003843E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/772ff404c5bd114279e08281193f921be69ea10a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes of this bugfix release:
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 0ce4b15dfc..fd715b5f84 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.7
+MESA3D_HEADERS_VERSION = 26.1.8
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 34ffd95e8f..dc7776488a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html
-sha256  25e0a669e6638c3563e7be32a0a09f1888317e6eed0d047dc41d49dc8de26c7d  mesa-26.1.7.tar.xz
-sha512  9acc75c3d6386f90cf761dfa42e72b1c36d399a6905127d18aa3eb84d665502da7c3cebead82fdbca91ad510673ba7e296b5e148602d6db7e79172d6155f3ec5  mesa-26.1.7.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000865.html
+sha256  b320f65874fd9653ac6c0bd1616605387344e1247411a50c797b5f3fb9dc0b55  mesa-26.1.8.tar.xz
+sha512  eb3d46ae9aaba70fdd908486cef24041fec9264ddf586eaebbba65ce55e716d306ef9e91be83e742dfaec4dfc94105a5cd3a36b29bf56614febcbcf6c1f8b516  mesa-26.1.8.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 99ef0f5edb..87c7f427e4 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.7
+MESA3D_VERSION = 26.1.8
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
