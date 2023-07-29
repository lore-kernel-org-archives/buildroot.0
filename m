Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA4D3C001DC
	for <buildroot@archiver.kernel.org>; Sat, 29 Jul 2023 15:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5585F81EC3;
	Sat, 29 Jul 2023 15:46:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5585F81EC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMHixo-sQ-Z3; Sat, 29 Jul 2023 15:46:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D5A81E52;
	Sat, 29 Jul 2023 15:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D5A81E52
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64FD51BF3EA
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 15:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CEEC409A4
 for <buildroot@lists.busybox.net>; Sat, 29 Jul 2023 15:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CEEC409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dD7B7jvHL8gi for <buildroot@lists.busybox.net>;
 Sat, 29 Jul 2023 15:46:19 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C4794099D
 for <buildroot@buildroot.org>; Sat, 29 Jul 2023 15:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C4794099D
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 59D32A4C0367;
 Sat, 29 Jul 2023 17:46:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58728)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPm91-0007l6-0O;
 Sat, 29 Jul 2023 17:46:15 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 17:46:15 +0200
Message-Id: <20230729154615.559891-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690645575;
 bh=19aGeMKAq5U2q/Y7svU9y/FDb9nDLiVKr51tKMC6yh4=;
 h=From:To:Cc:Subject:Date:From;
 b=fEd+bf4RiXbDXTDv5yM67x5yP9o/MzmYxWdjvcL9yHbK5ITp+HXo+YnpmDbABKfYt
 GmUkpFARJjFU53okK2feCA7oJLVGCgHi7EciE5N4yM3FXYL1AxPBzDYyfgalW5YPYX
 SZl4TA8xYp5wQJrIo3+PwaFLarx5+WgtV/fPg3r8cABeOxydFJ76fg3gpZwWVJHP3k
 FcY6fzypGwQonVuqTXdrP8vTWjjTNjhDR5QsupqYP3TVAyAUhQVVv26v7VyliJ3tkY
 MFIg2xq4jSIZVriPrmE1XYLPie32PbONMqBzGSK5n+Zdj0QNfPbJG7a7QCX2KeHgkq
 A3YeOYqaRKtaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fEd+bf4R
Subject: [Buildroot] [PATCH 1/1] package/libglu: bump version to 9.0.3
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-July/000725.html

Upstream dropped autoconf, switch to meson.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
