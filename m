Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714F2C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DF344EFBD;
	Tue, 21 Feb 2023 00:11:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DF344EFBD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJ49JQ18ynL8; Tue, 21 Feb 2023 00:11:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 062514F0A9;
	Tue, 21 Feb 2023 00:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062514F0A9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 141711BF27E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F8FC6FAB4
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F8FC6FAB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-x5lEtkaKNS for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A5F61B25
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0A5F61B25
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD89D828C8; Mon, 20 Feb 2023 20:52:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 23:08:15 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a4e154c9c583e74846f7ec80ad01d78811722b0
X-Git-Newrev: 41aa369d01a4dd6646390066f44135d99f926fe4
X-Patchwork-Hint: ignore
Message-Id: <20230220205225.AD89D828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qoriq-rcw: drop bogus
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
