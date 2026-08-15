Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A072C5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 16:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05EAC606A6;
	Sat, 15 Aug 2026 16:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Urcpf9Kt-Jph; Sat, 15 Aug 2026 16:37:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2835F60640
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786811876;
	bh=eTYfUzoSo4xWlzEVsFgNSeNbo3Qwi1CXcLiqplobfzg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=C572ODNN6/C58nbKQKTmc1p3qlh7MShPZLDJ98qh1E5mdCmdvrOJZJDeynxs6Qwi2
	 Aj4kzjKRgeKmjVHHqvcmvHYqN6zwFM1RP/xbN8u4mwp6VbdOcWEBvaOs+Hrw1SXwI2
	 3Xuli2v2IA393DVnv3b+lswLIPAdM+LItJ6bi8GBj8KmwF4LNeEL1s7laLe40Y5egZ
	 MuiuukWAQoauZT08WP0V1JpOEXWnngXbNhUbJ01zfW7W56ArTXac+S4IMOiZIqWMpk
	 8Sy3tc/bBN0lsguMG1dIZiihJ/lmKvrdKyL4GWl7f2b2nCmJAvImuQog/cM7Jaz46F
	 Y1W0H04QGpGxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2835F60640;
	Sat, 15 Aug 2026 16:37:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18DD1392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2FF840855
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fEJ28WbjwWi for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 16:37:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA6EE40850
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA6EE40850
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 16:37:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 473538D778; Sat, 15 Aug 2026 16:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 18:31:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fe4e48c329c38ab11469fc620d3c8fcd039facc
X-Git-Newrev: 299ba1918ecedea9538c13119ca97230cb840837
X-Patchwork-Hint: ignore
Message-Id: <20260815163703.473538D778@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/299ba1918ecedea9538c13119ca97230cb840837
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index d887d45325..0ce4b15dfc 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.6
+MESA3D_HEADERS_VERSION = 26.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 42c9e0a59e..34ffd95e8f 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-July/000862.html
-sha256  5296b88a0f1e012e2cb9ada150a2bbadf728ca81e5a4fb2ab43c83a4d2158606  mesa-26.1.6.tar.xz
-sha512  6746b73f5b87e8ff3723eee586b4b5f033dbe6d13cd0309d743b7fa484c350268859ec8ff21aadcbca7a04070cdaa7828146dd28dde4b1935bb879891d687f0b  mesa-26.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-August/000864.html
+sha256  25e0a669e6638c3563e7be32a0a09f1888317e6eed0d047dc41d49dc8de26c7d  mesa-26.1.7.tar.xz
+sha512  9acc75c3d6386f90cf761dfa42e72b1c36d399a6905127d18aa3eb84d665502da7c3cebead82fdbca91ad510673ba7e296b5e148602d6db7e79172d6155f3ec5  mesa-26.1.7.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 8e6f0bc125..99ef0f5edb 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.6
+MESA3D_VERSION = 26.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
