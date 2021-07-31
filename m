Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4642CC4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:11:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD4076103B
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD4076103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAA7C402AD;
	Sat, 31 Jul 2021 09:11:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A5kLnSe6QrHq; Sat, 31 Jul 2021 09:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 852DB4028F;
	Sat, 31 Jul 2021 09:11:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA5AB1BF956
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D876F60711
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwiImJe0DOuk for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 09:11:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D866C606A0
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 09:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2DA35887C6; Sat, 31 Jul 2021 09:11:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 11:11:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54054448bb661653f6c8a2291fc3b78471c30917
X-Git-Newrev: 6b78d020851a3bf74a825db09d39e215bf54e5c3
X-Patchwork-Hint: ignore
Message-Id: <20210731091119.2DA35887C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: fix build with
 libnss
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=6b78d020851a3bf74a825db09d39e215bf54e5c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build is broken since bump of libnss to version 3.68 in commit
0a73b9b962421ce7a72c88e5f5bbd8849f21b041

Fixes:
 - http://autobuild.buildroot.org/results/1e8113d638fcb73538329511eeac9f5e7cb04d6a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch  | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
new file mode 100644
index 0000000000..d0b573446f
--- /dev/null
+++ b/package/pkcs11-helper/0001-nss-use-nss-pkcs11-h.patch
@@ -0,0 +1,62 @@
+From d159a5c59c80552c3e8ea75d9bcf29b3a8e8289d Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Fri, 30 Jul 2021 20:06:36 +0300
+Subject: [PATCH] nss: use nss pkcs11.h
+
+make nss happy with its own extensions and non-standard behavior.
+[Retrieved (and updated to remove ChangeLog update) from:
+https://github.com/OpenSC/pkcs11-helper/pull/39]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog                 |  1 +
+ lib/_pkcs11h-crypto-nss.c | 14 ++++++++++----
+ lib/common.h              |  7 +++++++
+ 3 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-nss.c b/lib/_pkcs11h-crypto-nss.c
+index 4b70e826..f57f9e6b 100644
+--- a/lib/_pkcs11h-crypto-nss.c
++++ b/lib/_pkcs11h-crypto-nss.c
+@@ -48,15 +48,21 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include "common.h"
+-
+-#include "_pkcs11h-crypto.h"
++#ifdef HAVE_CONFIG_H
++#include <config.h>
++#endif
+ 
+ #if defined(ENABLE_PKCS11H_ENGINE_NSS)
+-#define _PKCS11T_H_ /* required so no conflict with ours */
+ #include <nss.h>
+ #include <cert.h>
+ 
++/* Use PKCS#11 of nss to avoid conflicts and make nss happy with its own extensions */
++#define PKCS11_H 1
++
++#include "common.h"
++
++#include "_pkcs11h-crypto.h"
++
+ static
+ int
+ __pkcs11h_crypto_nss_initialize (
+diff --git a/lib/common.h b/lib/common.h
+index 61a958af..2499e9c5 100644
+--- a/lib/common.h
++++ b/lib/common.h
+@@ -72,5 +72,12 @@
+ 
+ #define _PKCS11H_ASSERT		assert
+ 
++#ifndef FALSE
++#define FALSE 0
++#endif
++#ifndef TRUE
++#define TRUE 1
++#endif
++
+ #endif
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
