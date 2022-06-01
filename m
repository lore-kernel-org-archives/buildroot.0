Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76124C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45874184E;
	Wed,  1 Jun 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXIQkK0I7g7E; Wed,  1 Jun 2022 21:33:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E933C417BB;
	Wed,  1 Jun 2022 21:33:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2F8C81BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1211E82882
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eZ4bUMwdOMHG for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:33:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5637782864
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:33:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BCD9286945; Wed,  1 Jun 2022 21:21:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:22:37 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 0ca7ed66f51b7dd1b037ae444654cccc391c3035
X-Git-Newrev: dac6e3011883ce3b35cbf64ec156186153bf0032
X-Patchwork-Hint: ignore
Message-Id: <20220601212144.BCD9286945@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nettle: add build
 support for host
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

commit: https://git.buildroot.net/buildroot/commit/?id=dac6e3011883ce3b35cbf64ec156186153bf0032
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nettle/nettle.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 3dbd0cb94b..bc3708ca94 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -27,3 +27,4 @@ NETTLE_CONF_OPTS += --disable-arm-neon
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
