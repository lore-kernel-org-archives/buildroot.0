Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B88C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:14:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 397DD60FF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 397DD60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D9A483668;
	Mon,  2 Aug 2021 15:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWfzyXqA3EKf; Mon,  2 Aug 2021 15:14:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 149F982D17;
	Mon,  2 Aug 2021 15:14:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5CA61BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A58EC401C1
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YW3gzWi3e53r for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B39404053F
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E8A558A578; Mon,  2 Aug 2021 15:14:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:10:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a3f9fb6085993f9c48dd827e844795aad12e5306
X-Git-Newrev: cc02541b30d658c2b84d90715dbd4b8395e6614a
X-Patchwork-Hint: ignore
Message-Id: <20210802151418.E8A558A578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brltty: enable bluez HID plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc02541b30d658c2b84d90715dbd4b8395e6614a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

brltty builds with bluetooth support when bluez is enabled.
Ensure the HID Plugin is enabled.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/brltty/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/brltty/Config.in b/package/brltty/Config.in
index de11af3bbe..c728cb7e20 100644
--- a/package/brltty/Config.in
+++ b/package/brltty/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BRLTTY
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
 	help
 	  A daemon providing access to the Linux console for a blind
 	  person using a refreshable braille display.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
