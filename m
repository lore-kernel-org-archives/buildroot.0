Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E592C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:10:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C4E60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6C4E60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93AF8424D6;
	Wed,  4 Aug 2021 01:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LePGkLyJVYJn; Wed,  4 Aug 2021 01:10:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C587424CE;
	Wed,  4 Aug 2021 01:10:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 39B8D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B40F414B4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rcO_pserGp34 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6340440F42
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B3D5785E9B; Tue,  3 Aug 2021 21:10:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:13:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d773c3e9ffcf12b737306c234e2ad4654310057f
X-Git-Newrev: 92024d4448f3cdd4974de0ac4317394f3760c7a8
X-Patchwork-Hint: ignore
Message-Id: <20210803211027.B3D5785E9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/supertuxkart: enable
 BlueZ HID Plugin
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

commit: https://git.buildroot.net/buildroot/commit/?id=92024d4448f3cdd4974de0ac4317394f3760c7a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When BlueZ is enabled ensure to select the BlueZ HID Plugin for wiimote support.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/supertuxkart/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 99f2310d82..8af006d632 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	select BR2_PACKAGE_OPENAL
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID if BR2_PACKAGE_BLUEZ5_UTILS # runtime
 	help
 	  Karts. Nitro. Action! SuperTuxKart is a free 3D arcade kart
 	  racer with multiple karts, tracks and modes you can play.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
