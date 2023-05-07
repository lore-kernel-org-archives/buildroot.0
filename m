Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65961C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1659383B3F;
	Sun,  7 May 2023 21:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1659383B3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcBBRH6jEVV8; Sun,  7 May 2023 21:55:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4178E83B38;
	Sun,  7 May 2023 21:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4178E83B38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E221B1BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B846A83B38
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:55:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B846A83B38
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QG9v_SdMksX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:55:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4DAD83B32
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:55:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4DAD83B32
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3E40860E6; Sun,  7 May 2023 21:55:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:55:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d392f43437e0ee0332cac66c9d0477230ed019f
X-Git-Newrev: c85f9f4a5e01c4b948c4ac0c915467f6c606942e
X-Patchwork-Hint: ignore
Message-Id: <20230507215536.C3E40860E6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairomm: bump to version 1.16.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=c85f9f4a5e01c4b948c4ac0c915467f6c606942e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash, but only
provides xz archives (no gz).

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/cairomm/Config.in    | 2 +-
 package/cairomm/cairomm.hash | 5 ++++-
 package/cairomm/cairomm.mk   | 5 +++--
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index 75f6692b8a..174f3967ab 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_CAIROMM
 	help
 	  The cairomm package is a set of C++ bindings for Cairo.
 
-	  http://www.gtkmm.org/
+	  https://www.cairographics.org/cairomm/
 
 comment "cairomm needs a toolchain w/ C++, wchar, threads, gcc >= 7"
 	depends on BR2_USE_MMU
diff --git a/package/cairomm/cairomm.hash b/package/cairomm/cairomm.hash
index d14a65c2d6..254413af09 100644
--- a/package/cairomm/cairomm.hash
+++ b/package/cairomm/cairomm.hash
@@ -1,3 +1,6 @@
+# From https://www.cairographics.org/releases/cairomm-1.16.2.tar.xz.sha1
+sha1  c24339d5962e2bcbbea85b2fc66347e71fd3db8c  cairomm-1.16.2.tar.xz
+
 # Locally computed
-sha256  bb86d855041bd46d31b03e43ea355d233de44034b39d4200725b1e0947e63e67  cairomm-1.16.1.tar.gz
+sha256  6a63bf98a97dda2b0f55e34d1b5f3fb909ef8b70f9b8d382cb1ff3978e7dc13f  cairomm-1.16.2.tar.xz
 sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm/cairomm.mk b/package/cairomm/cairomm.mk
index 856c9d67fc..571512878e 100644
--- a/package/cairomm/cairomm.mk
+++ b/package/cairomm/cairomm.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-CAIROMM_VERSION = 1.16.1
+CAIROMM_VERSION = 1.16.2
 CAIROMM_LICENSE = LGPL-2.0+
 CAIROMM_LICENSE_FILES = COPYING
-CAIROMM_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM_VERSION)
+CAIROMM_SOURCE = cairomm-$(CAIROMM_VERSION).tar.xz
+CAIROMM_SITE = https://cairographics.org/releases
 CAIROMM_INSTALL_STAGING = YES
 CAIROMM_DEPENDENCIES = cairo libglib2 libsigc host-pkgconf
 CAIROMM_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
