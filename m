Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA9FFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB1B84DFF;
	Fri, 24 Apr 2026 16:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STuuIqMVmj9D; Fri, 24 Apr 2026 16:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3506184E5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049310;
	bh=puFEJaAlSAwEeRB9AQRpIlpMOReMuuvKe28Ha1spRQ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FQ1yVECU+iQudK7XyUvWQATbWOJkR+96DEFATVYioS4sLB3twQO3oD/Ddrn3DpJyN
	 Srzuxn5JDGZIU/jdq5jDqC+slMevpLL7KhBHX9QCtBfrf0557r6RFF88YTqiuQ/oIT
	 Tm9J31globbMecW4kms08lbgKcGEPND9rWM15A79qTp2fVABg2PRyey4GkxKJGyQFA
	 zoEdpT2NPtw2wCn5BARuMzJae8mpp/Gs59R2ocVCkodC5M5mOuhg2JxL2lmrBAiYJb
	 IeaoEprnWUsncuKBlYK3AlJcOY5GeCgJaibzAIosHE35VPeQJacIudIea+szht55pI
	 Z9IjoSHJPzsMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3506184E5B;
	Fri, 24 Apr 2026 16:48:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7AB8F24D
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6010561C55
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yBkUcMo-KiEF for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4844361C53
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4844361C53
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F15ED82B2E; Fri, 24 Apr 2026 16:48:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:44:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed27a33ba04fafdb28d5c74a53798c86aecd50e1
X-Git-Newrev: 26f1c8b5d4ec51e8c524910ca46a7e2b3f98fdf8
X-Patchwork-Hint: ignore
Message-Id: <20260424164826.F15ED82B2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openldap: bump version to 2.6.13
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26f1c8b5d4ec51e8c524910ca46a7e2b3f98fdf8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/openldap/openldap/blob/OPENLDAP_REL_ENG_2_6_13/CHANGES
https://www.openldap.org/software/release/changes_lts.html

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openldap/0001-fix-bignum.patch | 8 +++++---
 package/openldap/openldap.hash         | 4 ++--
 package/openldap/openldap.mk           | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/openldap/0001-fix-bignum.patch b/package/openldap/0001-fix-bignum.patch
index ec38ee3df0..1c71cd3165 100644
--- a/package/openldap/0001-fix-bignum.patch
+++ b/package/openldap/0001-fix-bignum.patch
@@ -11,11 +11,13 @@ So, keep the check for the bignum header, but check against ol_link_tls
 which means that openssl is enabled when we find the bignum headers.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Bernd: rebased for 2.6.13]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
 --- openldap-2.4.40.orig/configure	2014-09-19 03:48:49.000000000 +0200
 +++ openldap-2.4.40/configure	2015-01-25 18:44:54.216879362 +0100
-@@ -23431,7 +23431,7 @@
+@@ -25367,7 +25367,7 @@
  
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
@@ -23,10 +25,10 @@ diff -durN openldap-2.4.40.orig/configure openldap-2.4.40/configure
 +		test "$ol_link_tls" = "yes" ; then
  		ol_with_mp=bignum
  
- $as_echo "#define USE_MP_BIGNUM 1" >>confdefs.h
+ printf "%s\n" "#define USE_MP_BIGNUM 1" >>confdefs.h
 --- openldap-2.5.15.orig/configure.ac	2023-10-23 11:03:46.292215101 +0200
 +++ openldap-2.5.16/configure.ac	2023-10-23 11:05:07.245355497 +0200
-@@ -2323,7 +2323,7 @@
+@@ -2327,7 +2327,7 @@
  	AC_CHECK_HEADERS(openssl/crypto.h)
  	if test "$ac_cv_header_openssl_bn_h" = "yes" &&
  		test "$ac_cv_header_openssl_crypto_h" = "yes" &&
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index 69c3e978b1..de2fee536f 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,5 +1,5 @@
 # Verified by locally checking against the SHA3-512 hash available in
-# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.5.19.sha3-512
+# https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.13.sha3-512
 # Locally computed
-sha256  56e2936c7169aa7547cfc93d5c87db46aa05e98dee6321590c3ada92e1fbb66c  openldap-2.5.19.tgz
+sha256  d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656  openldap-2.6.13.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index da67562a40..6d30a22f54 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.5.19
+OPENLDAP_VERSION = 2.6.13
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
