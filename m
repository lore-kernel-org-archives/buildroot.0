Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9C2C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFDE1846C3;
	Wed, 16 Apr 2025 21:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZRuxVbV73g95; Wed, 16 Apr 2025 21:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E56E583FA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E56E583FA3;
	Wed, 16 Apr 2025 21:45:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16564159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4223F60B0C
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFpectLX8RQX for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:45:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A72D160785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A72D160785
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:45:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EFD484297; Wed, 16 Apr 2025 21:45:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Apr 2025 10:52:13 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: ee80a723e4774388224d7944764302fb0c4e493c
X-Git-Newrev: 8fc2c22378b71c290c788cd90dd298b7214a958b
X-Patchwork-Hint: ignore
Message-Id: <20250416214539.8EFD484297@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libcoap: bump
 version to 4.3.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8fc2c22378b71c290c788cd90dd298b7214a958b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

The patch introduced in [1] that fixed the CVE-2024-0962 is now
available upstream in the 4.3.5 release [2].

This commit also updates the LICENSE file hash, after adding reference
to wolfSSL in [3].

For more details see the release note:
https://github.com/obgm/libcoap/blob/v4.3.5/ChangeLog

[1] 9002b818be package/libcoap: fix CVE-2024-0962
[2] https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9
[3] https://github.com/obgm/libcoap/commit/e3a662a934ae9e2854f50eb4cf420009a90fe1df

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
[Julien: fix LICENSE file hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4df4d1d31240aa4d1c49dcbcb9694ce32eb626ba)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-parsing-OSCORE-configuration-information.patch | 38 ----------------------
 package/libcoap/libcoap.hash                       |  4 +--
 package/libcoap/libcoap.mk                         |  5 +--
 3 files changed, 3 insertions(+), 44 deletions(-)

diff --git a/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch b/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
deleted file mode 100644
index e75250d613..0000000000
--- a/package/libcoap/0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 2b28d8b0e9607e71a145345b4fe49517e052b7d9 Mon Sep 17 00:00:00 2001
-From: Jon Shallow <supjps-libcoap@jpshallow.com>
-Date: Thu, 25 Jan 2024 18:03:17 +0000
-Subject: [PATCH] coap_oscore.c: Fix parsing OSCORE configuration information
-
-Upstream: https://github.com/obgm/libcoap/commit/2b28d8b0e9607e71a145345b4fe49517e052b7d9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/coap_oscore.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/coap_oscore.c b/src/coap_oscore.c
-index 83f785c92..e0fb22947 100644
---- a/src/coap_oscore.c
-+++ b/src/coap_oscore.c
-@@ -1678,11 +1678,12 @@ get_split_entry(const char **start,
-                 oscore_value_t *value) {
-   const char *begin = *start;
-   const char *end;
-+  const char *kend;
-   const char *split;
-   size_t i;
- 
- retry:
--  end = memchr(begin, '\n', size);
-+  kend = end = memchr(begin, '\n', size);
-   if (end == NULL)
-     return 0;
- 
-@@ -1693,7 +1694,7 @@ get_split_entry(const char **start,
- 
-   if (begin[0] == '#' || (end - begin) == 0) {
-     /* Skip comment / blank line */
--    size -= end - begin + 1;
-+    size -= kend - begin + 1;
-     begin = *start;
-     goto retry;
-   }
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index 20abb94f8f..fc618fef52 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ae61a48c21f7b40e1442c9e1da9aab9e6f2cf0deccb02f3fed4de232a0b0522e  libcoap-4.3.4.tar.gz
+sha256  a417ed26ec6c95c041b42353b5b6fad1602e2bf42a6e26c09863450e227b7b5f  libcoap-4.3.5.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  bdd94ddd8e75010aebd045ead1c951110788003395c708811d6960248acb3891  LICENSE
+sha256  ecff7aa3af994b008dbb57c180753bd2a6c53fa6f8265a2486740f4cfd45280c  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 29161142f6..c5e5f85c62 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.4
+LIBCOAP_VERSION = 4.3.5
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
@@ -15,9 +15,6 @@ LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
 
-# 0001-coap_oscore-c-Fix-parsing-OSCORE-configuration-information.patch
-LIBCOAP_IGNORE_CVES += CVE-2024-0962
-
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
 LIBCOAP_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
