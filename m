Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A956C433EF
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 07:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E49E741C63;
	Thu, 27 Jan 2022 07:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GXnyxhDCI6Je; Thu, 27 Jan 2022 07:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD6241C68;
	Thu, 27 Jan 2022 07:15:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3363C1BF470
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21BA940B41
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 07:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hxJfp6cfojtq for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 07:12:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83CC340B25
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 07:12:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 398528285F; Thu, 27 Jan 2022 07:05:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 21:52:51 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 16cbd66f0404f7984b78c118dc32196c974e65bc
X-Git-Newrev: ecaafd1804496ac853a710075e43c7d39f2c0695
X-Patchwork-Hint: ignore
Message-Id: <20220127070554.398528285F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/freeswitch:
 security bump version to 1.10.7
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
Content-Type: multipart/mixed; boundary="===============8391928964885890655=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8391928964885890655==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ecaafd1804496ac853a710075e43c7d39f2c0695
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fixes the following security issues:

- CVE-2021-41105: FreeSWITCH susceptible to Denial of Service via invalid
  SRTP packets

  When handling SRTP calls, FreeSWITCH is susceptible to a DoS where calls
  can be terminated by remote attackers.  This attack can be done
  continuously, thus denying encrypted calls during the attack.

  https://github.com/signalwire/freeswitch/security/advisories/GHSA-jh42-prph-gp36

- CVE-2021-41157: FreeSWITCH does not authenticate SIP SUBSCRIBE requests by default

  By default, SIP requests of the type SUBSCRIBE are not authenticated in
  the affected versions of FreeSWITCH.

  https://github.com/signalwire/freeswitch/security/advisories/GHSA-g7xg-7c54-rmpj

- CVE-2021-37624: FreeSWITCH does not authenticate SIP MESSAGE requests,
  leading to spam and message spoofing

  By default, SIP requests of the type MESSAGE (RFC 3428) are not
  authenticated in the affected versions of FreeSWITCH.  MESSAGE requests
  are relayed to SIP user agents registered with the FreeSWITCH server
  without requiring any authentication.  Although this behaviour can be
  changed by setting the auth-messages parameter to true, it is not the
  default setting.

  https://github.com/signalwire/freeswitch/security/advisories/GHSA-mjcm-q9h8-9xv3

- CVE-2021-41145: FreeSWITCH susceptible to Denial of Service via SIP flooding

  When flooding FreeSWITCH with SIP messages, it was observed that after a
  number of seconds the process was killed by the operating system due to
  memory exhaustion

  https://github.com/signalwire/freeswitch/security/advisories/GHSA-jvpq-23v4-gp3m

- CVE-2021-41158: FreeSWITCH vulnerable to SIP digest leak for configured gateways

  An attacker can perform a SIP digest leak attack against FreeSWITCH and
  receive the challenge response of a gateway configured on the FreeSWITCH
  server.  This is done by challenging FreeSWITCH's SIP requests with the
  realm set to that of the gateway, thus forcing FreeSWITCH to respond with
  the challenge response which is based on the password of that targeted
  gateway.

  https://github.com/signalwire/freeswitch/security/advisories/GHSA-3v3f-99mv-qvj4

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.7

Removed patch, upstream applied a different fix:
https://github.com/signalwire/freeswitch/commit/e9fde845de5b8885282bf5e70f4be3645c5c3e9b

Added optional dependency to libks, needed due to upstream commit
https://github.com/signalwire/freeswitch/commit/ed9851666615d283effb76edc7028cc08b07eff9

Added upstream patches to fix build errors.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Peter: mention security fixes]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 829777c1c9a0d40c8c5753e6fe86acfc78edfc92)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch |  26 +++++
 ...lications-mod_cv-mod_cv.cpp-fix-build-wit.patch |  44 -------
 .../freeswitch/0002-core-fix--disable-libyuv.patch | 129 +++++++++++++++++++++
 package/freeswitch/freeswitch.hash                 |   4 +-
 package/freeswitch/freeswitch.mk                   |   8 +-
 5 files changed, 163 insertions(+), 48 deletions(-)

diff --git a/package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch b/package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch
new file mode 100644
index 0000000000..57f6e660c1
--- /dev/null
+++ b/package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch
@@ -0,0 +1,26 @@
+From 68039d344d8e826e8b403c9cd0284fd07b4495ac Mon Sep 17 00:00:00 2001
+From: Dragos Oancea <dragos@signalwire.com>
+Date: Tue, 26 Oct 2021 08:42:58 +0000
+Subject: [PATCH] [core] fix build SWITCH_BYTE_ORDER == __BIG_ENDIAN
+
+Downloaded from upstream commit:
+https://github.com/signalwire/freeswitch/commit/68039d344d8e826e8b403c9cd0284fd07b4495ac
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/switch_rtp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/switch_rtp.c b/src/switch_rtp.c
+index 1880bbb19c..843ee81381 100644
+--- a/src/switch_rtp.c
++++ b/src/switch_rtp.c
+@@ -2155,7 +2155,7 @@ static void switch_send_rtcp_event(switch_rtp_t *rtp_session ,struct switch_rtcp
+ 				switch_event_add_header_string(event, SWITCH_STACK_BOTTOM, header, value);
+ 				snprintf(header, sizeof(header), "Source-Lost");
+ #if SWITCH_BYTE_ORDER == __BIG_ENDIAN
+-				tmpLost = report->lost; /* signed 24bit will extended signess to int32_t automatically */
++				tmpLost = rtcp_report_block->lost; /* signed 24bit will extended signess to int32_t automatically */
+ #else
+ 				tmpLost = ntohl(rtcp_report_block->lost)>>8;
+ 				tmpLost = tmpLost | ((tmpLost & 0x00800000) ? 0xff000000 : 0x00000000); /* ...and signess compensation */
diff --git a/package/freeswitch/0001-src-mod-applications-mod_cv-mod_cv.cpp-fix-build-wit.patch b/package/freeswitch/0001-src-mod-applications-mod_cv-mod_cv.cpp-fix-build-wit.patch
deleted file mode 100644
index cd0a3ab4c2..0000000000
--- a/package/freeswitch/0001-src-mod-applications-mod_cv-mod_cv.cpp-fix-build-wit.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 575409a14e62f73e83309daf8ff6642a235f250c Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 16 Oct 2020 23:06:36 +0200
-Subject: [PATCH] src/mod/applications/mod_cv/mod_cv.cpp: fix build with opencv
- 3.4.9
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use cvScalar instead of CV_RGB to avoid the following build failure with
-opencv 3.4.9:
-
-mod_cv.cpp:693:24: error: conversion from ‘cv::Scalar {aka cv::Scalar_<double>}’ to non-scalar type ‘CvScalar’ requested
-         CvScalar col = CV_RGB((float)255 * object_neighbors / max_neighbors, 0, 0);
-                        ^
-
-Indeed, CV_RGB is defined as cv::Scalar instead of cvScalar since
-version 3.4.2 and
-https://github.com/opencv/opencv/commit/7f9253ea0a9fe2635926379420002dbf0c3fce0f
-
-It should be noted that CV_RGB(r,g,b) = cvScalar(b,g,r,0)
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/signalwire/freeswitch/pull/914]
----
- src/mod/applications/mod_cv/mod_cv.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mod/applications/mod_cv/mod_cv.cpp b/src/mod/applications/mod_cv/mod_cv.cpp
-index 582f925abf..bbec755e91 100644
---- a/src/mod/applications/mod_cv/mod_cv.cpp
-+++ b/src/mod/applications/mod_cv/mod_cv.cpp
-@@ -690,7 +690,7 @@ void detectAndDraw(cv_context_t *context)
- 		//printf("WTF %d\n", object_neighbors);
-         //cout << "Detected " << object_neighbors << " object neighbors" << endl;
-         const int rect_height = cvRound((float)img.rows * object_neighbors / max_neighbors);
--        CvScalar col = CV_RGB((float)255 * object_neighbors / max_neighbors, 0, 0);
-+        CvScalar col = cvScalar(0, 0, (float)255 * object_neighbors / max_neighbors, 0);
-         rectangle(img, cvPoint(0, img.rows), cvPoint(img.cols/10, img.rows - rect_height), col, -1);
- 
-         parse_stats(&context->nestDetected, nestedObjects.size(), context->skip);
--- 
-2.28.0
-
diff --git a/package/freeswitch/0002-core-fix--disable-libyuv.patch b/package/freeswitch/0002-core-fix--disable-libyuv.patch
new file mode 100644
index 0000000000..137cb27cf8
--- /dev/null
+++ b/package/freeswitch/0002-core-fix--disable-libyuv.patch
@@ -0,0 +1,129 @@
+From a2ce46c6fde38d6ac54a8a2ee1a5b391e2ed2071 Mon Sep 17 00:00:00 2001
+From: Sebastian Kemper <sebastian_ml@gmx.net>
+Date: Mon, 1 Nov 2021 09:59:09 +0100
+Subject: [PATCH] [core] fix "--disable-libyuv"
+
+Recent changes made it impossible to compile freeswitch without libyuv
+support.
+
+src/switch_core_video.c: In function 'switch_img_read_from_file':
+src/switch_core_video.c:3139:4: error: implicit declaration of function 'RAWToI420' [-Werror=implicit-function-declaration]
+RAWToI420(data, width * 3,
+^
+src/switch_core_video.c:3148:4: error: implicit declaration of function 'ABGRToARGB' [-Werror=implicit-function-declaration]
+ABGRToARGB(data, width * 4, img->planes[SWITCH_PLANE_PACKED], img->stride[SWITCH_PLANE_PACKED], width, height);
+^
+
+Fix this my adding/moving the checks for "SWITCH_HAVE_YUV".
+
+Downloaded from upstream commit:
+https://github.com/signalwire/freeswitch/commit/a2ce46c6fde38d6ac54a8a2ee1a5b391e2ed2071
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Sebastian Kemper <sebastian_ml@gmx.net>
+---
+ src/switch_core_video.c        | 12 ++++++++++++
+ tests/unit/switch_core_video.c |  4 ++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/src/switch_core_video.c b/src/switch_core_video.c
+index 7dbd685d6ee..0d377f9c3e4 100644
+--- a/src/switch_core_video.c
++++ b/src/switch_core_video.c
+@@ -3116,6 +3116,7 @@ SWITCH_DECLARE(switch_status_t) switch_img_data_url_png(switch_image_t *img, cha
+ 
+ SWITCH_DECLARE(switch_image_t *) switch_img_read_from_file(const char* file_name, switch_img_fmt_t img_fmt)
+ {
++#ifdef SWITCH_HAVE_YUV
+ 	int width = 0, height = 0, channels = 0;
+ 	int comp = STBI_rgb;
+ 	unsigned char *data = NULL;
+@@ -3155,12 +3156,16 @@ SWITCH_DECLARE(switch_image_t *) switch_img_read_from_file(const char* file_name
+ 	} else if (data) {
+ 		stbi_image_free(data);
+ 	}
++#endif
+ 
+ 	return NULL;
+ }
+ 
+ SWITCH_DECLARE(switch_status_t) switch_img_write_to_file(switch_image_t *img, const char* file_name, int quality)
+ {
++#ifndef SWITCH_HAVE_YUV
++	return SWITCH_STATUS_FALSE;
++#else
+ 	int comp = STBI_rgb;
+ 	unsigned char *data = NULL;
+ 	const char *ext = strrchr(file_name, '.');
+@@ -3217,6 +3222,7 @@ SWITCH_DECLARE(switch_status_t) switch_img_write_to_file(switch_image_t *img, co
+ 	free(data);
+ 
+ 	return ret ? SWITCH_STATUS_SUCCESS : SWITCH_STATUS_FALSE;
++#endif
+ }
+ 
+ typedef struct data_url_context_s {
+@@ -3224,14 +3230,19 @@ typedef struct data_url_context_s {
+ 	char **urlP;
+ } data_url_context_t;
+ 
++#ifdef SWITCH_HAVE_YUV
+ static void data_url_write_func(void *context, void *data, int size)
+ {
+ 	switch_buffer_t *buffer = (switch_buffer_t *)context;
+ 	switch_buffer_write(buffer, data, size);
+ }
++#endif
+ 
+ SWITCH_DECLARE(switch_status_t) switch_img_data_url(switch_image_t *img, char **urlP, const char *type, int quality)
+ {
++#ifndef SWITCH_HAVE_YUV
++	return SWITCH_STATUS_FALSE;
++#else
+ 	int comp = STBI_rgb;
+ 	unsigned char *data = NULL;
+ 	int stride_in_bytes = 0;
+@@ -3300,6 +3311,7 @@ SWITCH_DECLARE(switch_status_t) switch_img_data_url(switch_image_t *img, char **
+ 	switch_buffer_destroy(&buffer);
+ 
+ 	return ret ? SWITCH_STATUS_SUCCESS : SWITCH_STATUS_FALSE;
++#endif /* SWITCH_HAVE_YUV */
+ }
+ 
+ 
+diff --git a/tests/unit/switch_core_video.c b/tests/unit/switch_core_video.c
+index 27c96102929..e395db474d5 100644
+--- a/tests/unit/switch_core_video.c
++++ b/tests/unit/switch_core_video.c
+@@ -48,6 +48,7 @@ FST_CORE_BEGIN("./conf")
+ 		}
+ 		FST_TEARDOWN_END()
+ 
++#ifdef SWITCH_HAVE_YUV
+ 		FST_TEST_BEGIN(data_url_test)
+ 		{
+ 			char *data_url = NULL;
+@@ -88,6 +89,7 @@ FST_CORE_BEGIN("./conf")
+ 			unlink(argb_filename);
+ 		}
+ 		FST_TEST_END()
++#endif /* SWITCH_HAVE_YUV */
+ 
+ 		FST_TEST_BEGIN(img_patch)
+ 		{
+@@ -239,6 +241,7 @@ FST_CORE_BEGIN("./conf")
+ 		}
+ 		FST_TEST_END()
+ 
++#ifdef SWITCH_HAVE_YUV
+ 		FST_TEST_BEGIN(stb_data_url)
+ 		{
+ 			switch_image_t *img = switch_img_alloc(NULL, SWITCH_IMG_FMT_I420, 120, 60, 1);
+@@ -321,6 +324,7 @@ FST_CORE_BEGIN("./conf")
+ 			unlink(jpg_write_filename);
+ 		}
+ 		FST_TEST_END()
++#endif /* SWITCH_HAVE_YUV */
+ 	}
+ 	FST_SUITE_END()
+ }
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index dc5a67980f..8066c620c4 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.6.-release.tar.xz.sha256
-sha256  9a08d4e184e6d715e1c12c43a0f901597151752ef236f0a37e40996272b5c38d  freeswitch-1.10.6.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.7.-release.tar.xz.sha256
+sha256  0919bddc2ea9cab2e4944314e71637bea9dd4f40d510722a74ea032104594c41  freeswitch-1.10.7.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 944867cc75..c576e5f267 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.6
+FREESWITCH_VERSION = 1.10.7
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
@@ -120,7 +120,6 @@ FREESWITCH_ENABLED_MODULES += \
 	endpoints/mod_rtc \
 	endpoints/mod_rtmp \
 	endpoints/mod_sofia \
-	endpoints/mod_verto \
 	event_handlers/mod_cdr_csv \
 	event_handlers/mod_cdr_sqlite \
 	event_handlers/mod_event_socket \
@@ -209,6 +208,11 @@ FREESWITCH_DEPENDENCIES += libilbc
 FREESWITCH_ENABLED_MODULES += codecs/mod_ilbc
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKS),y)
+FREESWITCH_DEPENDENCIES += libks
+FREESWITCH_ENABLED_MODULES += endpoints/mod_verto
+endif
+
 ifeq ($(BR2_PACKAGE_LIBLDNS),y)
 FREESWITCH_DEPENDENCIES += libldns
 FREESWITCH_ENABLED_MODULES += applications/mod_enum

--===============8391928964885890655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8391928964885890655==--
