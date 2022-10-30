Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA2C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 19:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB1F60AF1;
	Sun, 30 Oct 2022 19:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BB1F60AF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ld7FB8UouAIU; Sun, 30 Oct 2022 19:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 485AD60ADC;
	Sun, 30 Oct 2022 19:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 485AD60ADC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29ECB1BF2A1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01AB760888
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 19:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01AB760888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rhCgScDEWe-2 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 19:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A308560A98
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A308560A98
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 19:33:12 +0000 (UTC)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
 by mailout03.t-online.de (Postfix) with SMTP id 0EEF46D20;
 Sun, 30 Oct 2022 20:33:10 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.145]) by fwd83.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1opE3Q-1nFvqD0; Sun, 30 Oct 2022 20:33:08 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:48156)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1opE3P-00052M-2H;
 Sun, 30 Oct 2022 20:33:07 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 20:33:07 +0100
Message-Id: <20221030193307.1190297-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030193307.1190297-1-bernd.kuhls@t-online.de>
References: <20221030193307.1190297-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667158388-62A0A2DC-A37CDC49/0/0 CLEAN NORMAL
X-TOI-MSGID: cc92c68e-ba1c-4caa-892c-4442db2215a3
Subject: [Buildroot] [PATCH v2 4/4] package/alsa-utils: bump version to 1.2.8
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://www.alsa-project.org/wiki/Changes_v1.2.7.2_v1.2.8#alsa-utils

Removed patch 0002 due to upstream removal of UCM code:
https://github.com/alsa-project/alsa-utils/commit/62cd05a929283d919144e092892c74ac85b00a7d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 ...ay-aplay.c-make-UCM-support-optional.patch | 89 -------------------
 package/alsa-utils/alsa-utils.hash            |  2 +-
 package/alsa-utils/alsa-utils.mk              |  2 +-
 3 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
