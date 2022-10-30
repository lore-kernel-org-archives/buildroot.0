Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5598ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 580B14025D;
	Sun, 30 Oct 2022 19:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 580B14025D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 545StFtmJk1a; Sun, 30 Oct 2022 19:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE7C3401A2;
	Sun, 30 Oct 2022 19:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE7C3401A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA581BF956
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42D9B400FA
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:43:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42D9B400FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4ljS7gjBBlB for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:43:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBA82400EB
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBA82400EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8AE387608; Sun, 30 Oct 2022 19:43:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:40:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b97b3e3bcdc5a099fdaef84ce1d131dbe6a3e79
X-Git-Newrev: 6c967d184d116a6eae9243e718b19e904582a686
X-Patchwork-Hint: ignore
Message-Id: <20221030194324.D8AE387608@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: bump version to 1.2.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c967d184d116a6eae9243e718b19e904582a686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.7.2_v1.2.8#alsa-utils

Removed patch 0002 due to upstream removal of UCM code:
https://github.com/alsa-project/alsa-utils/commit/62cd05a929283d919144e092892c74ac85b00a7d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...2-aplay-aplay.c-make-UCM-support-optional.patch | 89 ----------------------
 package/alsa-utils/alsa-utils.hash                 |  2 +-
 package/alsa-utils/alsa-utils.mk                   |  2 +-
 3 files changed, 2 insertions(+), 91 deletions(-)

diff --git a/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
deleted file mode 100644
index 0d58ae81a4..0000000000
--- a/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From 1921efacfe1a230021849b83b2877c8f239b44ab Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Sun, 17 Jul 2022 19:09:04 +0200
-Subject: [PATCH] aplay/aplay.c: make UCM support optional
-
-Commit 90f59671784a7e47b40485095cd66892d4840ed7 ("topology:
-pre-processor: Move the call to expand variables") modified aplay by
-unconditionally invoking features of the use case manager (UCM) from
-alsa-lib. However, alsa-lib can be compiled without UCM support.
-
-In order to properly support this situation, this commit changes aplay
-to only conditionally compile the UCM related code.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203847.html
----
- aplay/aplay.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/aplay/aplay.c b/aplay/aplay.c
-index b3b3635..59f937d 100644
---- a/aplay/aplay.c
-+++ b/aplay/aplay.c
-@@ -41,7 +41,9 @@
- #include <time.h>
- #include <locale.h>
- #include <alsa/asoundlib.h>
-+#ifdef HAVE_ALSA_USE_CASE_H
- #include <alsa/use-case.h>
-+#endif
- #include <assert.h>
- #include <termios.h>
- #include <signal.h>
-@@ -453,6 +455,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
- 	return offset;
- }
- 
-+#ifdef HAVE_ALSA_USE_CASE_H
- static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *name)
- {
- 	char *s, *p;
-@@ -476,6 +479,7 @@ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *na
- 	}
- 	return err;
- }
-+#endif
- 
- static long parse_long(const char *str, int *err)
- {
-@@ -553,7 +557,9 @@ int main(int argc, char *argv[])
- 	int do_device_list = 0, do_pcm_list = 0, force_sample_format = 0;
- 	snd_pcm_info_t *info;
- 	FILE *direction;
-+#ifdef HAVE_ALSA_USE_CASE_H
- 	snd_use_case_mgr_t *uc_mgr = NULL;
-+#endif
- 
- #ifdef ENABLE_NLS
- 	setlocale(LC_ALL, "");
-@@ -852,6 +858,7 @@ int main(int argc, char *argv[])
- 		goto __end;
- 	}
- 
-+#ifdef HAVE_ALSA_USE_CASE_H
- 	if (strncmp(pcm_name, "ucm.", 4) == 0) {
- 		err = open_ucm(&uc_mgr, &pcm_name, pcm_name + 4);
- 		if (err < 0) {
-@@ -861,6 +868,7 @@ int main(int argc, char *argv[])
- 		if (verbose)
- 			fprintf(stderr, _("Found UCM PCM device: %s\n"), pcm_name);
- 	}
-+#endif
- 
- 	err = snd_pcm_open(&handle, pcm_name, stream, open_mode);
- 	if (err < 0) {
-@@ -951,8 +959,10 @@ int main(int argc, char *argv[])
- 	if (verbose==2)
- 		putchar('\n');
- 	snd_pcm_close(handle);
-+#ifdef HAVE_ALSA_USE_CASE_H
- 	if (uc_mgr)
- 		snd_use_case_mgr_close(uc_mgr);
-+#endif
- 	handle = NULL;
- 	free(audiobuf);
-       __end:
--- 
-2.36.1
-
diff --git a/package/alsa-utils/alsa-utils.hash b/package/alsa-utils/alsa-utils.hash
index c53fe07963..66c04d261f 100644
--- a/package/alsa-utils/alsa-utils.hash
+++ b/package/alsa-utils/alsa-utils.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e906bf2404ff04c448eaa3d226d283a62b9a283f12e4fd8457fb24bac274e678  alsa-utils-1.2.7.tar.bz2
+sha256  e140fa604c351f36bd72167c8860c69d81b964ae6ab53992d6434dde38e9333c  alsa-utils-1.2.8.tar.bz2
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 65a7853c79..8c43f58b76 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALSA_UTILS_VERSION = 1.2.7
+ALSA_UTILS_VERSION = 1.2.8
 ALSA_UTILS_SOURCE = alsa-utils-$(ALSA_UTILS_VERSION).tar.bz2
 ALSA_UTILS_SITE = https://www.alsa-project.org/files/pub/utils
 ALSA_UTILS_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
