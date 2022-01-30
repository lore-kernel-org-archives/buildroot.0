Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C65C433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFA154055E;
	Sun, 30 Jan 2022 14:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJqLm_xxlq_4; Sun, 30 Jan 2022 14:56:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F6994028D;
	Sun, 30 Jan 2022 14:56:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6B0F1BF95D
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2F1A4028D
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hEARVJ1bva_f for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:56:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F401240245
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:56:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 42E1482AEC; Sun, 30 Jan 2022 14:49:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:56:25 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59f8a971ae6c8f88bf99dede56946e701a2c1b40
X-Git-Newrev: 7a2e33c5149c902e8532be7db6b97a6ef4fb9e62
X-Patchwork-Hint: ignore
Message-Id: <20220130144927.42E1482AEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: bump to version 1.28
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a2e33c5149c902e8532be7db6b97a6ef4fb9e62
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/OpenSC/pkcs11-helper/releases/tag/pkcs11-helper-1.28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch  | 62 ----------------------
 package/pkcs11-helper/pkcs11-helper.hash           |  2 +-
 package/pkcs11-helper/pkcs11-helper.mk             |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)

diff --git a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
deleted file mode 100644
index d0b573446f..0000000000
--- a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From d159a5c59c80552c3e8ea75d9bcf29b3a8e8289d Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Fri, 30 Jul 2021 20:06:36 +0300
-Subject: [PATCH] nss: use nss pkcs11.h
-
-make nss happy with its own extensions and non-standard behavior.
-[Retrieved (and updated to remove ChangeLog update) from:
-https://github.com/OpenSC/pkcs11-helper/pull/39]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ChangeLog                 |  1 +
- lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
- lib/common.h              |  7 +++++++
- 3 files changed, 18 insertions(+), 4 deletions(-)
-
-diff --git a/lib/_pkcs11h-crypto-nss.c b/lib/_pkcs11h-crypto-nss.c
-index 4b70e826..f57f9e6b 100644
---- a/lib/_pkcs11h-crypto-nss.c
-+++ b/lib/_pkcs11h-crypto-nss.c
-@@ -48,15 +48,21 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#include "common.h"
--
--#include "_pkcs11h-crypto.h"
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
- 
- #if defined(ENABLE_PKCS11H_ENGINE_NSS)
--#define _PKCS11T_H_ /* required so no conflict with ours */
- #include <nss.h>
- #include <cert.h>
- 
-+/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
-+#define PKCS11_H 1
-+
-+#include "common.h"
-+
-+#include "_pkcs11h-crypto.h"
-+
- static
- int
- __pkcs11h_crypto_nss_initialize (
-diff --git a/lib/common.h b/lib/common.h
-index 61a958af..2499e9c5 100644
---- a/lib/common.h
-+++ b/lib/common.h
-@@ -72,5 +72,12 @@
- 
- #define _PKCS11H_ASSERT		assert
- 
-+#ifndef FALSE
-+#define FALSE 0
-+#endif
-+#ifndef TRUE
-+#define TRUE 1
-+#endif
-+
- #endif
- 
diff --git a/package/pkcs11-helper/pkcs11-helper.hash b/package/pkcs11-helper/pkcs11-helper.hash
index d707bcf914..4114378ab8 100644
--- a/package/pkcs11-helper/pkcs11-helper.hash
+++ b/package/pkcs11-helper/pkcs11-helper.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  653730f0c561bbf5941754c0783976113589b2dc64a0661c908dc878bfa4e58b  pkcs11-helper-1.27.0.tar.bz2
+sha256  5bd55adafdbb708e096070dd0a910f23e1d5fd6291922398c1a15f00fff2b5ec  pkcs11-helper-1.28.0.tar.bz2
 sha256  808705ac1daafe07a76431929575c5712a8693977a39ec9102aed25f030754d9  COPYING
 sha256  865496cf23a6c792739ff2f9ea11e95ac99db89cfe3780a295b4e1495a9c19fe  COPYING.BSD
 sha256  cd2e7d63a11058f19c58b06fb8c759140ce70788369dce6e6e9db40d3475021e  COPYING.GPL
diff --git a/package/pkcs11-helper/pkcs11-helper.mk b/package/pkcs11-helper/pkcs11-helper.mk
index 90929404be..4fc3e21e5a 100644
--- a/package/pkcs11-helper/pkcs11-helper.mk
+++ b/package/pkcs11-helper/pkcs11-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PKCS11_HELPER_VERSION = 1.27
+PKCS11_HELPER_VERSION = 1.28
 PKCS11_HELPER_SOURCE = pkcs11-helper-$(PKCS11_HELPER_VERSION).0.tar.bz2
 PKCS11_HELPER_SITE = https://github.com/OpenSC/pkcs11-helper/releases/download/pkcs11-helper-$(PKCS11_HELPER_VERSION)
 PKCS11_HELPER_LICENSE = GPL-2.0 or BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
