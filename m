Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E258EC433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 12:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B4B340195;
	Thu, 24 Nov 2022 12:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B4B340195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsQ2xxZ9Un_g; Thu, 24 Nov 2022 12:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91CE74041C;
	Thu, 24 Nov 2022 12:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91CE74041C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 993C11BF287
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8286A40195
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8286A40195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OHCOH9dZEiSq for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 12:45:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AED644017E
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 12:45:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AED644017E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9933F84504; Thu, 24 Nov 2022 12:45:46 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 13:39:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a11b36089b34dcf0c1b90835a436f50efec3d8fb
X-Git-Newrev: d7178dd432e4905cf96383e5aa316553cf30f178
X-Patchwork-Hint: ignore
Message-Id: <20221124124546.9933F84504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libopenssl: drop useless option
 for rc5
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7178dd432e4905cf96383e5aa316553cf30f178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 Config.in.legacy                 | 7 +++++++
 package/libopenssl/Config.in     | 4 ----
 package/libopenssl/libopenssl.mk | 1 -
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 7458fa331e..b3c35d6b07 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "libopenssl rc5 was never enabled"
+	select BR2_LEGACY
+	help
+	  The libopenssl option for rc5 never actually enabled rc5,
+	  which had always been disabled in Buildroot.
+
 config BR2_PACKAGE_LIBDCADEC
 	bool "package was deprecated upstream, use ffmpeg instead"
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
