Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA8FC4321E
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 08:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D756E826B0;
	Mon, 17 Oct 2022 08:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D756E826B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZSB0b0cCnVP; Mon, 17 Oct 2022 08:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C870E8268F;
	Mon, 17 Oct 2022 08:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C870E8268F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41A151BF982
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D68C4056E
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 08:38:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D68C4056E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVlyjgOr2vXt for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 08:38:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2869408ED
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2869408ED
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D26BC86DEE; Mon, 17 Oct 2022 08:38:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 10:35:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c33056fff080dd1795bcfb543b87e7b70ac455c
X-Git-Newrev: 1b8230ab648ec33b93ff29a6c1ed5b327d36c7dd
X-Patchwork-Hint: ignore
Message-Id: <20221017083837.D26BC86DEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeswitch: bump version to 1.10.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b8230ab648ec33b93ff29a6c1ed5b327d36c7dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.8

Removed two patches which are included in upstream release,
renumbered remaining patch.

Removed libs/apr-util/LICENSE due to upstream removal of bundled
apr-util package.

Added fix to disable pcap detection, otherwise /usr/bin/pcap-config
can be picked-up which breaks building freeswitch.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-build-SWITCH_BYTE_ORDER-__BIG_ENDIAN.patch |  26 -----
 ...ypto-hash-hmac_ossl.c-fix-build-with-lib.patch} |   0
 .../freeswitch/0002-core-fix--disable-libyuv.patch | 129 ---------------------
 package/freeswitch/freeswitch.hash                 |   5 +-
 package/freeswitch/freeswitch.mk                   |   9 +-
 5 files changed, 8 insertions(+), 161 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
