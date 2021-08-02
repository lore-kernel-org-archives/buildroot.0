Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63CB6C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:14:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 231D160FC2
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 231D160FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA97A402EC;
	Mon,  2 Aug 2021 15:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i4ZAoW3DJ29H; Mon,  2 Aug 2021 15:14:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CC7340275;
	Mon,  2 Aug 2021 15:14:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA4671BF981
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAB1E825C7
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:14:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qiG6mW2h5DJ for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A960E83183
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:14:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id DCE878A577; Mon,  2 Aug 2021 15:14:18 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 Aug 2021 17:09:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dcadf5c2897f1a2644db3db0bdb3443e3edc4f2
X-Git-Newrev: a3f9fb6085993f9c48dd827e844795aad12e5306
X-Patchwork-Hint: ignore
Message-Id: <20210802151418.DCE878A577@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bluez-alsa: select BlueZ audio
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3f9fb6085993f9c48dd827e844795aad12e5306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The A2DP/AVCRP plugins now have to be explicitly selected.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/bluez-alsa/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bluez-alsa/Config.in b/package/bluez-alsa/Config.in
index a31d125d9d..42bb9133bf 100644
--- a/package/bluez-alsa/Config.in
+++ b/package/bluez-alsa/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_BLUEZ_ALSA
 	depends on BR2_USE_WCHAR # libglib2
 	select BR2_PACKAGE_ALSA_LIB
 	select BR2_PACKAGE_BLUEZ5_UTILS
+	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_SBC
 	help
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
