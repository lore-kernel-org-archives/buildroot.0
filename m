Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84BDC6FD1F
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 14:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71AD3408F4;
	Sun, 19 Mar 2023 14:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71AD3408F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUBmKd0hkqnP; Sun, 19 Mar 2023 14:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1D7740907;
	Sun, 19 Mar 2023 14:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1D7740907
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49A0D1BF34C
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E0714016C
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 14:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E0714016C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V1d1yyaTo2CX for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 14:22:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84831400A6
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84831400A6
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 14:22:24 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id 05D97205CF;
 Sun, 19 Mar 2023 10:22:20 -0400 (EDT)
To: buildroot@buildroot.org
Date: Sun, 19 Mar 2023 15:22:12 +0100
Message-Id: <20230319142213.3045818-1-me@stevenhay.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1679235741;
 bh=vf81hf0fJdiEpd9eQMjqYqRrsHZSEbcRzh4wtmINqY0=;
 h=From:To:Cc:Subject:Date:From;
 b=XCBdQ9dhSWgHZN9Qmp+SNRXe+ZZvXs4YhQwupDAM5Zv0oC/81JZjLw9HPmmC6sw9/
 D3qMWS/k4V4K4pe0RoSsiTjVEYb8p+JRK03DllaTWQt0S7odFUOOUd0xNHJTa8hyDa
 09Lda33xpjUdMwxPgfN+ViU1fuYdu8okuRg78WxKOme8twmtU35Xk8WP0HQ7Q2f0eH
 lIhf10UVICP9mXhj1yQp8moQmugChpR1V7ouXCof3752ARWDCqNiGzvIouUXrEjY6h
 B1a34q//G6OK3QWwaNXE8POCsTCksmTezMVKDnxFjysYCTBj/Sx887z36FLlfzN4jh
 iI1aWEgcUD9kg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=XCBdQ9dh
Subject: [Buildroot] [PATCH] package/ca-certificates: bump version to
 20230311
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
From: Steve Hay via buildroot <buildroot@buildroot.org>
Reply-To: Steve Hay <me@stevenhay.com>
Cc: Martin Bark <martin@barkynet.com>, Steve Hay <me@stevenhay.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The impetus for this change was that wget fails to load pages signed by
Let's Encrypt due to missing root certs. This version has the updated and
correct certs.

0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

Patch dropped because the fix is incorporated upstream.

Signed-off-by: Steve Hay <me@stevenhay.com>

---
Changes v1 -> v2
    - Removed the extraneous comment in the make file.
    - Fixed patch header.
    - Added note to the log as to why the patch was dropped.

Changes v2 -> v3
    - The v2 patch did not include the changes. This one does.

Signed-off-by: Steve Hay <me@stevenhay.com>
---
 ...2pem.py-make-cryptography-module-opt.patch | 27 ++++++++---------
 ...2pem.py-Fix-compat-with-cryptography.patch | 29 -------------------
 package/ca-certificates/ca-certificates.hash  |  4 +--
 package/ca-certificates/ca-certificates.mk    |  4 +--
 4 files changed, 17 insertions(+), 47 deletions(-)
 delete mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

diff --git a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
index b76c1bfd7f..ed90c217ec 100644
--- a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
+++ b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
@@ -1,4 +1,4 @@
-From bf18b564122e8f976681a2398862fde1eafd84ba Mon Sep 17 00:00:00 2001
+From a4e468a2a0afa80df174831c2f422184820bb0fa Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Thu, 6 Jan 2022 23:15:00 +0100
 Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
@@ -14,38 +14,39 @@ cryptography Python module is there, we perform the check, otherwise
 the check is skipped.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Steve: refreshed to apply on ca-certificates version 20230311]
+Signed-off-by: Steve Hay <me@stevenhay.com>
 ---
- mozilla/certdata2pem.py | 18 ++++++++++--------
- 1 file changed, 10 insertions(+), 8 deletions(-)
+ mozilla/certdata2pem.py | 17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
 
 diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
-index ede23d4..a6261f8 100644
+index 4df86a2..3a6d7dc 100644
 --- a/mozilla/certdata2pem.py
 +++ b/mozilla/certdata2pem.py
-@@ -28,9 +28,6 @@ import sys
+@@ -28,8 +28,6 @@ import sys
  import textwrap
  import io
  
 -from cryptography import x509
 -
--
+ 
  objects = []
  
- # Dirty file parser.
-@@ -122,11 +119,16 @@ for obj in objects:
+@@ -122,11 +120,16 @@ for obj in objects:
          if not obj['CKA_LABEL'] in trust or not trust[obj['CKA_LABEL']]:
              continue
  
--        cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
--        if cert.not_valid_after < datetime.datetime.now():
+-        cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
+-        if cert.not_valid_after < datetime.datetime.utcnow():
 -            print('!'*74)
 -            print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
 -            print('!'*74)
 +        try:
 +            from cryptography import x509
 +
-+            cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
-+            if cert.not_valid_after < datetime.datetime.now():
++            cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
++            if cert.not_valid_after < datetime.datetime.utcnow():
 +                print('!'*74)
 +                print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
 +                print('!'*74)
@@ -55,5 +56,5 @@ index ede23d4..a6261f8 100644
          bname = obj['CKA_LABEL'][1:-1].replace('/', '_')\
                                        .replace(' ', '_')\
 -- 
-2.33.1
+2.30.2
 
diff --git a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
deleted file mode 100644
index 0537da9224..0000000000
--- a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 5e493ca307a031e81528ceddb96f3da40bc062cf Mon Sep 17 00:00:00 2001
-From: Wataru Ashihara <wsh@iij.ad.jp>
-Date: Wed, 2 Nov 2022 12:40:05 -0400
-Subject: [PATCH] mozilla/certdata2pem.py: Fix compat with cryptography > 3.0
-
-In newer cryptography packages, load_der_x509_certificate is enforced to be 'bytes' rather than currently used 'bytearray'.  This fixes that.
-
-https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
-Signed-off-by: Justin Wood <jwood@starry.com>
----
- mozilla/certdata2pem.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
-index a6261f8..c0fa52c 100644
---- a/mozilla/certdata2pem.py
-+++ b/mozilla/certdata2pem.py
-@@ -122,7 +122,7 @@ for obj in objects:
-         try:
-             from cryptography import x509
- 
--            cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
-+            cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
-             if cert.not_valid_after < datetime.datetime.now():
-                 print('!'*74)
-                 print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
--- 
-2.38.1
-
diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index a1675b999e..8a5b48dd79 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,6 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1  bce5a8fac45456dbebf256f3a812c6cd0a853e3e  ca-certificates_20211016.tar.xz
-sha256  2ae9b6dc5f40c25d6d7fe55e07b54f12a8967d1955d3b7b2f42ee46266eeef88  ca-certificates_20211016.tar.xz
-
+sha256  83de934afa186e279d1ed08ea0d73f5cf43a6fbfb5f00874b6db3711c64576f3  ca-certificates_20230311.tar.xz
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 0b6962ab7b..202d0b92ac 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20211016
+CA_CERTIFICATES_VERSION = 20230311
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20230317T205011Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
