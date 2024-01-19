Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99380C4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 15:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ED0C83BE4;
	Fri, 19 Jan 2024 15:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ED0C83BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVlAR209TSyr; Fri, 19 Jan 2024 15:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BDF583CDB;
	Fri, 19 Jan 2024 15:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDF583CDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 731DA1BF47A
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 15:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 584F34225E
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 15:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584F34225E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J69oePRWFF6q for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 15:09:57 +0000 (UTC)
X-Greylist: delayed 370 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 19 Jan 2024 15:09:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FDA742257
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FDA742257
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 15:09:56 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 428FE100008
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 18:03:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 428FE100008
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 18:03:42 +0300 (MSK)
Received: from CAB-WSD-0004828.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 19 Jan 2024 18:03:41 +0300
To: <buildroot@buildroot.org>
Date: Fri, 19 Jan 2024 18:02:44 +0300
Message-ID: <20240119150244.204049-1-mmkurbanov@salutedevices.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 182798 [Jan 19 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, {Tracking_repetitive_subdir_in_url},
 github.com:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 100.64.160.123:7.1.2; smtp.sberdevices.ru:7.1.1,5.0.1; salutedevices.com:7.1.1;
 www.openssl.org:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/01/19 11:57:00
X-KSMG-LinksScanning: Clean, bases: 2024/01/19 11:57:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/01/19 14:04:00 #23304191
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1705676622;
 bh=91YnWMsECKLxDhdke4aE8Zlt0WoIPVxnK357dytTmqs=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=KnwjGGbDCbhV0f/GQhDrlvDv4G9IfMplpiLhIAQ/ZNLra7j4a9Vt5hHe4KYYgtEgf
 RX3vU+zDbyMUzSld1DEqXkmrTnujNYD3+1i19fIbWIzSbdFDwvYiKqBcSY5IOyrf7J
 Ci1r/MQBPEZE1m5S75f92+bO06Zamee9ikUblLMvxKhOEAOYaWVQrkVI9bGF3TEe4L
 rTEKYDVgFQwA0spEyQre7lMQuRhg7BNW74JV2vUW86BgpvE6tQuj9g/heaHWAwgKYY
 Ep92V0ngKjucT4apQjSSQYuPb1nyzb/gJfnz3BRjxbsFhFvC6DDqRFOWneD/pjIZ6t
 AXJuQLMiFcijw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=KnwjGGbD
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add patches fixing
 hangs asn1parse
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
From: Martin Kurbanov via buildroot <buildroot@buildroot.org>
Reply-To: Martin Kurbanov <mmkurbanov@salutedevices.com>
Cc: Martin Kurbanov <mmkurbanov@salutedevices.com>, kernel@salutedevices.com,
 sdfw_system_team@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The asn1parse command hangs forever on 3.2.0 when the genstr or genconf
option is passed.

This commit fixes the issue by adding upstream commits [1] [2].

[1] https://github.com/openssl/openssl/commit/a552c23c6502592c1b3c67d93dd7e5ffbe958aa4
[2] https://github.com/openssl/openssl/commit/749fcc0e3ce796474a15d6fac221e57daeacff1e

Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
---
 ...x-genstr-genconf-option-in-asn1parse.patch |  42 ++++++
 ...en-asn1-oid-loader-to-invalid-inputs.patch | 122 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
 create mode 100644 package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch

diff --git a/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch b/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
new file mode 100644
index 0000000000..14a6aa3af7
--- /dev/null
+++ b/package/libopenssl/0005-Fix-genstr-genconf-option-in-asn1parse.patch
@@ -0,0 +1,42 @@
+From 749fcc0e3ce796474a15d6fac221e57daeacff1e Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Tue, 5 Dec 2023 14:50:01 -0500
+Subject: [PATCH] Fix genstr/genconf option in asn1parse
+
+At some point the asn1parse applet was changed to default the inform to
+PEM, and defalt input file to stdin.  Doing so broke the -genstr|conf options,
+in that, before we attempt to generate an ASN1 block from the provided
+genstr string, we attempt to read a PEM input from stdin.  As a result,
+this command:
+openssl asn1parse -genstr OID:1.2.3.4
+hangs because we are attempting a blocking read on stdin, waiting for
+data that never arrives
+
+Fix it by giving priority to genstr|genconf, such that, if set, will just run
+do_generate on that string and exit
+
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/22957)
+Upstream: https://github.com/openssl/openssl/pull/22957
+Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
+---
+ apps/asn1parse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/apps/asn1parse.c b/apps/asn1parse.c
+index 097b0cc1ed..6597a6180b 100644
+--- a/apps/asn1parse.c
++++ b/apps/asn1parse.c
+@@ -178,7 +178,7 @@ int asn1parse_main(int argc, char **argv)
+ 
+     if ((buf = BUF_MEM_new()) == NULL)
+         goto end;
+-    if (informat == FORMAT_PEM) {
++    if (genstr == NULL && informat == FORMAT_PEM) {
+         if (PEM_read_bio(in, &name, &header, &str, &num) != 1) {
+             BIO_printf(bio_err, "Error reading PEM file\n");
+             ERR_print_errors(bio_err);
+-- 
+2.40.0
+
diff --git a/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch b/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch
new file mode 100644
index 0000000000..1e3e8bc2e3
--- /dev/null
+++ b/package/libopenssl/0006-Harden-asn1-oid-loader-to-invalid-inputs.patch
@@ -0,0 +1,122 @@
+From a552c23c6502592c1b3c67d93dd7e5ffbe958aa4 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@openssl.org>
+Date: Tue, 5 Dec 2023 15:24:20 -0500
+Subject: [PATCH] Harden asn1 oid loader to invalid inputs
+
+In the event that a config file contains this sequence:
+=======
+openssl_conf = openssl_init
+
+config_diagnostics = 1
+
+[openssl_init]
+oid_section = oids
+
+[oids]
+testoid1 = 1.2.3.4.1
+testoid2 = A Very Long OID Name, 1.2.3.4.2
+testoid3 = ,1.2.3.4.3
+======
+
+The leading comma in testoid3 can cause a heap buffer overflow, as the
+parsing code will move the string pointer back 1 character, thereby
+pointing to an invalid memory space
+
+correct the parser to detect this condition and handle it by treating it
+as if the comma doesn't exist (i.e. an empty long oid name)
+
+Reviewed-by: Hugo Landau <hlandau@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/22957)
+Upstream: https://github.com/openssl/openssl/pull/22957
+Signed-off-by: Martin Kurbanov <mmkurbanov@salutedevices.com>
+---
+ apps/asn1parse.c                  |  2 +-
+ crypto/asn1/asn_moid.c            |  4 ++++
+ test/recipes/04-test_asn1_parse.t | 26 ++++++++++++++++++++++++++
+ test/test_asn1_parse.cnf          | 12 ++++++++++++
+ 4 files changed, 43 insertions(+), 1 deletion(-)
+ create mode 100644 test/recipes/04-test_asn1_parse.t
+ create mode 100644 test/test_asn1_parse.cnf
+
+diff --git a/apps/asn1parse.c b/apps/asn1parse.c
+index 6597a6180b..bf62f85947 100644
+--- a/apps/asn1parse.c
++++ b/apps/asn1parse.c
+@@ -178,7 +178,7 @@ int asn1parse_main(int argc, char **argv)
+ 
+     if ((buf = BUF_MEM_new()) == NULL)
+         goto end;
+-    if (genstr == NULL && informat == FORMAT_PEM) {
++    if (genconf == NULL && genstr == NULL && informat == FORMAT_PEM) {
+         if (PEM_read_bio(in, &name, &header, &str, &num) != 1) {
+             BIO_printf(bio_err, "Error reading PEM file\n");
+             ERR_print_errors(bio_err);
+diff --git a/crypto/asn1/asn_moid.c b/crypto/asn1/asn_moid.c
+index 6f816307af..1e183f4f18 100644
+--- a/crypto/asn1/asn_moid.c
++++ b/crypto/asn1/asn_moid.c
+@@ -67,6 +67,10 @@ static int do_create(const char *value, const char *name)
+     if (p == NULL) {
+         ln = name;
+         ostr = value;
++    } else if (p == value) {
++        /* we started with a leading comma */
++        ln = name;
++        ostr = p + 1;
+     } else {
+         ln = value;
+         ostr = p + 1;
+diff --git a/test/recipes/04-test_asn1_parse.t b/test/recipes/04-test_asn1_parse.t
+new file mode 100644
+index 0000000000..f3af436592
+--- /dev/null
++++ b/test/recipes/04-test_asn1_parse.t
+@@ -0,0 +1,26 @@
++#! /usr/bin/env perl
++# Copyright 2023 The OpenSSL Project Authors. All Rights Reserved.
++#
++# Licensed under the Apache License 2.0 (the "License").  You may not use
++# this file except in compliance with the License.  You can obtain a copy
++# in the file LICENSE in the source distribution or at
++# https://www.openssl.org/source/license.html
++
++use strict;
++use OpenSSL::Test qw(:DEFAULT srctop_file);
++use OpenSSL::Test::Utils;
++
++setup("test_asn1_parse");
++
++plan tests => 3;
++
++$ENV{OPENSSL_CONF} = srctop_file("test", "test_asn1_parse.cnf");
++
++ok(run(app(([ 'openssl', 'asn1parse',
++              '-genstr', 'OID:1.2.3.4.1']))));
++
++ok(run(app(([ 'openssl', 'asn1parse',
++              '-genstr', 'OID:1.2.3.4.2']))));
++
++ok(run(app(([ 'openssl', 'asn1parse',
++              '-genstr', 'OID:1.2.3.4.3']))));
+diff --git a/test/test_asn1_parse.cnf b/test/test_asn1_parse.cnf
+new file mode 100644
+index 0000000000..5f0305657e
+--- /dev/null
++++ b/test/test_asn1_parse.cnf
+@@ -0,0 +1,12 @@
++openssl_conf = openssl_init
++
++# Comment out the next line to ignore configuration errors
++config_diagnostics = 1
++
++[openssl_init]
++oid_section = oids
++
++[oids]
++testoid1 = 1.2.3.4.1
++testoid2 = A Very Long OID Name, 1.2.3.4.2
++testoid3 = ,1.2.3.4.3
+-- 
+2.40.0
+
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
