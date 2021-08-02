Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE762C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:15:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B906860FF2
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B906860FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9424C6082E;
	Mon,  2 Aug 2021 15:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aBRbx6wwlGfx; Mon,  2 Aug 2021 15:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8B96081B;
	Mon,  2 Aug 2021 15:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D66BA1BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C644B401CC
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YTeNwIAYuK5q for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E82C4052D
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CF79F8A579; Mon,  2 Aug 2021 15:14:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:09:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78428b24a8c482639f9b1e5383bd301ef1a0eab6
X-Git-Newrev: 7dcadf5c2897f1a2644db3db0bdb3443e3edc4f2
X-Patchwork-Hint: ignore
Message-Id: <20210802151418.CF79F8A579@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cwiid: select BlueZ HID plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=7dcadf5c2897f1a2644db3db0bdb3443e3edc4f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

the HID plugin now needs to be explictly enabled.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/cwiid/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 374a91ffd6..e03248c722 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_CWIID
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID # runtime
 	help
 	  A collection of Linux tools written in C for interfacing to
 	  the Nintendo Wiimote.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
