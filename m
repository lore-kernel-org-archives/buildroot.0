Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F6CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 21:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C716A40462;
	Thu, 12 May 2022 21:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e5ydHlnOeq19; Thu, 12 May 2022 21:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9572040242;
	Thu, 12 May 2022 21:53:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 934E01BF3D4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F35482D07
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 21:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DY_D-iLxr7Jn for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 21:53:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42E4B82CE5
 for <buildroot@buildroot.org>; Thu, 12 May 2022 21:53:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 125-20020a1c1983000000b003941f354c62so3777349wmz.0
 for <buildroot@buildroot.org>; Thu, 12 May 2022 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wdb6jzyIwddOKxkt7EWuL2xrJEZnVsuJlPIsezbekts=;
 b=lR4cxW0xyyYdcGoRGABgO3hXXNCgizfsjSxV8DIpo0OuFAlcPVYuzFAa00K8IikW1B
 M67NaOCPih3s0Y/KLJRGuwUnQY7iCV2QKpP5dfAGSUHDJlF753zgr+x5PyKFxbgDCmsx
 D4Yj863mfP6pgEVe/qIjGLw4Iozp43wVOcAe8tSEkOalPc92eWXcXoDtxC2DCn0g8ZgH
 Etu7UeOY1kAHM2ULmQ6Z9tDU4UocHMdjlklsJ4NX5ZA/lT/+QvLrHxEO7VMrMXSBI+8e
 umRoxQQKAnHx2mHktUHUVfbleHIhuqIp0DEQKYQZVQr5Ut2S6+emrhMplJ1ZPpGTBZo9
 vufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wdb6jzyIwddOKxkt7EWuL2xrJEZnVsuJlPIsezbekts=;
 b=XT73NWEiI4quWHQtgLxA0kTnDMH66beGPRPSvVxsAIM53E8iFd1b/O/jTOjaSKlWI+
 ELWGgPNSRcnoEUoEbWgCZfQkmVz0jVVh6nDeU+0KkCJe7cD3BEPg8lycCWl+LZVXDVca
 6Wom8ljtGHqXBobqagjprQdNQ6Rzj4AwVJc1fCO/oFyzwc/64MKqLnBTKpI89/F84UEJ
 vGrKLVx78z6SCnPogGt09dARID3vuTk01dln/7FlLtsK+7BTOTnkW5NIl9ObpRck0whF
 gENopPXy6M0pSYxWD8fHK+MJ4XMe9jNMQL5Nd/5dkebetkhO8UbmUqfYFD4yGyPu330z
 zdZQ==
X-Gm-Message-State: AOAM532XATRmZZEH+bXWkq8YZPeCKylNwBDV7AL67SEZgV8k9Ymn/UWd
 zmBi5CMMCeB0mLOe7PXdcIECg2HJ/9o=
X-Google-Smtp-Source: ABdhPJxF9ohjQ/DNn7HOOKNAEjUZrNwTcPhmB8YUh/TTpKJYG5hSvNFvQyI5/FQ3XgE86c8kXUO4rg==
X-Received: by 2002:a05:600c:4f53:b0:394:6a35:79ac with SMTP id
 m19-20020a05600c4f5300b003946a3579acmr12103972wmq.36.1652392432191; 
 Thu, 12 May 2022 14:53:52 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w6-20020adfe046000000b0020c5253d8c5sm581239wrh.17.2022.05.12.14.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 14:53:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 23:51:42 +0200
Message-Id: <20220512215142.3713421-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/aircrack-ng: bump to version 1.7
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Drop patches (already in version)
- Update indentation in hash file (two spaces)

https://aircrack-ng.blogspot.com/2022/05/aircrack-ng-17.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Expand-packed-definition.patch       | 26 -------
 .../0002-Fix-duplicated-symbols.patch         | 74 -------------------
 ...rypto.c-fx-build-with-libressl-3.5.0.patch | 35 ---------
 package/aircrack-ng/aircrack-ng.hash          |  6 +-
 package/aircrack-ng/aircrack-ng.mk            |  2 +-
 5 files changed, 4 insertions(+), 139 deletions(-)
 delete mode 100644 package/aircrack-ng/0001-Expand-packed-definition.patch
 delete mode 100644 package/aircrack-ng/0002-Fix-duplicated-symbols.patch
 delete mode 100644 package/aircrack-ng/0003-lib-crypto-crypto.c-fx-build-with-libressl-3.5.0.patch

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
index e97886f894..de556f578d 100644
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
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
