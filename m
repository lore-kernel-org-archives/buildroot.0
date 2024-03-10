Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA0C54E58
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 10:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1997440716;
	Sun, 10 Mar 2024 10:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VLLHCeXZ2PDe; Sun, 10 Mar 2024 10:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C599240718
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C599240718;
	Sun, 10 Mar 2024 10:48:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E3961BF41D
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 10:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 287E681E37
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 10:48:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IVQsjA8WVW8p for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 10:48:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 737BF81CA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 737BF81CA7
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 737BF81CA7
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 10:48:15 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout01.mail.de (Postfix) with ESMTP id 8A271240D42
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 11:48:13 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix03.mail.de (Postfix) with ESMTP id 6EBB480147;
 Sun, 10 Mar 2024 11:48:13 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 2049C240BCB;
 Sun, 10 Mar 2024 11:48:12 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 11:48:07 +0100
Message-Id: <20240310104807.10227-1-kilian.zinnecker@mail.de>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1393
X-purgate-ID: 154282::1710067693-47DBA670-7495792E/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1710067693;
 bh=rFU1w2uLrhnKpvFI+f4yYat3scORgF2YEImpDayoX20=;
 h=From:To:Cc:Subject:Date:Message-Id:From:To:CC:Subject:Reply-To;
 b=gWb3xD7zyXnbCTGES/K/Up9Vp4kZdCulqOkVqhmhvBs9P/kT+fHc5uqtaPDiNUt9T
 2LEPKzc+iuH7fnyyzx+yhV10gvGJKdEz0NPVcDjPVuMa/42wMw3odH6ERSTcK4Wo5B
 WZYSCP0Sc+XTxSOl5sdEKyzNm0arkOYFhsTvNXOWWMvCpONJz7262QX9xPfXreypkT
 p1urk36VNN1kfxKljd7Ff/Y2/N3CLv6KZLMECYhGg7l7iqou9mmEp3ukbno2cqhgF9
 CVg4spARFIYoiUu7DRd5efxMYXl1vzfL1bVpdM5xaBhLl1Qii+m8JL9FvvuZEPB9d1
 NDeZPFUSjoVdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=gWb3xD7z
Subject: [Buildroot] [PATCH] configs/rock5b: Remove futile unsetting of
 rock5b_defconfig param
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

The rock5b_defconfig contained a
"# BR2BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set" line. This
caused check-dotconfig.py to throw a warning in the buildroot CI,
because the explicit unsetting of the parameter is not taken on in
the actual dotconfig, but instead the dotconfig will contain the
line 'BR2BR2_LINUX_KERNEL_INTREE_DTS_NAME=""'.

This patch removes the parameter from the rock5b_defconfig. The
resulting dotconfig from the original rock5b_defconfig and the
rock5b_defconfig without the parameter is identical, but the
check-dotconfig.py does not throw a warning anymore.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
---
 configs/rock5b_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
index 7175aa66bf..1ac42c8dc5 100644
--- a/configs/rock5b_defconfig
+++ b/configs/rock5b_defconfig
@@ -14,7 +14,6 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
 BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-# BR2_LINUX_KERNEL_INTREE_DTS_NAME is not set
 BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/radxa/rock5b/rock5b.dts"
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
