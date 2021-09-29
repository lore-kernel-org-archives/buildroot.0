Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285A3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 18:11:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705CA61555
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 18:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 705CA61555
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 414B44071F;
	Wed, 29 Sep 2021 18:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2YtB65VGvLn; Wed, 29 Sep 2021 18:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4503940724;
	Wed, 29 Sep 2021 18:10:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 862641BF842
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 18:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 760A7421DA
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 18:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3EGZiXMTLgsU for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 18:10:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8B3741973
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 18:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 712088D584; Wed, 29 Sep 2021 18:08:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 29 Sep 2021 19:19:54 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: dd9a110c0b78e19ef7b8d8ad9cb39c452a492613
X-Git-Newrev: 9f3d6453f92eb49d5de04406b5429a0d43bfaeb0
X-Patchwork-Hint: ignore
Message-Id: <20210929180824.712088D584@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/botan: add
 upstream security fix for CVE-2021-40529
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f3d6453f92eb49d5de04406b5429a0d43bfaeb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fixes the following security issue:

- CVE-2021-40529: The ElGamal implementation in Botan through 2.18.1, as
  used in Thunderbird and other products, allows plaintext recovery because,
  during interaction between two cryptographic libraries, a certain
  dangerous combination of the prime defined by the receiver's public key,
  the generator defined by the receiver's public key, and the sender's
  ephemeral exponents can lead to a cross-configuration attack against
  OpenPGP

For more details, see the upstream bug and issue writeup:
- https://github.com/randombit/botan/pull/2790
- https://ibm.github.io/system-security-research-updates/2021/07/20/insecurity-elgamal-pt1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 31c94080d26ed97561f1418198a2716caab0cdb3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-Avoid-using-short-exponents-with-ElGamal.patch | 38 ++++++++++++++++++++++
 package/botan/botan.mk                             |  3 ++
 2 files changed, 41 insertions(+)

diff --git a/package/botan/0004-Avoid-using-short-exponents-with-ElGamal.patch b/package/botan/0004-Avoid-using-short-exponents-with-ElGamal.patch
new file mode 100644
index 0000000000..e2570cd5ff
--- /dev/null
+++ b/package/botan/0004-Avoid-using-short-exponents-with-ElGamal.patch
@@ -0,0 +1,38 @@
+From 9a23e4e3bc3966340531f2ff608fa9d33b5185a2 Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Tue, 3 Aug 2021 18:20:29 -0400
+Subject: [PATCH] Avoid using short exponents with ElGamal
+
+Some off-brand PGP implementation generates keys where p - 1 is
+smooth, as a result short exponents can leak enough information about
+k to allow decryption.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+[Peter: Drop tests, CVE-2021-40529]
+---
+ src/lib/pubkey/elgamal/elgamal.cpp        |  8 +++-
+ 1 file changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/src/lib/pubkey/elgamal/elgamal.cpp b/src/lib/pubkey/elgamal/elgamal.cpp
+index b3ec6df2c..0e33c2ca5 100644
+--- a/src/lib/pubkey/elgamal/elgamal.cpp
++++ b/src/lib/pubkey/elgamal/elgamal.cpp
+@@ -113,8 +113,12 @@ ElGamal_Encryption_Operation::raw_encrypt(const uint8_t msg[], size_t msg_len,
+    if(m >= m_group.get_p())
+       throw Invalid_Argument("ElGamal encryption: Input is too large");
+ 
+-   const size_t k_bits = m_group.exponent_bits();
+-   const BigInt k(rng, k_bits);
++   /*
++   Some ElGamal implementations foolishly use prime fields where p - 1 is
++   smooth, as a result it is unsafe to use short exponents.
++   */
++   const size_t k_bits = m_group.p_bits() - 1;
++   const BigInt k(rng, k_bits, false);
+ 
+    const BigInt a = m_group.power_g_p(k, k_bits);
+    const BigInt b = m_group.multiply_mod_p(m, monty_execute(*m_monty_y_p, k, k_bits));
+-
+-- 
+2.20.1
+
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 2e3f99b49b..802dab9e30 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -11,6 +11,9 @@ BOTAN_LICENSE = BSD-2-Clause
 BOTAN_LICENSE_FILES = license.txt
 BOTAN_CPE_ID_VENDOR = botan_project
 
+# 0001-Avoid-using-short-exponents-with-ElGamal.patch
+BOTAN_IGNORE_CVES += CVE-2021-40529
+
 BOTAN_INSTALL_STAGING = YES
 
 BOTAN_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
