Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51BADEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 21:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE1F941916;
	Tue, 25 Jul 2023 21:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE1F941916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s-BZcOdfgT_u; Tue, 25 Jul 2023 21:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E9CB41902;
	Tue, 25 Jul 2023 21:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E9CB41902
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C33E61BF4E5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BAEA8214D
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 21:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BAEA8214D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5d71PhxNqsBb for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B68808214A
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B68808214A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4B6582DC9; Tue, 25 Jul 2023 21:00:22 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 22:59:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1ea6f04f8bf6ddb93ad3e248a588ac9f3032def0
X-Git-Newrev: 6daa5562fe6cf86fdefc261a6e03200731c00151
X-Patchwork-Hint: ignore
Message-Id: <20230725210022.A4B6582DC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-utils: bump to version
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6daa5562fe6cf86fdefc261a6e03200731c00151
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  1 -
 ...001-wayland-info-Fix-build-without-libdrm.patch | 46 ----------------------
 package/wayland-utils/wayland-utils.hash           |  8 ++--
 package/wayland-utils/wayland-utils.mk             |  2 +-
 4 files changed, 4 insertions(+), 53 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b9265ae2e4..8eb88813c9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1567,7 +1567,6 @@ package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch Up
 package/wampcc/0003-Broken-build-on-Windows.patch Upstream
 package/watchdogd/S01watchdogd Indent NotExecutable
 package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch Upstream
-package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch Upstream
 package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch Upstream
 package/weston/0001-tests-Add-dependency-on-screenshooter-client-protocol.patch Upstream
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
diff --git a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
deleted file mode 100644
index 2d4591f785..0000000000
--- a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3657a11d45f133776b50c716d99f37965eb07ed1 Mon Sep 17 00:00:00 2001
-From: Olivier Fourdan <ofourdan@redhat.com>
-Date: Wed, 14 Sep 2022 09:07:10 +0200
-Subject: [PATCH] wayland-info: Fix build without libdrm
-
-wayland-info can optionally use libdrm to provide a description of the
-dmabuf format modifiers.
-
-When not using libdrm however, the build fails because "dev_t" is not
-defined.
-
-The definition of "dev_t" comes from <sys/types.h> which is included
-from <libdrm.h>, which is not included without libdrm support, hence the
-build failure.
-
-Simply include <sys/types.h> unconditionally to make sure "dev_t" is
-defined regardless of libdrm support, to fix the build failure.
-
-Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
-Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
-Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
-Reviewed-by: Simon Ser <contact@emersion.fr>
-Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
-(cherry picked from commit baa65ba9f62e6a05c32b9202b524158a21f24245)
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-3657a11d45f133776b50c716d99f37965eb07ed1]
----
- wayland-info/wayland-info.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
-index 53cd04b..98ff205 100644
---- a/wayland-info/wayland-info.c
-+++ b/wayland-info/wayland-info.c
-@@ -34,6 +34,7 @@
- #include <ctype.h>
- #include <unistd.h>
- #include <sys/mman.h>
-+#include <sys/types.h>
- 
- #include <wayland-client.h>
- #if HAVE_HUMAN_FORMAT_MODIFIER
--- 
-2.34.1
-
diff --git a/package/wayland-utils/wayland-utils.hash b/package/wayland-utils/wayland-utils.hash
index c9b16e0535..fd14b986bc 100644
--- a/package/wayland-utils/wayland-utils.hash
+++ b/package/wayland-utils/wayland-utils.hash
@@ -1,6 +1,4 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2022-September/042399.html
-md5  1a398cbb75c3ac1ac231b2a8f84bd6d6  wayland-utils-1.1.0.tar.xz
-sha1  38e5c37f5b35b86a84289659b4b0796811eb66cd  wayland-utils-1.1.0.tar.xz
-sha256  9e685863025b4feade36d53bbc8e31b43e26498be743dea84c7a84912959410a  wayland-utils-1.1.0.tar.xz
-sha512  5b841ecb9b534a9b353e104dda9410961495495380fa65e32ef40855750609b03942a87c2fd66339aab57c05b3b8699e2bee055cfd44151f9609a5f6c53349df  wayland-utils-1.1.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2023-June/042736.html
+sha256  d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4  wayland-utils-1.2.0.tar.xz
+sha512  dc69a2d88215b54486954bd9f6e91cd158b0c0b94dccd2c863477cf6b1e83a83db4466f0718aa7d2be4de8d06484c0672c79318bc5c2b1f082f893fe795c2c00  wayland-utils-1.2.0.tar.xz
 sha256  1eba39c11640014a5841dd3017e5245fc31f47e1cf43a3287a286dd6a8de8a1a  COPYING
diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
index bc648a6904..efeb7e57a8 100644
--- a/package/wayland-utils/wayland-utils.mk
+++ b/package/wayland-utils/wayland-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_UTILS_VERSION = 1.1.0
+WAYLAND_UTILS_VERSION = 1.2.0
 WAYLAND_UTILS_SITE = https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/$(WAYLAND_UTILS_VERSION)/downloads
 WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
 WAYLAND_UTILS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
