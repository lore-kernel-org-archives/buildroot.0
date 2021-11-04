Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADC9C433FE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:34:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00E9660E90
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 12:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00E9660E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C535D400F3;
	Thu,  4 Nov 2021 12:34:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PH08v8TvpHf1; Thu,  4 Nov 2021 12:34:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7383403B7;
	Thu,  4 Nov 2021 12:34:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4861BF25F
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EEB8C4058D
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 12:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8BlwDi71RxY for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 12:34:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41CEA40260
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 12:34:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1ED968A575; Thu,  4 Nov 2021 12:30:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 Nov 2021 13:31:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee2311687b8946a11c5ca652162f859f914f1fd6
X-Git-Newrev: 47fa16dffa6c6a72b2f76984f6d492f4f352a52b
X-Patchwork-Hint: ignore
Message-Id: <20211104123055.1ED968A575@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: security bump to version
 2.18.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=47fa16dffa6c6a72b2f76984f6d492f4f352a52b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix a low risk OAEP decryption side channel (GH #2797)
- Drop patch (already in version)

https://github.com/randombit/botan/blob/2.18.2/news.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Avoid-using-short-exponents-with-ElGamal.patch | 38 ----------------------
 package/botan/botan.hash                           |  2 +-
 package/botan/botan.mk                             |  5 +--
 3 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch b/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
deleted file mode 100644
index e2570cd5ff..0000000000
--- a/package/botan/0001-Avoid-using-short-exponents-with-ElGamal.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 9a23e4e3bc3966340531f2ff608fa9d33b5185a2 Mon Sep 17 00:00:00 2001
-From: Jack Lloyd <jack@randombit.net>
-Date: Tue, 3 Aug 2021 18:20:29 -0400
-Subject: [PATCH] Avoid using short exponents with ElGamal
-
-Some off-brand PGP implementation generates keys where p - 1 is
-smooth, as a result short exponents can leak enough information about
-k to allow decryption.
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
-[Peter: Drop tests, CVE-2021-40529]
----
- src/lib/pubkey/elgamal/elgamal.cpp        |  8 +++-
- 1 file changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/src/lib/pubkey/elgamal/elgamal.cpp b/src/lib/pubkey/elgamal/elgamal.cpp
-index b3ec6df2c..0e33c2ca5 100644
---- a/src/lib/pubkey/elgamal/elgamal.cpp
-+++ b/src/lib/pubkey/elgamal/elgamal.cpp
-@@ -113,8 +113,12 @@ ElGamal_Encryption_Operation::raw_encrypt(const uint8_t msg[], size_t msg_len,
-    if(m >= m_group.get_p())
-       throw Invalid_Argument("ElGamal encryption: Input is too large");
- 
--   const size_t k_bits = m_group.exponent_bits();
--   const BigInt k(rng, k_bits);
-+   /*
-+   Some ElGamal implementations foolishly use prime fields where p - 1 is
-+   smooth, as a result it is unsafe to use short exponents.
-+   */
-+   const size_t k_bits = m_group.p_bits() - 1;
-+   const BigInt k(rng, k_bits, false);
- 
-    const BigInt a = m_group.power_g_p(k, k_bits);
-    const BigInt b = m_group.multiply_mod_p(m, monty_execute(*m_monty_y_p, k, k_bits));
--
--- 
-2.20.1
-
diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index b7804ce9d7..91e1bf741a 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
 # From https://botan.randombit.net/releases/sha256sums.txt
-sha256  f8c7b46222a857168a754a5cc329bb780504122b270018dda5304c98db28ae29  Botan-2.18.1.tar.xz
+sha256  541a3b13f1b9d30f977c6c1ae4c7bfdfda763cda6e44de807369dce79f42307e  Botan-2.18.2.tar.xz
 # Locally computed
 sha256  fb7f0322d36fba55ca17d77bc203a9f09a40daa8a249b75cf8887aba36cec9d0  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 36aca6d93e..ebff1343b1 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-BOTAN_VERSION = 2.18.1
+BOTAN_VERSION = 2.18.2
 BOTAN_SOURCE = Botan-$(BOTAN_VERSION).tar.xz
 BOTAN_SITE = http://botan.randombit.net/releases
 BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VENDOR = botan_project
 
-# 0001-Avoid-using-short-exponents-with-ElGamal.patch
-BOTAN_IGNORE_CVES += CVE-2021-40529
-
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
