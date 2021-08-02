Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4ECEC4320A
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:16:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EE4160FC0
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8EE4160FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F05A40410;
	Mon,  2 Aug 2021 15:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6DVJQf-ZPL9J; Mon,  2 Aug 2021 15:16:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81A9C403D9;
	Mon,  2 Aug 2021 15:16:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E34F1BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 316B54020E
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f7V9NqWjjdpK for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15CD7400A9
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 451778A576; Mon,  2 Aug 2021 15:14:19 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:13:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 92024d4448f3cdd4974de0ac4317394f3760c7a8
X-Git-Newrev: 001949f6b52330a18d3bfe5ed0983843e1ae1669
X-Patchwork-Hint: ignore
Message-Id: <20210802151419.451778A576@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: enable BlueZ Audio and HID
 plugins
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

commit: https://git.buildroot.net/buildroot/commit/?id=001949f6b52330a18d3bfe5ed0983843e1ae1669
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Bluetooth support is enabled ensure to enable the Audio and
HID plugins.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/kodi/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f702ae841a..074a457d1b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -129,6 +129,8 @@ config BR2_PACKAGE_KODI_BLUEZ
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # bluez5_utils
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # bluez5_utils
 	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_HID
 	help
 	    Enable bluetooth support
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
