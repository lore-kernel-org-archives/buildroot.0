Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0144D6A22D
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 21:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53AA8407CD;
	Thu, 14 Nov 2024 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPBnJACwE7zo; Thu, 14 Nov 2024 21:10:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDD56406FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD56406FB;
	Thu, 14 Nov 2024 21:10:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADB1F1ED5
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96D4A40263
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5o9bmKbniPD for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 21:10:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3461540277
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3461540277
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3461540277
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 21:10:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E76D2B00565;
 Thu, 14 Nov 2024 22:09:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Julien Olivain <ju.o@free.fr>
Date: Thu, 14 Nov 2024 22:09:52 +0100
Message-ID: <20241114210952.61365-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731618600;
 bh=K7XmiL1m5lfnVeOyVQujNQGaP+R9TV5Sng7fQS5Th2E=;
 h=From:To:Cc:Subject:Date:From;
 b=aZ62/Dd5KEThiZJzpHhSLHEWJ1KpoWypfoVP72tZ5JYL8E+2CzTfrxynlFhyN+a69
 eYCfk7xukqm8NqSLY5R2h7xwOPJW+KUmR0EJ/6gca0ZRVBF5h1dTUDnwDdyxfEiCkX
 vhh2FSEsKe1Aiy57heYEV4efI7ssNqSDAORfRXfjepf15JepKgEbU7HrpBRib/kar8
 Lmtadbr/tHBLBA3PzvHIYY+ijOYe5gXHJATQ79Npz6TFjVaLotGcKCSIGzab2Nl94l
 HsxC1gHqFX4nzXjD4/R2JIcB0i2UJ0bT2uMe8GfHGUQruRHnnwvameNMEiPhmLRrQj
 ccI/iTS+Ss+4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aZ62/Dd5
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: security bump to version
 1.21.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For the change log, see [1].

The license hash file changed, due to the year update. See [2].
This commit also adds a comment in the hash file the pgp signature file
source and key id used for the verification.

Fixes:
- https://nvd.nist.gov/vuln/detail/CVE-2024-37370
- https://nvd.nist.gov/vuln/detail/CVE-2024-37371

[1] https://web.mit.edu/kerberos/www/krb5-1.21/
[2] https://github.com/krb5/krb5/commit/fec2c44ee93bfd3282bed99509a941d56a6e2c21

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested (compilation only) in:
https://gitlab.com/jolivain/buildroot/-/pipelines/1543592409
---
 package/libkrb5/libkrb5.hash | 6 ++++--
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index 02c0e3396e..0403b3aed0 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,7 @@
 # Locally calculated after checking pgp signature
-sha256  9560941a9d843c0243a71b17a7ac6fe31c7cebb5bce3983db79e52ae7e850491  krb5-1.21.2.tar.gz
+# from https://web.mit.edu/kerberos/dist/krb5/1.21/krb5-1.21.3.tar.gz.asc
+# with key C4493CB739F4A89F9852CBC20CBA08575F8372DF
+sha256  b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35  krb5-1.21.3.tar.gz
 
 # Hash for license file:
-sha256  0d5373486138cb176c063db98274b4c4ab6ef3518c4191360736384b780306c2  NOTICE
+sha256  7601361a275aadbe35c90185519323c28730d60c553683e56fd06cf9c5f749a6  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index def627d422..e57a2b98a2 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.21
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).2
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
