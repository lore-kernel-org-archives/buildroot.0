Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F90EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 09:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3114D40889;
	Thu,  6 Jul 2023 09:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3114D40889
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HRbcxSd1NGld; Thu,  6 Jul 2023 09:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D612C4089C;
	Thu,  6 Jul 2023 09:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D612C4089C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 692A71BF3EB
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 09:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EEA74089C
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 09:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EEA74089C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiv_zz6cRpGF for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 09:27:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1011340889
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 09:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1011340889
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F10B3867E3; Thu,  6 Jul 2023 09:27:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 11:25:38 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 442e7cab3a9881e082279cb48cb8df6905bdb6e5
X-Git-Newrev: 748007faee8cd229d21e4cea15d8a966dd79a74f
X-Patchwork-Hint: ignore
Message-Id: <20230706092722.F10B3867E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/{mesa3d,
 mesa3d-headers}: bump version to 23.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=748007faee8cd229d21e4cea15d8a966dd79a74f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2023-May/000721.html
https://lists.freedesktop.org/archives/mesa-announce/2023-June/000722.html

Removed patch which is included in this version bump:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=2630f4b310f534c830250be44d285e485da83869

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c3c4b6356e866cc2d34075869e2e957b57ad2616)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...xit-early-when-trying-to-create-an-unsupp.patch | 50 ----------------------
 package/mesa3d/mesa3d.hash                         |  6 +--
 package/mesa3d/mesa3d.mk                           |  2 +-
 4 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6bfc61bcbf..f7b0ecfd52 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.1.0
+MESA3D_HEADERS_VERSION = 23.1.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
deleted file mode 100644
index 278d75e64a..0000000000
--- a/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 2a6908ff4c94284b39c3cd4c97e1069876720eb7 Mon Sep 17 00:00:00 2001
-From: Jordan Justen <jordan.l.justen@intel.com>
-Date: Tue, 16 May 2023 18:46:50 -0700
-Subject: [PATCH] mesa/main: Exit early when trying to create an unsupported
- context API
-
-Fixes: adbe8b6c17a ("mesa: optimize out _mesa_is_desktop_gl*() and _mesa_is_gles*() calls when not built")
-Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038
-Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
-Reviewed-by: Eric Engestrom <eric@engestrom.ch>
-Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23068>
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/8bb1ecaa02177720758255bdd7ec34a5d15feca4
-[Romain: backport to 23.1]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- src/mesa/main/context.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/src/mesa/main/context.c b/src/mesa/main/context.c
-index d8eea2ea867..2b810b0d863 100644
---- a/src/mesa/main/context.c
-+++ b/src/mesa/main/context.c
-@@ -996,6 +996,24 @@ _mesa_initialize_context(struct gl_context *ctx,
-    struct gl_shared_state *shared;
-    int i;
- 
-+   switch (api) {
-+   case API_OPENGL_COMPAT:
-+   case API_OPENGL_CORE:
-+      if (!HAVE_OPENGL)
-+         return GL_FALSE;
-+      break;
-+   case API_OPENGLES2:
-+      if (!HAVE_OPENGL_ES_2)
-+         return GL_FALSE;
-+      break;
-+   case API_OPENGLES:
-+      if (!HAVE_OPENGL_ES_1)
-+         return GL_FALSE;
-+      break;
-+   default:
-+      return GL_FALSE;
-+   }
-+
-    ctx->API = api;
-    ctx->DrawBuffer = NULL;
-    ctx->ReadBuffer = NULL;
--- 
-2.40.1
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f1eed92fb6..80272b70d6 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2023-May/000720.html
-sha256  a9dde3c76571c4806245a05bda1cceee347c3267127e9e549e4f4e225d92e992  mesa-23.1.0.tar.xz
-sha512  bbcfd0dd8e5414826631e80edbbe48218115a7461ef4ac1f2e4e090a48d6c0e1ab3b51dd45e988d5f1572f29bfc03c33769263c0f3e04033138d5b1ec102e8c9  mesa-23.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2023-June/000722.html
+sha256  60b1f3adb1561830c158bf3c68508943674fb9d69f384c3c7289694385ab5c7e  mesa-23.1.2.tar.xz
+sha512  728e79720d950b0f39fa55c21dff7caed3650e88dff52a2f3e70540a049f1baf78178e62e5d6b1e59c76f6555ab0be3f0043cfbddd4745c0a742ccef2f5774d4  mesa-23.1.2.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7e41442398..feb8547e73 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.1.0
+MESA3D_VERSION = 23.1.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
