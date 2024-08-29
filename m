Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B28C83F16
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 16:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E38B3840BA;
	Thu, 29 Aug 2024 16:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tc2F9bzhbhZ0; Thu, 29 Aug 2024 16:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91E4881F77
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91E4881F77;
	Thu, 29 Aug 2024 16:17:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46DC11BF98E
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23DC281E9F
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 16:17:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eiSpQaoR2HXu for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 983A3812E6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 983A3812E6
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83ADF866CF; Thu, 29 Aug 2024 16:17:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 29 Aug 2024 18:04:45 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 83601534d3ffbb1c32d2e0556681eed57b10743e
X-Git-Newrev: 3d5741d911f5a44263458c63cc989ffc14b80877
X-Patchwork-Hint: ignore
Message-Id: <20240829161701.83ADF866CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/ibm-sw-tpm2: fix
 build with openssl 3.3.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d5741d911f5a44263458c63cc989ffc14b80877
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Fix the following build failure with openssl 3.3.x raised since commit
6d5ce8609f17a3403d1148a0bbf7a2bdb5ec7f67:

In file included from BnValues.h:327,
                 from Global.h:80,
                 from Tpm.h:78,
                 from AuditCommands.c:62:
TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
   83 | #   error Untested OpenSSL version
      |     ^~~~~

Fixes: 6d5ce8609f17a3403d1148a0bbf7a2bdb5ec7f67
 - http://autobuild.buildroot.org/results/2fb5e1cb792fe25ef860ff8111622cd1ff3770bf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 75ec656c36ba2b5bf617acc6e946ef7aa97f948e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ToOsslMath.h-fix-build-with-openssl-3.3.x.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch b/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
new file mode 100644
index 0000000000..a349c05d4c
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-src-BnToOsslMath.h-fix-build-with-openssl-3.3.x.patch
@@ -0,0 +1,40 @@
+From 1b5d9eb91f0d24d09d711ef839d301ee8b640d61 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 21 Jul 2024 09:08:39 +0200
+Subject: [PATCH] src/BnToOsslMath.h: fix build with openssl 3.3.x
+
+Fix the following build failure with openssl 3.3.x:
+
+In file included from BnValues.h:327,
+                 from Global.h:80,
+                 from Tpm.h:78,
+                 from AuditCommands.c:62:
+TpmToOsslMath.h:83:5: error: #error Untested OpenSSL version
+   83 | #   error Untested OpenSSL version
+      |     ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2fb5e1cb792fe25ef860ff8111622cd1ff3770bf
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/15
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index df4bcfb..72939ea 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30200ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x30300ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
