Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6CAC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A2B60FDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4A2B60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4D4F40245;
	Sun, 17 Oct 2021 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3poowCNTPTCZ; Sun, 17 Oct 2021 20:03:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8ABA401ED;
	Sun, 17 Oct 2021 20:03:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1237D1BF59C
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01E8E401ED
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbNILwA0q2N5 for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:03:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56929401E2
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634501022;
 bh=9q0z9yBZ/prA5obr+Z/CSDqn3s5XCTzfgmE0tOqiXrQ=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=Ma1HTqC9eRMIpEyPQCfIJ9so3IIJ7cV/NWyaipI1dQ6hLpN2nwys+soFmd7XLDU57
 jvwCsSZ3F4Tuppn6oYIbUDOveO2EFK11u4O4ULGy3TQYl8l0KRl4k22XJVIiXJye1z
 dadMy+KRs7FWPFJnN/u9Mp3kU947dA19doEcWDJs=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.59]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSbx3-1m9zE702xN-00T0BN
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 22:03:42 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 22:03:41 +0200
Message-Id: <20211017200341.20867-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:SzUivW6OjBJnb0OAJLWdn+fJQ5Y7iWNBkUMpD9ru9iLsaKxlTmx
 v2HF64ET4aX3utGPqCoQN1VpECMPaBnOPYAoJYD866jqYFbfaTA5fSm+GbNlBPqIXsk5jUe
 TvFD6ytBCRGgRfbTQKbo5xjYcGhmpY5B3uKw06u6Y5xunLy/fZi6axPwHx1UCg0q+IC5p3I
 lEgucUHzYd//YpI2ZUzFQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eNWojBaw040=:WS97nZ8xhXov7XssJNkvMT
 3QC6ULw2l3f0DtUE2IoqGDp14dq2UVksbHS0db4oeNxoA+zbU120vMGpWQdprjN+y3Q5BngCp
 yagZ0BR6ek9MeICc1D8dqLuHM2+x5EMCgM5k+zTZ7eWxhHJ6q1pBg8VltLKrH/9v4dvf5jPwZ
 UzlhyzKyyD77UuMvLDSD1dPZI6AYtduNo9lSFoq7W4bfqv7itSodh4Dqga/qpL88kEWlFtot+
 YCByR1agFgwMXx1PYQBUXmlkPCxbQBE3jnLI2P5wbRB60vvFNDn4OcyC/uI7KbzumHqc6zIVn
 6owjOzVzwgMUp6Mlj+CVA8e1/c5dSrZrPM9rB7KayXtOrubD7ySAtav7feqfryLfcuC02LtH6
 qEN76h091+QgRcwgMLBUGyPMjXaLNqX1ROI6k04nFm1H8kb9l5JguyZFZTIgfMZhRLmiW3m2U
 kQnRvKuEV3b6cq/7F938kuh+h+xRP4ARJ9yeulNVzZDG1kXHlrVApmw+SGOPU12o5t0RpOx3U
 NsodFsSpdmq7lM2ZekubUcCkydDFLpm9eM62kNe37Z5/nyd4drGy0Z56AOtrMz2nWczlHtTgf
 9Jv71qPL+nH/ZbbgMMRWiIrrnSKoQgjHIFUXtYGpxgSg/E8ZL6KdvQ6pz0sxUEev/vxdBKUf3
 u6BLW0Xg2XuDnQQ+Uw/RvZhZb7rTNX8EdoV1qH6FW7L3CRM2K1wBVTzQ94DpCP1D7Mev55e4S
 N77gkX9xqSXUDh4quVK90StDwVLriDIkQmH/kDT7mqb6aJ4ZHj2IokCMjTDIf7hVDaNImW2Za
 RgvGMmLshrh4BqmPG1c4BOnbbCa/mKLcaqnl2XrMpR/FtTd/Tqge30tr22lqE7bRbkOJfRhgu
 mKbxBpt4Csb29l2tYbMr6QYSdW7+qrmAIcKQT3VMf6rrWA18B2/8rlhmropbA2uM8t9e27w4D
 bH2Ukobhz+arDF5VADliMQll7us9Khfol5mK7WVmm3VlwdKb56ir+6Rvy/N5KVm+aVp/jhd+i
 B7hGkWynWSDWv3vZHDRAAFfEjAXU/IVZi9QcwryVNUPgt9rr9BMjB/PBDQ8ZbTXP3kWkj8b6f
 QA6aiVhQIEiPaU=
Subject: [Buildroot] [PATCH v1] package/gnupg2: bump version to 2.2.32
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- removed 0001-dirmngr-Fix-build-with--disable-ldap.patch
  (from upstream [1])

- fix/update signature check key hash

For details (since 2.2.28) see [2], [3], [4] and [5].

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142
[2] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000461.html
[3] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000463.html
[4] https://lists.gnupg.org/pipermail/gnupg-announce/2021q3/000464.html
[5] https://lists.gnupg.org/pipermail/gnupg-announce/2021q4/000465.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Notes:

  - signature check key hash: do not know where the original one comes from,
    not mentioned on the GnuPG signature key web site [6], opposed to the
    new one referenced as:

	pub   ed25519 2020-08-24 [SC] [expires: 2030-06-30]
	      6DAA 6E64 A76D 2840 571B  4902 5288 97B8 2640 3ADA
	uid   Werner Koch (dist signing 2020)

    The old one is used in the following location in buildroot

	$ git grep D8692123C4065DEA5E0F3AB5249B39D24F25E3B6 | cat
	package/libassuan/libassuan.hash:# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
	package/libgpg-error/libgpg-error.hash:# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
	package/libgpgme/libgpgme.hash:# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
	package/libnpth/libnpth.hash:# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6

   Doing the signature check on the last old version:

	$ wget https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.28.tar.bz2.sig
	$ gpg --verify gnupg-2.2.28.tar.bz2.sig gnupg-2.2.28.tar.bz2
	gpg: Signature made Do 10 Jun 2021 19:28:12 CEST
	gpg:                using EDDSA key 6DAA6E64A76D2840571B4902528897B826403ADA
	gpg: Can't check signature: No public key

   But googeling the old key gives some evidence it is an old one:

	https://lists.gnupg.org/pipermail/gnupg-users/2016-December/057354.html

	2048R/4F25E3B6 2011-01-12 [expires: 2019-12-31]
	Key fingerprint = D869 2123 C406 5DEA 5E0F  3AB5 249B 39D2 4F25 E3B6
	Werner Koch (dist sig)

    And the old key is known to keyserver.ubuntu.com:

	$ gpg --keyserver keyserver.ubuntu.com --recv-keys D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
	gpg: key 249B39D24F25E3B6: public key "Werner Koch (dist sig)" imported
	gpg: Total number processed: 1
	gpg:               imported: 1

    As is the new one:

	$ gpg --keyserver keyserver.ubuntu.com --recv-keys 6DAA6E64A76D2840571B4902528897B826403ADA
	gpg: key 528897B826403ADA: public key "Werner Koch (dist signing 2020)" imported
	gpg: Total number processed: 1
	gpg:               imported: 1

    With expiration dates (different from the one mentioned above):

	pub   rsa2048 2011-01-12 [SC] [expires: 2021-12-31]
	      D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
	uid           [ unknown] Werner Koch (dist sig)

	pub   ed25519 2020-08-24 [SC] [expires: 2030-06-30]
	      6DAA6E64A76D2840571B4902528897B826403ADA
	uid           [ unknown] Werner Koch (dist signing 2020)

[6] https://gnupg.org/signature_key.html
---
 ...dirmngr-Fix-build-with--disable-ldap.patch | 43 -------------------
 package/gnupg2/gnupg2.hash                    |  8 ++--
 package/gnupg2/gnupg2.mk                      |  2 +-
 3 files changed, 5 insertions(+), 48 deletions(-)
 delete mode 100644 package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch

diff --git a/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch b/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch
deleted file mode 100644
index fbdd7fa4a7..0000000000
--- a/package/gnupg2/0001-dirmngr-Fix-build-with--disable-ldap.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From c6900f5723b4edc899aaea267ed599b5ad724142 Mon Sep 17 00:00:00 2001
-From: NIIBE Yutaka <gniibe@fsij.org>
-Date: Fri, 11 Jun 2021 10:30:02 +0900
-Subject: [PATCH] dirmngr: Fix build with --disable-ldap.
-
-* dirmngr/dirmngr.c (parse_rereadable_options) [USE_LDAP]:
-Conditionalize.
-
---
-
-Reported-by: Phil Pennock
-Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
-(cherry picked from commit c8b2162c0e7eb42b74811b7ed225fa0f56be4083)
-[Retrieved from:
-https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=commit;h=c6900f5723b4edc899aaea267ed599b5ad724142]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- dirmngr/dirmngr.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/dirmngr/dirmngr.c b/dirmngr/dirmngr.c
-index 915e0e601..330983f3f 100644
---- a/dirmngr/dirmngr.c
-+++ b/dirmngr/dirmngr.c
-@@ -770,6 +770,7 @@ parse_rereadable_options (gpgrt_argparse_t *pargs, int reread)
-     case oRecursiveResolver: enable_recursive_resolver (1); break;
- 
-     case oLDAPServer:
-+#if USE_LDAP
-       {
-         ldap_server_t server;
-         char *p;
-@@ -791,6 +792,7 @@ parse_rereadable_options (gpgrt_argparse_t *pargs, int reread)
-             opt.ldapservers = server;
-           }
-       }
-+#endif
-       break;
- 
-     case oKeyServer:
--- 
-2.11.0
-
diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
index 023ec9bb1e..caf5dcc883 100644
--- a/package/gnupg2/gnupg2.hash
+++ b/package/gnupg2/gnupg2.hash
@@ -1,7 +1,7 @@
 # From https://lists.gnupg.org/pipermail/gnupg-announce/2021q2/000460.html
-sha1  5f92b7b32d594cf21ea2b48cdaa2e460daccd6e3 gnupg-2.2.28.tar.bz2
+sha1  81684626720c91060ae9920936c768df9fc8b2f6  gnupg-2.2.32.tar.bz2
 # Calculated based on the hash above and signature
-# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.28.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  6ff891fc7583a9c3fb9f097ee0d1de0a12469d4b53997e7ba5064950637dfaec  gnupg-2.2.28.tar.bz2
+# https://gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.32.tar.bz2.sig
+# using key 6DAA6E64A76D2840571B4902528897B826403ADA
+sha256  b2571b35f82c63e7d278aa6a1add0d73453dc14d3f0854be490c844fca7e0614  gnupg-2.2.32.tar.bz2
 sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 6bd957683b..32c22b8257 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPG2_VERSION = 2.2.28
+GNUPG2_VERSION = 2.2.32
 GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
 GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
 GNUPG2_LICENSE = GPL-3.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
