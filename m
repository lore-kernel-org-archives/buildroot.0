Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9F8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 13:43:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C0BB610A8;
	Thu, 12 May 2022 13:43:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0K7QrkLh94i; Thu, 12 May 2022 13:43:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 471EF60BFF;
	Thu, 12 May 2022 13:43:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02BD11BF3C3
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 13:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E65D083EE4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id apb-d5k-Cd-u for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 13:43:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29F8583EDC
 for <buildroot@busybox.net>; Thu, 12 May 2022 13:43:26 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 32EFE440605;
 Thu, 12 May 2022 16:42:08 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1652362928;
 bh=Y5rL8XGiCNxdcVFLvdALmxAUa/2gQpyRcylUscq99rk=;
 h=From:To:Cc:Subject:Date:From;
 b=C19NEms6aobwCd4xgSCjHUnld9m9NGsDBPYl+btANA/qy1wPvz+i5ku4aVdAKz2ro
 5o0k57OjNOVSmqui0lBcRt2nMcZQy5XeXJg5gqrlFgNZT9iirkg3KNLuNOUGJdSHd3
 L3CApH5Y0GBygDSlA0fKoOx2JQbSUs5MoXGzCVAyExB3S8Mjh3YJILevLfETnewX4q
 08Rjvat2g8YNEd+WG6TmVtbqFc55BD/nsujiULFja34i7mBUPUbKShR95J5ZVaq1FP
 vzeRS5EH3d6Y6U+Dt1q9i4+lsSXcJ3tdT9Yv+27faScKBrIFAxZi7qvzYRd+69yBOu
 cfnjJHO1HSMdw==
To: buildroot@busybox.net
Date: Thu, 12 May 2022 16:42:47 +0300
Message-Id: <6588b9e983ce137243bb72afad96bab8a595bf32.1652362968.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/pciutils: requires C99
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since version 3.8.0 pciutils requires C99 toolchain as documented in its
README file. Use the gnu99 variant because the code requires the GNU
extended getopt(3) and the 'asm' keyword.

Fixes:
http://autobuild.buildroot.net/results/1c9988105b64594185a4002ca046aec8b87ea141/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/pciutils/pciutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index c1445968b91c..140276dbc47e 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -13,7 +13,7 @@ PCIUTILS_LICENSE_FILES = COPYING
 PCIUTILS_MAKE_OPTS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	HOST="$(NORMALIZED_ARCH)-linux" \
-	OPT="$(TARGET_CFLAGS)" \
+	OPT="$(TARGET_CFLAGS) -std=gnu99" \
 	LDFLAGS="$(TARGET_LDFLAGS)" \
 	DNS=no \
 	STRIP=
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
