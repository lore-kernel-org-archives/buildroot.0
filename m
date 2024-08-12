Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7CCC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB1D80AB4;
	Mon, 12 Aug 2024 20:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v4Ve82pa9-iI; Mon, 12 Aug 2024 20:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4525E80AD0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4525E80AD0;
	Mon, 12 Aug 2024 20:49:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8799C1BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 733D4405B0
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2i__KFFRgyK for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E5E405AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76E5E405AE
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:49:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6007B85536; Mon, 12 Aug 2024 20:49:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 22:18:20 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 300d507c2efd3201ddb6c9d8116711a85288003e
X-Git-Newrev: 09cee6ad435d16fb1d4681591e28c597bc3e7b33
X-Patchwork-Hint: ignore
Message-Id: <20240812204943.6007B85536@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/wolfssl: security
 bump to version 5.7.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=09cee6ad435d16fb1d4681591e28c597bc3e7b33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

- Fix CVE-2024-1544, CVE-2024-5288, CVE-2024-5991 and CVE-2024-5814
- Disable option checking which is enabled by default since
  https://github.com/wolfSSL/wolfssl/commit/412447ac416ce76ba2a9bebbea8917258ed4c81e

https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.2-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f13e0014a548244cd0e617ab60b47c68c872f823)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index e705bba9fd..9a1e8bfd4a 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  2de93e8af588ee856fe67a6d7fce23fc1b226b74d710b0e3946bc8061f6aa18f  wolfssl-5.7.0.tar.gz
+sha256  0f2ed82e345b833242705bbc4b08a2a2037a33f7bf9c610efae6464f6b10e305  wolfssl-5.7.2.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 893408eca4..91ab7ca08a 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.7.0
+WOLFSSL_VERSION = 5.7.2
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
@@ -16,7 +16,10 @@ WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
 WOLFSSL_AUTORECONF = YES
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
-WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
+WOLFSSL_CONF_OPTS = \
+	--disable-examples \
+	--disable-crypttests \
+	--disable-option-checking
 
 ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
 WOLFSSL_CONF_OPTS += --enable-all
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
