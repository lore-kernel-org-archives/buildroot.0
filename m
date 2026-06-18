Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C920CDB46B
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 09:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0F106FAC7;
	Sat, 20 Jun 2026 09:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f8vtC4yu5xP0; Sat, 20 Jun 2026 09:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDAD46FABE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781946402;
	bh=qoYOzfJw9+YxpuQPhKcl8c0rp7NIUgPbsJ9M0owFZew=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uk1xsX0n4SMY5pFNTtVq4Ys2TnmHl9vd3ZHVSv8WHzz59z+9Vy2Dt4CzTv4Y+epF3
	 37vJA2xEq3ckpkESBWP4KfEMUdWQ/mMmJTj+Ig1n1lRw6JSzUxZ/i5zAM0XoVyEr0n
	 j1hFLIhuIJfHI+mjOPMJobBr7DlB4Tgt3kjYrc/OS5jlcttzpk9vie2DF6bmYsh3tp
	 yFjNdVjyKQZTjUZUZgyg/XF8cFpSagtsIcaxWAh5/WLmLC3wIhat0ZBqNisg7aP02D
	 5zMLgDpj7m0EXvjwec+V9KGbO6WW1OrnzfsUukH/AVIfo9f+OEmGSFljeaigGJv0d+
	 7zz+v6adSjUDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDAD46FABE;
	Sat, 20 Jun 2026 09:06:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93B98367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 543998618B
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3EwBISVJBAp for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 09:06:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F88F86181
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F88F86181
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 09:06:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B95681E3E; Sat, 20 Jun 2026 09:06:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 14:47:14 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 1836d7f6abe371a63261d9d03f4f68ce7dc96a00
X-Git-Newrev: bb975551e65e9a71db68d6d556cbb1ac88ffb051
X-Patchwork-Hint: ignore
Message-Id: <20260620090611.5B95681E3E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libopenssl:
 security bump to version 3.5.7
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb975551e65e9a71db68d6d556cbb1ac88ffb051
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/openssl/openssl/releases/tag/openssl-3.5.7

This release incorporates the following bug fixes and mitigations:

    Fixed heap use-after-free in PKCS7_verify().
    (CVE-2026-45447)

    Fixed CMS AuthEnvelopedData processing may accept forged messages.
    (CVE-2026-34182)

    Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler.
    (CVE-2026-34183)

    Fixed NULL pointer dereference in QUIC server initial packet handling.
    (CVE-2026-42764)

    Fixed AES-OCB IV ignored on EVP_Cipher() path.
    (CVE-2026-45445)

    Fixed possible heap buffer overflow in ASN.1 multibyte string conversion.
    (CVE-2026-7383)

    Fixed out-of-bounds read in CMS password-based decryption.
    (CVE-2026-9076)

    Fixed heap buffer over-read in ASN.1 content parsing.
    (CVE-2026-34180)

    Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys.
    (CVE-2026-34181)

    Fixed possible NULL dereference in password-dased CMS decryption.
    (CVE-2026-42766)

    Fixed NULL pointer dereference in CRMF EncryptedValue decryption.
    (CVE-2026-42767)

    Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt()
    and PKCS7_decrypt().
    (CVE-2026-42768)

    Fixed trust anchor substitution via cert/issuer typo in CMP
    rootCaKeyUpdate.
    (CVE-2026-42769)

    Fixed FFC-DH peer validation uses attacker-supplied q.
    (CVE-2026-42770)

    Fixed incorrect tag processing for empty messages in AES-GCM-SIV
    and AES-SIV modes.
    (CVE-2026-45446)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Waldemar Brodkorb <wbx@openadk.org>
(cherry picked from commit b0ea6e310fc8a77e7c982154b38a482d2c3a8b64)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch | 4 ++--
 package/libopenssl/0003-Revert-Fix-static-builds.patch              | 6 +++---
 package/libopenssl/libopenssl.hash                                  | 4 ++--
 package/libopenssl/libopenssl.mk                                    | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
index f74576beae..8adf7e51b0 100644
--- a/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
+++ b/package/libopenssl/0002-Configure-use-ELFv2-ABI-on-some-ppc64-big-endian-sys.patch
@@ -18,10 +18,10 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
  1 file changed, 4 insertions(+)
 
 diff --git a/Configure b/Configure
-index 15054f9..ac3206e 100755
+index 1b020faadb..4614b5becf 100755
 --- a/Configure
 +++ b/Configure
-@@ -1686,6 +1686,10 @@ unless ($disabled{asm}) {
+@@ -1691,6 +1691,10 @@ unless ($disabled{asm}) {
      }
  }
  
diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index 10ca97a240..970626a725 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -15,10 +15,10 @@ Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index ac3206e..764ef89 100755
+index 4614b5becf..cac670405e 100755
 --- a/Configure
 +++ b/Configure
-@@ -1510,10 +1510,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+@@ -1515,10 +1515,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
          unless file_name_is_absolute($config{prefix});
  }
  
@@ -29,7 +29,7 @@ index ac3206e..764ef89 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1808,6 +1804,10 @@ if ($strict_warnings)
+@@ -1813,6 +1809,10 @@ if ($strict_warnings)
                  }
          }
  
diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index 781701532d..8a7186d669 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.5.6/openssl-3.5.6.tar.gz.sha256
-sha256  deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736  openssl-3.5.6.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.5.7/openssl-3.5.7.tar.gz.sha256
+sha256  a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8  openssl-3.5.7.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 837c3f0346..a9e18f96ac 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.5.6
+LIBOPENSSL_VERSION = 3.5.7
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
