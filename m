Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7E5C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 756EA410B7;
	Sun, 27 Nov 2022 20:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 756EA410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQIHBqVjR0xy; Sun, 27 Nov 2022 20:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C814410B0;
	Sun, 27 Nov 2022 20:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C814410B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E46441BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF8AE816F5
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:25:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF8AE816F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TIAI3tjJarRo for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E656B8133D
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E656B8133D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D69EF8496E; Sun, 27 Nov 2022 20:25:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 21:12:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: cd4658b25ea54c2e5c0e066623ca1b6d6a2b0259
X-Git-Newrev: 72b156d60b5ddbb795ba6325f9919cf516c783db
X-Patchwork-Hint: ignore
Message-Id: <20221127202517.D69EF8496E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libopenssl: drop
 useless option for rc5
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

commit: https://git.buildroot.net/buildroot/commit/?id=72b156d60b5ddbb795ba6325f9919cf516c783db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Commit a83d41867c8d (package/libopenssl: add option to enable some
features) added an option to enable rc5. However, since commit
1fff94121936 (Fixup non-x86 openssl build), dated 2002-12-30, rc5
has always been forcibly disabled in Buildroot.

Given that it was unconditionally disabled all this time, and no
one complained, it means there is virtually no-one using rc5, so we
can just drop the option.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit d7178dd432e4905cf96383e5aa316553cf30f178)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                 | 7 +++++++
 package/libopenssl/Config.in     | 4 ----
 package/libopenssl/libopenssl.mk | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index cfbe2921cc..8db70cae5a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "libopenssl rc5 was never enabled"
+	select BR2_LEGACY
+	help
+	  The libopenssl option for rc5 never actually enabled rc5,
+	  which had always been disabled in Buildroot.
+
 config BR2_PACKAGE_PHP_EXT_WDDX
 	bool "php wddx removed"
 	select BR2_LEGACY
diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index fcead4c11a..00339238fb 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -44,10 +44,6 @@ config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
 	bool "enable CHACHA"
 	default y
 
-config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
-	bool "enable RC5"
-	default y
-
 config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
 	bool "enable RC2"
 	default y
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 50d41a6533..3542b89727 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -85,7 +85,6 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-fuzz-afl \
 			no-afalgeng \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
-			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
 			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
