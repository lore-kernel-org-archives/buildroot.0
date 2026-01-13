Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDC5D30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 735CC60E17;
	Tue, 13 Jan 2026 20:59:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfUy5hGPasag; Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9148D60E1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337964;
	bh=DGDOV70KKmfz8SdbrFc2Ssjd4isHfPw5vCFPRt1UqHA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjiLqspcA9AUNUDEE5VSMgfLYvR6i+V1Vwcr+7ZWGK+vpH1yK5p/nf36bn9G1PiwJ
	 l/FzVAeJGW6GFN4APS0Qdxvycx5e0AYoY/HdWnnNg9/PGoHCx/nvVf+K5qOXDfNRuv
	 OlItbJ0Z6bCLjD0pHckNycbxUHX4WnyJfy9ovpxyNiRrZpQFBFeXruWPDxNsTMevGF
	 1DgSmu1qnBYUbZDRcuuY++ntFYUb0MCd3t2IfIuYLFIOLYApMOPcBfcI/cSt/FgcE1
	 ubqIG1SoM+Wi4Dk8nNWAPfozSTX6vdKhSyyEr1wAVxmnLkIFJwo5xreM+MaiiRejjt
	 r44iXtIzzaB8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9148D60E1B;
	Tue, 13 Jan 2026 20:59:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A90AD1CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5EB407BB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LL9XORkZSIVL for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F84D40794
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F84D40794
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E7CF81382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6673cfb2f47c03374e40ecd28bd66d65abb0248
X-Git-Newrev: 130244a730a7210498cf784bcbc5f9aa2ae4a3df
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.0E7CF81382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xlib_libXv: bump version to
 1.0.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=130244a730a7210498cf784bcbc5f9aa2ae4a3df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-December/003573.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xlib_libXv/xlib_libXv.hash | 6 +++---
 package/x11r7/xlib_libXv/xlib_libXv.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xlib_libXv/xlib_libXv.hash b/package/x11r7/xlib_libXv/xlib_libXv.hash
index 0852f27f8b..dee8059f1a 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.hash
+++ b/package/x11r7/xlib_libXv/xlib_libXv.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003280.html
-sha256  aaf7fa09f689f7a2000fe493c0d64d1487a1210db154053e9e2336b860c63848  libXv-1.0.12.tar.xz
-sha512  bdd00de1ce6a8911056181ab4de32f9e319a68567389162d4bc2e3c9946d5f3c60f87eb6c53f74c9b6a342255e591d5fef4a445a4ac8ca3c1b6fe87d42c51c1e  libXv-1.0.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003573.html
+sha256  7d34910958e1c1f8d193d828fea1b7da192297280a35437af0692f003ba03755  libXv-1.0.13.tar.xz
+sha512  80d7a11e6415fbe0fc50c3c2a1abf8f0f2ec38446c9c8d88ff48875cd94b8949cb1028f2ab37476c4b25cbd7eac34dde9132dd998c4e04ea576b95ae411ba946  libXv-1.0.13.tar.xz
 # Locally calculated
 sha256  4fac4d581d00f11c459d68b7cb970f3d4e5a5bbfb53784d85f59a90076280301  COPYING
diff --git a/package/x11r7/xlib_libXv/xlib_libXv.mk b/package/x11r7/xlib_libXv/xlib_libXv.mk
index 808b1e6e7b..e150edf03a 100644
--- a/package/x11r7/xlib_libXv/xlib_libXv.mk
+++ b/package/x11r7/xlib_libXv/xlib_libXv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XLIB_LIBXV_VERSION = 1.0.12
+XLIB_LIBXV_VERSION = 1.0.13
 XLIB_LIBXV_SOURCE = libXv-$(XLIB_LIBXV_VERSION).tar.xz
-XLIB_LIBXV_SITE = http://xorg.freedesktop.org/releases/individual/lib
+XLIB_LIBXV_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBXV_LICENSE = ISC-like
 XLIB_LIBXV_LICENSE_FILES = COPYING
 XLIB_LIBXV_CPE_ID_VENDOR = x.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
