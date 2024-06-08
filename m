Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DC3C25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 19:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A8A3846C7;
	Sat,  8 Jun 2024 19:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jJPEcmu3iTI6; Sat,  8 Jun 2024 19:15:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4BA9847ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4BA9847ED;
	Sat,  8 Jun 2024 19:15:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A15E21BF407
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFF5B60681
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tDTXrNLhKJ8H for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 19:14:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E85F960665
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E85F960665
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 19:14:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBF7887E8B; Sat,  8 Jun 2024 19:14:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 18:45:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 82dec87ecc69923449f21d932947769e887b996f
X-Git-Newrev: b746f626cbc56b7351c6c5990ffbd7be3ccf71b8
X-Patchwork-Hint: ignore
Message-Id: <20240608191458.CBF7887E8B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/tinyproxy: bump
 version to 1.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b746f626cbc56b7351c6c5990ffbd7be3ccf71b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Drop now included patch.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
[Peter: drop patch from .checkpackageignore]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9fcdc50175b02adce950e90e8d2ae2b7d1396761)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...wing-up-in-error-page-in-invalid-requests.patch | 32 ----------------------
 package/tinyproxy/tinyproxy.hash                   |  4 +--
 package/tinyproxy/tinyproxy.mk                     |  5 +---
 4 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 364701fe1a..536788f5ea 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1262,7 +1262,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch Upstream
 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch Upstream
-package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Indent Shellcheck Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch Upstream
diff --git a/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch b/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
deleted file mode 100644
index da9c21a41a..0000000000
--- a/package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3764b8551463b900b5b4e3ec0cd9bb9182191cb7 Mon Sep 17 00:00:00 2001
-From: rofl0r <rofl0r@users.noreply.github.com>
-Date: Thu, 8 Sep 2022 15:18:04 +0000
-Subject: [PATCH] prevent junk from showing up in error page in invalid
- requests
-
-fixes #457
-
-[Retrieved from:
-https://github.com/tinyproxy/tinyproxy/commit/3764b8551463b900b5b4e3ec0cd9bb9182191cb7]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/reqs.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/reqs.c b/src/reqs.c
-index bce69819..45db118d 100644
---- a/src/reqs.c
-+++ b/src/reqs.c
-@@ -343,8 +343,12 @@ static struct request_s *process_request (struct conn_s *connptr,
-                 goto fail;
-         }
- 
-+        /* zero-terminate the strings so they don't contain junk in error page */
-+        request->method[0] = url[0] = request->protocol[0] = 0;
-+
-         ret = sscanf (connptr->request_line, "%[^ ] %[^ ] %[^ ]",
-                       request->method, url, request->protocol);
-+
-         if (ret == 2 && !strcasecmp (request->method, "GET")) {
-                 request->protocol[0] = 0;
- 
diff --git a/package/tinyproxy/tinyproxy.hash b/package/tinyproxy/tinyproxy.hash
index 84e98a84ce..8d4bb69537 100644
--- a/package/tinyproxy/tinyproxy.hash
+++ b/package/tinyproxy/tinyproxy.hash
@@ -1,4 +1,4 @@
-# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.1
-sha512  2e3435bbfece3797c11ccce222eef494ed92e00dd82bea2c40a54e454b7e03c8abc8e09b244f2da7192209c39047369439d08974b79eebc996fb3095230d0374  tinyproxy-1.11.1.tar.xz
+# From https://github.com/tinyproxy/tinyproxy/releases/tag/1.11.2
+sha512  008e43b770f946965d5a3fbad1881859e30b66a3a4a97cf9982e63d81139da7a8f23937601b72f32276166cd170008cafec9231b616fc840f05cae3c1329be35  tinyproxy-1.11.2.tar.xz
 # locally computed
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/tinyproxy/tinyproxy.mk b/package/tinyproxy/tinyproxy.mk
index e989f70a22..6656a752a6 100644
--- a/package/tinyproxy/tinyproxy.mk
+++ b/package/tinyproxy/tinyproxy.mk
@@ -4,14 +4,11 @@
 #
 ################################################################################
 
-TINYPROXY_VERSION = 1.11.1
+TINYPROXY_VERSION = 1.11.2
 TINYPROXY_SITE = https://github.com/tinyproxy/tinyproxy/releases/download/$(TINYPROXY_VERSION)
 TINYPROXY_SOURCE = tinyproxy-$(TINYPROXY_VERSION).tar.xz
 TINYPROXY_LICENSE = GPL-2.0+
 TINYPROXY_LICENSE_FILES = COPYING
 TINYPROXY_CPE_ID_VALID = YES
 
-# 0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch
-TINYPROXY_IGNORE_CVES += CVE-2022-40468
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
