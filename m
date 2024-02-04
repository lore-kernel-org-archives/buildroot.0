Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBF1C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 21:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DFE5240420;
	Sun,  4 Feb 2024 21:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFE5240420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BWlrmXEYO8lX; Sun,  4 Feb 2024 21:16:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD16E4055F;
	Sun,  4 Feb 2024 21:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD16E4055F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A440D1BF407
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:16:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CAAF416C0
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 21:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CAAF416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M_vvkzOPz4dO for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 21:16:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B673640225
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 21:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B673640225
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F76A86918; Sun,  4 Feb 2024 21:16:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 4 Feb 2024 22:10:52 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: c1297bfb5ad0d42535fb5049e6cd0b813caa6957
X-Git-Newrev: e4fa5ebff17d899c3c0ef349b4eeb5af7b2aeb81
X-Patchwork-Hint: ignore
Message-Id: <20240204211636.9F76A86918@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/micropython:
 libffi is optional, not mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=e4fa5ebff17d899c3c0ef349b4eeb5af7b2aeb81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

libffi is optional, not mandatory since bump to version 1.22.0 in commit
1e12b7dd49d1c64a5195f226e9e4da21e84f5d0c and
https://github.com/micropython/micropython/commit/89b320737652829edbab921e86d7ad3962d86d9e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2c1cac10d8935f66260b8beeea776d3d49633ca4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/Config.in      | 1 -
 package/micropython/micropython.mk | 9 ++++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/micropython/Config.in b/package/micropython/Config.in
index b5dc47279d..30161c8b70 100644
--- a/package/micropython/Config.in
+++ b/package/micropython/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_MICROPYTHON
 	bool "micropython"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
-	select BR2_PACKAGE_LIBFFI
 	help
 	  Micro Python is a lean and fast implementation of the Python
 	  3 programming language that is optimised to run on a
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 41bd32099b..37c148da94 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -12,7 +12,7 @@ MICROPYTHON_SOURCE = micropython-$(MICROPYTHON_VERSION).tar.xz
 # and most of the copied code is not used in the unix build.
 MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
-MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
+MICROPYTHON_DEPENDENCIES = host-python3
 MICROPYTHON_CPE_ID_VENDOR = micropython
 
 # Use fallback implementation for exception handling on architectures that don't
@@ -36,6 +36,13 @@ MICROPYTHON_MAKE_OPTS += \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	CWARN=
 
+ifeq ($(BR2_PACKAGE_LIBFFI),y)
+MICROPYTHON_DEPENDENCIES += host-pkgconf libffi
+MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=1
+else
+MICROPYTHON_MAKE_OPTS += MICROPY_PY_FFI=0
+endif
+
 define MICROPYTHON_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
