Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3349DC74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC1F881F3E;
	Sat, 18 Mar 2023 21:42:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC1F881F3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEnJGQ9FuQIm; Sat, 18 Mar 2023 21:42:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0584B81F24;
	Sat, 18 Mar 2023 21:41:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0584B81F24
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 606F71BF378
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A51881F24
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 21:41:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A51881F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OMCfuqeEHbp for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 21:41:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 537E681F0A
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 21:41:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537E681F0A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FFCA86D72; Sat, 18 Mar 2023 21:41:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 18 Mar 2023 22:39:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 889fd54f809973d56b98e78677ae8a14e9e64da4
X-Git-Newrev: e011fa0415883b9d44df616cfaf6956e1a11da88
X-Patchwork-Hint: ignore
Message-Id: <20230318214156.3FFCA86D72@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snmppp: security bump to version
 3.5.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e011fa0415883b9d44df616cfaf6956e1a11da88
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Improved (security): Avoid timing attacks on authentication
  verification.
- Drop patch (already in version)

https://www.agentpp.com/download/changes_snmp++v3.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-fix-build-with-libressl-3-5-0.patch       | 39 ----------------------
 package/snmppp/snmppp.hash                         |  2 +-
 package/snmppp/snmppp.mk                           |  2 +-
 3 files changed, 2 insertions(+), 41 deletions(-)

diff --git a/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch b/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
deleted file mode 100644
index f60f84f9a2..0000000000
--- a/package/snmppp/0001-fix-build-with-libressl-3-5-0.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-auth_priv.cpp: In member function 'virtual int Snmp_pp::AuthMD5::password_to_key(const unsigned char*, unsigned int, const unsigned char*, unsigned int, unsigned char*, unsigned int*)':
-auth_priv.cpp:1132:20: error: aggregate 'Snmp_pp::MD5HashStateType md5_hash_state' has incomplete type and cannot be defined
-   MD5HashStateType md5_hash_state;
-                    ^~~~~~~~~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b50b883c03e82564198a8b7e91bd14bf007772e0
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: merged (emailed to katz.agentpp.com@magenta.de)]
-
-diff -Naurp snmp++-3.4.9.orig/src/auth_priv.cpp snmp++-3.4.9/src/auth_priv.cpp
---- snmp++-3.4.9.orig/src/auth_priv.cpp	2022-05-13 11:39:14.083038544 +0200
-+++ snmp++-3.4.9/src/auth_priv.cpp	2022-05-13 15:00:42.576102348 +0200
-@@ -79,8 +79,9 @@ static const char *loggerModuleName = "s
- 
- /* -- START: Defines for OpenSSL -- */
- 
--#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
--// OpenSSL versions up to 1.0.x and LibreSSL
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L || \
-+	(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
-+// OpenSSL versions up to 1.0.x and LibreSSL versions up to 3.4.x
- typedef EVP_MD_CTX            EVPHashStateType;
- 
- int evpAllocAndInit(EVP_MD_CTX *ctx, const EVP_MD *md)
-@@ -138,7 +139,7 @@ typedef EVP_MD_CTX*           MD5HashSta
- #define MD5_PROCESS(s, p, l)  EVP_DigestUpdate(*(s), p, l)
- #define MD5_DONE(s, k)        evpDigestFinalAndFree(s, k)
- 
--#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
-+#endif // OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
- 
- typedef DES_key_schedule      DESCBCType;
- #define DES_CBC_START_ENCRYPT(c, iv, k, kl, r, s) \
diff --git a/package/snmppp/snmppp.hash b/package/snmppp/snmppp.hash
index 6dc3d39ced..74c6a3e98f 100644
--- a/package/snmppp/snmppp.hash
+++ b/package/snmppp/snmppp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d7a77fd05ecd99b25c51cbab08dfeef22a5edf2677875695c213631af59d5bae  snmp++-3.4.10.tar.gz
+sha256  43a433bd5f6fd67add5a26add6521ca664c41aead438405658ed57483664b4bf  snmp++-3.5.0.tar.gz
 sha256  61337e799c8274e596e5783b22607beea8073ee296c6b27fc5c7487296e56851  src/v3.cpp
diff --git a/package/snmppp/snmppp.mk b/package/snmppp/snmppp.mk
index 005a5a9f35..9f1916dd66 100644
--- a/package/snmppp/snmppp.mk
+++ b/package/snmppp/snmppp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNMPPP_VERSION = 3.4.10
+SNMPPP_VERSION = 3.5.0
 SNMPPP_SOURCE = snmp++-$(SNMPPP_VERSION).tar.gz
 SNMPPP_SITE = http://www.agentpp.com/download
 SNMPPP_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
