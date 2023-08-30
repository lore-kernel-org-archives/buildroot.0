Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92CCBC83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A07D41DBE;
	Wed, 30 Aug 2023 11:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A07D41DBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMgY3yW_bjlW; Wed, 30 Aug 2023 11:05:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC62041D9D;
	Wed, 30 Aug 2023 11:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC62041D9D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4171BF282
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 726868140A
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 726868140A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYfvIp4jQjnA for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69053814A1
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69053814A1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BA7786589; Wed, 30 Aug 2023 11:03:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:55:05 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e57158821e4225bdef7dc265a0843147e5b3632c
X-Git-Newrev: f6706817e7ca26c8589d816481b9a5155ac7cf33
X-Patchwork-Hint: ignore
Message-Id: <20230830110347.4BA7786589@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/seatd: fix seatd
 group name
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

commit: https://git.buildroot.net/buildroot/commit/?id=f6706817e7ca26c8589d816481b9a5155ac7cf33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The seatd service was changed to use the "seat" group in version 0.6.0:
https://git.sr.ht/~kennylevinsen/seatd/commit/5535c2c3b19b42ebfe4c451600059e9418e401a6

In buildroot we updated seatd past version 0.6.0 in commit:
c54f85ca0d2ba7b73c899a27e62c67d3389617b8

However we forgot to fix the group name when doing so.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 50a8d8330bf5ac9a3f7a52e83a5316bd40fe0ec9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
