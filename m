Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1B8C433FE
	for <buildroot@archiver.kernel.org>; Sun, 16 Oct 2022 15:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 701B040905;
	Sun, 16 Oct 2022 15:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 701B040905
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GacHGSnzsUD; Sun, 16 Oct 2022 15:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 41B83408F3;
	Sun, 16 Oct 2022 15:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41B83408F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E20CA1BF2FA
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C90D5409B4
 for <buildroot@lists.busybox.net>; Sun, 16 Oct 2022 15:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90D5409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZHftFIRb2I8T for <buildroot@lists.busybox.net>;
 Sun, 16 Oct 2022 15:29:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48517409B1
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48517409B1
 for <buildroot@buildroot.org>; Sun, 16 Oct 2022 15:29:46 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout07.t-online.de (Postfix) with SMTP id 5B69D1844A;
 Sun, 16 Oct 2022 17:29:44 +0200 (CEST)
Received: from fli4l.lan.fli4l ([84.161.190.223]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ok5a8-1L8ooj0; Sun, 16 Oct 2022 17:29:40 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:55518)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ok5a7-0000Ej-1a;
 Sun, 16 Oct 2022 17:29:39 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 16 Oct 2022 17:29:39 +0200
Message-Id: <20221016152939.1162118-2-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221016152939.1162118-1-bernd.kuhls@t-online.de>
References: <20221016152939.1162118-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1665934180-EEFF2A26-3BEFD420/0/0 CLEAN NORMAL
X-TOI-MSGID: dd77371d-836f-4ca1-babb-989ba6bc314a
Subject: [Buildroot] [PATCH 2/2] package/freeswitch: bump version to 1.10.8
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.8

Removed two patches which are included in upstream release,
renumbered remaining patch.

Removed libs/apr-util/LICENSE due to upstream removal of bundled
apr-util package.

Added fix to disable pcap detection, otherwise /usr/bin/pcap-config
can be picked-up which breaks building freeswitch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch |  26 ----
 ...hash-hmac_ossl.c-fix-build-with-lib.patch} |   0
 .../0002-core-fix--disable-libyuv.patch       | 129 ------------------
 package/freeswitch/freeswitch.hash            |   5 +-
 package/freeswitch/freeswitch.mk              |   9 +-
 5 files changed, 8 insertions(+), 161 deletions(-)
 delete mode 100644 package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch
 rename package/freeswitch/{0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch => 0001-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch} (100%)
 delete mode 100644 package/freeswitch/0002-core-fix--disable-libyuv.patch

diff --git a/package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch b/package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch
deleted file mode 100644
index 57f6e660c1..0000000000
--- a/package/freeswitch/0001-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 68039d344d8e826e8b403c9cd0284fd07b4495ac Mon Sep 17 00:00:00 2001
-From: Dragos Oancea <dragos@signalwire.com>
-Date: Tue, 26 Oct 2021 08:42:58 +0000
-Subject: [PATCH] [core] fix build SWITCH_BYTE_ORDER == __BIG_ENDIAN
-
-Downloaded from upstream commit:
-https://github.com/signalwire/freeswitch/commit/68039d344d8e826e8b403c9cd0284fd07b4495ac
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/switch_rtp.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/switch_rtp.c b/src/switch_rtp.c
-index 1880bbb19c..843ee81381 100644
---- a/src/switch_rtp.c
-+++ b/src/switch_rtp.c
-@@ -2155,7 +2155,7 @@ static void switch_send_rtcp_event(switch_rtp_t *rtp_session ,struct switch_rtcp
- 				switch_event_add_header_string(event, SWITCH_STACK_BOTTOM, header, value);
- 				snprintf(header, sizeof(header), "Source-Lost");
- #if SWITCH_BYTE_ORDER == __BIG_ENDIAN
--				tmpLost = report->lost; /* signed 24bit will extended signess to int32_t automatically */
-+				tmpLost = rtcp_report_block->lost; /* signed 24bit will extended signess to int32_t automatically */
- #else
- 				tmpLost = ntohl(rtcp_report_block->lost)>>8;
- 				tmpLost = tmpLost | ((tmpLost & 0x00800000) ? 0xff000000 : 0x00000000); /* ...and signess compensation */
diff --git a/package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch b/package/freeswitch/0001-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
similarity index 100%
rename from package/freeswitch/0003-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
rename to package/freeswitch/0001-libs-srtp-crypto-hash-hmac_ossl.c-fix-build-with-lib.patch
diff --git a/package/freeswitch/0002-core-fix--disable-libyuv.patch b/package/freeswitch/0002-core-fix--disable-libyuv.patch
deleted file mode 100644
index 137cb27cf8..0000000000
--- a/package/freeswitch/0002-core-fix--disable-libyuv.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From a2ce46c6fde38d6ac54a8a2ee1a5b391e2ed2071 Mon Sep 17 00:00:00 2001
-From: Sebastian Kemper <sebastian_ml@gmx.net>
-Date: Mon, 1 Nov 2021 09:59:09 +0100
-Subject: [PATCH] [core] fix "--disable-libyuv"
-
-Recent changes made it impossible to compile freeswitch without libyuv
-support.
-
-src/switch_core_video.c: In function 'switch_img_read_from_file':
-src/switch_core_video.c:3139:4: error: implicit declaration of function 'RAWToI420' [-Werror=implicit-function-declaration]
-RAWToI420(data, width * 3,
-^
-src/switch_core_video.c:3148:4: error: implicit declaration of function 'ABGRToARGB' [-Werror=implicit-function-declaration]
-ABGRToARGB(data, width * 4, img->planes[SWITCH_PLANE_PACKED], img->stride[SWITCH_PLANE_PACKED], width, height);
-^
-
-Fix this my adding/moving the checks for "SWITCH_HAVE_YUV".
-
-Downloaded from upstream commit:
-https://github.com/signalwire/freeswitch/commit/a2ce46c6fde38d6ac54a8a2ee1a5b391e2ed2071
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Signed-off-by: Sebastian Kemper <sebastian_ml@gmx.net>
----
- src/switch_core_video.c        | 12 ++++++++++++
- tests/unit/switch_core_video.c |  4 ++++
- 2 files changed, 16 insertions(+)
-
-diff --git a/src/switch_core_video.c b/src/switch_core_video.c
-index 7dbd685d6ee..0d377f9c3e4 100644
---- a/src/switch_core_video.c
-+++ b/src/switch_core_video.c
-@@ -3116,6 +3116,7 @@ SWITCH_DECLARE(switch_status_t) switch_img_data_url_png(switch_image_t *img, cha
- 
- SWITCH_DECLARE(switch_image_t *) switch_img_read_from_file(const char* file_name, switch_img_fmt_t img_fmt)
- {
-+#ifdef SWITCH_HAVE_YUV
- 	int width = 0, height = 0, channels = 0;
- 	int comp = STBI_rgb;
- 	unsigned char *data = NULL;
-@@ -3155,12 +3156,16 @@ SWITCH_DECLARE(switch_image_t *) switch_img_read_from_file(const char* file_name
- 	} else if (data) {
- 		stbi_image_free(data);
- 	}
-+#endif
- 
- 	return NULL;
- }
- 
- SWITCH_DECLARE(switch_status_t) switch_img_write_to_file(switch_image_t *img, const char* file_name, int quality)
- {
-+#ifndef SWITCH_HAVE_YUV
-+	return SWITCH_STATUS_FALSE;
-+#else
- 	int comp = STBI_rgb;
- 	unsigned char *data = NULL;
- 	const char *ext = strrchr(file_name, '.');
-@@ -3217,6 +3222,7 @@ SWITCH_DECLARE(switch_status_t) switch_img_write_to_file(switch_image_t *img, co
- 	free(data);
- 
- 	return ret ? SWITCH_STATUS_SUCCESS : SWITCH_STATUS_FALSE;
-+#endif
- }
- 
- typedef struct data_url_context_s {
-@@ -3224,14 +3230,19 @@ typedef struct data_url_context_s {
- 	char **urlP;
- } data_url_context_t;
- 
-+#ifdef SWITCH_HAVE_YUV
- static void data_url_write_func(void *context, void *data, int size)
- {
- 	switch_buffer_t *buffer = (switch_buffer_t *)context;
- 	switch_buffer_write(buffer, data, size);
- }
-+#endif
- 
- SWITCH_DECLARE(switch_status_t) switch_img_data_url(switch_image_t *img, char **urlP, const char *type, int quality)
- {
-+#ifndef SWITCH_HAVE_YUV
-+	return SWITCH_STATUS_FALSE;
-+#else
- 	int comp = STBI_rgb;
- 	unsigned char *data = NULL;
- 	int stride_in_bytes = 0;
-@@ -3300,6 +3311,7 @@ SWITCH_DECLARE(switch_status_t) switch_img_data_url(switch_image_t *img, char **
- 	switch_buffer_destroy(&buffer);
- 
- 	return ret ? SWITCH_STATUS_SUCCESS : SWITCH_STATUS_FALSE;
-+#endif /* SWITCH_HAVE_YUV */
- }
- 
- 
-diff --git a/tests/unit/switch_core_video.c b/tests/unit/switch_core_video.c
-index 27c96102929..e395db474d5 100644
---- a/tests/unit/switch_core_video.c
-+++ b/tests/unit/switch_core_video.c
-@@ -48,6 +48,7 @@ FST_CORE_BEGIN("./conf")
- 		}
- 		FST_TEARDOWN_END()
- 
-+#ifdef SWITCH_HAVE_YUV
- 		FST_TEST_BEGIN(data_url_test)
- 		{
- 			char *data_url = NULL;
-@@ -88,6 +89,7 @@ FST_CORE_BEGIN("./conf")
- 			unlink(argb_filename);
- 		}
- 		FST_TEST_END()
-+#endif /* SWITCH_HAVE_YUV */
- 
- 		FST_TEST_BEGIN(img_patch)
- 		{
-@@ -239,6 +241,7 @@ FST_CORE_BEGIN("./conf")
- 		}
- 		FST_TEST_END()
- 
-+#ifdef SWITCH_HAVE_YUV
- 		FST_TEST_BEGIN(stb_data_url)
- 		{
- 			switch_image_t *img = switch_img_alloc(NULL, SWITCH_IMG_FMT_I420, 120, 60, 1);
-@@ -321,6 +324,7 @@ FST_CORE_BEGIN("./conf")
- 			unlink(jpg_write_filename);
- 		}
- 		FST_TEST_END()
-+#endif /* SWITCH_HAVE_YUV */
- 	}
- 	FST_SUITE_END()
- }
diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 8066c620c4..18a36ff23c 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,10 +1,9 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.7.-release.tar.xz.sha256
-sha256  0919bddc2ea9cab2e4944314e71637bea9dd4f40d510722a74ea032104594c41  freeswitch-1.10.7.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.8.-release.tar.xz.sha256
+sha256  1176b26b2f463de2980e5be953f81ced94d23c784452bd41e086d3933a88be5f  freeswitch-1.10.8.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
 sha256  e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
-sha256  1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
 sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
 sha256  2b2cc1180c7e6988328ad2033b04b80117419db9c4c584918bbb3cfec7e9364f  libs/libyuv/LICENSE
 sha256  7d72a8aee2c4b1a084200487992a5d86f5df6b535727a14c1874918e99d24600  libs/libzrtp/src/zrtp_legal.c
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 24c1ee4dd4..6234dd8e97 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,20 +4,19 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.7
+FREESWITCH_VERSION = 1.10.8
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
 FREESWITCH_INSTALL_STAGING = YES
 FREESWITCH_LICENSE = MPL-1.1, \
 	GPL-3.0+ with font exception (fonts), \
-	Apache-2.0 (apr, apr-util), \
+	Apache-2.0 (apr), \
 	BSD-3-Clause (libsrtp)
 
 FREESWITCH_LICENSE_FILES = \
 	COPYING \
 	libs/apr/LICENSE \
-	libs/apr-util/LICENSE \
 	libs/srtp/LICENSE
 
 FREESWITCH_CPE_ID_VENDOR = freeswitch
@@ -50,6 +49,10 @@ FREESWITCH_CONF_ENV += \
 	ac_cv_prog_PHP_CONFIG=false \
 	ac_cv_have_php_config=no
 
+# disable pcap detection, pcap is an optional dependency for unit tests
+FREESWITCH_CONF_ENV += \
+	ac_cv_prog_HAVE_PCAP_CONFIG=false
+
 # copied from freeswitch/configure.ac, line 258+
 FREESWITCH_CONF_ENV += \
 	ac_cv_file__dev_ptmx=yes \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
