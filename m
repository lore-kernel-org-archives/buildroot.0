Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8642C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8550960F76;
	Sat, 13 Jan 2024 21:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8550960F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvRtD42MO7Xh; Sat, 13 Jan 2024 21:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE03F60F71;
	Sat, 13 Jan 2024 21:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE03F60F71
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5E2191BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E91360EE5
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E91360EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRE6qIJgR-Tu for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4678660AC3
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4678660AC3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4318786065; Sat, 13 Jan 2024 21:15:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:09:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 146cd5abb260a0be41a773ba4a33b32ca83f1e35
X-Git-Newrev: 0e09a4ad71db519dc94701f1e1de4ab0b46348f4
X-Patchwork-Hint: ignore
Message-Id: <20240113211502.4318786065@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: fix openssl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e09a4ad71db519dc94701f1e1de4ab0b46348f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of openssl to version
3.2.0 in commit 973b1eba5a4ee72f040bd471b147267e36be73ad:

In file included from BnValues.h:327,
                 from Global.h:80,
                 from Tpm.h:78,
                 from ACTCommands.c:62:
TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
   83 | #   error Untested OpenSSL version
      |     ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f22867e71dca64d4ab5fee4db39fe9b1899f4b85

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-Add-support-for-OpenSSL-3-2-x.patch       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch b/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch
new file mode 100644
index 0000000000..6732efce8c
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-Add-support-for-OpenSSL-3-2-x.patch
@@ -0,0 +1,28 @@
+From beea0f97b3c95ec69f3e269df1af87eb2cdd3c46 Mon Sep 17 00:00:00 2001
+From: Otto Hollmann <otto@hollmann.cz>
+Date: Tue, 12 Dec 2023 13:58:32 +0100
+Subject: [PATCH] Add support for OpenSSL 3.2.x
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/13
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/TpmToOsslMath.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/TpmToOsslMath.h b/src/TpmToOsslMath.h
+index 0b18191..1271937 100644
+--- a/src/TpmToOsslMath.h
++++ b/src/TpmToOsslMath.h
+@@ -76,10 +76,10 @@
+  * As of release 3.0.0, OPENSSL_VERSION_NUMBER is a combination of the
+  * major (M), minor (NN) and patch (PP) version into a single integer 0xMNN00PP0L
+  */
+-#if OPENSSL_VERSION_NUMBER > 0x30100ff0L
++#if OPENSSL_VERSION_NUMBER > 0x30200ff0L
+ // Check the bignum_st definition in crypto/bn/bn_lcl.h or crypto/bn/bn_local.h and either update
+ // the version check or provide the new definition for this version.
+-// Currently safe for all 3.1.x
++// Currently safe for all 3.2.x
+ #   error Untested OpenSSL version
+ #elif OPENSSL_VERSION_NUMBER >= 0x10100000L
+ // from crypto/bn/bn_lcl.h
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
