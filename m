Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FCBC6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8435341C49;
	Wed, 30 Aug 2023 11:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8435341C49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PeMLvqmtDvOf; Wed, 30 Aug 2023 11:03:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3435C41C62;
	Wed, 30 Aug 2023 11:03:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3435C41C62
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E6781BF98D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A74B4168D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A74B4168D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OQ34WzYMlhzi for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 411C141696
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 411C141696
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2ECCC8655E; Wed, 30 Aug 2023 11:02:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 12:54:57 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: f2cfe1d28c093d2abeef0d86d73022d6c6deea24
X-Git-Newrev: e9ca6ecae41162dfa73c1e618769371ed74f46bc
X-Patchwork-Hint: ignore
Message-Id: <20230830110242.2ECCC8655E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/seatd: fix seatd
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

commit: https://git.buildroot.net/buildroot/commit/?id=e9ca6ecae41162dfa73c1e618769371ed74f46bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
