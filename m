Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F5C5CFDB
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 977B840D06;
	Fri, 14 Aug 2026 13:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v0BSjRC3k-lH; Fri, 14 Aug 2026 13:20:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86DFB40CEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713607;
	bh=Crgb/3MATzm3T9L0K+VVZSt/ruDuTnjK8HP8D1oRmmA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lMLwzJJN8XzbX6b/0VpotN+ctSQwm3CJo0wHqFgnpSiwiu5+74wzOhD4NyNmcv7yF
	 fiY9yW5d8pVPWgahtTv65OQl37Khxp/BH1/Ll+Fa6aAGlJ+0m0KXSKeQkfc3tAE3Bx
	 tb7+CZoKHIfROfDokNnZUS+noSrAFMj7R7yABj2/JET2+Ai3Md2byPzis8T6co9UEu
	 eomINDgdgl3l9cn88YMOqbsJHhZLiXXdIdrV9gdAfutzkMfKPfr/9o3T3/8h+/KMHE
	 zcv6zdvlsD0Ybs5qeJbEILZVS5f13jptRfiLvHf0rk2ijXOMMN3X1wpXOAc0BhZjEu
	 zFc02ewNZ9ing==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86DFB40CEC;
	Fri, 14 Aug 2026 13:20:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9522323F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B0FD40C39
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAH24BnKL10C for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAEA7409DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAEA7409DB
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF9338D66A; Fri, 14 Aug 2026 13:18:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:44:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4cc800effef9297f90c8bd845c7777cd99789157
X-Git-Newrev: 62afdce87f394548dbc5d12c96360a16d6e0e1ae
X-Patchwork-Hint: ignore
Message-Id: <20260814131856.AF9338D66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgcrypt:
 upstream patch for CVE-2026-41989
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/62afdce87f394548dbc5d12c96360a16d6e0e1ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This commit patches the following vulnerability:

- CVE-2026-41989:
    Libgcrypt before 1.12.2 sometimes allows a heap-based buffer overflow
    and denial of service via crafted ECDH ciphertext to gcry_pk_decrypt.
    https://www.cve.org/CVERecord?id=CVE-2026-41989

This has already been addressed on the master branch by the package bump
[1].

[1] 93f486ac56 package/libgcrypt: bump version to 1.12.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libgcrypt/0002-CVE-2026-41989.patch | 40 +++++++++++++++++++++++++++++
 package/libgcrypt/libgcrypt.mk              |  3 +++
 2 files changed, 43 insertions(+)

diff --git a/package/libgcrypt/0002-CVE-2026-41989.patch b/package/libgcrypt/0002-CVE-2026-41989.patch
new file mode 100644
index 0000000000..b93247ecdb
--- /dev/null
+++ b/package/libgcrypt/0002-CVE-2026-41989.patch
@@ -0,0 +1,40 @@
+From 2d3d732c9bf87cc10729f69678dd9e6862f99fa3 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 10 Apr 2026 16:58:57 +0900
+Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
+
+* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
+mistake and add updating RAWMPILEN.
+
+CVE: CVE-2026-41989
+Upstream: https://github.com/gpg/libgcrypt/commit/2d3d732c9bf87cc10729f69678dd9e6862f99fa3
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+GnuPG-bug-id: 8211
+Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
+Suggested-by: Bronson Yen <bronson@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+---
+ cipher/ecc-misc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
+index 615b0df2d..ab3799dcb 100644
+--- a/cipher/ecc-misc.c
++++ b/cipher/ecc-misc.c
+@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t ec, mpi_point_t result)
+         *--p = *buf++;
+ 
+       if (rawmpilen < nbytes)
+-        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
++        {
++          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
++          rawmpilen = nbytes;
++        }
+     }
+   else
+     {
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5f56e40ac2..babce3c264 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -14,6 +14,9 @@ LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 LIBGCRYPT_CPE_ID_VENDOR = gnupg
 
+# 0002-CVE-2026-41989.patch
+LIBGCRYPT_IGNORE_CVES += CVE-2026-41989
+
 # Patching configure.ac and Makefile.am in 0001
 LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
