Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A2AEB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B9A417A7;
	Tue, 18 Jul 2023 21:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B9A417A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YkfJKTYRBoxi; Tue, 18 Jul 2023 21:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7A61417A9;
	Tue, 18 Jul 2023 21:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A61417A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB5181BF350
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9243060B4C
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9243060B4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIgz5aakuU0D for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:15:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A137260C19
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A137260C19
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C5858744E; Tue, 18 Jul 2023 21:15:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 23:13:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10f40a6b0c58a10f00d6a9b44fc76aea756e6036
X-Git-Newrev: 525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc
X-Patchwork-Hint: ignore
Message-Id: <20230718211511.8C5858744E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pound: bump version to 4.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4845261670691001134=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4845261670691001134==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=525cb6a8fbe04a959ea6e3a21a3f6f8828d7e9dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Original upstream ended the development of pound 2.8 in 2022:
https://groups.google.com/g/pound_proxy/c/O8xaIIODw18

Switch project to use a maintained fork at https://github.com/graygnuorg
and remove all patches, they are not needed anymore.

Follow the rename of the license file:
https://github.com/graygnuorg/pound/commit/223b4276ac7a71583e0983f7d0d920f70e6c1abe

Release notes: https://github.com/graygnuorg/pound/blob/master/NEWS

This bump includes compatibility with OpenSSL 3.x (since version 4.0)
and added optional support for pcre2:
https://github.com/graygnuorg/pound/commit/a797374f220c5958f20a4f630083294dae4165b8

Fixes:
http://autobuild.buildroot.net/results/1ca/1ca31debd709f634e65492bee0806ca81bcf9ee5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   2 -
 package/pound/0001-fix-openssl-1.0.2.patch         | 127 --------
 package/pound/0002-fix-openssl-1.1.0.patch         | 334 ---------------------
 ...or-libressl-coexisting-with-openssl-1.1.x.patch | 140 ---------
 package/pound/Config.in                            |   2 +-
 package/pound/pound.hash                           |   4 +-
 package/pound/pound.mk                             |  15 +-
 7 files changed, 13 insertions(+), 611 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6a0bac3c00..0c2a882135 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1192,8 +1192,6 @@ package/poke/0002-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch Upstream
 package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch Upstream
 package/postgresql/S50postgresql Variables
-package/pound/0001-fix-openssl-1.0.2.patch Upstream
-package/pound/0002-fix-openssl-1.1.0.patch Upstream
 package/powertop/0001-dont-force-stack-smashing-protection.patch Upstream
 package/pppd/0001-pppd-Fix-compilation-with-older-glibc-or-kernel-headers.patch Upstream
 package/pppd/0002-pppd-eap-tls.c-fix-build-with-libressl.patch Upstream
diff --git a/package/pound/0001-fix-openssl-1.0.2.patch b/package/pound/0001-fix-openssl-1.0.2.patch
deleted file mode 100644
index b20fdb36f1..0000000000
--- a/package/pound/0001-fix-openssl-1.0.2.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-From eb471de8f26e0367dd08d299d2252fa8b2b958a9 Mon Sep 17 00:00:00 2001
-From: Emilio <emilio.campos@zevenet.com>
-Date: Mon, 17 Jul 2017 09:41:32 +0200
-Subject: [PATCH] [Improvement] Added support to compile pound with openssl
- 1.0.2
-
-Signed-off-by: Emilio <emilio.campos@zevenet.com>
-
-	new file:   dh2048.h
-	modified:   svc.c
-
-Patch was downloaded from 3rd-party repo:
-https://github.com/zevenet/pound/commit/eb471de8f26e0367dd08d299d2252fa8b2b958a9
-
-This repo was announced on upstream mailinglist:
-http://www.apsis.ch/pound/pound_list/archive/2017/2017-07/1500287626000#1500287626000
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- dh2048.h | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
- svc.c    | 33 +++++++++++++++++++++++++++++++++
- 2 files changed, 86 insertions(+)
- create mode 100644 dh2048.h
-
-diff --git a/dh2048.h b/dh2048.h
-new file mode 100644
-index 0000000..79c693c
---- /dev/null
-+++ b/dh2048.h
-@@ -0,0 +1,53 @@
-+#ifndef HEADER_DH_H
-+# include <openssl/dh.h>
-+#endif
-+
-+DH *get_dh2048()
-+{
-+    static unsigned char dhp_2048[] = {
-+	0xBF, 0x6C, 0xC6, 0xBD, 0xEA, 0x10, 0x84, 0x59, 0x40, 0xC2, 
-+	0xC6, 0xA2, 0x9B, 0x19, 0xD3, 0x2E, 0x2F, 0xAB, 0xE6, 0xE4, 
-+	0x1E, 0x91, 0x0D, 0x59, 0xDC, 0x96, 0x3F, 0x6E, 0x65, 0x38, 
-+	0xB9, 0xBE, 0xBB, 0x8F, 0xDF, 0x73, 0xAC, 0xAC, 0xB3, 0x2F, 
-+	0xA7, 0x02, 0x0B, 0x87, 0xB7, 0x3F, 0x3A, 0x42, 0x8A, 0x94, 
-+	0xDD, 0xEC, 0x33, 0xA4, 0x25, 0xB1, 0xBF, 0x84, 0x91, 0x87, 
-+	0xD8, 0x1C, 0x42, 0xB9, 0x8E, 0x00, 0x1F, 0x49, 0xED, 0x57, 
-+	0xA4, 0x48, 0xB0, 0xCC, 0xD8, 0xB8, 0x83, 0xCA, 0x3E, 0xDF, 
-+	0xA2, 0xF2, 0x07, 0x71, 0x71, 0x18, 0x1F, 0x50, 0x45, 0x3A, 
-+	0x66, 0x04, 0x7F, 0x15, 0xB2, 0xA8, 0x02, 0x77, 0xCE, 0xC6, 
-+	0xF9, 0x7C, 0x63, 0xE4, 0x52, 0x41, 0xFA, 0x62, 0xB9, 0x0D, 
-+	0xDC, 0x08, 0x62, 0xEC, 0x00, 0xAB, 0xB0, 0xF7, 0x79, 0x48, 
-+	0x75, 0x22, 0x85, 0xCC, 0x67, 0x3C, 0xEA, 0x09, 0x32, 0xAC, 
-+	0x30, 0xED, 0x1E, 0x67, 0xDC, 0x74, 0xF8, 0xD9, 0xC3, 0xD0, 
-+	0xA0, 0x60, 0x4D, 0xCE, 0x52, 0xBC, 0xA3, 0xE5, 0x18, 0x7B, 
-+	0x0B, 0xC8, 0xCE, 0x70, 0xA2, 0xC8, 0x21, 0xCA, 0xCE, 0xA5, 
-+	0xD4, 0xCB, 0x85, 0xFC, 0xC7, 0x07, 0x5C, 0x05, 0x87, 0xFC, 
-+	0x2F, 0x67, 0x4D, 0x2D, 0x4F, 0xA4, 0xEE, 0x63, 0x98, 0x49, 
-+	0xE4, 0x2E, 0xD7, 0x3F, 0x7D, 0x69, 0x68, 0x0A, 0xA2, 0x3E, 
-+	0x5A, 0x04, 0xD4, 0xDD, 0xBB, 0xC7, 0xB4, 0x34, 0xB7, 0x21, 
-+	0xD3, 0xAC, 0x99, 0xD7, 0x87, 0x45, 0x5E, 0x18, 0x68, 0x16, 
-+	0x3A, 0xAF, 0xE2, 0x04, 0x57, 0xB8, 0x6A, 0xB8, 0x2F, 0x75, 
-+	0xD5, 0x79, 0x96, 0x60, 0x8D, 0xD1, 0xCC, 0xD1, 0x33, 0x85, 
-+	0x53, 0x88, 0x87, 0x34, 0xA6, 0x4B, 0x49, 0x24, 0x53, 0xD6, 
-+	0xF1, 0x1E, 0x4E, 0x98, 0x4D, 0x6B, 0x44, 0x31, 0x94, 0xFF, 
-+	0x46, 0xC2, 0x38, 0x2E, 0xEA, 0xBB
-+    };
-+    static unsigned char dhg_2048[] = {
-+	0x05
-+    };
-+    DH *dh = DH_new();
-+    BIGNUM *dhp_bn, *dhg_bn;
-+
-+    if (dh == NULL)
-+        return NULL;
-+    dhp_bn = BN_bin2bn(dhp_2048, sizeof (dhp_2048), NULL);
-+    dhg_bn = BN_bin2bn(dhg_2048, sizeof (dhg_2048), NULL);
-+    if (dhp_bn == NULL || dhg_bn == NULL
-+            || !DH_set0_pqg(dh, dhp_bn, NULL, dhg_bn)) {
-+        DH_free(dh);
-+        BN_free(dhp_bn);
-+        BN_free(dhg_bn);
-+        return NULL;
-+    }
-+    return dh;
-+}
-diff --git a/svc.c b/svc.c
-index 1341397..758dfbd 100644
---- a/svc.c
-+++ b/svc.c
-@@ -1512,6 +1512,39 @@ do_RSAgen(void)
-     return;
- }
- 
-+
-+#if OPENSSL_VERSION_NUMBER < 0x10100000
-+static inline int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
-+{
-+	/* If the fields p and g in d are NULL, the corresponding input
-+	 * parameters MUST be non-NULL.  q may remain NULL.
-+	 */
-+	if ((dh->p == NULL && p == NULL)
-+	    || (dh->g == NULL && g == NULL))
-+		return 0;
-+
-+	if (p != NULL) {
-+		BN_free(dh->p);
-+		dh->p = p;
-+	}
-+	if (q != NULL) {
-+		BN_free(dh->q);
-+		dh->q = q;
-+	}
-+	if (g != NULL) {
-+		BN_free(dh->g);
-+		dh->g = g;
-+	}
-+
-+	if (q != NULL) {
-+		dh->length = BN_num_bits(q);
-+	}
-+
-+	return 1;
-+}
-+#endif
-+
-+
- #include    "dh512.h"
- 
- #if DH_LEN == 1024
diff --git a/package/pound/0002-fix-openssl-1.1.0.patch b/package/pound/0002-fix-openssl-1.1.0.patch
deleted file mode 100644
index 04eddb15d7..0000000000
--- a/package/pound/0002-fix-openssl-1.1.0.patch
+++ /dev/null
@@ -1,334 +0,0 @@
-From a2c9dde4d055ea8942afb150b7fc3a807d4e5d60 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 28 Feb 2018 13:44:01 +0000
-Subject: [PATCH] Support for Openssl 1.1
-
-Fixes
-http://autobuild.buildroot.net/results/ef2/ef2de6c280bf8622a00d4573bc5bd143e3baa002
-
-Downloaded from github fork:
-https://github.com/graygnuorg/pound/commit/a2c9dde4d055ea8942afb150b7fc3a807d4e5d60
-
-This patch was announced on the upstream mailinglist:
-http://www.apsis.ch/pound/pound_list/archive/2018/2018-03/1519920322000
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- .gitignore |  15 ++++++++
- config.c   |  17 +++++++--
- http.c     |  12 ++++++-
- pound.h    |   4 ++-
- svc.c      | 101 +++++++++++++++++++++++++++++++++++++++++++----------
- 5 files changed, 125 insertions(+), 24 deletions(-)
- create mode 100644 .gitignore
-
-diff --git a/config.c b/config.c
-index d41a3ee..e8fec0f 100644
---- a/config.c
-+++ b/config.c
-@@ -174,6 +174,16 @@ conf_fgets(char *buf, const int max)
-     }
- }
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+# define general_name_string(n) \
-+	strndup(ASN1_STRING_get0_data(n->d.dNSName),	\
-+	        ASN1_STRING_length(n->d.dNSName) + 1)
-+#else
-+# define general_name_string(n) \
-+	strndup(ASN1_STRING_data(n->d.dNSName),	\
-+	       ASN1_STRING_length(n->d.dNSName) + 1)
-+#endif
-+
- unsigned char **
- get_subjectaltnames(X509 *x509, unsigned int *count)
- {
-@@ -194,8 +204,7 @@ get_subjectaltnames(X509 *x509, unsigned int *count)
-         name = sk_GENERAL_NAME_pop(san_stack);
-         switch(name->type) {
-             case GEN_DNS:
--                temp[local_count] = strndup(ASN1_STRING_data(name->d.dNSName), ASN1_STRING_length(name->d.dNSName)
--                                    + 1);
-+ 	        temp[local_count] = general_name_string(name);
-                 if(temp[local_count] == NULL)
-                     conf_err("out of memory");
-                 local_count++;
-@@ -565,7 +574,9 @@ parse_service(const char *svc_name)
-     pthread_mutex_init(&res->mut, NULL);
-     if(svc_name)
-         strncpy(res->name, svc_name, KEY_SIZE);
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    if((res->sessions = lh_TABNODE_new(t_hash, t_cmp)) == NULL)    
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((res->sessions = LHM_lh_new(TABNODE, t)) == NULL)
- #else
-     if((res->sessions = lh_new(LHASH_HASH_FN(t_hash), LHASH_COMP_FN(t_cmp))) == NULL)
-diff --git a/http.c b/http.c
-index dd211e4..c8e756a 100644
---- a/http.c
-+++ b/http.c
-@@ -527,12 +527,22 @@ log_bytes(char *res, const LONG cnt)
- 
- /* Cleanup code. This should really be in the pthread_cleanup_push, except for bugs in some implementations */
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+# define clear_error()
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-+# define clear_error() \
-+	if(ssl != NULL) { ERR_clear_error(); ERR_remove_thread_state(NULL); }
-+#else
-+# define clear_error() \
-+	if(ssl != NULL) { ERR_clear_error(); ERR_remove_state(0); }
-+#endif
-+
- #define clean_all() {   \
-     if(ssl != NULL) { BIO_ssl_shutdown(cl); } \
-     if(be != NULL) { BIO_flush(be); BIO_reset(be); BIO_free_all(be); be = NULL; } \
-     if(cl != NULL) { BIO_flush(cl); BIO_reset(cl); BIO_free_all(cl); cl = NULL; } \
-     if(x509 != NULL) { X509_free(x509); x509 = NULL; } \
--    if(ssl != NULL) { ERR_clear_error(); ERR_remove_state(0); } \
-+    clear_error(); \
- }
- 
- /*
-diff --git a/pound.h b/pound.h
-index fa22c36..9603b91 100644
---- a/pound.h
-+++ b/pound.h
-@@ -344,7 +344,9 @@ typedef struct _tn {
- /* maximal session key size */
- #define KEY_SIZE    127
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+  DEFINE_LHASH_OF(TABNODE);
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
- DECLARE_LHASH_OF(TABNODE);
- #endif
- 
-diff --git a/svc.c b/svc.c
-index 60ba488..063b92c 100644
---- a/svc.c
-+++ b/svc.c
-@@ -27,10 +27,17 @@
- 
- #include    "pound.h"
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+# define TABNODE_GET_DOWN_LOAD(t) lh_TABNODE_get_down_load(t)
-+# define TABNODE_SET_DOWN_LOAD(t,n) lh_TABNODE_set_down_load(t,n)
-+#else
- #ifndef LHASH_OF
- #define LHASH_OF(x) LHASH
- #define CHECKED_LHASH_OF(type, h) h
- #endif
-+# define TABNODE_GET_DOWN_LOAD(t) (CHECKED_LHASH_OF(TABNODE, t)->down_load)
-+# define TABNODE_SET_DOWN_LOAD(t,n) (CHECKED_LHASH_OF(TABNODE, t)->down_load = n)
-+#endif
- 
- /*
-  * Add a new key/content pair to a hash table
-@@ -58,7 +65,9 @@ t_add(LHASH_OF(TABNODE) *const tab, const char *key, const void *content, const
-     }
-     memcpy(t->content, content, cont_len);
-     t->last_acc = time(NULL);
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    if((old = lh_TABNODE_insert(tab, t)) != NULL) {
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((old = LHM_lh_insert(TABNODE, tab, t)) != NULL) {
- #else
-     if((old = (TABNODE *)lh_insert(tab, t)) != NULL) {
-@@ -82,7 +91,9 @@ t_find(LHASH_OF(TABNODE) *const tab, char *const key)
-     TABNODE t, *res;
- 
-     t.key = key;
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    if((res = lh_TABNODE_retrieve(tab, &t)) != NULL) {
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((res = (TABNODE *)LHM_lh_retrieve(TABNODE, tab, &t)) != NULL) {
- #else
-     if((res = (TABNODE *)lh_retrieve(tab, &t)) != NULL) {
-@@ -102,7 +113,9 @@ t_remove(LHASH_OF(TABNODE) *const tab, char *const key)
-     TABNODE t, *res;
- 
-     t.key = key;
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    if((res = lh_TABNODE_delete(tab, &t)) != NULL) {    
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((res = LHM_lh_delete(TABNODE, tab, &t)) != NULL) {
- #else
-     if((res = (TABNODE *)lh_delete(tab, &t)) != NULL) {
-@@ -127,7 +140,9 @@ t_old_doall_arg(TABNODE *t, ALL_ARG *a)
-     TABNODE *res;
- 
-     if(t->last_acc < a->lim)
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+        if((res = lh_TABNODE_delete(a->tab, t)) != NULL) {	    
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-         if((res = LHM_lh_delete(TABNODE, a->tab, t)) != NULL) {
- #else
-         if((res = lh_delete(a->tab, t)) != NULL) {
-@@ -145,6 +160,10 @@ IMPLEMENT_LHASH_DOALL_ARG_FN(t_old, TABNODE, ALL_ARG)
- IMPLEMENT_LHASH_DOALL_ARG_FN(t_old, TABNODE *, ALL_ARG *)
- #endif
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+IMPLEMENT_LHASH_DOALL_ARG(TABNODE,ALL_ARG);
-+#endif
-+
- /*
-  * Expire all old nodes
-  */
-@@ -156,14 +175,16 @@ t_expire(LHASH_OF(TABNODE) *const tab, const time_t lim)
- 
-     a.tab = tab;
-     a.lim = lim;
--    down_load = CHECKED_LHASH_OF(TABNODE, tab)->down_load;
--    CHECKED_LHASH_OF(TABNODE, tab)->down_load = 0;
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+    down_load = TABNODE_GET_DOWN_LOAD(tab);
-+    TABNODE_SET_DOWN_LOAD(tab, 0);
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    lh_TABNODE_doall_ALL_ARG(tab, t_old_doall_arg, &a);
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     LHM_lh_doall_arg(TABNODE, tab, LHASH_DOALL_ARG_FN(t_old), ALL_ARG, &a);
- #else
-     lh_doall_arg(tab, LHASH_DOALL_ARG_FN(t_old), &a);
- #endif
--    CHECKED_LHASH_OF(TABNODE, tab)->down_load = down_load;
-+    TABNODE_SET_DOWN_LOAD(tab, down_load);
-     return;
- }
- 
-@@ -173,7 +194,9 @@ t_cont_doall_arg(TABNODE *t, ALL_ARG *arg)
-     TABNODE *res;
- 
-     if(memcmp(t->content, arg->content, arg->cont_len) == 0)
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+        if((res = lh_TABNODE_delete(arg->tab, t)) != NULL) {
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-         if((res = LHM_lh_delete(TABNODE, arg->tab, t)) != NULL) {
- #else
-         if((res = lh_delete(arg->tab, t)) != NULL) {
-@@ -203,15 +226,16 @@ t_clean(LHASH_OF(TABNODE) *const tab, void *const content, const size_t cont_len
-     a.tab = tab;
-     a.content = content;
-     a.cont_len = cont_len;
--    down_load = CHECKED_LHASH_OF(TABNODE, tab)->down_load;
--    CHECKED_LHASH_OF(TABNODE, tab)->down_load = 0;
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+    down_load = TABNODE_GET_DOWN_LOAD(tab);
-+    TABNODE_SET_DOWN_LOAD(tab, 0);
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    lh_TABNODE_doall_ALL_ARG(tab, t_cont_doall_arg, &a);
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     LHM_lh_doall_arg(TABNODE, tab, LHASH_DOALL_ARG_FN(t_cont), ALL_ARG, &a);
- #else
-     lh_doall_arg(tab, LHASH_DOALL_ARG_FN(t_cont), &a);
- #endif
--    CHECKED_LHASH_OF(TABNODE, tab)->down_load = down_load;
--    return;
-+    TABNODE_SET_DOWN_LOAD(tab, down_load);
- }
- 
- /*
-@@ -1262,6 +1286,31 @@ RSA_tmp_callback(/* not used */SSL *ssl, /* not used */int is_export, int keylen
-     return res;
- }
- 
-+static int
-+generate_key(RSA **ret_rsa, unsigned long bits)
-+{
-+#if OPENSSL_VERSION_NUMBER > 0x00908000L
-+    int rc = 0;
-+    RSA *rsa;
-+
-+    rsa = RSA_new();
-+    if (rsa) {
-+	BIGNUM *bne = BN_new();
-+	if (BN_set_word(bne, RSA_F4))
-+	    rc = RSA_generate_key_ex(rsa, bits, bne, NULL);
-+	BN_free(bne);
-+	if (rc)
-+	    *ret_rsa = rsa;
-+	else
-+	    RSA_free(rsa);
-+    }
-+    return rc;
-+#else
-+    *ret_rsa = RSA_generate_key(bits, RSA_F4, NULL, NULL);
-+    return *ret_rsa != NULL;
-+#endif
-+}
-+
- /*
-  * Periodically regenerate ephemeral RSA keys
-  * runs every T_RSA_KEYS seconds
-@@ -1274,8 +1323,9 @@ do_RSAgen(void)
-     RSA *t_RSA1024_keys[N_RSA_KEYS];
- 
-     for(n = 0; n < N_RSA_KEYS; n++) {
--        t_RSA512_keys[n] = RSA_generate_key(512, RSA_F4, NULL, NULL);
--        t_RSA1024_keys[n] = RSA_generate_key(1024, RSA_F4, NULL, NULL);
-+        /* FIXME: Error handling */
-+        generate_key(&t_RSA512_keys[n], 512);
-+	generate_key(&t_RSA1024_keys[n], 1024);
-     }
-     if(ret_val = pthread_mutex_lock(&RSA_mut))
-         logmsg(LOG_WARNING, "thr_RSAgen() lock: %s", strerror(ret_val));
-@@ -1329,11 +1379,11 @@ init_timer(void)
-      * Pre-generate ephemeral RSA keys
-      */
-     for(n = 0; n < N_RSA_KEYS; n++) {
--        if((RSA512_keys[n] = RSA_generate_key(512, RSA_F4, NULL, NULL)) == NULL) {
-+        if(!generate_key(&RSA512_keys[n], 512)) {
-             logmsg(LOG_WARNING,"RSA_generate(%d, 512) failed", n);
-             return;
-         }
--        if((RSA1024_keys[n] = RSA_generate_key(1024, RSA_F4, NULL, NULL)) == NULL) {
-+        if(!generate_key(&RSA1024_keys[n], 1024)) {
-             logmsg(LOG_WARNING,"RSA_generate(%d, 1024) failed", n);
-             return;
-         }
-@@ -1420,6 +1470,10 @@ IMPLEMENT_LHASH_DOALL_ARG_FN(t_dump, TABNODE, DUMP_ARG)
- IMPLEMENT_LHASH_DOALL_ARG_FN(t_dump, TABNODE *, DUMP_ARG *)
- #endif
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+IMPLEMENT_LHASH_DOALL_ARG(TABNODE,DUMP_ARG);
-+#endif
-+	
- /*
-  * write sessions to the control socket
-  */
-@@ -1430,7 +1484,9 @@ dump_sess(const int control_sock, LHASH_OF(TABNODE) *const sess, BACKEND *const
- 
-     a.control_sock = control_sock;
-     a.backends = backends;
--#if OPENSSL_VERSION_NUMBER >= 0x10000000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+    lh_TABNODE_doall_DUMP_ARG(sess, t_dump_doall_arg, &a);
-+#elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     LHM_lh_doall_arg(TABNODE, sess, LHASH_DOALL_ARG_FN(t_dump), DUMP_ARG, &a);
- #else
-     lh_doall_arg(sess, LHASH_DOALL_ARG_FN(t_dump), &a);
-@@ -1664,6 +1720,13 @@ thr_control(void *arg)
-     }
- }
- 
-+#ifndef SSL3_ST_SR_CLNT_HELLO_A
-+# define SSL3_ST_SR_CLNT_HELLO_A (0x110|SSL_ST_ACCEPT)
-+#endif
-+#ifndef SSL23_ST_SR_CLNT_HELLO_A
-+# define SSL23_ST_SR_CLNT_HELLO_A (0x210|SSL_ST_ACCEPT)
-+#endif
-+		
- void
- SSLINFO_callback(const SSL *ssl, int where, int rc)
- {
diff --git a/package/pound/0003-Support-for-libressl-coexisting-with-openssl-1.1.x.patch b/package/pound/0003-Support-for-libressl-coexisting-with-openssl-1.1.x.patch
deleted file mode 100644
index 3befc271d7..0000000000
--- a/package/pound/0003-Support-for-libressl-coexisting-with-openssl-1.1.x.patch
+++ /dev/null
@@ -1,140 +0,0 @@
-From 145b88d0c1a71ba6f4d216768388e0c5853d3990 Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Tue, 5 Feb 2019 10:34:55 -0600
-Subject: [PATCH] Support for libressl coexisting with openssl 1.1.x
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libressl needs to not follow the 1.1.x path of APIs
-
-Resolves build failure like
-In file included from svc.c:28:0:
-pound.h:348:3: warning: data definition has no type or storage class
-   DEFINE_LHASH_OF(TABNODE);
-   ^~~~~~~~~~~~~~~
-pound.h:348:3: warning: type defaults to ‘int’ in declaration of ‘DEFINE_LHASH_OF’ [-Wimplicit-int]
-svc.c: In function ‘t_add’:
-svc.c:69:15: warning: implicit declaration of function ‘lh_TABNODE_insert’; did you mean ‘lh_OBJ_NAME_insert’? [-Wimplicit-function-declaration]
-     if((old = lh_TABNODE_insert(tab, t)) != NULL) {
-               ^~~~~~~~~~~~~~~~~
-               lh_OBJ_NAME_insert
-
-Upstream: Site was down when I tried (http://www.apsis.ch/pound)
-
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
----
- config.c |  2 +-
- svc.c    | 20 ++++++++++----------
- 2 files changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/config.c b/config.c
-index 58b928e..3ad7fbb 100644
---- a/config.c
-+++ b/config.c
-@@ -574,7 +574,7 @@ parse_service(const char *svc_name)
-     pthread_mutex_init(&res->mut, NULL);
-     if(svc_name)
-         strncpy(res->name, svc_name, KEY_SIZE);
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     if((res->sessions = lh_TABNODE_new(t_hash, t_cmp)) == NULL)    
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((res->sessions = LHM_lh_new(TABNODE, t)) == NULL)
-diff --git a/svc.c b/svc.c
-index f125be4..8a2f62c 100644
---- a/svc.c
-+++ b/svc.c
-@@ -27,7 +27,7 @@
- 
- #include    "pound.h"
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
- # define TABNODE_GET_DOWN_LOAD(t) lh_TABNODE_get_down_load(t)
- # define TABNODE_SET_DOWN_LOAD(t,n) lh_TABNODE_set_down_load(t,n)
- #else
-@@ -65,7 +65,7 @@ t_add(LHASH_OF(TABNODE) *const tab, const char *key, const void *content, const
-     }
-     memcpy(t->content, content, cont_len);
-     t->last_acc = time(NULL);
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     if((old = lh_TABNODE_insert(tab, t)) != NULL) {
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((old = LHM_lh_insert(TABNODE, tab, t)) != NULL) {
-@@ -91,7 +91,7 @@ t_find(LHASH_OF(TABNODE) *const tab, char *const key)
-     TABNODE t, *res;
- 
-     t.key = key;
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     if((res = lh_TABNODE_retrieve(tab, &t)) != NULL) {
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((res = (TABNODE *)LHM_lh_retrieve(TABNODE, tab, &t)) != NULL) {
-@@ -113,7 +113,7 @@ t_remove(LHASH_OF(TABNODE) *const tab, char *const key)
-     TABNODE t, *res;
- 
-     t.key = key;
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     if((res = lh_TABNODE_delete(tab, &t)) != NULL) {    
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     if((res = LHM_lh_delete(TABNODE, tab, &t)) != NULL) {
-@@ -140,7 +140,7 @@ t_old_doall_arg(TABNODE *t, ALL_ARG *a)
-     TABNODE *res;
- 
-     if(t->last_acc < a->lim)
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-         if((res = lh_TABNODE_delete(a->tab, t)) != NULL) {	    
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-         if((res = LHM_lh_delete(TABNODE, a->tab, t)) != NULL) {
-@@ -160,7 +160,7 @@ IMPLEMENT_LHASH_DOALL_ARG_FN(t_old, TABNODE, ALL_ARG)
- IMPLEMENT_LHASH_DOALL_ARG_FN(t_old, TABNODE *, ALL_ARG *)
- #endif
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
- IMPLEMENT_LHASH_DOALL_ARG(TABNODE,ALL_ARG);
- #endif
- 
-@@ -177,7 +177,7 @@ t_expire(LHASH_OF(TABNODE) *const tab, const time_t lim)
-     a.lim = lim;
-     down_load = TABNODE_GET_DOWN_LOAD(tab);
-     TABNODE_SET_DOWN_LOAD(tab, 0);
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     lh_TABNODE_doall_ALL_ARG(tab, t_old_doall_arg, &a);
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     LHM_lh_doall_arg(TABNODE, tab, LHASH_DOALL_ARG_FN(t_old), ALL_ARG, &a);
-@@ -194,7 +194,7 @@ t_cont_doall_arg(TABNODE *t, ALL_ARG *arg)
-     TABNODE *res;
- 
-     if(memcmp(t->content, arg->content, arg->cont_len) == 0)
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-         if((res = lh_TABNODE_delete(arg->tab, t)) != NULL) {
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-         if((res = LHM_lh_delete(TABNODE, arg->tab, t)) != NULL) {
-@@ -228,7 +228,7 @@ t_clean(LHASH_OF(TABNODE) *const tab, void *const content, const size_t cont_len
-     a.cont_len = cont_len;
-     down_load = TABNODE_GET_DOWN_LOAD(tab);
-     TABNODE_SET_DOWN_LOAD(tab, 0);
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     lh_TABNODE_doall_ALL_ARG(tab, t_cont_doall_arg, &a);
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     LHM_lh_doall_arg(TABNODE, tab, LHASH_DOALL_ARG_FN(t_cont), ALL_ARG, &a);
-@@ -1514,7 +1514,7 @@ dump_sess(const int control_sock, LHASH_OF(TABNODE) *const sess, BACKEND *const
- 
-     a.control_sock = control_sock;
-     a.backends = backends;
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined LIBRESSL_VERSION_NUMBER
-     lh_TABNODE_doall_DUMP_ARG(sess, t_dump_doall_arg, &a);
- #elif OPENSSL_VERSION_NUMBER >= 0x10000000L
-     LHM_lh_doall_arg(TABNODE, sess, LHASH_DOALL_ARG_FN(t_dump), DUMP_ARG, &a);
--- 
-1.9.1
-
diff --git a/package/pound/Config.in b/package/pound/Config.in
index 91c29ea7a6..60fafff935 100644
--- a/package/pound/Config.in
+++ b/package/pound/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_POUND
 	  for a convenient SSL wrapper for those Web servers that do not
 	  offer it natively.
 
-	  http://www.apsis.ch/pound
+	  https://github.com/graygnuorg/pound
 
 comment "pound needs a toolchain w/ dynamic library, threads"
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pound/pound.hash b/package/pound/pound.hash
index 1e88218692..c5b08891be 100644
--- a/package/pound/pound.hash
+++ b/package/pound/pound.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a7fd8690de0fd390615e79fd0f4bfd56a544b8ef97dd6659c07ecd3207480c25  Pound-2.8.tgz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL.txt
+sha256  f1a041e060124941b090ad2d4fec5a72be37a5f8a50f0e0ca821dcbbe4b5925b  pound-4.8.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/pound/pound.mk b/package/pound/pound.mk
index d6839fc2e7..550da10513 100644
--- a/package/pound/pound.mk
+++ b/package/pound/pound.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-POUND_VERSION = 2.8
-POUND_SITE = http://www.apsis.ch/pound
-POUND_SOURCE = Pound-$(POUND_VERSION).tgz
+POUND_VERSION = 4.8
+POUND_SITE = https://github.com/graygnuorg/pound/releases/download/v$(POUND_VERSION)
 POUND_LICENSE = GPL-3.0+
-POUND_LICENSE_FILES = GPL.txt
+POUND_LICENSE_FILES = COPYING
 POUND_DEPENDENCIES = openssl host-openssl
 
 # Force owner/group to us, otherwise it will try proxy:proxy by
@@ -17,8 +16,14 @@ POUND_CONF_OPTS = \
 	--with-owner=$(shell id -un) \
 	--with-group=$(shell id -gn)
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+POUND_CONF_OPTS += --enable-pcreposix=pcre2
+POUND_DEPENDENCIES += pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
+POUND_CONF_OPTS += --enable-pcreposix=pcre1
 POUND_DEPENDENCIES += pcre
+else
+POUND_CONF_OPTS += --disable-pcreposix
 endif
 
 $(eval $(autotools-package))

--===============4845261670691001134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4845261670691001134==--
