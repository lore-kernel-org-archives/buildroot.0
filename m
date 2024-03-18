Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BB4C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 16:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 530E360869;
	Mon, 18 Mar 2024 16:49:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvG5aU_MAi-n; Mon, 18 Mar 2024 16:49:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50A096085B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50A096085B;
	Mon, 18 Mar 2024 16:49:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34D001BF99A
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EB0B409E3
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 16:49:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MaRebEBwPGYJ for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 16:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40AE940903
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40AE940903
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 16:49:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 367C682BC8; Mon, 18 Mar 2024 16:49:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 17:43:41 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 99947363dd80cef30fd7f203fe0868fde2039e6a
X-Git-Newrev: 8873d98abe2016ee77eb1bd6877749f19ee9d649
X-Patchwork-Hint: ignore
Message-Id: <20240318164916.367C682BC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libcoap: bump to
 version 4.3.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=8873d98abe2016ee77eb1bd6877749f19ee9d649
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Drop patch (already in version)
- LIBCOAP_IGNORE_CVES is not needed after bump
- Update hash of license file: LGPL-2.1 added when RIOT support with
  https://github.com/obgm/libcoap/commit/8d869fff047d34a1c825ffc1bab5d3fde28c75b7

https://github.com/obgm/libcoap/blob/v4.3.4/ChangeLog
https://github.com/obgm/libcoap/compare/v4.3.1...v4.3.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f5d88d8db355870c89f9ab5fca375f60499f681e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Backport-fix-for-CVE-2023-30362.patch     | 59 ----------------------
 package/libcoap/libcoap.hash                       |  4 +-
 package/libcoap/libcoap.mk                         |  6 +--
 3 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch b/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
deleted file mode 100644
index ddc5329299..0000000000
--- a/package/libcoap/0001-Backport-fix-for-CVE-2023-30362.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From c63ecbdc6b38cc7e571a72964fe9ca63834dcc89 Mon Sep 17 00:00:00 2001
-From: Jon Shallow <supjps-libcoap@jpshallow.com>
-Date: Wed, 6 Sep 2023 21:38:13 +0200
-Subject: [PATCH] Backport fix for CVE-2023-30362
-
-Upstream: https://github.com/obgm/libcoap/issues/1063#issuecomment-1626962307
-Signed-off-by: Daniel Lang <dalang@gmx.at>
----
- src/net.c | 34 +++++++++++++++++++++-------------
- 1 file changed, 21 insertions(+), 13 deletions(-)
-
-diff --git a/src/net.c b/src/net.c
-index 98859443..e259ab00 100644
---- a/src/net.c
-+++ b/src/net.c
-@@ -1305,19 +1305,27 @@ coap_send_internal(coap_session_t *session, coap_pdu_t *pdu) {
- 
-       /* Need to check that we are not seeing this proxy in the return loop */
-       if (pdu->data && opt == NULL) {
--        if (pdu->used_size + 1 <= pdu->max_size) {
--          char *a_match;
--          size_t data_len = pdu->used_size - (pdu->data - pdu->token);
--          pdu->data[data_len] = '\000';
--          a_match = strstr((char*)pdu->data, cp);
--          if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
--              ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
--               a_match[len] == ' ')) {
--            coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
--                     (char*)pdu->data);
--            coap_delete_pdu(pdu);
--            return (coap_mid_t)COAP_DROPPED_RESPONSE;
--          }
-+        char *a_match;
-+        size_t data_len;
-+
-+        if (pdu->used_size + 1 > pdu->max_size) {
-+          /* No space */
-+          return (coap_mid_t)COAP_DROPPED_RESPONSE;
-+        }
-+        if (!coap_pdu_resize(pdu, pdu->used_size + 1)) {
-+          /* Internal error */
-+          return (coap_mid_t)COAP_DROPPED_RESPONSE;
-+        }
-+        data_len = pdu->used_size - (pdu->data - pdu->token);
-+        pdu->data[data_len] = '\000';
-+        a_match = strstr((char*)pdu->data, cp);
-+        if (a_match && (a_match == (char*)pdu->data || a_match[-1] == ' ') &&
-+            ((size_t)(a_match - (char*)pdu->data + len) == data_len ||
-+             a_match[len] == ' ')) {
-+          coap_log(LOG_WARNING, "Proxy loop detected '%s'\n",
-+                   (char*)pdu->data);
-+          coap_delete_pdu(pdu);
-+          return (coap_mid_t)COAP_DROPPED_RESPONSE;
-         }
-       }
-       if (pdu->used_size + len + 1 <= pdu->max_size) {
--- 
-2.42.0
-
diff --git a/package/libcoap/libcoap.hash b/package/libcoap/libcoap.hash
index e0006b62af..20abb94f8f 100644
--- a/package/libcoap/libcoap.hash
+++ b/package/libcoap/libcoap.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  074a71deca01e06d3acb00a1416d0fbeb87d130f40a3c0f6fda3a5c711855dca  libcoap-4.3.1.tar.gz
+sha256  ae61a48c21f7b40e1442c9e1da9aab9e6f2cf0deccb02f3fed4de232a0b0522e  libcoap-4.3.4.tar.gz
 sha256  09dd86a017bad210527085008cbf706609c58210897b69845af14099577e7eb7  COPYING
-sha256  5711e8bf7e94b59fcf0681d0f73752111bc196563b60f8568f19dacd0213192b  LICENSE
+sha256  bdd94ddd8e75010aebd045ead1c951110788003395c708811d6960248acb3891  LICENSE
diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index 94bfc59702..62f08a20e9 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCOAP_VERSION = 4.3.1
+LIBCOAP_VERSION = 4.3.4
 LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
@@ -14,10 +14,6 @@ LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
 LIBCOAP_AUTORECONF = YES
-# 0001-Backport-fix-for-CVE-2023-30362.patch
-LIBCOAP_IGNORE_CVES += CVE-2023-30362
-# Doesn't affect 4.3.1, see https://github.com/obgm/libcoap/issues/1117
-LIBCOAP_IGNORE_CVES += CVE-2023-35862
 
 ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBCOAP_DEPENDENCIES += gnutls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
