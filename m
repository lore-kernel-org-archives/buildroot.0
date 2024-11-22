Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6733CE6916C
	for <buildroot@archiver.kernel.org>; Fri, 22 Nov 2024 16:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31AC2613A3;
	Fri, 22 Nov 2024 16:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2yfwZob0C1rz; Fri, 22 Nov 2024 16:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E2361397
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03E2361397;
	Fri, 22 Nov 2024 16:07:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BAF6B69
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:07:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C8F142B3B
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:07:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6wlm0ro1YNh for <buildroot@buildroot.org>;
 Fri, 22 Nov 2024 16:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78EAE42B3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 78EAE42B3A
 for <buildroot@buildroot.org>; Fri, 22 Nov 2024 16:07:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 666EB865AD; Fri, 22 Nov 2024 16:07:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Nov 2024 15:31:16 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: d81cd0b488dd42fc00531cfec6968c4a1997e61a
X-Git-Newrev: f956d40c81a7fee80c42134a88c5b45d2dc6dac6
X-Patchwork-Hint: ignore
Message-Id: <20241122160746.666EB865AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/mbedtls: security
 bump to 2.28.9
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f956d40c81a7fee80c42134a88c5b45d2dc6dac6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Fixes CVE-2024-45157: CTR_DRBG prioritized over HMAC_DRBG as the PSA DRBG

https://mbed-tls.readthedocs.io/en/latest/security-advisories/mbedtls-security-advisory-2024-08-1/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Peter: add CVE / advisory details]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 64884430074aa420be48d2e63665c36673aa5e4c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbedtls/mbedtls.hash | 4 ++--
 package/mbedtls/mbedtls.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 5466b0e7de..9de7f731da 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,4 +1,4 @@
-# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.8:
-sha256  241c68402cef653e586be3ce28d57da24598eb0df13fcdea9d99bfce58717132  mbedtls-2.28.8.tar.bz2
+# From https://github.com/ARMmbed/mbedtls/releases/tag/v2.28.9:
+sha256  e85ea97aaf78dd6c0a5ba2e54dd5932ffa15f39abfc189c26beef7684630c02b  mbedtls-2.28.9.tar.bz2
 # Locally calculated
 sha256  9b405ef4c89342f5eae1dd828882f931747f71001cfba7d114801039b52ad09b  LICENSE
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 9757b8b080..2faa6dff55 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MBEDTLS_VERSION = 2.28.8
-MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/v$(MBEDTLS_VERSION)
+MBEDTLS_VERSION = 2.28.9
+MBEDTLS_SITE = https://github.com/Mbed-TLS/mbedtls/releases/download/mbedtls-$(MBEDTLS_VERSION)
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION).tar.bz2
 MBEDTLS_CONF_OPTS = \
 	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -std=c99" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
