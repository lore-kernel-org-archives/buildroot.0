Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA222CD1292
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACACC40B11;
	Sun,  7 Apr 2024 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m_DcqV578n6K; Sun,  7 Apr 2024 19:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BC7340B24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BC7340B24;
	Sun,  7 Apr 2024 19:49:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8AB1BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58A4E60A65
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tCenL8c84-GB for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7BF60A5E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E7BF60A5E
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7106485C77; Sun,  7 Apr 2024 19:49:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 21:44:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8df468c7b192dec02440436767eccd51f5a4c3f
X-Git-Newrev: 3a2891621c35fea394b135256c7a0846ece442aa
X-Patchwork-Hint: ignore
Message-Id: <20240407194943.7106485C77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to version
 5.7.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3a2891621c35fea394b135256c7a0846ece442aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vulnerabilities
 - [High] CVE-2024-0901 Potential denial of service and out of bounds
   read. Affects TLS 1.3 on the server side when accepting a connection
   from a malicious TLS 1.3 client. If using TLS 1.3 on the server side
   it is recommended to update the version of wolfSSL used.
 - [Med] CVE-2024-1545 Fault Injection vulnerability in
   RsaPrivateDecryption function that potentially allows an attacker
   that has access to the same system with a victims process to perform
   a Rowhammer fault injection.
 - [Med] Fault injection attack with EdDSA signature operations. This
   affects ed25519 sign operations where the system could be susceptible
   to Rowhammer attacks.

No official tarball provided so switch to github and set autoreconf

https://github.com/wolfSSL/wolfssl/releases/tag/v5.7.0-stable

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/wolfssl/wolfssl.hash | 2 +-
 package/wolfssl/wolfssl.mk   | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index 59e42e98b9..e705bba9fd 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  75aaafe3b8c776d1ac417288116c8d444115f9fac5acb382a39a7d163dfd618d  wolfssl-5.6.6.tar.gz
+sha256  2de93e8af588ee856fe67a6d7fce23fc1b226b74d710b0e3946bc8061f6aa18f  wolfssl-5.7.0.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 68c69afd59..893408eca4 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.6.6
-WOLFSSL_SITE = https://github.com/wolfSSL/wolfssl/releases/download/v$(WOLFSSL_VERSION)-stable
+WOLFSSL_VERSION = 5.7.0
+WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
 WOLFSSL_LICENSE = GPL-2.0+
 WOLFSSL_LICENSE_FILES = COPYING LICENSING
 WOLFSSL_CPE_ID_VENDOR = wolfssl
 WOLFSSL_CONFIG_SCRIPTS = wolfssl-config
+# From git
+WOLFSSL_AUTORECONF = YES
 WOLFSSL_DEPENDENCIES = host-pkgconf
 
 WOLFSSL_CONF_OPTS = --disable-examples --disable-crypttests
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
