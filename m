Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720C3EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 12:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20118409F1;
	Mon, 17 Jul 2023 12:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20118409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fkdDcGp8T64T; Mon, 17 Jul 2023 12:14:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D98440646;
	Mon, 17 Jul 2023 12:14:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D98440646
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9E9C81BF34C
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7743760D4F
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 12:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7743760D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0TueLTm1LHez for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 12:14:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B792960B45
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 12:14:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B792960B45
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0FCD87165; Mon, 17 Jul 2023 12:14:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Jul 2023 13:50:02 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 01cbe2510598c51635e9f7274ec401ab408358a4
X-Git-Newrev: dbea8981a63bc14cc6c0ee7b6e9293ff3a4c7f22
X-Patchwork-Hint: ignore
Message-Id: <20230717121418.A0FCD87165@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/libgcrypt:
 disable asm on i386
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

commit: https://git.buildroot.net/buildroot/commit/?id=dbea8981a63bc14cc6c0ee7b6e9293ff3a4c7f22
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes:
http://autobuild.buildroot.net/results/933/93330f9e1867b1ddc1de19b57d70d223b6f23994/

Code failing to build on i386 was added in libgcrypt-10.0.0
https://github.com/gpg/libgcrypt/commit/9d909cb67e70fd792926ac1e2ab305b2cc96bc27
which was added in buildroot with commit
d96b9ed0738bae270c479bdaf21eebd4c1f9930d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cef05ae1566a4a62915362a46f17ace581908881)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
