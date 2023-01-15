Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B3AC3DA78
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 20:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7354092A;
	Sun, 15 Jan 2023 20:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7354092A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jw-NnjdZD2wt; Sun, 15 Jan 2023 20:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36D7640301;
	Sun, 15 Jan 2023 20:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36D7640301
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6071BF25F
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5531A41477
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 20:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5531A41477
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFO4pMaOpcLS for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 20:28:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BB6241505
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 20:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BB6241505
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF45D87B22; Sun, 15 Jan 2023 20:28:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 21:15:33 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d89d991e74de1b39057e0e49c53fb9771d97c412
X-Git-Newrev: d57989ccc26b9de4f7c9f0bc37763e3cc1ce600a
X-Patchwork-Hint: ignore
Message-Id: <20230115202805.EF45D87B22@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/libpjsip:
 security bump to version 2.13
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

commit: https://git.buildroot.net/buildroot/commit/?id=d57989ccc26b9de4f7c9f0bc37763e3cc1ce600a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

- Fix CVE-2022-39269, CVE-2022-39244 and CVE-2022-31031:
  https://github.com/pjsip/pjproject/security/advisories/GHSA-wx5m-cj97-4wwg
  https://github.com/pjsip/pjproject/security/advisories/GHSA-fq45-m3f7-3mhj
  https://github.com/pjsip/pjproject/security/advisories/GHSA-26j7-ww69-c4qj
- Drop patch (already in version)
- libuuid configure option is available since
  https://github.com/pjsip/pjproject/commit/0b0488f17b41c5323028b522cc7323f2cd9b684c
- libupnp is an optional dependency since
  https://github.com/pjsip/pjproject/commit/82247cb8c0441d0eafd18cb69e6c7bf55fc6a088
- libsrtp is optional since
  https://github.com/pjsip/pjproject/commit/fe6cbbc39764cae8ff6789a98f8ef8e85c63445c

https://github.com/pjsip/pjproject/releases/tag/2.13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit cbc80c75570f535e991297602191c724ff33a04d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rge-pull-request-from-GHSA-26j7-ww69-c4qj.patch | 44 ----------------------
 package/libpjsip/Config.in                         |  1 -
 package/libpjsip/libpjsip.hash                     |  2 +-
 package/libpjsip/libpjsip.mk                       | 28 ++++++++++----
 4 files changed, 22 insertions(+), 53 deletions(-)

diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
deleted file mode 100644
index 42b842a616..0000000000
--- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 450baca94f475345542c6953832650c390889202 Mon Sep 17 00:00:00 2001
-From: sauwming <ming@teluu.com>
-Date: Tue, 7 Jun 2022 12:00:13 +0800
-Subject: [PATCH] Merge pull request from GHSA-26j7-ww69-c4qj
-
-[Retrieved from:
-https://github.com/pjsip/pjproject/commit/450baca94f475345542c6953832650c390889202]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pjlib-util/src/pjlib-util/stun_simple.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/pjlib-util/src/pjlib-util/stun_simple.c b/pjlib-util/src/pjlib-util/stun_simple.c
-index 722519584..d0549176d 100644
---- a/pjlib-util/src/pjlib-util/stun_simple.c
-+++ b/pjlib-util/src/pjlib-util/stun_simple.c
-@@ -54,6 +54,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
- {
-     pj_uint16_t msg_type, msg_len;
-     char *p_attr;
-+    int attr_max_cnt = PJ_ARRAY_SIZE(msg->attr);
- 
-     PJ_CHECK_STACK();
- 
-@@ -83,7 +84,7 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
-     msg->attr_count = 0;
-     p_attr = (char*)buf + sizeof(pjstun_msg_hdr);
- 
--    while (msg_len > 0) {
-+    while (msg_len > 0 && msg->attr_count < attr_max_cnt) {
- 	pjstun_attr_hdr **attr = &msg->attr[msg->attr_count];
- 	pj_uint32_t len;
- 	pj_uint16_t attr_type;
-@@ -111,6 +112,10 @@ PJ_DEF(pj_status_t) pjstun_parse_msg( void *buf, pj_size_t buf_len,
- 	p_attr += len;
- 	++msg->attr_count;
-     }
-+    if (msg->attr_count == attr_max_cnt) {
-+	PJ_LOG(4, (THIS_FILE, "Warning: max number attribute %d reached.",
-+		   attr_max_cnt));
-+    }
- 
-     return PJ_SUCCESS;
- }
diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
index 727d2ec3d0..980fada3d5 100644
--- a/package/libpjsip/Config.in
+++ b/package/libpjsip/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LIBPJSIP
 	bool "libpjsip"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_PACKAGE_LIBSRTP
 	help
 	  PJSIP is a free and open source multimedia communication
 	  library written in C language implementing standard based
diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index b1ccdb2f37..9935575567 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0feef6963b07934e821ba4328aecb4c36358515c1b3e507da5874555d713533  pjproject-2.12.1.tar.gz
+sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 4134d40da8..5cc0423f5d 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.12.1
+LIBPJSIP_VERSION = 2.13
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
-LIBPJSIP_DEPENDENCIES = libsrtp
 LIBPJSIP_LICENSE = GPL-2.0+
 LIBPJSIP_LICENSE_FILES = COPYING
 LIBPJSIP_CPE_ID_VENDOR = teluu
@@ -16,9 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
-# 0001-Merge-pull-request-from-GHSA-26j7-ww69-c4qj.patch
-LIBPJSIP_IGNORE_CVES += CVE-2022-31031
-
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
@@ -40,8 +36,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-l16-codec \
 	--disable-g722-codec \
 	--disable-ipp \
-	--disable-silk \
-	--with-external-srtp
+	--disable-silk
 
 # Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
 # both enable it. But that's OK, epoll is better than the alternative,
@@ -103,6 +98,22 @@ else
 LIBPJSIP_CONF_OPTS += --disable-libsamplerate
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+LIBPJSIP_DEPENDENCIES += libsrtp
+LIBPJSIP_CONF_OPTS += \
+	--enable-libsrtp \
+	--with-external-srtp
+else
+LIBPJSIP_CONF_OPTS += --disable-libsrtp
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+LIBPJSIP_DEPENDENCIES += libupnp
+LIBPJSIP_CONF_OPTS += --with-upnp=$(STAGING_DIR)/usr
+else
+LIBPJSIP_CONF_OPTS += --disable-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBV4L),y)
 # --enable-v4l2 is broken (check for libv4l2 will be omitted)
 LIBPJSIP_DEPENDENCIES += libv4l
@@ -161,6 +172,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
 LIBPJSIP_DEPENDENCIES += util-linux
+LIBPJSIP_CONF_OPTS += --enable-libuuid
+else
+LIBPJSIP_CONF_OPTS += --disable-libuuid
 endif
 
 # disable build of test binaries
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
