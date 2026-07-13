Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ED2C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A712F408E3;
	Mon, 13 Jul 2026 10:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rm9c7kAtnXCF; Mon, 13 Jul 2026 10:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A49DA408C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938796;
	bh=vNfmzax/GM1umr6aDi/AodbxV4lN2bQ3ldYMje0ZdlQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OPz309Lezsy4DKm6gWEDHO+S0B6pVUydGd1KobTYfZuE8o141imHI/w1c5SchLXC1
	 p5si2Dh47bQUzxYmtKQpQBSCQExRgvJN7+n5efbUvwQjn9TDjBivSOi/svi83z2YA6
	 tpY70X0dFAamSRsogi/H9txHN5KxMa0RMpcV28DhevSsYK1X1rcFlxegLs56au4aCW
	 VLj10SxtBjTj9OHow0t8d32e2up3tPsRP3vQu9ea/uOoZjV+1q+zoXUsmQlaE67SgB
	 +iWz5cuTY0ve71MhVIbyozAG8GpodMjgHaqHuWkU6uFh9d2prbGvRC+pFxD1ULev56
	 yLX9FXrxa919A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A49DA408C2;
	Mon, 13 Jul 2026 10:33:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DF0DA28D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08F3401B9
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QfQa3x0OBpX6 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19A59402ED
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19A59402ED
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C677F887BC; Mon, 13 Jul 2026 10:32:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 12:26:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d01f6fcee4435651224066e36ac8ae8038ac463
X-Git-Newrev: c6e304f3835b6989c828c13c83c9b03b68b82dab
X-Patchwork-Hint: ignore
Message-Id: <20260713103238.C677F887BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXfont2: security
 bump version to 2.0.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6e304f3835b6989c828c13c83c9b03b68b82dab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.x.org/archives/xorg-announce/2026-July/003715.html
https://lists.x.org/archives/xorg-announce/2026-July/003714.html

Fixes
- CVE-2026-56001: BitmapScaleBitmaps Integer Overflow Heap Buffer Overflow
- CVE-2026-56002: PCF Font Parsing Heap Buffer Overflow
- CVE-2026-56003: computeProps Property Buffer Heap Buffer Overflow

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.hash | 6 +++---
 package/x11r7/xlib_libXfont2/xlib_libXfont2.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
index 4f50b2dbd2..86e972a0e8 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2024-August/003523.html
-sha256  8b7b82fdeba48769b69433e8e3fbb984a5f6bf368b0d5f47abeec49de3e58efb  libXfont2-2.0.7.tar.xz
-sha512  f703127df5d5b1093c9b73e019153ed7799523573d52e61d344209f0acfd4df42e11be12bdd1880479c47c2b70de581a4f2ef74e199e9b1ac438f426593d56b0  libXfont2-2.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2026-July/003715.html
+sha256  f556c0e1093a4e6911cc90bc4b106d201902ee187fd74af206ff162f7e6a24d5  libXfont2-2.0.8.tar.xz
+sha512  e14cc3fa03d7baa4554ee5754ab33f69ac1da3d509c686a5f705fde8cd07772be564d68cc18d9fd0beb5ed7b2f864fcd7f6bf4983f5c0db08a9c747d0e001531  libXfont2-2.0.8.tar.xz
 # Locally calculated
 sha256  3b1047f0d45584973866a40e3eedc74aea4c6ac636960d650ae05af603e6d1a8  COPYING
diff --git a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
index c95f6c6395..a881a4c55b 100644
--- a/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
+++ b/package/x11r7/xlib_libXfont2/xlib_libXfont2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBXFONT2_VERSION = 2.0.7
+XLIB_LIBXFONT2_VERSION = 2.0.8
 XLIB_LIBXFONT2_SOURCE = libXfont2-$(XLIB_LIBXFONT2_VERSION).tar.xz
 XLIB_LIBXFONT2_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXFONT2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
