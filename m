Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769A2CDB46F
	for <buildroot@archiver.kernel.org>; Mon, 22 Jun 2026 22:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FEBB80F68;
	Mon, 22 Jun 2026 22:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SfMV8QmBFmn; Mon, 22 Jun 2026 22:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50C0D80F71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782165768;
	bh=PYLDo+ONS+zyBRG4Ad80JNxNjoNqfZXuH6ZDQ3djf+Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gf+EAqBfble6BLgvhvyyp4/WtiVRnIwQoVd+zbpq1kXikyhI3F3Ct7vT0e3m/zlen
	 cOeu9EtmWQIjMDmY1zBgBkJ/U6HLbEZ0qe3kY72NJtOkLpysDk1/0StXQD2vNwi8U1
	 9CKnxFBVquzA5PVdN+HUwvi4Ah5ONX+AMZxw4bTubrfcERIxuwroNt4aAwc8QyGZxm
	 x0vzZ3fEdr4czwrWyiOnu6d1CM1nreJAngCleOkMOP/O3i1DRzo+JzYuEWVLJM9qAm
	 CNXIWr7suKwIdzNeoRRIky5qVjlKpzuvMmXKqPQRCqtfQrBUNo85sVMZXawpuJwJdR
	 /LQTEkyJhISfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C0D80F71;
	Mon, 22 Jun 2026 22:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8396367
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA6D4606EF
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ML2PO_Bc-bXZ for <buildroot@buildroot.org>;
 Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2149660659
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2149660659
 for <buildroot@buildroot.org>; Mon, 22 Jun 2026 22:02:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D59F083C6B; Mon, 22 Jun 2026 22:02:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jun 2026 23:51:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 46886b51c29b1c1108c85087cba4dbf22c6fa79d
X-Git-Newrev: 4ab91a29d8931105d3ff8f6263c59a5438ada1a1
X-Patchwork-Hint: ignore
Message-Id: <20260622220221.D59F083C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.3
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ab91a29d8931105d3ff8f6263c59a5438ada1a1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-June/000855.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3c6f2ee1f2..9781a1357c 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.1.2
+MESA3D_HEADERS_VERSION = 26.1.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index deb7ea7f7b..abc0527907 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000853.html
-sha256  bac2bca9121897a2b8162e79636b50ac998fca799c8e6cf914edd85962babdf0  mesa-26.1.2.tar.xz
-sha512  08e7b6357c27bf6e13f59e6fb0f84b73ec25c2d1a01cd09ffcc35ab263f278f10f3bd36fde419f60e78e781abcb315a432d0d5ceb3bab0bca26b8a2a39758e03  mesa-26.1.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-June/000855.html
+sha256  7725004e724b34c6d4fbaf5c48fc6c6223aa9f2741d6d7782c699b049356fc45  mesa-26.1.3.tar.xz
+sha512  6dd452e8c7f2e7e9a26733f53dd0daf4df824f82de3d37c171581854dd419f519e104212aacdf8bdf94042a845d9ba5c45a1605d7cba1dc491570a9e72a91f83  mesa-26.1.3.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 23644cd7f5..4e7a5240c7 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.1.2
+MESA3D_VERSION = 26.1.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
