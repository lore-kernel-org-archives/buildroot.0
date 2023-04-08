Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FA2C7619A
	for <buildroot@archiver.kernel.org>; Sat,  8 Apr 2023 19:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F22974038B;
	Sat,  8 Apr 2023 19:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F22974038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sljn6vpRpR1J; Sat,  8 Apr 2023 19:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E678840620;
	Sat,  8 Apr 2023 19:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E678840620
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 168021BF82F
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E473C404AF
 for <buildroot@lists.busybox.net>; Sat,  8 Apr 2023 19:42:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E473C404AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dcXRVESclfq for <buildroot@lists.busybox.net>;
 Sat,  8 Apr 2023 19:42:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0B044038B
 for <buildroot@buildroot.org>; Sat,  8 Apr 2023 19:42:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0B044038B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDEE083817; Sat,  8 Apr 2023 19:42:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Apr 2023 21:36:51 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 75e04c691e580165b7f203261a3ca2a2d1e3e25c
X-Git-Newrev: d031f1712b81b18945f88776e74698d5ab5c0c3f
X-Patchwork-Hint: ignore
Message-Id: <20230408194214.DDEE083817@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ca-certificates:
 bump version to 20230311
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

commit: https://git.buildroot.net/buildroot/commit/?id=d031f1712b81b18945f88776e74698d5ab5c0c3f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The impetus for this change was that wget fails to load pages signed by
Let's Encrypt due to missing root certs. This version has the updated and
correct certs.

0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

Patch dropped because the fix is incorporated upstream.

Signed-off-by: Steve Hay <me@stevenhay.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f5c8bd4305ab7667f3a36911ba58cef358b5aa8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tdata2pem.py-make-cryptography-module-opt.patch | 27 +++++++++++-----------
 package/ca-certificates/ca-certificates.hash       |  4 +---
 package/ca-certificates/ca-certificates.mk         |  4 ++--
 3 files changed, 17 insertions(+), 18 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
