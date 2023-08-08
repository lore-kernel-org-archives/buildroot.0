Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE9BC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 05:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E55581F33;
	Tue,  8 Aug 2023 05:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E55581F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1_PG-Vn5AbO; Tue,  8 Aug 2023 05:01:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C03BB81F29;
	Tue,  8 Aug 2023 05:01:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C03BB81F29
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89D671BF969
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63837402D7
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63837402D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QEb4ut3PK3dF for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 05:01:30 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09EB340102
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 05:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09EB340102
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id 30857A05F5
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 07:01:28 +0200 (CEST)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix01.mail.de (Postfix) with ESMTP id 162B980069;
 Tue,  8 Aug 2023 07:01:28 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id D44FE100140;
 Tue,  8 Aug 2023 07:01:27 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 07:01:21 +0200
Message-Id: <20230808050122.6788-2-kilian.zinnecker@mail.de>
In-Reply-To: <20230808050122.6788-1-kilian.zinnecker@mail.de>
References: <20230808050122.6788-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1188
X-purgate-ID: 154282::1691470887-90D0F7B6-CBC88B74/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691470888;
 bh=rCKloYfnaKPty9/yYaE7EVqwh4XESXZxwU5+kpO7Oa8=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=bh2fAIjjE4a+6zAOUGLHuVqshWK6dX8xpsiJ7smgVbkEIMv3PbPlAC2CiLjhB4GfV
 9+rjhuML1TinqGvvW/R3CpDbHDGR/+LJcFbfwXwxmasdPbn421Zb4b0Hhen6KLX2d3
 iNdeZYkK75DgAZlHIytUB+6pQKg50eiK0d5Px22tQ95fUDnhPzfAVqloOP+yU/OAA7
 5SiQYfso7hb1g7Jy3mYepXfF50df/vhuX0vgGWb/raAw3e87qWW3/zkdW9o65gnAA8
 nLq3V+KIeBj+1IHnR7DTxMr9g0Mc0rN/K1b4kGcqPK87Ovi1NbVLoBPS6WAEji58SZ
 GlxfMC+vSE7pA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=bh2fAIjj
Subject: [Buildroot] [PATCH 1/2] configs/rock5b: Freeze gcc to version 11
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch sets the gcc version to use for the Radxa Rock 5B to
version 11. Recently the gcc default version in buildroot was
changed to gcc 12. However, the used kernel for the Rock 5B is a
custom kernel, provided by Radxa, with specific changes. It is
derived from a 5.10 version of the mainline kernel. When compiled
with gcc 12 some kernel code parts break, due to warnings. Some of
those parts are fixed in later versions of the mainline kernel.
Others are parts customized, non-mainline code, for which no fix
seems to exist currently.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 configs/rock5b_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 6e525d9676..93d34f8cf3 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -6,6 +6,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=""
 BR2_TARGET_GENERIC_HOSTNAME="rock5b"
 BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
 BR2_SYSTEM_DHCP="eth0"
+BR2_GCC_VERSION_11_X=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
