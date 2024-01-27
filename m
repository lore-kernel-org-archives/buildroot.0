Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064EAC46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 20:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABA9839F9;
	Sat, 27 Jan 2024 20:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABA9839F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o8H1Eg-71uZx; Sat, 27 Jan 2024 20:14:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC659838DB;
	Sat, 27 Jan 2024 20:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC659838DB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 526011BF280
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3850C417AB
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 20:14:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3850C417AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJtA1KpJAX_t for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 20:14:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6BF63417A8
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 20:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BF63417A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 587FC865C1; Sat, 27 Jan 2024 20:14:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 21:11:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48874afb9d03cb02b0207fd53bf2cdf0c37c8fa0
X-Git-Newrev: 52fd4753fe64208bfc25dc8a298f067da5c4c4b4
X-Patchwork-Hint: ignore
Message-Id: <20240127201446.587FC865C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.28.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=52fd4753fe64208bfc25dc8a298f067da5c4c4b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fix CVE-2024-23170 and CVE-2024-23775
- Mbed TLS is now released under a dual Apache-2.0 OR GPL-2.0-or-later
  license. Users may choose which license they take the code under:
  https://github.com/Mbed-TLS/mbedtls/commit/f429557c5900d3b90bd10a21b228f719e80f81a2

https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-1/
https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-01-2/
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.6
https://github.com/Mbed-TLS/mbedtls/releases/tag/v2.28.7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mbedtls/mbedtls.hash | 6 +++---
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index d0cd0b2105..3ec151a859 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.4:
-sha256  849e86b626e42ded6bf67197b64aa771daa54e2a7e2868dc67e1e4711959e5e3  mbedtls-2.28.5.tar.gz
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.7:
+sha256  1df6073f0cf6a4e1953890bf5e0de2a8c7e6be50d6d6c69fa9fefcb1d14e981a  mbedtls-2.28.7.tar.gz
 # Locally calculated
-sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
+sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 1b941e04f4..cdb4aef4f4 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.5
+MBEDTLS_VERSION = 2.28.7
 MBEDTLS_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS_VERSION))
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
@@ -12,7 +12,7 @@ MBEDTLS_CONF_OPTS = \
 	-DENABLE_TESTING=OFF \
 	-DMBEDTLS_FATAL_WARNINGS=OFF
 MBEDTLS_INSTALL_STAGING = YES
-MBEDTLS_LICENSE = Apache-2.0
+MBEDTLS_LICENSE = Apache-2.0 or GPL-2.0+
 MBEDTLS_LICENSE_FILES = LICENSE
 MBEDTLS_CPE_ID_VENDOR = arm
 MBEDTLS_CPE_ID_PRODUCT = mbed_tls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
