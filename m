Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192E4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 14:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C210F4017C;
	Sun, 30 Jan 2022 14:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qeZYjLs4oykH; Sun, 30 Jan 2022 14:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA5D940146;
	Sun, 30 Jan 2022 14:28:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 040461BF425
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F404F4035B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 14:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzv0poZzLqG6 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 14:28:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5281340276
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 14:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A0CB982A52; Sun, 30 Jan 2022 14:21:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 15:18:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a865fc386d9e7b7e23e5bca051f38ab45920829f
X-Git-Newrev: 3af06834c80a5efe5696dac0aab81cb233cec334
X-Patchwork-Hint: ignore
Message-Id: <20220130142119.A0CB982A52@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poke: install libpoke.so to staging
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3af06834c80a5efe5696dac0aab81cb233cec334
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Poke generate a library libpoke.so, so install it to staging.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/poke/poke.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/poke/poke.mk b/package/poke/poke.mk
index fed023e954..ddd03ae3b0 100644
--- a/package/poke/poke.mk
+++ b/package/poke/poke.mk
@@ -13,6 +13,7 @@ POKE_LICENSE_FILES = COPYING jitter/COPYING
 # 0001-configure.ac-HELP2MAN-replace-by-false-when-cross-co.patch
 POKE_AUTORECONF = YES
 
+POKE_INSTALL_STAGING = YES
 POKE_DEPENDENCIES = host-flex host-bison host-pkgconf bdwgc readline
 
 # poke bundle gnulib that doesn't support the case where
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
