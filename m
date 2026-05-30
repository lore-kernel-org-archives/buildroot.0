Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D69CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:38:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D1D42B61;
	Sat, 30 May 2026 09:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPP1nIS0S5GZ; Sat, 30 May 2026 09:38:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B197142B4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780133909;
	bh=g5te7WNJ2bnHLbUAVPQ6QxVjys99ZjC0Uu/UySJKniI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fHbE56yv6mFiEbvu70wN+xzLGtOwdCqgTkadUlCzVHrEXO2zypSJ5CetOIp+dvIcq
	 SxYloAAd0fMWFB02lkYvLR/hjOuj8HA/YJak7JxEuGvrR7Cnu+7AQ5x1oUSzqnEU/q
	 h4RxQUDYVLiml1C7RY6OEfYObOXDOJQvM2MbQ3NztstWyToFgNCyTc5mQuf8ncoE3w
	 zrIaAzH67FCtZSm35357Uz40JzT6DTXhlr46OiriOTsU956NKrmF+GK85bhDvbw9av
	 2OGfQRHeq72KrrBqBTiM3kAYiknQ0R8pnFAfLH5QwPz4Pticpf1bYxzv469Hzrs3Zq
	 vwE+XKP6UwMCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B197142B4F;
	Sat, 30 May 2026 09:38:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36BD7218
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26010407D2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:38:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2TBiGzHy5EEZ for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:38:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76912406F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76912406F0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:38:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EC6B86E6F; Sat, 30 May 2026 09:38:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 11:33:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f8905d38c65e46cf1242a9f7bd7fb4b5b2b9b91
X-Git-Newrev: 0ceddf2ac04829ce75d03c18c47073c04ab4d92b
X-Patchwork-Hint: ignore
Message-Id: <20260530093813.5EC6B86E6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/drm-info: propagate json-c
 dependencies
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0ceddf2ac04829ce75d03c18c47073c04ab4d92b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_JSON_C
  Depends on [n]: BR2_TOOLCHAIN_HAS_SYNC_4 [=n]
  Selected by [y]:
  - BR2_PACKAGE_DRM_INFO [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/drm-info/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/drm-info/Config.in b/package/drm-info/Config.in
index 49b8fd6f2c..1a6e11e696 100644
--- a/package/drm-info/Config.in
+++ b/package/drm-info/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DRM_INFO
 	bool "drm_info"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # json-c
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	select BR2_PACKAGE_JSON_C
 	select BR2_PACKAGE_LIBDRM
@@ -9,4 +10,5 @@ config BR2_PACKAGE_DRM_INFO
 	  https://gitlab.freedesktop.org/emersion/drm_info
 
 comment "drm_info needs a toolchain w/ threads"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
