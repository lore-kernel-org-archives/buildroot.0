Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B94C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52E1640B96;
	Sat, 29 Jul 2023 20:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52E1640B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xz33J32vIaBj; Sat, 29 Jul 2023 20:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85F1E404B9;
	Sat, 29 Jul 2023 20:27:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85F1E404B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 166811BF576
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F154E81D65
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 20:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F154E81D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmYBpg0z0uWV for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 20:27:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3B6D81ABB
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 20:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B6D81ABB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D04EF83AFF; Sat, 29 Jul 2023 20:27:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 22:26:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90790790925c5d456ce7585afdf6e42aa25fd9ea
X-Git-Newrev: 172e07029857a8087a70596b3a75dcc45e6a1dd8
X-Patchwork-Hint: ignore
Message-Id: <20230729202740.D04EF83AFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglu: bump version to 9.0.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=172e07029857a8087a70596b3a75dcc45e6a1dd8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-July/000725.html

Upstream dropped autoconf, switch to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libglu/libglu.hash | 6 +++---
 package/libglu/libglu.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
index 234b58dd63..17d018ac66 100644
--- a/package/libglu/libglu.hash
+++ b/package/libglu/libglu.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2021-June/000634.html
-sha256  6e7280ff585c6a1d9dfcdf2fca489251634b3377bfc33c29e4002466a38d02d4  glu-9.0.2.tar.xz
-sha512  2517d7406bb643d12c017a95dcb5d8716f307344332638bcbdf274a90752a7c22165d34745f1b082ed916bb07d40e62d1d1d67d96426225be63166f3480d6f64  glu-9.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-July/000725.html
+sha256  bd43fe12f374b1192eb15fe20e45ff456b9bc26ab57f0eee919f96ca0f8a330f  glu-9.0.3.tar.xz
+sha512  b2781059c0e176192c3fc0d7244645020937a463311171efddb9f35fb94ee43faabcf627fa7f429d48fceaf6dd9c5adb69c86c7a21ec4ea490f4ab143d52e3ba  glu-9.0.3.tar.xz
 # locally computed
 sha256  3a9992ccc9d672cfdd07ea862431d943a992d04836570c638a733bf15ec62c54  include/GL/glu.h
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index 8820e75d8b..b30187884a 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-LIBGLU_VERSION = 9.0.2
+LIBGLU_VERSION = 9.0.3
 LIBGLU_SITE = https://mesa.freedesktop.org/archive/glu
 LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.xz
 LIBGLU_LICENSE = SGI-B-2.0
 LIBGLU_LICENSE_FILES = include/GL/glu.h
 LIBGLU_INSTALL_STAGING = YES
 LIBGLU_DEPENDENCIES = libgl host-pkgconf
+LIBGLU_CONF_OPTS = -Dgl_provider=gl
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
