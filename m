Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3562EC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 02:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5DB96085C;
	Fri,  7 Aug 2026 02:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kh0UVrj4hz64; Fri,  7 Aug 2026 02:23:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B929C60868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786069389;
	bh=2osUak7aUH69AXuq/ZbyP0KYow8OdEhG8uTe+rHdURQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FXOf01TnfEhHzkPHKv7tJ4uWQsJybyELPSOAYA2GoaZFkkGXEbEPQZ7WoFX3tLSEo
	 mgCJEQCC1l2lBh/qUzOm9qNdSZKkp1s5IZbsLfki98f+ogWAKYZiGyvkXtsoEID65H
	 Ihgj7teDN1oNxxBFhbYqEmXQcrGdH9oko4hv5uL28fzEuk5XMZAptS+VJB8YyKma2t
	 xAi/B0nD6JqwodUZ5ARjTPex/Rl6UkenY1aphbXukdHC6BnLGnvLGa18oMQpQfCVWg
	 7rlsZCnJnaJnUMlobrAIZgh0yoWo479WcDP6K6bOcDlUQS2V4ZyEoSAJrpdb8u1y84
	 tAA3MJ7JfHbSw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B929C60868;
	Fri,  7 Aug 2026 02:23:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 835E9198
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 02:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7544B60871
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 02:23:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bb_8BUVtW1Hf for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 02:23:07 +0000 (UTC)
X-Greylist: delayed 368 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 07 Aug 2026 02:23:05 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A90B160868
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A90B160868
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.4;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A90B160868
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 02:23:05 +0000 (UTC)
Received: from tianyuanhao3$163.com (
 [2409:8915:20a7:1878:61ef:3d15:68c1:b28c] ) by ajax-webmail-wmsvr-40-148
 (Coremail) ; Fri, 7 Aug 2026 10:10:11 +0800 (CST)
X-Originating-IP: [2409:8915:20a7:1878:61ef:3d15:68c1:b28c]
Date: Fri, 7 Aug 2026 10:10:11 +0800 (CST)
From: "TIAN Yuanhao" <tianyuanhao3@163.com>
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, yann.morin.1998@free.fr
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <2a597fd1.96d8.19e44ddf0a8.Coremail.tianyuanhao3@163.com>
References: <20260316195726.690352-1-james.hilliard1@gmail.com>
 <2a597fd1.96d8.19e44ddf0a8.Coremail.tianyuanhao3@163.com>
X-NTES-SC: AL_Qu2TBPydt04q5yiaZOkfmksSgOg6X8CxuP8g3IRWO5x+jCHr6jgJTWBjJHDq6u+hLRGqtieIQipV1cVkWax2bYcBaf/f0ucbc6ta1EutqVSI0g==
MIME-Version: 1.0
Message-ID: <11ccd448.1a28.19fd9fc32f4.Coremail.tianyuanhao3@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lCgvCgD3n+eDPnVqcmUtAA--.6523W
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbC4QOnNWp1PoO7tAAA3d
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
 Message-ID; bh=Z2atEQ4JlpbRwjNJMDGxjBsRhc+ZAzrf/6JDnOp9Ksk=; b=B
 He+4FleJ3aavi+lE2iVEASJqW1ngLyD76xbsDoB/1iO+QTc9715xvqH2gbJtpity
 qD7yqMnwWb9quN9fgP40Zny4hH0NpaLgy2NTq+6qVbAwER5mZwS36o5c+2XvPVga
 esMnsbdM1Zyq6ILGzMTvUaYMCXZJ2l4BWmy/7SJyZw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=BHe+4Fle
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


Hello,

Can someone review this patch?

At 2026-05-20 18:10:56, "TIAN Yuanhao" <tianyuanhao3@163.com> wrote:
>Tested-by: TIAN Yuanhao <tianyuanhao3@163.com>
>
>At 2026-03-17 03:57:26, "James Hilliard" <james.hilliard1@gmail.com> wrote:
>>When merged bin was enabled in systemd in buildroot commit
>>a530492cd3e6de7ed5f9406f7573fe7b9061b3d5 the tailscaled package
>>started overwriting the tailscaled binary with a broken symlink as it
>>assumed /usr/bin and /usr/sbin were not merged.
>>
>>To ensure this doesn't happen only apply the symlink when
>>BR2_ROOTFS_MERGED_BIN is not selected.
>>
>>Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>>---
>> package/tailscale/tailscale.mk | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>>diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
>>index 86039fd4b1..f231022476 100644
>>--- a/package/tailscale/tailscale.mk
>>+++ b/package/tailscale/tailscale.mk
>>@@ -22,10 +22,12 @@ define TAILSCALE_INSTALL_INIT_SYSTEMD
>> 		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
>> endef
>> 
>>+ifeq ($(BR2_ROOTFS_MERGED_BIN),)
>> define TAILSCALE_INSTALL_SYMLINK
>> 	ln -f -s ../bin/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
>> endef
>> TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
>>+endif
>> 
>> define TAILSCALE_LINUX_CONFIG_FIXUPS
>> 	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
>>-- 
>>2.43.0
>>
>_______________________________________________
>buildroot mailing list
>buildroot@buildroot.org
>https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
