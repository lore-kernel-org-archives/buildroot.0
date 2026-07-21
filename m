Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C90C4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 19:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAB0F6089F;
	Tue, 21 Jul 2026 19:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-cPr7wbhpQR; Tue, 21 Jul 2026 19:50:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B226089E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784663417;
	bh=Pn/BFKAESX1+aV1PC7KjG+MO5ndd4SDwBcseHJYAEsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=raz0HaU79lRzYvcymmFP3FMBnTTkRd8z/u/eQ2dc1AJ3mGoNTnP0vzLhCk9Bfl0OM
	 +B+RvC16MSk5c2v/QfPLnVH6xcW1j5OtOlBw2ljdwRKCXjr341YLmWydLOYuqgJTmm
	 ZRtAQP2kGbAcQ4C3FjdaDJNQFeVxw1hiTaGUsZdpACCpkP1xruBfS2NN+iygz8PLPp
	 SWmyqEIpc6bNfIb/NFQRn5Xcrmln+qgneMMGpFBxLqEKlqEgs1V+uAyqtM3dH3f1ba
	 ld4/xgGxteoyhXhFmq7mPIbd5ggZqrkoQjaqjxJYYZph708GHLSQye0ZeYzr7gYgRO
	 A81DSz6b5/OAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B226089E;
	Tue, 21 Jul 2026 19:50:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1016710A3
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90EB80C44
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-oA6JETzT3C for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D2D480DA1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D2D480DA1
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 19:50:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B42CB8913C; Tue, 21 Jul 2026 19:49:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 21:47:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfe3b3adbe9bcb06cf4e3ccd87c21363f88c7e65
X-Git-Newrev: f939799014026257af6841bda3c594d64f094566
X-Patchwork-Hint: ignore
Message-Id: <20260721194936.B42CB8913C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libqrtr-glib: bump to version 1.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f939799014026257af6841bda3c594d64f094566
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Petr Vorel <petr.vorel@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-libqrtr-lib-meson.build-fix-static-build.patch | 36 ----------------------
 package/libqrtr-glib/libqrtr-glib.hash             |  2 +-
 package/libqrtr-glib/libqrtr-glib.mk               |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)

diff --git a/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch b/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
deleted file mode 100644
index 8c0db7bed5..0000000000
--- a/package/libqrtr-glib/0001-src-libqrtr-lib-meson.build-fix-static-build.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From dd9d68259c1fb79bcf40fcdf6aa1e6026edec9b2 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 9 Feb 2024 21:16:39 +0100
-Subject: [PATCH] src/libqrtr-lib/meson.build: fix static build
-
-Replace shared_library by library to avoid the following static build
-failure:
-
-[5/5] Linking target src/libqrtr-glib/libqrtr-glib.so.0.0.0
-FAILED: src/libqrtr-glib/libqrtr-glib.so.0.0.0
-
-Fixes:
- - http://autobuild.buildroot.org/results/e0442e97279a07f33a14ec52840f98b7ec0fe32d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/merge_requests/24
----
- src/libqrtr-glib/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libqrtr-glib/meson.build b/src/libqrtr-glib/meson.build
-index bbdd869..0cddcc7 100644
---- a/src/libqrtr-glib/meson.build
-+++ b/src/libqrtr-glib/meson.build
-@@ -39,7 +39,7 @@ c_flags = [
-   '-DLIBEXEC_PATH="@0@"'.format(qrtr_prefix / qrtr_libexecdir),
- ]
- 
--libqrtr_glib = shared_library(
-+libqrtr_glib = library(
-   libname,
-   version: qrtr_glib_version,
-   sources: sources + [version_header],
--- 
-2.43.0
-
diff --git a/package/libqrtr-glib/libqrtr-glib.hash b/package/libqrtr-glib/libqrtr-glib.hash
index 38543f7de9..da02b2c2f6 100644
--- a/package/libqrtr-glib/libqrtr-glib.hash
+++ b/package/libqrtr-glib/libqrtr-glib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c5cdf5ea91cbd2cf2758b2896064c7b1dfe7156063267df905f957ac69b6b763  libqrtr-glib-1.2.2.tar.gz
+sha256  9e5f988c6005af347f6d0ac95c872e473c9c10c3ec3714ee0b73d896db7d5766  libqrtr-glib-1.4.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libqrtr-glib/libqrtr-glib.mk b/package/libqrtr-glib/libqrtr-glib.mk
index c3df76dc84..580a65cf52 100644
--- a/package/libqrtr-glib/libqrtr-glib.mk
+++ b/package/libqrtr-glib/libqrtr-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBQRTR_GLIB_VERSION = 1.2.2
+LIBQRTR_GLIB_VERSION = 1.4.0
 LIBQRTR_GLIB_SITE = https://gitlab.freedesktop.org/mobile-broadband/libqrtr-glib/-/archive/$(LIBQRTR_GLIB_VERSION)
 LIBQRTR_GLIB_LICENSE = LGPL-2.1+
 LIBQRTR_GLIB_LICENSE_FILES = LICENSES/LGPL-2.1-or-later.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
