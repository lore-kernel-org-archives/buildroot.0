Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E91CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5848C411ED;
	Fri, 12 Jun 2026 11:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xOS0xoHgjm9J; Fri, 12 Jun 2026 11:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEF75411B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263382;
	bh=FXL3dhUUdp2cbQCm5bwtwrZVwsdOH8Zo/1utri3dolY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A2c3tbBYsNspDGg7D1NnnIco41sKHCeNdlbC5lB04QCgiSYId462uUoQZoHjHnUUK
	 QSsU0dXJMLAbTm7eNDg4149Sv8P/XLty6A1OMmKkG0rN50IvUs99Aw8AWIrXU+kz7b
	 ZYCAJ8My3iMyEz4koh3kaZmNaTJqy2zvdk59/rVwodtZf5lWMgAZE0vWCsP8ZaQhlK
	 hc2KlvQUENmefISZZdnDIyLa87zN8FpqqJmvG0ZXCGbn5togqCr1ObABJtb8gOZAM7
	 W55t7xLtZtZ13r0ayOfVPM/xm5oEcUZPv+t5libJNI54L1cbXXj7jPpr5aQcuFJ689
	 X8QVP8rSK5DwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEF75411B0;
	Fri, 12 Jun 2026 11:23:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1E9237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09EDD60F3D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUXNkdCvQppv for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEC2860F42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEC2860F42
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA175880DE; Fri, 12 Jun 2026 11:22:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:43:37 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 992d69bc528a59e1d69ab4cbebf7de843d6b0a18
X-Git-Newrev: bdbcabf44ec13b7c0c8e90bbb042f1b7d121c629
X-Patchwork-Hint: ignore
Message-Id: <20260612112214.AA175880DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/esp-hosted: don't
 treat warnings as errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdbcabf44ec13b7c0c8e90bbb042f1b7d121c629
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This driver fails to build because warnings are treated as errors but
this is too strict, breaking the build.

This used to be hidden by commit 6b56e0b4f0 ("linux: disable -Werror"),
which was reverted in commit a966f5cde5 ("Revert "linux: disable -Werror""),
so fix it by explicitly passing -Wno-error.

Fixes:
https://autobuild.buildroot.org/results/df3763e74de4071331a41140fb5528523af9e374/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Peter: add note about when issue was (re-)introduced]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit daf49629376b0f61aeb330e4f25dee495d398bc5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/esp-hosted/esp-hosted.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
index e6ded627fe..41cffceba5 100644
--- a/package/esp-hosted/esp-hosted.mk
+++ b/package/esp-hosted/esp-hosted.mk
@@ -34,5 +34,7 @@ else
 ESP_HOSTED_MODULE_MAKE_OPTS += ESP_SLAVE=CONFIG_TARGET_ESP32C6=y
 endif
 
+ESP_HOSTED_MODULE_MAKE_OPTS += KCFLAGS="-Wno-error"
+
 $(eval $(kernel-module))
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
