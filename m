Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E34C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:17:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8182E60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8182E60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 505D3401F5;
	Wed,  4 Aug 2021 01:17:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dYoQKFaepsp7; Wed,  4 Aug 2021 01:17:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DA1D40330;
	Wed,  4 Aug 2021 01:17:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ADE771BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB6C3600B4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E_GRned72MQh for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:25:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B39760896
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:25:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 48A2F8B475; Tue,  3 Aug 2021 21:25:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 23:24:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0344be5299259c9f3e2e928b51af6868948e78bc
X-Git-Newrev: 0aea8427108bef1610cfd4dcf6241959b207adaa
X-Patchwork-Hint: ignore
Message-Id: <20210803212500.48A2F8B475@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez5_utils: hid2hci needs tools
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=0aea8427108bef1610cfd4dcf6241959b207adaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/9f91d530c22cad053d89a7bf54c4567d3012d05e
http://autobuild.buildroot.net/results/80b90e1b6fee99ed7bf4aed87a14311a12469993
http://autobuild.buildroot.net/results/444eaab22b140b26a730c7fdd4bada71a8d6fef2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez5_utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index a8232279bd..2eea8c7ced 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -143,6 +143,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TOOLS_HID2HCI
 	bool "build hid2hci tool"
 	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
+	select BR2_PACKAGE_BLUEZ5_UTILS_TOOLS
 	help
 	  Build hid2hci tool
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
