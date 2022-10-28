Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97400C38A02
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 19:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30ED7408D7;
	Fri, 28 Oct 2022 19:16:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30ED7408D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N1p-iVu6C34k; Fri, 28 Oct 2022 19:16:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38BF040338;
	Fri, 28 Oct 2022 19:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38BF040338
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06E3A1BF859
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E45C0606FF
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:16:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E45C0606FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpFsDrqSdjxE for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 19:16:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2464606F9
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2464606F9
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 19:16:00 +0000 (UTC)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
 by mailout02.t-online.de (Postfix) with SMTP id A675A21C4;
 Fri, 28 Oct 2022 21:15:28 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.226]) by fwd75.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ooUpD-3rA9HW0; Fri, 28 Oct 2022 21:15:27 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52200)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ooUpC-0003Fh-29;
 Fri, 28 Oct 2022 21:15:26 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 21:15:26 +0200
Message-Id: <20221028191526.122405-4-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028191526.122405-1-bernd.kuhls@t-online.de>
References: <20221028191526.122405-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666984527-3C882535-187D39A1/0/0 CLEAN NORMAL
X-TOI-MSGID: 28a60dd9-a9b1-47d9-8ddb-c529a9b26855
Subject: [Buildroot] [PATCH 4/4] package/alsa-utils: bump version to 1.2.8
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

Removed patch 0002 which fixed UCM support, upstream however removed the
UCM code:
https://github.com/alsa-project/alsa-utils/commit/62cd05a929283d919144e092892c74ac85b00a7d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
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
