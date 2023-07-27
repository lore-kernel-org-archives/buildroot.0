Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654D3C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 21:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2005581E6B;
	Thu, 27 Jul 2023 21:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2005581E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W7nb59TNmAZO; Thu, 27 Jul 2023 21:17:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652D884054;
	Thu, 27 Jul 2023 21:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652D884054
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 890061BF98E
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DBE541FFC
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 21:16:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DBE541FFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nbynazUXl7eY for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 21:16:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E11741FF6
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 21:16:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E11741FF6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CD0583739; Thu, 27 Jul 2023 21:16:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:16:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6b96fbd62b286d6a1da80d847d511d591fd1692
X-Git-Newrev: 50a8d8330bf5ac9a3f7a52e83a5316bd40fe0ec9
X-Patchwork-Hint: ignore
Message-Id: <20230727211652.5CD0583739@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/seatd: fix seatd group name
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

commit: https://git.buildroot.net/buildroot/commit/?id=50a8d8330bf5ac9a3f7a52e83a5316bd40fe0ec9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The seatd service was changed to use the "seat" group in version 0.6.0:
https://git.sr.ht/~kennylevinsen/seatd/commit/5535c2c3b19b42ebfe4c451600059e9418e401a6

In buildroot we updated seatd past version 0.6.0 in commit:
c54f85ca0d2ba7b73c899a27e62c67d3389617b8

However we forgot to fix the group name when doing so.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/seatd/seatd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 96caf63b30..dbe9ac3154 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -33,7 +33,7 @@ ifeq ($(BR2_PACKAGE_SEATD_DAEMON),y)
 SEATD_CONF_OPTS += -Dlibseat-seatd=enabled -Dserver=enabled
 
 define SEATD_USERS
-	- - video -1 - - - - -
+	- - seat -1 - - - - -
 endef
 
 define SEATD_INSTALL_INIT_SYSV
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
