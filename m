Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C2C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 20:24:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3517405E5;
	Sun, 27 Nov 2022 20:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3517405E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V787HKWftfbC; Sun, 27 Nov 2022 20:24:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20B8E402E0;
	Sun, 27 Nov 2022 20:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20B8E402E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A3801BF39F
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 543DB408A4
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 20:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 543DB408A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nA75XWB7ixnv for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E5C74035A
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E5C74035A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C06D848D1; Sun, 27 Nov 2022 20:23:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 21:11:38 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 311d28cc595e70087b6b3f140ae14d785358054a
X-Git-Newrev: 84389f18f88bbe59ec63a5c7156f6628d1a77937
X-Patchwork-Hint: ignore
Message-Id: <20221127202358.2C06D848D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libopenssl: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=84389f18f88bbe59ec63a5c7156f6628d1a77937
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
index 03814c0378..e0a38a2006 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.08"
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "libopenssl rc5 was never enabled"
+	select BR2_LEGACY
+	help
+	  The libopenssl option for rc5 never actually enabled rc5,
+	  which had always been disabled in Buildroot.
+
 config BR2_ECLIPSE_REGISTER
 	bool "Eclipse integration removed"
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
