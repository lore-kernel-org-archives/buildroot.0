Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FBBFD45EF
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E64840D1;
	Wed, 25 Feb 2026 20:35:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mrFzHRU1llF8; Wed, 25 Feb 2026 20:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5EAB840D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772051707;
	bh=jQ1a+Z2x/g0LhXnfnOSW31qrJaY7jLibtRLNphgt0xA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=V+yd+bEe+hMMG4C9QcTn8fx+Dq8QRKyJEivPBW0gK8ZXRd3stHgEvHWn9sxbTGe1u
	 4Sc6DsH9wS2zCZvLjL6a7WEgrmy3VZEFUljF/j/dMjSYUOsMBuRQgwuvc2ACd/Dcxt
	 W96DsysjZITL+8owZlDNUTLlC7+Jg72xw606ekDXFnZyZoKQBaSWuLZJxB/PKkAzfq
	 NI/rrbz0zXZnKnAcve9eapNqm5arcPlRwH9NMAjPLGHNa4gmySUzVagP5QKWVGfsBQ
	 cKGRWBCYGhXrZ+VkLUk2AeRJuHjwGDz5q4SMvYvQTebhhRdVpzeL/zZ90rpStylz0m
	 HkLgoWOnPS5HQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5EAB840D3;
	Wed, 25 Feb 2026 20:35:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F224F24E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:35:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF95741CE0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V3fkeIrUYp5Y for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:35:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFAC241887
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFAC241887
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:35:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4BA7873ED; Wed, 25 Feb 2026 20:35:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 25 Feb 2026 20:54:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50b3b887cb55b91a470b27d5a29ef8af65546398
X-Git-Newrev: b45b3b412c306af9eab09d44bdc7eef7b79bd128
X-Patchwork-Hint: ignore
Message-Id: <20260225203504.C4BA7873ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: security bump version to 26.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b45b3b412c306af9eab09d44bdc7eef7b79bd128
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 10cfd8f719..b9acabe325 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.0
+MESA3D_HEADERS_VERSION = 26.0.1
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 958a99ec9f..898d1c6897 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000838.html
-sha256  2a44e98e64d5c36cec64633de2d0ec7eff64703ee25b35364ba8fcaa84f33f72  mesa-26.0.0.tar.xz
-sha512  d39d190d0a17306f0aa69033e38dd8cf458dbf8da483b768841e2dc681dd670735999b212fbe0b29be839702a20750c87d6587bd925dca10693950830a17cd55  mesa-26.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html
+sha256  bb5104f9f9a46c9b5175c24e601e0ef1ab44ce2d0fdbe81548b59adc8b385dcc  mesa-26.0.1.tar.xz
+sha512  d47072257035acfa8a5594c0cda831b4e5178169dea8a06c6657268a441e32271f8798486e837cea23f35ce3f0b4b9520a4ea4ed26b0e1267b02da4c649bc9f9  mesa-26.0.1.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 42693ce928..325756d92e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.0
+MESA3D_VERSION = 26.0.1
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
