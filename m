Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EDDC7618E
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 20:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18EC961377;
	Thu, 16 Mar 2023 20:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18EC961377
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqjDcJJam09p; Thu, 16 Mar 2023 20:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EC3B6104D;
	Thu, 16 Mar 2023 20:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EC3B6104D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2FEF61BF2A2
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 20:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 096604094D
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 20:49:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 096604094D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSUOWtCrDRRv for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 20:49:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16E2040905
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16E2040905
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 20:49:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.166.121]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mqs4f-1qG9DW0Ybp-00mslq; Thu, 16 Mar 2023 21:48:59 +0100
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 21:47:43 +0100
Message-Id: <20230316204743.26192-1-dalang@gmx.at>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ofAabkl7etKJBbbm7ggR4vibpvoX7TkHxwcyBpJjkByufmQ/kPN
 TtuuIO5fLBP7C/u/CaAWb3o+nZi6KrJSey4/IXFUkcrVYmV4or6wKFJfzhnliHYiZrbrdDb
 RCOvN6g3EDQrUBEBzTjvf+3xU17F++MBpG9MBFxyFqXENC84RtkdqTNP3ZYfg4PmmX+kjcP
 ghCvZvvJ0Y4yeWaK/Dnow==
UI-OutboundReport: notjunk:1;M01:P0:14QlgjmHewk=;81A/Qc/dUXIPaEgBRo/UUpyXNo5
 iRiY3w3RPUPuqzAWiiysClqBEqgTzy9AkXDwmKcDkuLLPsMUk6caU02Y5Tu6Ksipspp0mfcy9
 r5Xx12XQH80U6cDP3xBFlhiWzIFFgffo/eTDTuW907GjlhhUMrvM8vWlghMkdYIWW264PkcOH
 nokUfZhddI2VcuClAqnXRAGzISEL8gGLz0w5kxRpV4IxL4acsf5LndbrWGqKidIp1iOLKq4xJ
 YABVXIL0EEAZ2GivgzhLbtiYMMMzIhKo1Exgq3LnlFCBtllBXnej/HONQV9+Wi8PE7KgCVJ6/
 rH5ABLwkKcch0mqLjhxgbdmpoDqKG3A3K9n282JszY8gOrGCZBIKFvlu56JSqaf5Zb5rCRNxW
 nPbzrQ8qyABbZ1JR5rOFkjMwLugkfcCzDZEw8rHg6ycqwRg3aG/KSzVAWPNdZcXvQDr7GUB0N
 QmuPKmRMD7roll8goBYkksZh0+WbHS+s9NDIGB8RKjsOYRFJaTvhHaljBQlYBfwMhG1IBxHA+
 mxNUhFwRQBDe5mZ8hR068IO/+05tDFFFrLeVADVECndXddDq6+UCr2FSfuz/kNcA9ISEKDtG9
 s/sVApXCpAdkO2aHQBSKH95+k9Vau49IOijBcl59hwkGki4+5pmdWDDrhq8gQUU7F+QiSc5Qb
 cgAQqsg1X6xkBUcIsKsx3zuKbga7FXzrNgRLmswABUkNQLvK3P6JNNCdeLo1mGdy7qee7MT1c
 eWK2ADOYDpCaHkP5TEhdCzXqtjGdU/UTK+4TZyz6aih80oj6ckjIByyFcHDLm1hXlXD5sIeWK
 jAN6TTCjNolQyj2Z3HP6HVMYp0o0LpbfOpnXBdTBKYy2ViNvZl3HDaWr5AnvWqlaOxPZOazqF
 OauuJLvO2t6+Q0v7UAEPKDRl3m8zY/nCJ+JaPjoe11tCUOWFCrgPhOiIke9PHMfZ6pCMcx4iC
 u+htxBxRC3/DcUxTkO0w3RRRiGQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1678999739; i=dalang@gmx.at;
 bh=PVhfLvPDHrS9t4TofyWPKsDMZ6xLfG0+jT/D6vjWsmU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=B+sVopzoBwLB/LoioQB6l1RFm+vx6N//8ONl4SD84/0EBPj71DnXnMvSAbiZNgYfm
 HhppPK5pvw7uPoKp4cQSnRAbB6/DiYQoZBJp70xGrrrXyFibuayu2nHgR+bd+Yng7b
 kWHG+Vtl7rGyU+eu7yDLT1unej9skJbX+t3NsxqvaDU2kKNJhihBGShE6ZgDZDPg8b
 dP8ng3M+qLW+pL7Wk4cqbZasomIVFGIQ8gXSQjepy9SsZ/DTv2+7IgQ9ZKoTcvbD8s
 p7IQZkDqUEgswXdoUn3xrMB73OVDDV7S//2DZj6KA4fc7pp7+DwWI1LZskVvyJRCx6
 hNXwlfD6NJy5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=B+sVopzo
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
Cc: Daniel Lang <dalang@gmx.at>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...2pem.py-make-cryptography-module-opt.patch | 10 ++++---
 ...2pem.py-Fix-compat-with-cryptography.patch | 29 -------------------
 package/ca-certificates/ca-certificates.hash  |  4 +--
 package/ca-certificates/ca-certificates.mk    |  4 +--
 4 files changed, 10 insertions(+), 37 deletions(-)
 delete mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch

diff --git a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
index b76c1bfd7f..ce6fa19e12 100644
--- a/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
+++ b/package/ca-certificates/0001-mozilla-certdata2pem.py-make-cryptography-module-opt.patch
@@ -14,6 +14,8 @@ cryptography Python module is there, we perform the check, otherwise
 the check is skipped.

 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+[Daniel: update patch for 20230311]
+Signed-off-by: Daniel Lang <dalang@gmx.at>
 ---
  mozilla/certdata2pem.py | 18 ++++++++++--------
  1 file changed, 10 insertions(+), 8 deletions(-)
@@ -36,16 +38,16 @@ index ede23d4..a6261f8 100644
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
index a1675b999e..b07ddb924f 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,6 +1,6 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1  bce5a8fac45456dbebf256f3a812c6cd0a853e3e  ca-certificates_20211016.tar.xz
-sha256  2ae9b6dc5f40c25d6d7fe55e07b54f12a8967d1955d3b7b2f42ee46266eeef88  ca-certificates_20211016.tar.xz
+sha1  61ca9ac8493972dffd304a94f3cb2c63b3ac697e  ca-certificates_20230311.tar.xz
+sha256  83de934afa186e279d1ed08ea0d73f5cf43a6fbfb5f00874b6db3711c64576f3  ca-certificates_20230311.tar.xz

 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 0b6962ab7b..a31d3a35fd 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################

-CA_CERTIFICATES_VERSION = 20211016
+CA_CERTIFICATES_VERSION = 20230311
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20230314T211539Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
--
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
