Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3921AC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 21:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE94418BB;
	Tue, 20 Sep 2022 21:13:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE94418BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCGVClwWQtK0; Tue, 20 Sep 2022 21:13:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D776408A2;
	Tue, 20 Sep 2022 21:13:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D776408A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B0A61BF2A7
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 602E360F93
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 21:13:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 602E360F93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id diM1M0wEMs2P for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 21:13:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2BF260F3B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2BF260F3B
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 21:13:34 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id EAA20240003;
 Tue, 20 Sep 2022 21:13:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Sep 2022 23:13:29 +0200
Message-Id: <20220920211330.658196-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1663708412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Nbwslgacree2wz9MjpeX+0ERHF8Cp0NFAHyrSzs9TVA=;
 b=LLSPGcAZ0QH5yu97CrY7PADHf0PB7mupOwPvruPcfi0g5yg7dQg4HVc1fB26rwJ98uJt10
 9EcLJLwxU1GbWL8FXVicEMx6V6dN2OwFK6H804Zk4i3tpkZGn2p93d0H9XXmCA3PalpdIt
 Cr1lvnYAebiZROHnwtDAjKDs9OWifXCJfYt/WZw4rwcyQb3Z4n1nqGQBiFurGE58732lXS
 KYNGCFSLD8qtyV6kqR56I+z7D8emNzJ67YHPNip5chyuxlhhS4tuhB3hRoQthZsoCmujFA
 aoCU4v9btHCv9Jai+o5k1Pa014bCI/Z9mOu9tM4/hFLIlh4ZiLZsnj5BZjt8DQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LLSPGcAZ
Subject: [Buildroot] [PATCH] package/heirloom-mailx: security bump to
 version 12.5-5 from Debian
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Our current heirloom-mailx package is affected by CVE-2014-7844. It
has been fixed by a Debian patch
0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch, but it does rely
on other Debian patches as well.

Instead of bringing those patches locally, we just update the package
to use version 12.5-5 from Debian, including its patches.

The local patch
0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch is
removed as it is part of the Debian patches.

The remaining patch 0002-fix-libressl-support.patch is renumbered.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-support-since-it-is-no-longer-suppo.patch | 42 -------------------
 ....patch => 0001-fix-libressl-support.patch} |  0
 package/heirloom-mailx/heirloom-mailx.hash    |  3 +-
 package/heirloom-mailx/heirloom-mailx.mk      |  5 ++-
 4 files changed, 6 insertions(+), 44 deletions(-)
 delete mode 100644 package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
 rename package/heirloom-mailx/{0002-fix-libressl-support.patch => 0001-fix-libressl-support.patch} (100%)

diff --git a/package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch b/package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
deleted file mode 100644
index db5b19ee52..0000000000
--- a/package/heirloom-mailx/0001-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From: Hilko Bengen <bengen@debian.org>
-Date: Wed, 27 Apr 2011 00:18:42 +0200
-Subject: Patched out SSL2 support since it is no longer supported by OpenSSL.
-
-Now that openssl has dropped SSLv2 support we need to patch it out.
-Patch picked up from debian patchseries 5.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
----
- mailx.1   |    2 +-
- openssl.c |    4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/mailx.1 b/mailx.1
-index 417ea04..a02e430 100644
---- a/mailx.1
-+++ b/mailx.1
-@@ -3575,7 +3575,7 @@ Only applicable if SSL/TLS support is built using OpenSSL.
- .TP
- .B ssl-method
- Selects a SSL/TLS protocol version;
--valid values are `ssl2', `ssl3', and `tls1'.
-+valid values are `ssl3', and `tls1'.
- If unset, the method is selected automatically,
- if possible.
- .TP
-diff --git a/openssl.c b/openssl.c
-index b4e33fc..44fe4e5 100644
---- a/openssl.c
-+++ b/openssl.c
-@@ -216,9 +216,7 @@ ssl_select_method(const char *uhp)
- 
- 	cp = ssl_method_string(uhp);
- 	if (cp != NULL) {
--		if (equal(cp, "ssl2"))
--			method = SSLv2_client_method();
--		else if (equal(cp, "ssl3"))
-+		if (equal(cp, "ssl3"))
- 			method = SSLv3_client_method();
- 		else if (equal(cp, "tls1"))
- 			method = TLSv1_client_method();
diff --git a/package/heirloom-mailx/0002-fix-libressl-support.patch b/package/heirloom-mailx/0001-fix-libressl-support.patch
similarity index 100%
rename from package/heirloom-mailx/0002-fix-libressl-support.patch
rename to package/heirloom-mailx/0001-fix-libressl-support.patch
diff --git a/package/heirloom-mailx/heirloom-mailx.hash b/package/heirloom-mailx/heirloom-mailx.hash
index 13e8896809..c42f9b6de7 100644
--- a/package/heirloom-mailx/heirloom-mailx.hash
+++ b/package/heirloom-mailx/heirloom-mailx.hash
@@ -1,4 +1,5 @@
-# From http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-3.dsc
+# From http://snapshot.debian.org/archive/debian/20150815T155609Z/pool/main/h/heirloom-mailx/heirloom-mailx_12.5-5.dsc
 sha256  015ba4209135867f37a0245d22235a392b8bbed956913286b887c2e2a9a421ad  heirloom-mailx_12.5.orig.tar.gz
+sha256  0140cef831f966cf65a0a6ba2ed4eef4f2bfb402b7b18db7307bc42e63328ce6  heirloom-mailx_12.5-5.debian.tar.xz
 # Locally computed
 sha256  5ddc00aed98a0cf75fc7edfd9f3aeb1e919ae0ad5e9ff55d61f643d62d802b07  COPYING
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index e851e1dfcc..d3b8ad437a 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -6,11 +6,14 @@
 
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx
+HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20150815T155609Z/pool/main/h/heirloom-mailx
+HEIRLOOM_MAILX_PATCH = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION)-5.debian.tar.xz
 HEIRLOOM_MAILX_LICENSE = BSD-4-Clause, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPL-1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 HEIRLOOM_MAILX_CPE_ID_VENDOR = heirloom
 HEIRLOOM_MAILX_CPE_ID_PRODUCT = mailx
+# 0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch in the Debian patches
+HEIRLOOM_MAILX_IGNORE_CVES += CVE-2014-7844
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 HEIRLOOM_MAILX_DEPENDENCIES += openssl
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
