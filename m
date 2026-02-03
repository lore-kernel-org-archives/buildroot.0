Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE8DE8B366
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CEC3608A6;
	Tue,  3 Feb 2026 21:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uNemuvbqWo0V; Tue,  3 Feb 2026 21:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51CAD60904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154737;
	bh=lRmYhzrP065MzNRwj3AdQwgY9tB67vr00uFg4tq+/MU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ef8SnafqzAftOrISgJceshp5DAuH4HSOVhVFrjDc9u8HE91DW8cXqDErsCd1pyLzz
	 h8fePlzzDUIYT7o0ST4NNJgxiXL0YYGQiNZ9sv3KoLNRRbgfqWfjT17uenq+aImdz3
	 //xidl7Y80iKf191bc5YtmxLtTCgbYKSrtp3EFoTjejMZeEIDII9uou1I3l+uxYqxX
	 3O7MWWa9g26bK81K2J+sg15DWmDtJ2aM/2L+8vTwU08E6Uhmf0Q7iHnJYMdf2b4whn
	 VX/q4t0XgLw+5LR+xeWqkezAwHFMwSV3u6Y/FZKD/fSn26W+xeraLNJn21o6H6U5aQ
	 JG1hoYLKMZG1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51CAD60904;
	Tue,  3 Feb 2026 21:38:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E28C4F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEA3883DF5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L9xQfectBH4X for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F35AC83DF4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F35AC83DF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:38:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB97C86747; Tue,  3 Feb 2026 21:38:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:34:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 49e7a554f2814e324b96db45daf8856ea7da0804
X-Git-Newrev: 83815826469ac94b76b5aee8c61af95989f91f46
X-Patchwork-Hint: ignore
Message-Id: <20260203213854.DB97C86747@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pico-sdk: replace
 $(HOST_DIR)/usr/share with $(HOST_DIR)/share
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1105909783776248841=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1105909783776248841==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=83815826469ac94b76b5aee8c61af95989f91f46
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit adding host-pico-sdk [1] introduced $(HOST_DIR)/usr/share
while it should be $(HOST_DIR)/share. Fix the error reported by
check-package.

[1] ceb800d3c63fe91628f42ce749c211ebef278628

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12973112667

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/pico-sdk/pico-sdk.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 5bcf71650d..dfb29d2320 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -20,8 +20,8 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 endef
 
 define HOST_PICO_SDK_INSTALL_CMDS
-	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
-	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+	mkdir -p $(HOST_DIR)/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/share/pico-sdk
 endef
 
 $(eval $(generic-package))

--===============1105909783776248841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1105909783776248841==--
