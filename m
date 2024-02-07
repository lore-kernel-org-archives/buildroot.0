Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8118C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 23:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65F1E426D2;
	Wed,  7 Feb 2024 23:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQzi9ywCLdUi; Wed,  7 Feb 2024 23:22:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65A8E42883
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65A8E42883;
	Wed,  7 Feb 2024 23:22:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A00951BF82C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 23:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3C785082
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 23:22:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJ4kCVZjrgdS for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 23:22:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::216; helo=shout01.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DDF3F8509F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDF3F8509F
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDF3F8509F
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 23:22:24 +0000 (UTC)
Received: from postfix01.mail.de (postfix01.bt.mail.de [10.0.121.125])
 by shout01.mail.de (Postfix) with ESMTP id A8403240C87;
 Thu,  8 Feb 2024 00:22:22 +0100 (CET)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix01.mail.de (Postfix) with ESMTP id 8C9AD80292;
 Thu,  8 Feb 2024 00:22:22 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 81CDF240AC8;
 Thu,  8 Feb 2024 00:22:21 +0100 (CET)
To: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 08 Feb 2024 00:22:21 +0100
Message-ID: <2254622.iZASKD2KPV@laptop>
In-Reply-To: <20240207204337.561d3b54@windsurf>
References: <20231130223101.132221-1-kilian.zinnecker@mail.de>
 <20240207204337.561d3b54@windsurf>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 1753
X-purgate-ID: 154282::1707348142-077EF338-94738AEF/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707348142;
 bh=oCgyvdWqy2yL65j6ZmBCBC1rgiQlRLOO1QzsYL9uUMo=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=imyHD70Ip24PSHHZ8rZRQ8VV1aLIsdJd3SyeA96/4TFm5bbQUOJaSkwRMIyGaQHOi
 UCOoQqJJu5y3rm/ww+DUMASlBnoe4H7uN51sSnxQecKtO8ISH/YxBSFO70XIbGmW+y
 Um+fJtMAQ0YF7nJRHCsrDDSKZwgdAoGbR2kIm2+0/iV2ABQcexDAsvVogiWuDsPclB
 4Lkahb5vn2euHdoPANJDGrXknc4v/EIDpfdCC7GJBs7Rmst06+YAukT6l311B0Lkux
 f7j/9iHKAY8l0KUyT/4jNKWRX+GAATX5A5WqwEEqNkWoip3uC3fKrNNqYrSvK3PuQz
 mEJvo8T9JYOMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=imyHD70I
Subject: Re: [Buildroot] [PATCH 1/1] configs/rzboard_v2L_defconfig: new
 defconfig
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Cc: "kilian.zinnecker@mail.de" <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Giulio, all,

Thanks Giulio for reviewing my patch and your feedback!

[--SNIP--]

> Thanks, I have applied to master, after renaming to
> avnet_rzboard_v2l_defconfig, and taking into account the feedback from
> Giulio.

Thanks for fixing the issues and applying the patch!

> However, I find it not so nice that we don't build a fully bootable
> image that includes U-Boot. Could you work on this and submit a
> follow-up patch?
> 
> There is a DIP switch on the board that allows to boot from SD, see
> page 15 of the board hardware manual;

Yes, I agree and would prefer a bootable image, containing a uboot built by 
buildroot as part of the boot chain, too. I therefore tried to run uboot from 
SD card at first (using the information from the hardware manual you refered 
to), but I was not successful. Hence I asked the author of a hackster.io 
article about the RZBoard V2L boot [1], whether he could help me. He told me, 
that he asked the Avnet BSP team, and "they confirmed there is no official 
support for storing bootloader files on micro sd". This matches his article, 
listing only eMMC and QSPI as possible locations for the bootloader.

However, maybe this information is incomplete and there is in fact a way to 
run uboot from SD card, which I just was not able to get working. I can try to 
reach out to the Avnet support myself. And even if there is no way to do that, 
I can try to adjust the board support to build uboot, figure out how to flash 
uboot to the eMMC and document that in the readme. May take me some time 
though at the moment. 

Best regards,
Kilian

[1] https://www.hackster.io/lucas-keller/mastering-rzboardv2l-emmc-micro-sd-and-network-booting-dc87f3



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
