Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B35C433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 09:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D79ED60F15;
	Sat, 14 May 2022 09:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dHRtjC6jEAJg; Sat, 14 May 2022 09:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A194D60F0A;
	Sat, 14 May 2022 09:54:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC3451BF85D
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C9B8C83FB5
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tkni6yfBGqfr for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE3B683FBD
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:50:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8BF328376C; Sat, 14 May 2022 09:39:44 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 11:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4a762bf7f1b5753730d73ccac9b059f79c81387
X-Git-Newrev: 814ed3896f62373f5e91978e3713642c2b6e85a9
X-Patchwork-Hint: ignore
Message-Id: <20220514093944.8BF328376C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aircrack-ng: bump to version 1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=814ed3896f62373f5e91978e3713642c2b6e85a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://aircrack-ng.blogspot.com/2022/05/aircrack-ng-17.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-Expand-packed-definition.patch            | 26 --------
 .../aircrack-ng/0002-Fix-duplicated-symbols.patch  | 74 ----------------------
 ...pto-crypto.c-fx-build-with-libressl-3.5.0.patch | 35 ----------
 package/aircrack-ng/aircrack-ng.hash               |  6 +-
 package/aircrack-ng/aircrack-ng.mk                 |  2 +-
 5 files changed, 4 insertions(+), 139 deletions(-)

diff --git a/package/aircrack-ng/0001-Expand-packed-definition.patch b/package/aircrack-ng/0001-Expand-packed-definition.patch
deleted file mode 100644
index f0c033a1aa..0000000000
--- a/package/aircrack-ng/0001-Expand-packed-definition.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d4496006ac1e0c99908108b998ae39afb0658733 Mon Sep 17 00:00:00 2001
-From: Joseph Benden <joe@benden.us>
-Date: Tue, 7 Jul 2020 11:42:40 -0700
-Subject: [PATCH] Expand __packed definition.
-
-Signed-off-by: Joseph Benden <joe@benden.us>
-[Retrieved from:
-https://github.com/aircrack-ng/aircrack-ng/commit/d4496006ac1e0c99908108b998ae39afb0658733]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/radiotap/radiotap.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/radiotap/radiotap.h b/lib/radiotap/radiotap.h
-index 57f784b8d..bb5a41dfc 100644
---- a/lib/radiotap/radiotap.h
-+++ b/lib/radiotap/radiotap.h
-@@ -56,7 +56,7 @@ struct ieee80211_radiotap_header {
- 	 * @it_present: (first) present word
- 	 */
- 	uint32_t it_present;
--} __packed;
-+} __attribute__((__packed__));
- 
- /* version is always 0 */
- #define PKTHDR_RADIOTAP_VERSION	0
diff --git a/package/aircrack-ng/0002-Fix-duplicated-symbols.patch b/package/aircrack-ng/0002-Fix-duplicated-symbols.patch
deleted file mode 100644
index f181580808..0000000000
--- a/package/aircrack-ng/0002-Fix-duplicated-symbols.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-From f6f1396807607f5649d20631db517cfca3a1f5c4 Mon Sep 17 00:00:00 2001
-From: Joseph Benden <joe@benden.us>
-Date: Tue, 7 Jul 2020 11:44:40 -0700
-Subject: [PATCH] Fix duplicated symbols.
-
-Signed-off-by: Joseph Benden <joe@benden.us>
-[Retrieved from:
-https://github.com/aircrack-ng/aircrack-ng/commit/f6f1396807607f5649d20631db517cfca3a1f5c4]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/airodump-ng/airodump-ng.c                 | 2 --
- src/airventriloquist-ng/airventriloquist-ng.c | 6 +++---
- src/tkiptun-ng/tkiptun-ng.c                   | 4 ++--
- 3 files changed, 5 insertions(+), 7 deletions(-)
-
-diff --git a/src/airodump-ng/airodump-ng.c b/src/airodump-ng/airodump-ng.c
-index 3ae6994dd..e72bc88e2 100644
---- a/src/airodump-ng/airodump-ng.c
-+++ b/src/airodump-ng/airodump-ng.c
-@@ -92,8 +92,6 @@
- #include "radiotap/radiotap_iter.h"
- 
- struct devices dev;
--uint8_t h80211[4096] __attribute__((aligned(16)));
--uint8_t tmpbuf[4096] __attribute__((aligned(16)));
- 
- static const unsigned char llcnull[] = {0, 0, 0, 0};
- 
-diff --git a/src/airventriloquist-ng/airventriloquist-ng.c b/src/airventriloquist-ng/airventriloquist-ng.c
-index ac6b7647e..267d95540 100644
---- a/src/airventriloquist-ng/airventriloquist-ng.c
-+++ b/src/airventriloquist-ng/airventriloquist-ng.c
-@@ -173,7 +173,7 @@ static struct local_options
- } lopt;
- 
- struct devices dev;
--struct wif *_wi_in, *_wi_out;
-+extern struct wif *_wi_in, *_wi_out;
- 
- struct ARP_req
- {
-@@ -195,8 +195,8 @@ struct APt
- };
- 
- unsigned long nb_pkt_sent;
--u_int8_t h80211[4096];
--static u_int8_t tmpbuf[4096];
-+extern u_int8_t h80211[4096];
-+extern u_int8_t tmpbuf[4096];
- 
- static int tcp_test(const char * ip_str, const short port)
- {
-diff --git a/src/tkiptun-ng/tkiptun-ng.c b/src/tkiptun-ng/tkiptun-ng.c
-index dc67f5d58..43db0bc23 100644
---- a/src/tkiptun-ng/tkiptun-ng.c
-+++ b/src/tkiptun-ng/tkiptun-ng.c
-@@ -267,7 +267,7 @@ static struct local_options
- 
- // unused, but needed for link
- struct devices dev;
--struct wif *_wi_in, *_wi_out;
-+extern struct wif *_wi_in, *_wi_out;
- 
- struct ARP_req
- {
-@@ -289,7 +289,7 @@ struct APt
- };
- 
- unsigned long nb_pkt_sent;
--unsigned char h80211[4096];
-+extern unsigned char h80211[4096];
- static unsigned char srcbuf[4096];
- static char strbuf[512];
- static int alarmed;
diff --git a/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch b/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
deleted file mode 100644
index da1549df5b..0000000000
--- a/package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 3 May 2022 01:34:41 +0200
-Subject: [PATCH] lib/crypto/crypto.c: fx build with libressl >= 3.5.0 (#2310)
-
-Fix the following build failure with libressl >= 3.5.0:
-
-lib/crypto/crypto.c: In function 'calc_mic':
-lib/crypto/crypto.c:203:2: error: variable 'ctx' has initializer but incomplete type
-  203 |  HMAC_CTX ctx = {0};
-      |  ^~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/d8444dada84a54205273ac627d3e4f4692a55364
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/aircrack-ng/aircrack-ng/commit/cbfe47193bbab1f82fafb4b83c3d159a0f1fe03d]
----
- lib/crypto/crypto.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/crypto/crypto.c b/lib/crypto/crypto.c
-index df2c1bf41..52bc5e5ac 100644
---- a/lib/crypto/crypto.c
-+++ b/lib/crypto/crypto.c
-@@ -196,7 +196,7 @@ void calc_mic(struct AP_info * ap,
- 	int i;
- 	unsigned char pke[100];
- #if defined(USE_GCRYPT) || OPENSSL_VERSION_NUMBER < 0x10100000L                \
--	|| defined(LIBRESSL_VERSION_NUMBER)
-+	|| (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
- #define HMAC_USE_NO_PTR
- #endif
- 
diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index 990c3ef563..3fb6de986b 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,6 +1,6 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1 ffeb4816476e7b329dc0c154f1aa4a30ad171beb aircrack-ng-1.6.tar.gz
-md5  22ddc85549b51ed0da0931d01ef215e5 aircrack-ng-1.6.tar.gz
+sha1  bd43a35281c9c81d958b95aa76b4404c29f904ff  aircrack-ng-1.7.tar.gz
+md5  a918ea7146f91d8c799fb770c38f4bec  aircrack-ng-1.7.tar.gz
 
 # Hash for license file:
-sha256 fc51fd3a97223f2fd47b057202d4a6b0daaedf23b5a1f5ff8723c192fc1e021d LICENSE
+sha256  fc51fd3a97223f2fd47b057202d4a6b0daaedf23b5a1f5ff8723c192fc1e021d  LICENSE
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index 95cda7c5a6..6ce738bbab 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.6
+AIRCRACK_NG_VERSION = 1.7
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
