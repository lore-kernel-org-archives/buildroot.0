Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A107C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F98842AB;
	Sun, 11 Feb 2024 21:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iwo4C9WPelgH; Sun, 11 Feb 2024 21:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B64B842AC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B64B842AC;
	Sun, 11 Feb 2024 21:30:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A9051BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04DA2405F5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6TblhyQE4iW for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:30:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8FDE405F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8FDE405F3
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C31187789; Sun, 11 Feb 2024 21:30:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:28:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69ad593a410ac734a629fd0dc4590ec7f43308ec
X-Git-Newrev: cd27bde7f0d1d254b386fb7a719fe3b0f892bc9f
X-Patchwork-Hint: ignore
Message-Id: <20240211213031.9C31187789@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-lib: bump version to 1.2.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd27bde7f0d1d254b386fb7a719fe3b0f892bc9f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which is included in this release.

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.10_v1.2.11#alsa-lib

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ve-__STRING-macro-outside-PIC-ifdef-block.patch | 50 ----------------------
 package/alsa-lib/alsa-lib.hash                     |  2 +-
 package/alsa-lib/alsa-lib.mk                       |  2 +-
 3 files changed, 2 insertions(+), 52 deletions(-)

diff --git a/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch b/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch
deleted file mode 100644
index 7bd67507fd..0000000000
--- a/package/alsa-lib/0002-global-h-move-__STRING-macro-outside-PIC-ifdef-block.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 10bd599970acc71c92f85eb08943eb8d3d702a9c Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Wed, 6 Sep 2023 15:16:44 +0200
-Subject: [PATCH] global.h: move __STRING() macro outside !PIC ifdef block
-
-It solves the musl libc compilation issue.
-
-control.c: In function 'snd_ctl_open_conf':
-../../include/global.h:98:36: warning: implicit declaration of function '__STRING' [-Wimplicit-function-declaratio]
-   98 | #define SND_DLSYM_VERSION(version) __STRING(version)
-      |                                    ^~~~~~~~
-
-Fixes: https://github.com/alsa-project/alsa-lib/issues/350
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-Upstream: https://github.com/alsa-project/alsa-lib/commit/10bd599970acc71c92f85eb08943eb8d3d702a9c
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- include/global.h | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/include/global.h b/include/global.h
-index dfe9bc2b..3ecaeee8 100644
---- a/include/global.h
-+++ b/include/global.h
-@@ -51,6 +51,11 @@ const char *snd_asoundlib_version(void);
- #define ATTRIBUTE_UNUSED __attribute__ ((__unused__))
- #endif
- 
-+#ifndef __STRING
-+/** \brief Return 'x' argument as string */
-+#define __STRING(x)     #x
-+#endif
-+
- #ifdef PIC /* dynamic build */
- 
- /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
-@@ -71,11 +76,6 @@ struct snd_dlsym_link {
- 
- extern struct snd_dlsym_link *snd_dlsym_start;
- 
--#ifndef __STRING
--/** \brief Return 'x' argument as string */
--#define __STRING(x)     #x
--#endif
--
- /** \hideinitializer \brief Helper macro for #SND_DLSYM_BUILD_VERSION. */
- #define __SND_DLSYM_VERSION(prefix, name, version) _ ## prefix ## name ## version
- /**
diff --git a/package/alsa-lib/alsa-lib.hash b/package/alsa-lib/alsa-lib.hash
index a6d9c7dbdc..830643dea8 100644
--- a/package/alsa-lib/alsa-lib.hash
+++ b/package/alsa-lib/alsa-lib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  c86a45a846331b1b0aa6e6be100be2a7aef92efd405cf6bac7eef8174baa920e  alsa-lib-1.2.10.tar.bz2
+sha256  9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d  alsa-lib-1.2.11.tar.bz2
 sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
 sha256  bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced  aserver/COPYING
diff --git a/package/alsa-lib/alsa-lib.mk b/package/alsa-lib/alsa-lib.mk
index 5dfcd1e861..246761d4e6 100644
--- a/package/alsa-lib/alsa-lib.mk
+++ b/package/alsa-lib/alsa-lib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_LIB_VERSION = 1.2.10
+ALSA_LIB_VERSION = 1.2.11
 ALSA_LIB_SOURCE = alsa-lib-$(ALSA_LIB_VERSION).tar.bz2
 ALSA_LIB_SITE = https://www.alsa-project.org/files/pub/lib
 ALSA_LIB_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (aserver)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
