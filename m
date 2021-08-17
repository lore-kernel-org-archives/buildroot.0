Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD63C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 16:37:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A7A60F11
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 16:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1A7A60F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83B2740004;
	Tue, 17 Aug 2021 16:37:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kytNdz6KwuWG; Tue, 17 Aug 2021 16:37:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12102400E1;
	Tue, 17 Aug 2021 16:37:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB4F61BF2F3
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 16:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AAD9402E0
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 16:37:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j19JVZrI81JB for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 16:37:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C539E402CE
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 16:37:37 +0000 (UTC)
Received: from fwd33.aul.t-online.de (fwd33.aul.t-online.de [172.20.27.144])
 by mailout11.t-online.de (Postfix) with SMTP id C259D1ECE1
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 18:37:34 +0200 (CEST)
Received: from fli4l.lan.fli4l
 (E2W+rsZaYhAAfgdaERraHFTdjrBt3hPoB0XzDwU-Xfk3nKZsysNXB1BkHG8F5dzg31@[79.214.196.191])
 by fwd33.t-online.de with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1mG25m-3X36UC0; Tue, 17 Aug 2021 18:37:34 +0200
Received: from mahler.lan.fli4l ([192.168.1.1]:59920)
 by fli4l.lan.fli4l with esmtp (Exim 4.94.2)
 (envelope-from <bernd.kuhls@t-online.de>) id 1mG25l-0005O1-M1
 for buildroot@buildroot.org; Tue, 17 Aug 2021 18:37:34 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 18:37:33 +0200
Message-Id: <20210817163733.57255-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ID: E2W+rsZaYhAAfgdaERraHFTdjrBt3hPoB0XzDwU-Xfk3nKZsysNXB1BkHG8F5dzg31
X-TOI-EXPURGATEID: 150726::1629218254-00013209-EAB3201E/0/0 CLEAN NORMAL
X-TOI-MSGID: 80bb6227-275d-4e91-a9e0-866c73a3a6bb
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.6.7
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes CVE-2021-38385: https://blog.torproject.org/node/2062

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/0001-Fix-static-linking-with-OpenSSL.patch | 10 +++++-----
 package/tor/tor.hash                                   |  2 +-
 package/tor/tor.mk                                     |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
index 8385c28972..26ed6fe819 100644
--- a/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
+++ b/package/tor/0001-Fix-static-linking-with-OpenSSL.patch
@@ -9,7 +9,7 @@ and remove host paths when looking for openssl.
 [Vincent:
  - Adapt the patch to make it apply on the new version.]
 [Bernd: rebased for tor-0.2.7.6, 0.2.8.10, 0.2.9.9, 0.3.1.7, 0.3.2.10,
-        0.3.4.8, 0.3.5.7, 0.4.4.5 & 0.4.5.6]
+        0.3.4.8, 0.3.5.7, 0.4.4.5, 0.4.5.6 & 0.4.6.7]
 [Fabrice: fix detection of openssl functions in 0.3.5.8]
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
@@ -24,7 +24,7 @@ diff --git a/configure.ac b/configure.ac
 index 05e1392cf..580befa6b 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1056,7 +1056,7 @@ AC_ARG_WITH(ssl-dir,
+@@ -1074,7 +1074,7 @@ AC_ARG_WITH(ssl-dir,
    ])
  
  AC_MSG_NOTICE([Now, we'll look for OpenSSL >= 1.0.1])
@@ -33,7 +33,7 @@ index 05e1392cf..580befa6b 100644
      [#include <openssl/ssl.h>
       char *getenv(const char *);],
      [struct ssl_cipher_st;
-@@ -1086,7 +1086,7 @@ dnl Now check for particular openssl functions.
+@@ -1104,7 +1104,7 @@ dnl Now check for particular openssl functions.
  save_LIBS="$LIBS"
  save_LDFLAGS="$LDFLAGS"
  save_CPPFLAGS="$CPPFLAGS"
@@ -46,7 +46,7 @@ diff --git a/src/test/include.am b/src/test/include.am
 index ecb768957..39a622e88 100644
 --- a/src/test/include.am
 +++ b/src/test/include.am
-@@ -404,8 +404,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
+@@ -399,8 +399,8 @@ src_test_test_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_ntor_cl_LDADD = \
  	libtor.a \
  	$(rust_ldadd) \
@@ -57,7 +57,7 @@ index ecb768957..39a622e88 100644
  	@CURVE25519_LIBS@ @TOR_LZMA_LIBS@ @TOR_TRACE_LIBS@
  src_test_test_ntor_cl_AM_CPPFLAGS =	       \
  	$(AM_CPPFLAGS)
-@@ -414,8 +414,8 @@
+@@ -409,8 +409,8 @@
  src_test_test_hs_ntor_cl_LDFLAGS = @TOR_LDFLAGS_zlib@ $(TOR_LDFLAGS_CRYPTLIB)
  src_test_test_hs_ntor_cl_LDADD = \
  	libtor.a \
diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 564e0e7ecb..72bdc4a2ee 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3423189ba455372021ed44e0be576d181f2908cbd9bdef202d9c11c950882e12  tor-0.4.6.6.tar.gz
+sha256  ff665ce121b2952110bd98b9c8741b5593bf6c01ac09033ad848ed92c2510f9a  tor-0.4.6.7.tar.gz
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 30ad34115f..54c8506f46 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.6.6
+TOR_VERSION = 0.4.6.7
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
