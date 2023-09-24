Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E126CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 09:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6840541809;
	Sun, 24 Sep 2023 09:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6840541809
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PX0J9qHOJgZu; Sun, 24 Sep 2023 09:02:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D69D941817;
	Sun, 24 Sep 2023 09:02:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D69D941817
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 344101BF299
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:02:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DFEF4063E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DFEF4063E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmvoxWm2JYys for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 09:02:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 050DC40297
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 09:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 050DC40297
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E22C487400; Sun, 24 Sep 2023 09:02:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 11:01:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd46e1b1439e854dc9e4c016795d6e5276e4c573
X-Git-Newrev: 7447700f057a4bf8b2ee84c22a2319ab05f9aeea
X-Patchwork-Hint: ignore
Message-Id: <20230924090243.E22C487400@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpjsip: security bump to version
 2.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7447700f057a4bf8b2ee84c22a2319ab05f9aeea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security vulnerability:

- CVE-2023-27585: Heap buffer overflow when parsing DNS packet
  https://github.com/pjsip/pjproject/security/advisories/GHSA-q9cp-8wcq-7pfr

Drop now upstreamed security fixes for CVE-2022-23537 and CVE-2022-23547.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 -
 ...rge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch | 99 ----------------------
 ...rge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch | 54 ------------
 package/libpjsip/libpjsip.hash                     |  2 +-
 package/libpjsip/libpjsip.mk                       |  8 +-
 5 files changed, 2 insertions(+), 163 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f8aaf41af9..0250805be1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -740,8 +740,6 @@ package/liboping/0004-Fix-compile-error-on-GCC-7.patch Upstream
 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch Upstream
 package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch Upstream
 package/libpam-tacplus/0001-Add-an-option-to-disable-Werror.patch Upstream
-package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch Upstream
-package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch Upstream
 package/libplatform/0001-cmake-require-c-11-as-the-minimum-standard.patch Upstream
 package/libpng/0001-Disable-pngfix-and-png-fix-itxt.patch Upstream
 package/libpthsem/0001-fix-build-on-linux-3.x-host.patch Upstream
diff --git a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch b/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
deleted file mode 100644
index 01e1878189..0000000000
--- a/package/libpjsip/0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From d8440f4d711a654b511f50f79c0445b26f9dd1e1 Mon Sep 17 00:00:00 2001
-From: Nanang Izzuddin <nanang@teluu.com>
-Date: Tue, 20 Dec 2022 11:39:12 +0700
-Subject: [PATCH] Merge pull request from GHSA-9pfh-r8x4-w26w
-
-* Fix buffer overread in STUN message decoder
-
-* Updates based on comments
-
-[Retrieved from:
-https://github.com/pjsip/pjproject/commit/d8440f4d711a654b511f50f79c0445b26f9dd1e1]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pjnath/include/pjnath/stun_msg.h |  4 ++++
- pjnath/src/pjnath/stun_msg.c     | 14 +++++++++++---
- 2 files changed, 15 insertions(+), 3 deletions(-)
-
-diff --git a/pjnath/include/pjnath/stun_msg.h b/pjnath/include/pjnath/stun_msg.h
-index b52f95c586..e49f096f3a 100644
---- a/pjnath/include/pjnath/stun_msg.h
-+++ b/pjnath/include/pjnath/stun_msg.h
-@@ -442,6 +442,7 @@ typedef enum pj_stun_status
- 
-    \endverbatim
-  */
-+#pragma pack(1)
- typedef struct pj_stun_msg_hdr
- {
-     /**
-@@ -473,6 +474,7 @@ typedef struct pj_stun_msg_hdr
-     pj_uint8_t          tsx_id[12];
- 
- } pj_stun_msg_hdr;
-+#pragma pack()
- 
- 
- /**
-@@ -490,6 +492,7 @@ typedef struct pj_stun_msg_hdr
- 
-    \endverbatim
-  */
-+#pragma pack(1)
- typedef struct pj_stun_attr_hdr
- {
-     /**
-@@ -506,6 +509,7 @@ typedef struct pj_stun_attr_hdr
-     pj_uint16_t         length;
- 
- } pj_stun_attr_hdr;
-+#pragma pack()
- 
- 
- /**
-diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
-index 3def6b3eac..e904a0ba47 100644
---- a/pjnath/src/pjnath/stun_msg.c
-+++ b/pjnath/src/pjnath/stun_msg.c
-@@ -746,7 +746,7 @@ PJ_DEF(int) pj_stun_set_padding_char(int chr)
- 
- #define INIT_ATTR(a,t,l)    (a)->hdr.type=(pj_uint16_t)(t), \
-                             (a)->hdr.length=(pj_uint16_t)(l)
--#define ATTR_HDR_LEN        4
-+#define ATTR_HDR_LEN        sizeof(pj_stun_attr_hdr)
- 
- static pj_uint16_t GETVAL16H(const pj_uint8_t *buf, unsigned pos)
- {
-@@ -2327,6 +2327,14 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
-         status = pj_stun_msg_check(pdu, pdu_len, options);
-         if (status != PJ_SUCCESS)
-             return status;
-+    } else {
-+        /* For safety, verify packet length at least */
-+        pj_uint32_t msg_len = GETVAL16H(pdu, 2) + 20;
-+        if (msg_len > pdu_len ||
-+            ((options & PJ_STUN_IS_DATAGRAM) && msg_len != pdu_len))
-+        {
-+            return PJNATH_EINSTUNMSGLEN;
-+        }
-     }
- 
-     /* Create the message, copy the header, and convert to host byte order */
-@@ -2345,7 +2353,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
-         p_response = NULL;
- 
-     /* Parse attributes */
--    while (pdu_len >= 4) {
-+    while (pdu_len >= ATTR_HDR_LEN) {
-         unsigned attr_type, attr_val_len;
-         const struct attr_desc *adesc;
- 
-@@ -2357,7 +2365,7 @@ PJ_DEF(pj_status_t) pj_stun_msg_decode(pj_pool_t *pool,
-         attr_val_len = (attr_val_len + 3) & (~3);
- 
-         /* Check length */
--        if (pdu_len < attr_val_len) {
-+        if (pdu_len < attr_val_len + ATTR_HDR_LEN) {
-             pj_str_t err_msg;
-             char err_msg_buf[80];
- 
diff --git a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch b/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
deleted file mode 100644
index 82249a2076..0000000000
--- a/package/libpjsip/0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From bc4812d31a67d5e2f973fbfaf950d6118226cf36 Mon Sep 17 00:00:00 2001
-From: sauwming <ming@teluu.com>
-Date: Fri, 23 Dec 2022 15:05:28 +0800
-Subject: [PATCH] Merge pull request from GHSA-cxwq-5g9x-x7fr
-
-* Fixed heap buffer overflow when parsing STUN errcode attribute
-
-* Also fixed uint parsing
-
-[Retrieved from:
-https://github.com/pjsip/pjproject/commit/bc4812d31a67d5e2f973fbfaf950d6118226cf36]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- pjnath/src/pjnath/stun_msg.c | 11 ++++++-----
- 1 file changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/pjnath/src/pjnath/stun_msg.c b/pjnath/src/pjnath/stun_msg.c
-index c6b0bdd284..b55d29849a 100644
---- a/pjnath/src/pjnath/stun_msg.c
-+++ b/pjnath/src/pjnath/stun_msg.c
-@@ -1438,12 +1438,12 @@ static pj_status_t decode_uint_attr(pj_pool_t *pool,
-     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_uint_attr);
-     GETATTRHDR(buf, &attr->hdr);
- 
--    attr->value = GETVAL32H(buf, 4);
--
-     /* Check that the attribute length is valid */
-     if (attr->hdr.length != 4)
-         return PJNATH_ESTUNINATTRLEN;
- 
-+    attr->value = GETVAL32H(buf, 4);
-+
-     /* Done */
-     *p_attr = attr;
- 
-@@ -1757,14 +1757,15 @@ static pj_status_t decode_errcode_attr(pj_pool_t *pool,
-     attr = PJ_POOL_ZALLOC_T(pool, pj_stun_errcode_attr);
-     GETATTRHDR(buf, &attr->hdr);
- 
-+    /* Check that the attribute length is valid */
-+    if (attr->hdr.length < 4)
-+        return PJNATH_ESTUNINATTRLEN;
-+
-     attr->err_code = buf[6] * 100 + buf[7];
- 
-     /* Get pointer to the string in the message */
-     value.ptr = ((char*)buf + ATTR_HDR_LEN + 4);
-     value.slen = attr->hdr.length - 4;
--    /* Make sure the length is never negative */
--    if (value.slen < 0)
--        value.slen = 0;
- 
-     /* Copy the string to the attribute */
-     pj_strdup(pool, &attr->reason, &value);
diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index 9935575567..2edd97bed4 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  4178bb9f586299111463fc16ea04e461adca4a73e646f8ddef61ea53dafa92d9  pjproject-2.13.tar.gz
+sha256  32a5ab5bfbb9752cb6a46627e4c410e61939c8dbbd833ac858473cfbd9fb9d7d  pjproject-2.13.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 24db641446..f97d547fd7 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.13
+LIBPJSIP_VERSION = 2.13.1
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
@@ -15,12 +15,6 @@ LIBPJSIP_CPE_ID_PRODUCT = pjsip
 LIBPJSIP_INSTALL_STAGING = YES
 LIBPJSIP_MAKE = $(MAKE1)
 
-# 0001-Merge-pull-request-from-GHSA-9pfh-r8x4-w26w.patch
-LIBPJSIP_IGNORE_CVES += CVE-2022-23537
-
-# 0002-Merge-pull-request-from-GHSA-cxwq-5g9x-x7fr.patch
-LIBPJSIP_IGNORE_CVES += CVE-2022-23547
-
 LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1
 
 # relocation truncated to fit: R_68K_GOT16O
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
