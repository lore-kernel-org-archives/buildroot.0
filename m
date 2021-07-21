Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455EDC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:22:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D2D60F46
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18D2D60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D31684051F;
	Wed,  4 Aug 2021 00:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xeks-hUna81M; Wed,  4 Aug 2021 00:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADF2240628;
	Wed,  4 Aug 2021 00:22:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F0061BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7EE741483
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ajz2kVVQFkXI for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B9BA40F1D
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B56FC81469; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:10:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 35953d1e61aa8581be09c9dca39365955b10590e
X-Git-Newrev: af19131543926879fb6676a3352c63ac0b2038bc
X-Patchwork-Hint: ignore
Message-Id: <20210803211013.B56FC81469@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/alsa-lib: bump to
 1.2.5.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=af19131543926879fb6676a3352c63ac0b2038bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This version bump is needed prior to the introduction of alsa-plugins
1.2.5.

As part of this bump, we drop 0002-dlmisc-the-snd_plugin_dir_set.patch
which was an upstream backport, and we introduce
0002-fix-build-with-disable-ucm.patch to fix the build of alsa-lib
when UCM support is disabled. This patch is also backported from
upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-dlmisc-the-snd_plugin_dir_set.patch       | 34 -----------------
 .../alsa-lib/0002-fix-build-with-disable-ucm.patch | 43 ++++++++++++++++++++++
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 4 files changed, 45 insertions(+), 36 deletions(-)

diff --git a/package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch b/package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch
deleted file mode 100644
index 61d945455c..0000000000
--- a/package/alsa-lib/0002-dlmisc-the-snd_plugin_dir_set.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 22 Oct 2020 20:57:32 +0200
-Subject: [PATCH] dlmisc: the snd_plugin_dir_set / snd_plugin_dir must be
- declared even for \!DL_ORIGIN_AVAILABLE
-
-Fixes: 8580c081c2 ("dlsym: add support for ALSA_PLUGIN_DIR environment variable")
-BugLink: https://github.com/alsa-project/alsa-lib/issues/91
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-Downloaded from upstream commit
-https://github.com/alsa-project/alsa-lib/commit/ad8c8e5503980295dd8e5e54a6285d2d7e32eb1e
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/dlmisc.c | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/src/dlmisc.c b/src/dlmisc.c
-index c9517c55..f20eb593 100644
---- a/src/dlmisc.c
-+++ b/src/dlmisc.c
-@@ -42,11 +42,9 @@
- #ifndef PIC
- struct snd_dlsym_link *snd_dlsym_start = NULL;
- #endif
--#ifdef DL_ORIGIN_AVAILABLE
- static int snd_plugin_dir_set = 0;
- static char *snd_plugin_dir = NULL;
- #endif
--#endif
- 
- #if defined(DL_ORIGIN_AVAILABLE) && defined(HAVE_LIBPTHREAD)
- static pthread_mutex_t snd_dlpath_mutex = PTHREAD_MUTEX_INITIALIZER;
diff --git a/package/alsa-lib/0002-fix-build-with-disable-ucm.patch b/package/alsa-lib/0002-fix-build-with-disable-ucm.patch
new file mode 100644
index 0000000000..144c8e3fbd
--- /dev/null
+++ b/package/alsa-lib/0002-fix-build-with-disable-ucm.patch
@@ -0,0 +1,43 @@
+From 3fbaea3ff390d4c09adbf5d6ae62fb7b5f3f24f5 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Mon, 28 Jun 2021 12:08:53 +0200
+Subject: [PATCH] fix build with --disable-ucm
+
+Link: https://mailman.alsa-project.org/pipermail/alsa-devel/2021-June/186729.html
+Reported-by: Michael Forney <mforney@mforney.org>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+Upstream: f4f29d42be8b8ad60ea4c5697374adad4bfe6868
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ include/local.h | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/include/local.h b/include/local.h
+index 4e7d88a0..7cfcec53 100644
+--- a/include/local.h
++++ b/include/local.h
+@@ -374,6 +374,8 @@ int _snd_config_load_with_include(snd_config_t *config, snd_input_t *in,
+ void *INTERNAL(snd_dlopen)(const char *name, int mode, char *errbuf, size_t errbuflen);
+ #endif
+ 
++#ifdef BUILD_UCM
++
+ const char *uc_mgr_alibcfg_by_device(snd_config_t **config, const char *name);
+ 
+ static inline int _snd_is_ucm_device(const char *name)
+@@ -381,4 +383,12 @@ static inline int _snd_is_ucm_device(const char *name)
+ 	return name && name[0] == '_' && name[1] == 'u' && name[2] == 'c' && name[3] == 'm';
+ }
+ 
++#else
++
++static inline const char *uc_mgr_alibcfg_by_device(snd_config_t **config, const char *name) { return NULL; }
++static inline int _snd_is_ucm_device(const char *name) { return 0; }
++
++
++#endif
++
+ #endif
+-- 
+2.31.1
+
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index 6e65fb7166..6660c8a104 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  f7554be1a56cdff468b58fc1c29b95b64864c590038dd309c7a978c7116908f7  alsa-lib-1.2.4.tar.bz2
+sha256  628421d950cecaf234de3f899d520c0a6923313c964ad751ffac081df331438e  alsa-lib-1.2.5.1.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index b1bfaf30e5..c71ad5dd58 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.4
+ALSA_LIB_VERSION = 1.2.5.1
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
