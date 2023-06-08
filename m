Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80ADC7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 20:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 705AC41552;
	Thu,  8 Jun 2023 20:45:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 705AC41552
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id srBuTK_8KWZL; Thu,  8 Jun 2023 20:45:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97C004154F;
	Thu,  8 Jun 2023 20:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97C004154F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BD0D1BF395
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9E8F4154F
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 20:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9E8F4154F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NLTiXQbnikRm for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 20:45:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EABBE4154A
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EABBE4154A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6AE882195; Thu,  8 Jun 2023 20:45:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 8 Jun 2023 22:43:10 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: e3fd9ccde9d89282ec4eddb480a001dec7521d88
X-Git-Newrev: ae1e0bf96a4957e6ef021b07b060ddcc269549c6
X-Patchwork-Hint: ignore
Message-Id: <20230608204543.D6AE882195@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cairomm: bump to
 version 1.16.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae1e0bf96a4957e6ef021b07b060ddcc269549c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

The website [1] states that the released version can be downloaded from
the cairo release area [2], which also features a sha1 hash, but only
provides xz archives (no gz).

[1]: https://www.cairographics.org/cairomm/
[2]: https://www.cairographics.org/releases/

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c85f9f4a5e01c4b948c4ac0c915467f6c606942e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
