Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EE2C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 14:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC0D683F21;
	Sun, 18 Sep 2022 14:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC0D683F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 90tBfkDhm_Hu; Sun, 18 Sep 2022 14:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F21D983F1F;
	Sun, 18 Sep 2022 14:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F21D983F1F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BFCC51BF34A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 967264088A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 967264088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QMMhgF-snH0R for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 14:15:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7EAA403AC
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:15:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7EAA403AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93428851C9; Sun, 18 Sep 2022 14:15:25 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 16:15:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af494d92d3d065a8939f0567bfbf312d177048f2
X-Git-Newrev: 7719e4525d895a59e5b5c522ce82f6c03b2df68f
X-Patchwork-Hint: ignore
Message-Id: <20220918141525.93428851C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: drop autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=7719e4525d895a59e5b5c522ce82f6c03b2df68f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b936a95d021d73e (package/openssh: bump to version 9.0p1) dropped the
patch touching m4/openssh.m4, but forgot to remove autoreconf.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openssh/openssh.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 63a28f3af5..a8c32f3d33 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -13,9 +13,6 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
 OPENSSH_LICENSE_FILES = LICENCE
 
-# patch touching m4/openssh.m4
-OPENSSH_AUTORECONF = YES
-
 OPENSSH_CONF_ENV = \
 	LD="$(TARGET_CC)" \
 	LDFLAGS="$(TARGET_CFLAGS)" \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
