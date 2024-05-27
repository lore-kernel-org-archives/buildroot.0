Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC78C25B74
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 14:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2000F608F0;
	Mon, 27 May 2024 14:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rx3CE-42jmSl; Mon, 27 May 2024 14:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF62D608F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF62D608F1;
	Mon, 27 May 2024 14:38:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6B2201D1DD6
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5AE4340338
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 14:38:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s8qGBNkjZ5xq for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 14:38:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F3C404F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81F3C404F3
 for <buildroot@buildroot.org>; Mon, 27 May 2024 14:38:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6454A875B4; Mon, 27 May 2024 14:38:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 May 2024 16:37:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa54abf730ea11bfadd432b645a0735a7b4fe852
X-Git-Newrev: 9fcdc50175b02adce950e90e8d2ae2b7d1396761
X-Patchwork-Hint: ignore
Message-Id: <20240527143833.6454A875B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyproxy: bump version to 1.11.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fcdc50175b02adce950e90e8d2ae2b7d1396761
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop now included patch.

Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>
[Peter: drop patch from .checkpackageignore]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...wing-up-in-error-page-in-invalid-requests.patch | 32 ----------------------
 package/tinyproxy/tinyproxy.hash                   |  4 +--
 package/tinyproxy/tinyproxy.mk                     |  5 +---
 4 files changed, 3 insertions(+), 39 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dbed0fdc34..1070281f98 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1509,7 +1509,6 @@ package/tinyalsa/0001-include-time.h-before-asound.h.patch lib_patch.Upstream
 package/tinycbor/0001-Makefile-add-DISABLE_WERROR.patch lib_patch.Upstream
 package/tinycompress/0001-wave-add-time.h-missing-header-inclusion.patch lib_patch.Upstream
 package/tinydtls/0001-sha2-sha2.c-fix-build-on-big-endian.patch lib_patch.Upstream
-package/tinyproxy/0001-prevent-junk-from-showing-up-in-error-page-in-invalid-requests.patch lib_patch.Upstream
 package/tinyxml/0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch lib_patch.Upstream
 package/tpm2-abrmd/S80tpm2-abrmd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/tpm2-tss/0001-Temporary-fix-for-build-without-C.patch lib_patch.Upstream
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
