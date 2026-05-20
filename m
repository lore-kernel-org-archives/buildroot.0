Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED4ECD4F54
	for <buildroot@archiver.kernel.org>; Wed, 20 May 2026 10:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53434412FD;
	Wed, 20 May 2026 10:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2G3EOuTmtps; Wed, 20 May 2026 10:11:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02E41412E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779271864;
	bh=H7VfVDM0WLRajjBuVaxK3kysqitmxX7B62o8RfCznU8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QarrqtbnuH0JZ3YalOUJpDO0C5OgukaCTqXQI3KFcU8K2dSf6DOHJIbAEjc7SGkqK
	 cFK6W59BedQh9T8TQKwLH9PVH0RTEik8YAtSd0gS5dhJWpobEor6LlL7fA1dwHtI7s
	 ZMdIBk60jY6oLet9ugBYSHfBFdDHgHNxknWjXrSF9saDWpLhOs36LD9qFih4GfLgu4
	 IkwWVP9v2xXJK8mkR9I7+t/9Uz5iUMBIsbVN1N3EV47oVsudXdKPq9oc+Vq8t+NR+V
	 eCof7njo28mSDmtaDoSLJelktQyXurgT1FH079sxAZ1geX6XO/Vd/NGKqj7MHH/AZC
	 r3ydBY5HWQSpg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02E41412E1;
	Wed, 20 May 2026 10:11:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82103265
 for <buildroot@buildroot.org>; Wed, 20 May 2026 10:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 646BB4084C
 for <buildroot@buildroot.org>; Wed, 20 May 2026 10:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SeSgT_x31Dzq for <buildroot@buildroot.org>;
 Wed, 20 May 2026 10:11:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B08F40846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B08F40846
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B08F40846
 for <buildroot@buildroot.org>; Wed, 20 May 2026 10:11:01 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [240e:40e:2302:974e:2184:6203:d67e:884d] ) by ajax-webmail-wmsvr-40-129
 (Coremail) ; Wed, 20 May 2026 18:10:56 +0800 (CST)
X-Originating-IP: [240e:40e:2302:974e:2184:6203:d67e:884d]
Date: Wed, 20 May 2026 18:10:56 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260403(27802f6d) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260316195726.690352-1-james.hilliard1@gmail.com>
References: <20260316195726.690352-1-james.hilliard1@gmail.com>
X-NTES-SC: AL_Qu2cC/6cvkAu4CKQbekfmksSgOg6X8CxuP8g3IRWO5x+jADp6DAhR21pD3nt3v+fKweOkjKlUSRy+sBCWIBWeYkk+t1Qrc+c4eizhPiwGwoaqg==
MIME-Version: 1.0
Message-ID: <2a597fd1.96d8.19e44ddf0a8.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: gSgvCgDn_xywiA1qjRSoAA--.8841W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC-hAsuWoNiLCsHAAA3U
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=KbdazHaAn36vEYPunfiDXp2p4PdDIWi6PwbBFpEXYwY=; b=D
 jhZalFJGrw75tpXc6qI//Z/lAwpY3/aotPbkqyP7QpdttDIcqScUIGSZste5dyUp
 L4SyAdPIF8fjjXg/u+6xfIJO7YSYPtkCNx6uiY+7ttn3TIC8CuJJMq2rKglucCDJ
 RWhUGgdzu/s513hiMTVfvOiSFtCxQBuOUv0S0d7SWo=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=DjhZalFJ
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: don't overwrite
 tailscaled when using merged bin
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>

At 2026-03-17 03:57:26, "James Hilliard" <james.hilliard1@gmail.com> wrote:
>When merged bin was enabled in systemd in buildroot commit
>a530492cd3e6de7ed5f9406f7573fe7b9061b3d5 the tailscaled package
>started overwriting the tailscaled binary with a broken symlink as it
>assumed /usr/bin and /usr/sbin were not merged.
>
>To ensure this doesn't happen only apply the symlink when
>BR2_ROOTFS_MERGED_BIN is not selected.
>
>Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>---
> package/tailscale/tailscale.mk | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
>index 86039fd4b1..f231022476 100644
>--- a/package/tailscale/tailscale.mk
>+++ b/package/tailscale/tailscale.mk
>@@ -22,10 +22,12 @@ define TAILSCALE_INSTALL_INIT_SYSTEMD
> 		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
> endef
> 
>+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
> define TAILSCALE_INSTALL_SYMLINK
> 	ln -f -s ../bin/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
> endef
> TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
>+endif
> 
> define TAILSCALE_LINUX_CONFIG_FIXUPS
> 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
>-- 
>2.43.0
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
