Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9624C001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87D5F81980;
	Mon,  3 Jul 2023 20:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87D5F81980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkoaGqpvEhnG; Mon,  3 Jul 2023 20:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45D081836;
	Mon,  3 Jul 2023 20:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45D081836
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E36CE1BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB87C40931
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:05:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB87C40931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id byCYIiJSLO8t for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:05:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B274091C
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8B274091C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C76D186584; Mon,  3 Jul 2023 20:05:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 22:04:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ee2bd48f11ec9362f6bdbec29a733296b7a01e7
X-Git-Newrev: cef05ae1566a4a62915362a46f17ace581908881
X-Patchwork-Hint: ignore
Message-Id: <20230703200534.C76D186584@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgcrypt: disable asm on i386
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

commit: https://git.buildroot.net/buildroot/commit/?id=cef05ae1566a4a62915362a46f17ace581908881
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/933/93330f9e1867b1ddc1de19b57d70d223b6f23994/

Code failing to build on i386 was added in libgcrypt-10.0.0
https://github.com/gpg/libgcrypt/commit/9d909cb67e70fd792926ac1e2ab305b2cc96bc27
which was added in buildroot with commit
d96b9ed0738bae270c479bdaf21eebd4c1f9930d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgcrypt/libgcrypt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 4fffe5360e..b74838b649 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -21,8 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
 	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
-# Libgcrypt doesn't support assembly for coldfire
-ifeq ($(BR2_m68k_cf),y)
+# disable asm for broken archs
+ifeq ($(BR2_i386)$(BR2_m68k_cf),y)
 LIBGCRYPT_CONF_OPTS += --disable-asm
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
