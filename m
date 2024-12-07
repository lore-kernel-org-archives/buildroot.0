Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A69C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A5726FB82;
	Fri, 28 Feb 2025 16:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5E4iBbzhlynZ; Fri, 28 Feb 2025 16:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A30446FBEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30446FBEC;
	Fri, 28 Feb 2025 16:34:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 108D9711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFEEF41A19
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMqmAR8wLAKV for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DE61418F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3DE61418F7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 347DB83CA0; Fri, 28 Feb 2025 16:29:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Dec 2024 15:36:55 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 28c982b5f4ea6f4e619ab02ab62407d764f7d9f3
X-Git-Newrev: eedf9750ff8ade051892a5c4d2bc88e85dc4ebb8
X-Patchwork-Hint: ignore
Message-Id: <20250228162933.347DB83CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ibm-sw-tpm2: fix build
 with openssl 3.4.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=eedf9750ff8ade051892a5c4d2bc88e85dc4ebb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes:
http://autobuild.buildroot.net/results/be6c679b821183b4385c74471e26d9ad7d3d8967

Similar to the patch we for openssl 3.3.x added by commit 75ec656c36b
"package/ibm-sw-tpm2: fix build with openssl 3.3.x", add another patch to
bump the maximum supported openssl version to 3.4.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ToOsslMath.h-fix-build-with-openssl-3.4.x.patch | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch b/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
new file mode 100644
index 0000000000..e65c1c898b
--- /dev/null
+++ b/package/ibm-sw-tpm2/0003-src-BnToOsslMath.h-fix-build-with-openssl-3.4.x.patch
@@ -0,0 +1,45 @@
+From d59535c8c605f0b23abbefd9b23200b1a5e937fe Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Fri, 6 Dec 2024 20:35:35 +0100
+Subject: [PATCH] src/BnToOsslMath.h: fix build with openssl 3.4.x
+
+Openssl 3.4.x is out:
+https://github.com/openssl/openssl/blob/openssl-3.4.0/NEWS.md#openssl-34
+
+So bump the max supported version number similar to how it was done by
+commit 89a4cb9cf8 "src/BnToOsslMath.h: fix build with openssl 3.3.x" to fix
+build failures with 3.4.x:
+
+    In file included from BnValues.h:327,
+                     from Global.h:80,
+                     from Tpm.h:78,
+                     from AuditCommands.c:62:
+    TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
+       83 | #   error Untested OpenSSL version
+          |     ^~~~~
+
+Fixes:
+- http://autobuild.buildroot.net/results/be6c679b821183b4385c74471e26d9ad7d3d8967
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/17
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 72939ea..165304d 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30300ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30400ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.39.5
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
