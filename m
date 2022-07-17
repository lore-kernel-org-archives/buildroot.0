Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2A2C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 18:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABAA40A8C;
	Sun, 17 Jul 2022 18:43:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABAA40A8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8dtACEfXy4p; Sun, 17 Jul 2022 18:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17CC840A87;
	Sun, 17 Jul 2022 18:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17CC840A87
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9586B1BF3BB
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:42:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ECCA831EF
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 18:42:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ECCA831EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9AdPnt1NNYvh for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 18:42:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8592482E14
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 18:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8592482E14
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C456783C2F; Sun, 17 Jul 2022 18:29:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 20:41:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92a2308eb287b775c8e7b8818f0c99c66cae1cae
X-Git-Newrev: 83bad5e0f00df3b03fd55916f5e03e64946ff177
X-Patchwork-Hint: ignore
Message-Id: <20220717182932.C456783C2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/alsa-utils: fix two build issues
 following 1.2.7 bump
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

commit: https://git.buildroot.net/buildroot/commit/?id=83bad5e0f00df3b03fd55916f5e03e64946ff177
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4dc8563363d639255217ffc59482eaccf93a1b51 ("package/alsa-utils:
bump version to 1.2.7") has bumped alsa-utils to 1.2.7, triggering
several build failures in the autobuilders.

The two build issues are fixed by two different patches, both of which
have been submitted upstream.

The first patch fixes:

  http://autobuild.buildroot.net/results/c185ad120eb95cb3af0cd3be5fe47c924c565d3e/

The second patch fixes:

  http://autobuild.buildroot.net/results/31f52013db927511bbf0ad8e9d8701ac70e27be0/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[yann.morin.1998@free.fr: alsa-lib can be configure with*out* UCM]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...o.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch | 108 +++++++++++++++++++++
 ...2-aplay-aplay.c-make-UCM-support-optional.patch |  89 +++++++++++++++++
 2 files changed, 197 insertions(+)

diff --git a/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch b/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
new file mode 100644
index 0000000000..97c4729bf9
--- /dev/null
+++ b/package/alsa-utils/0001-alsactl-info.c-fix-conditionals-on-__ALSA_PCM_H-and-.patch
@@ -0,0 +1,108 @@
+From 4bfd1f15114550e1be7e43ae37a61906e1bff809 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 17 Jul 2022 18:59:48 +0200
+Subject: [PATCH] alsactl/info.c: fix conditionals on __ALSA_PCM_H and
+ __ALSA_RAWMIDI_H
+
+Commit bbc74a61ac7c35e506c3d7f76ecf943cb55736a6 ("alsactl: implement
+'info' command") implemented an alsactl info command. In this
+implementation, there was an attempt to properly address optional
+features from alsa-lib by using conditions on __ALSA_PCM_H,
+__ALSA_RAWMIDI_H.
+
+Unfortunately, this attempt does not work entirely: only the code
+inside pcm_device_list(), rawmidi_device_list() was conditionally
+compiled, but their very prototype also use type definitions provided
+in pcm.h and rawmidi.h. So really, it's the entire function that needs
+to be conditionally implemented.
+
+Also, snd_rawmidi_stream_name() was not handled properly, for the same
+reason.
+
+This commit implements pcm_device_list() only if __ALSA_PCM_H is
+defined, and implements snd_rawmidi_stream_name() and
+rawmidi_device_list() only if __ALSA_RAWMIDI_H is defined.
+
+general_card_info() is modified to not call the PCM or raw MIDI
+functions when support is not available.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203846.html
+---
+ alsactl/info.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/alsactl/info.c b/alsactl/info.c
+index 253539d..9bd72af 100644
+--- a/alsactl/info.c
++++ b/alsactl/info.c
+@@ -22,9 +22,9 @@
+ #include "aconfig.h"
+ #include "alsactl.h"
+ 
++#ifdef __ALSA_PCM_H
+ static int pcm_device_list(snd_ctl_t *ctl, snd_pcm_stream_t stream, bool *first)
+ {
+-#ifdef __ALSA_PCM_H
+ 	int err, dev, idx;
+ 	unsigned int count;
+ 	snd_pcm_info_t *pcminfo;
+@@ -76,10 +76,12 @@ static int pcm_device_list(snd_ctl_t *ctl, snd_pcm_stream_t stream, bool *first)
+ 						idx, snd_pcm_info_get_subdevice_name(pcminfo));
+ 		}
+ 	}
+-#endif
++
+ 	return 0;
+ }
++#endif
+ 
++#ifdef __ALSA_RAWMIDI_H
+ static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
+ {
+ 	if (stream == SND_RAWMIDI_STREAM_INPUT)
+@@ -91,7 +93,6 @@ static const char *snd_rawmidi_stream_name(snd_rawmidi_stream_t stream)
+ 
+ static int rawmidi_device_list(snd_ctl_t *ctl, snd_rawmidi_stream_t stream, bool *first)
+ {
+-#ifdef __ALSA_RAWMIDI_H
+ 	int err, dev, idx;
+ 	unsigned int count;
+ 	snd_rawmidi_info_t *info;
+@@ -143,9 +144,10 @@ static int rawmidi_device_list(snd_ctl_t *ctl, snd_rawmidi_stream_t stream, bool
+ 						idx, snd_rawmidi_info_get_subdevice_name(info));
+ 		}
+ 	}
+-#endif
++
+ 	return 0;
+ }
++#endif
+ 
+ static int hwdep_device_list(snd_ctl_t *ctl)
+ {
+@@ -227,17 +229,21 @@ int general_card_info(int cardno)
+ 	}
+ 	err = card_info(ctl);
+ 
++#ifdef __ALSA_PCM_H
+ 	first = true;
+ 	if (err >= 0)
+ 		err = pcm_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
+ 	if (err >= 0)
+ 		err = pcm_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
++#endif
+ 
++#ifdef __ALSA_RAWMIDI_H
+ 	first = true;
+ 	if (err >= 0)
+ 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_PLAYBACK, &first);
+ 	if (err >= 0)
+ 		err = rawmidi_device_list(ctl, SND_PCM_STREAM_CAPTURE, &first);
++#endif
+ 
+ 	if (err >= 0)
+ 		err = hwdep_device_list(ctl);
+-- 
+2.36.1
+
diff --git a/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
new file mode 100644
index 0000000000..0d58ae81a4
--- /dev/null
+++ b/package/alsa-utils/0002-aplay-aplay.c-make-UCM-support-optional.patch
@@ -0,0 +1,89 @@
+From 1921efacfe1a230021849b83b2877c8f239b44ab Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Sun, 17 Jul 2022 19:09:04 +0200
+Subject: [PATCH] aplay/aplay.c: make UCM support optional
+
+Commit 90f59671784a7e47b40485095cd66892d4840ed7 ("topology:
+pre-processor: Move the call to expand variables") modified aplay by
+unconditionally invoking features of the use case manager (UCM) from
+alsa-lib. However, alsa-lib can be compiled without UCM support.
+
+In order to properly support this situation, this commit changes aplay
+to only conditionally compile the UCM related code.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Upstream: https://mailman.alsa-project.org/pipermail/alsa-devel/2022-July/203847.html
+---
+ aplay/aplay.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/aplay/aplay.c b/aplay/aplay.c
+index b3b3635..59f937d 100644
+--- a/aplay/aplay.c
++++ b/aplay/aplay.c
+@@ -41,7 +41,9 @@
+ #include <time.h>
+ #include <locale.h>
+ #include <alsa/asoundlib.h>
++#ifdef HAVE_ALSA_USE_CASE_H
+ #include <alsa/use-case.h>
++#endif
+ #include <assert.h>
+ #include <termios.h>
+ #include <signal.h>
+@@ -453,6 +455,7 @@ static ssize_t xwrite(int fd, const void *buf, size_t count)
+ 	return offset;
+ }
+ 
++#ifdef HAVE_ALSA_USE_CASE_H
+ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *name)
+ {
+ 	char *s, *p;
+@@ -476,6 +479,7 @@ static int open_ucm(snd_use_case_mgr_t **uc_mgr, char **pcm_name, const char *na
+ 	}
+ 	return err;
+ }
++#endif
+ 
+ static long parse_long(const char *str, int *err)
+ {
+@@ -553,7 +557,9 @@ int main(int argc, char *argv[])
+ 	int do_device_list = 0, do_pcm_list = 0, force_sample_format = 0;
+ 	snd_pcm_info_t *info;
+ 	FILE *direction;
++#ifdef HAVE_ALSA_USE_CASE_H
+ 	snd_use_case_mgr_t *uc_mgr = NULL;
++#endif
+ 
+ #ifdef ENABLE_NLS
+ 	setlocale(LC_ALL, "");
+@@ -852,6 +858,7 @@ int main(int argc, char *argv[])
+ 		goto __end;
+ 	}
+ 
++#ifdef HAVE_ALSA_USE_CASE_H
+ 	if (strncmp(pcm_name, "ucm.", 4) == 0) {
+ 		err = open_ucm(&uc_mgr, &pcm_name, pcm_name + 4);
+ 		if (err < 0) {
+@@ -861,6 +868,7 @@ int main(int argc, char *argv[])
+ 		if (verbose)
+ 			fprintf(stderr, _("Found UCM PCM device: %s\n"), pcm_name);
+ 	}
++#endif
+ 
+ 	err = snd_pcm_open(&handle, pcm_name, stream, open_mode);
+ 	if (err < 0) {
+@@ -951,8 +959,10 @@ int main(int argc, char *argv[])
+ 	if (verbose==2)
+ 		putchar('\n');
+ 	snd_pcm_close(handle);
++#ifdef HAVE_ALSA_USE_CASE_H
+ 	if (uc_mgr)
+ 		snd_use_case_mgr_close(uc_mgr);
++#endif
+ 	handle = NULL;
+ 	free(audiobuf);
+       __end:
+-- 
+2.36.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
