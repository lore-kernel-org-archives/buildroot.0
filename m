Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69EDC0015E
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F5FA402A7;
	Fri, 21 Jul 2023 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F5FA402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNEvxsr8PSz7; Fri, 21 Jul 2023 21:19:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94B1A4017B;
	Fri, 21 Jul 2023 21:19:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94B1A4017B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4BCB31BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2625541875
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2625541875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W0ZWdCzmZAoI for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:19:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4039B4188B
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:19:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4039B4188B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 145CD87535; Fri, 21 Jul 2023 21:19:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:12:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ecf0baa747f8b0fa3e7f483ccde1a0ae40e3749
X-Git-Newrev: 2c97f3fc0b352104eb1a2725e5b2e81b00ab3ad4
X-Patchwork-Hint: ignore
Message-Id: <20230721211905.145CD87535@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/janet: bump to version 1.29.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2c97f3fc0b352104eb1a2725e5b2e81b00ab3ad4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-Update-for-more-minimal-builds.patch      | 29 ----------------------
 package/janet/janet.hash                           |  2 +-
 package/janet/janet.mk                             |  2 +-
 4 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 00fe9f2edd..dce0c2bf64 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -648,7 +648,6 @@ package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
 package/iucode-tool/S00iucode-tool Variables
 package/iwd/S40iwd Shellcheck Variables
 package/jack2/0001-Remove-usage-of-U-mode-bit-for-opening-files-in-pyth.patch Upstream
-package/janet/0001-Update-for-more-minimal-builds.patch Upstream
 package/janus-gateway/0001-disable-ssp.patch Upstream
 package/janus-gateway/0002-Add-test-for-Wunused-but-set-variable.patch Upstream
 package/jose/0001-lib-hsh.c-rename-hsh-local-variable.patch Upstream
diff --git a/package/janet/0001-Update-for-more-minimal-builds.patch b/package/janet/0001-Update-for-more-minimal-builds.patch
deleted file mode 100644
index ba36a9beba..0000000000
--- a/package/janet/0001-Update-for-more-minimal-builds.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 746ff5307d309536984b648460e7b5c5dac44453 Mon Sep 17 00:00:00 2001
-From: Calvin Rose <calsrose@gmail.com>
-Date: Sun, 12 Feb 2023 12:14:11 -0600
-Subject: [PATCH] Update for more minimal builds.
-
-[Retrieved (and backported) from:
-https://github.com/janet-lang/janet/commit/746ff5307d309536984b648460e7b5c5dac44453]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/core/ffi.c   | 4 ++++
- src/core/marsh.c | 2 ++
- 2 files changed, 6 insertions(+)
-
-diff --git a/src/core/ffi.c b/src/core/ffi.c
-index 45a498c7..b453f1f6 100644
---- a/src/core/ffi.c
-+++ b/src/core/ffi.c
-@@ -1311,7 +1311,11 @@ JANET_CORE_FN(cfun_ffi_jitfn,
-     size_t alloc_size = ((size_t) bytes.len + FFI_PAGE_MASK) & ~FFI_PAGE_MASK;
- 
- #ifdef JANET_FFI_JIT
-+#ifdef JANET_EV
-     JanetFFIJittedFn *fn = janet_abstract_threaded(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
-+#else
-+    JanetFFIJittedFn *fn = janet_abstract(&janet_type_ffijit, sizeof(JanetFFIJittedFn));
-+#endif
-     fn->function_pointer = NULL;
-     fn->size = 0;
- #ifdef JANET_WINDOWS
diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 47e0de4a0f..15eaafc48b 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  c95dab93e8e4ebcab5c293d5ee448fb43ab8bd2f6391fd66a6ca92fe1ec72c03  janet-1.26.0.tar.gz
+sha256  2ac3f69842f3e805a8d072a9e36f207f6287f063654c51cb3cd2b6e73b1cadf6  janet-1.29.1.tar.gz
 
 # Locally calculated
 sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index db1eb2a5c4..9c87ba79fd 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.26.0
+JANET_VERSION = 1.29.1
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
