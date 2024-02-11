Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD499C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72017850F9;
	Sun, 11 Feb 2024 21:43:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CH9LBOoYfxDy; Sun, 11 Feb 2024 21:43:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178F8850C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 178F8850C1;
	Sun, 11 Feb 2024 21:43:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 85EF11BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 732EE60ED8
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:43:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RS2JslemdES6 for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:43:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD1460EA5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD1460EA5
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:43:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E9E8A877CD; Sun, 11 Feb 2024 21:43:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:43:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16eec251427b3075d68ea43d7f1395567e2effe4
X-Git-Newrev: ce4d278739953c830cea0c017836f26ceabef63a
X-Patchwork-Hint: ignore
Message-Id: <20240211214348.E9E8A877CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: security bump to
 version 3.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce4d278739953c830cea0c017836f26ceabef63a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And drop the now upstreamed patches.

Fixes the following (low severity) issues:

- CVE-2023-6129 POLY1305 MAC implementation corrupts vector registers on
  PowerPC
  https://www.openssl.org/news/secadv/20240109.txt

- CVE-2023-6237 Excessive time spent checking invalid RSA public keys
  https://www.openssl.org/news/secadv/20240115.txt

- CVE-2024-0727 PKCS12 Decoding crashes
  https://www.openssl.org/news/secadv/20240125.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...cv-Fix-mispelling-of-extension-test-macro.patch |  30 -----
 ...05-Fix-genstr-genconf-option-in-asn1parse.patch |  42 -------
 ...-Harden-asn1-oid-loader-to-invalid-inputs.patch | 122 ---------------------
 package/libopenssl/libopenssl.hash                 |   4 +-
 package/libopenssl/libopenssl.mk                   |   2 +-
 5 files changed, 3 insertions(+), 197 deletions(-)

diff --git a/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch b/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
deleted file mode 100644
index 93b191a61c..0000000000
--- a/package/libopenssl/0004-riscv-Fix-mispelling-of-extension-test-macro.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 68c549df05892c16b99603b9a831c79c540f268c Mon Sep 17 00:00:00 2001
-From: Grant Nichol <me@grantnichol.com>
-Date: Fri, 22 Dec 2023 23:46:39 -0600
-Subject: [PATCH] riscv: Fix mispelling of extension test macro
-
-When refactoring the riscv extension test macros,
-RISCV_HAS_ZKND_AND_ZKNE was mispelled.
-
-Upstream: https://github.com/openssl/openssl/pull/23139
-Signed-off-by: Grant Nichol <me@grantnichol.com>
----
- providers/implementations/ciphers/cipher_aes_xts_hw.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/providers/implementations/ciphers/cipher_aes_xts_hw.c b/providers/implementations/ciphers/cipher_aes_xts_hw.c
-index b35b71020e..65adc47d1f 100644
---- a/providers/implementations/ciphers/cipher_aes_xts_hw.c
-+++ b/providers/implementations/ciphers/cipher_aes_xts_hw.c
-@@ -285,7 +285,7 @@ static const PROV_CIPHER_HW aes_xts_rv32i_zbkb_zknd_zkne = {                   \
- # define PROV_CIPHER_HW_select_xts()                                           \
- if (RISCV_HAS_ZBKB_AND_ZKND_AND_ZKNE())                                        \
-     return &aes_xts_rv32i_zbkb_zknd_zkne;                                      \
--if (RISCV_HAS_ZKND_ZKNE())                                                     \
-+if (RISCV_HAS_ZKND_AND_ZKNE())                                                     \
-     return &aes_xts_rv32i_zknd_zkne;
- # else
- /* The generic case */
---
-2.43.0
-
diff --git a/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch b/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
deleted file mode 100644
index 9fa36d83be..0000000000
--- a/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 749fcc0e3ce796474a15d6fac221e57daeacff1e Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@openssl.org>
-Date: Tue, 5 Dec 2023 14:50:01 -0500
-Subject: [PATCH] Fix genstr/genconf option in asn1parse
-
-At some point the asn1parse applet was changed to default the inform to
-PEM, and defalt input file to stdin.  Doing so broke the -genstr|conf options,
-in that, before we attempt to generate an ASN1 block from the provided
-genstr string, we attempt to read a PEM input from stdin.  As a result,
-this command:
-openssl asn1parse -genstr OID:1.2.3.4
-hangs because we are attempting a blocking read on stdin, waiting for
-data that never arrives
-
-Fix it by giving priority to genstr|genconf, such that, if set, will just run
-do_generate on that string and exit
-
-Reviewed-by: Hugo Landau <hlandau@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/22957)
-Upstream: https://github.com/openssl/openssl/commit/749fcc0e3ce796474a15d6fac221e57daeacff1e
-Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
----
- apps/asn1parse.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/apps/asn1parse.c b/apps/asn1parse.c
-index 097b0cc1ed..6597a6180b 100644
---- a/apps/asn1parse.c
-+++ b/apps/asn1parse.c
-@@ -178,7 +178,7 @@ int asn1parse_main(int argc, char **argv)
- 
-     if ((buf = BUF_MEM_new()) == NULL)
-         goto end;
--    if (informat == FORMAT_PEM) {
-+    if (genstr == NULL && informat == FORMAT_PEM) {
-         if (PEM_read_bio(in, &name, &header, &str, &num) != 1) {
-             BIO_printf(bio_err, "Error reading PEM file\n");
-             ERR_print_errors(bio_err);
--- 
-2.40.0
-
diff --git a/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch b/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch
deleted file mode 100644
index 299ecbc2ed..0000000000
--- a/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-From a552c23c6502592c1b3c67d93dd7e5ffbe958aa4 Mon Sep 17 00:00:00 2001
-From: Neil Horman <nhorman@openssl.org>
-Date: Tue, 5 Dec 2023 15:24:20 -0500
-Subject: [PATCH] Harden asn1 oid loader to invalid inputs
-
-In the event that a config file contains this sequence:
-=======
-openssl_conf = openssl_init
-
-config_diagnostics = 1
-
-[openssl_init]
-oid_section = oids
-
-[oids]
-testoid1 = 1.2.3.4.1
-testoid2 = A Very Long OID Name, 1.2.3.4.2
-testoid3 = ,1.2.3.4.3
-======
-
-The leading comma in testoid3 can cause a heap buffer overflow, as the
-parsing code will move the string pointer back 1 character, thereby
-pointing to an invalid memory space
-
-correct the parser to detect this condition and handle it by treating it
-as if the comma doesn't exist (i.e. an empty long oid name)
-
-Reviewed-by: Hugo Landau <hlandau@openssl.org>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/22957)
-Upstream: https://github.com/openssl/openssl/commit/a552c23c6502592c1b3c67d93dd7e5ffbe958aa4
-Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
----
- apps/asn1parse.c                  |  2 +-
- crypto/asn1/asn_moid.c            |  4 ++++
- test/recipes/04-test_asn1_parse.t | 26 ++++++++++++++++++++++++++
- test/test_asn1_parse.cnf          | 12 ++++++++++++
- 4 files changed, 43 insertions(+), 1 deletion(-)
- create mode 100644 test/recipes/04-test_asn1_parse.t
- create mode 100644 test/test_asn1_parse.cnf
-
-diff --git a/apps/asn1parse.c b/apps/asn1parse.c
-index 6597a6180b..bf62f85947 100644
---- a/apps/asn1parse.c
-+++ b/apps/asn1parse.c
-@@ -178,7 +178,7 @@ int asn1parse_main(int argc, char **argv)
- 
-     if ((buf = BUF_MEM_new()) == NULL)
-         goto end;
--    if (genstr == NULL && informat == FORMAT_PEM) {
-+    if (genconf == NULL && genstr == NULL && informat == FORMAT_PEM) {
-         if (PEM_read_bio(in, &name, &header, &str, &num) != 1) {
-             BIO_printf(bio_err, "Error reading PEM file\n");
-             ERR_print_errors(bio_err);
-diff --git a/crypto/asn1/asn_moid.c b/crypto/asn1/asn_moid.c
-index 6f816307af..1e183f4f18 100644
---- a/crypto/asn1/asn_moid.c
-+++ b/crypto/asn1/asn_moid.c
-@@ -67,6 +67,10 @@ static int do_create(const char *value, const char *name)
-     if (p == NULL) {
-         ln = name;
-         ostr = value;
-+    } else if (p == value) {
-+        /* we started with a leading comma */
-+        ln = name;
-+        ostr = p + 1;
-     } else {
-         ln = value;
-         ostr = p + 1;
-diff --git a/test/recipes/04-test_asn1_parse.t b/test/recipes/04-test_asn1_parse.t
-new file mode 100644
-index 0000000000..f3af436592
---- /dev/null
-+++ b/test/recipes/04-test_asn1_parse.t
-@@ -0,0 +1,26 @@
-+#! /usr/bin/env perl
-+# Copyright 2023 The OpenSSL Project Authors. All Rights Reserved.
-+#
-+# Licensed under the Apache License 2.0 (the "License").  You may not use
-+# this file except in compliance with the License.  You can obtain a copy
-+# in the file LICENSE in the source distribution or at
-+# https://www.openssl.org/source/license.html
-+
-+use strict;
-+use OpenSSL::Test qw(:DEFAULT srctop_file);
-+use OpenSSL::Test::Utils;
-+
-+setup("test_asn1_parse");
-+
-+plan tests => 3;
-+
-+$ENV{OPENSSL_CONF} = srctop_file("test", "test_asn1_parse.cnf");
-+
-+ok(run(app(([ 'openssl', 'asn1parse',
-+              '-genstr', 'OID:1.2.3.4.1']))));
-+
-+ok(run(app(([ 'openssl', 'asn1parse',
-+              '-genstr', 'OID:1.2.3.4.2']))));
-+
-+ok(run(app(([ 'openssl', 'asn1parse',
-+              '-genstr', 'OID:1.2.3.4.3']))));
-diff --git a/test/test_asn1_parse.cnf b/test/test_asn1_parse.cnf
-new file mode 100644
-index 0000000000..5f0305657e
---- /dev/null
-+++ b/test/test_asn1_parse.cnf
-@@ -0,0 +1,12 @@
-+openssl_conf = openssl_init
-+
-+# Comment out the next line to ignore configuration errors
-+config_diagnostics = 1
-+
-+[openssl_init]
-+oid_section = oids
-+
-+[oids]
-+testoid1 = 1.2.3.4.1
-+testoid2 = A Very Long OID Name, 1.2.3.4.2
-+testoid3 = ,1.2.3.4.3
--- 
-2.40.0
-
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 9e09e12461..841d4b4cfd 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://www.openssl.org/source/openssl-3.2.0.tar.gz.sha256
-sha256  14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e  openssl-3.2.0.tar.gz
+# From https://www.openssl.org/source/openssl-3.2.1.tar.gz.sha256
+sha256  83c7329fe52c850677d75e5d0b0ca245309b97e8ecbcfdc1dfdc4ab9fac35b39  openssl-3.2.1.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 7dc6d93256..feb5026c02 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.2.0
+LIBOPENSSL_VERSION = 3.2.1
 LIBOPENSSL_SITE = https://www.openssl.org/source
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
