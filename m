Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC04C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 20:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A8A240546;
	Sat, 18 Mar 2023 20:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8A240546
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m59i8X-oCihJ; Sat, 18 Mar 2023 20:44:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA6D8401F1;
	Sat, 18 Mar 2023 20:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA6D8401F1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 209C51BF332
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 20:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8BF7410D8
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 20:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BF7410D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VEZ0qLOA4WrH for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 20:44:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5314410A2
Received: from box.stevenhay.com (box.stevenhay.com
 [IPv6:2a01:7e01:e001:325::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5314410A2
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 20:44:44 +0000 (UTC)
Received: from authenticated-user (box.stevenhay.com [172.104.133.13])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by box.stevenhay.com (Postfix) with ESMTPSA id A4C7620413;
 Sat, 18 Mar 2023 16:44:37 -0400 (EDT)
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 21:44:06 +0100
Message-Id: <20230318204407.2112290-1-me@stevenhay.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=stevenhay.com; s=mail; t=1679172278;
 bh=tvCOKPST7CMr6ho0SIiOZYhuhAgDij4AXM7ZuLKuoZU=;
 h=From:To:Cc:Subject:Date:From;
 b=UmPLZlGmd2y/Xa0XG07wzSE+9O6UdEVD1fWDKDNFrag9aRf3s6ixRtgDsy/4Ok0Ex
 CjJ2QQEBQXr24D2ZFbeX0WQ1X39wiDS2znLXIt2Lm4Hkqwlg8G/FYt4vGCfSvWduc0
 6wezvLtEzez6FSmSfCxNA8Temqe8nTQ1HShStZjQhC8deq+BEN+4NxpvUpx5Pl6Kaz
 RnYHNGn7M6DphO3ISktsRoxCny6F9Q6Rtj2LQcxOhL7bCDZtWWaRfKW9nzE/30ssNv
 sLK4PxQL0NQ0QiS5KfWB9lhwPE8Emmx5KgRJKO09/KvnYz3ZSDiU+eLQhmnyfPY68v
 B3KM3iS4vqPEQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=stevenhay.com header.i=@stevenhay.com
 header.a=rsa-sha256 header.s=mail header.b=UmPLZlGm
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

Signed-off-by: Steve Hay <me@stevenhay.com>
---
 ...2pem.py-make-cryptography-module-opt.patch | 31 +++++++++++--------
 ...2pem.py-Fix-compat-with-cryptography.patch | 29 -----------------
 package/ca-certificates/ca-certificates.hash  |  4 +--
 package/ca-certificates/ca-certificates.mk    |  5 +--
 4 files changed, 22 insertions(+), 47 deletions(-)
 delete mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

diff --git a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
index b76c1bfd7f..ced593664e 100644
--- a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
+++ b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
@@ -1,4 +1,10 @@
-From bf18b564122e8f976681a2398862fde1eafd84ba Mon Sep 17 00:00:00 2001
+From a4e468a2a0afa80df174831c2f422184820bb0fa Mon Sep 17 00:00:00 2001
+From: Steve Hay <me@stevenhay.com>
+Date: Sat, 18 Mar 2023 17:57:18 +0100
+Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
+
+Modified for a newer version of the ca-certificates module.
+
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Thu, 6 Jan 2022 23:15:00 +0100
 Subject: [PATCH] mozilla/certdata2pem.py: make cryptography module optional
@@ -15,37 +21,36 @@ the check is skipped.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
@@ -55,5 +60,5 @@ index ede23d4..a6261f8 100644
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
index 0b6962ab7b..5246b6e543 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20211016
+# batocera / version bump
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
