Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D7CC53210
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 22:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87FF4418C7;
	Wed,  4 Jan 2023 22:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87FF4418C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cdZ1ydGU8VCP; Wed,  4 Jan 2023 22:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 855D7409A9;
	Wed,  4 Jan 2023 22:12:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 855D7409A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BEBD1BF3A3
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23233409A9
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 22:11:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23233409A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQacZ197icyx for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 22:11:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29DB7409EB
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 22:11:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DB7409EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 163DD875CF; Wed,  4 Jan 2023 22:11:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 23:08:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9a4e154c9c583e74846f7ec80ad01d78811722b0
X-Git-Newrev: 41aa369d01a4dd6646390066f44135d99f926fe4
X-Patchwork-Hint: ignore
Message-Id: <20230104221108.163DD875CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-rcw: drop bogus
 QORIQ_RCW_FILE_BIN
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

commit: https://git.buildroot.net/buildroot/commit/?id=41aa369d01a4dd6646390066f44135d99f926fe4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While applying [1] and cleaning up, the commit "d167f7006e
package/qoriq-rcw: add in-tree rcw source support" ended up keeping an
unused define.

Drop it now.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200207083857.28058-4-jerry.huang@nxp.com/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qoriq-rcw/qoriq-rcw.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 8b1ceacfce..b9c9e99222 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -59,7 +59,6 @@ endef
 else ifneq ($(QORIQ_RCW_INTREE),)
 
 QORIQ_RCW_PLATFORM = $(firstword $(subst /, ,$(QORIQ_RCW_INTREE)))
-QORIQ_RCW_FILE_BIN = $(lastword $(subst /, ,$(QORIQ_RCW_INTREE)))
 
 define HOST_QORIQ_RCW_BUILD_CMDS
 	$(MAKE) -C $(@D)/$(QORIQ_RCW_PLATFORM)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
