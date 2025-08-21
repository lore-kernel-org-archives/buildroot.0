Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF965CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 20:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB46A614B7;
	Thu, 21 Aug 2025 20:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dLpjzklZcKs9; Thu, 21 Aug 2025 20:09:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7821616CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7821616CD;
	Thu, 21 Aug 2025 20:09:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BB351C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 20:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA9B41565
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eNcJx-hi1Nhn for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 20:09:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 33A5940DE4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33A5940DE4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33A5940DE4
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 20:09:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 6F3F313F8C2;
 Thu, 21 Aug 2025 22:09:44 +0200 (CEST)
Received: from IP-208-94-110-98.static.fibrenoire.ca ([208.94.110.98:45900])
 via IP-208-94-110-98.static.fibrenoire.ca ([208.94.110.98])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 21 Aug 2025 22:09:44 +0200
MIME-Version: 1.0
Date: Thu, 21 Aug 2025 22:09:44 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Damien Le Moal <dlemoal@kernel.org>
In-Reply-To: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
References: <20250819075441.3288414-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ab59252283498240ef20d094e5437158@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755806986;
 bh=vzfuSfogmcQNiCBuBFodxQmVhaimuoVCenZVT1hvws4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BodwOku7PRyyPfuME8cLGtbWBx1muNnsJlau96PXGDCD0zz38A/TlQ5PkktL5MuN5
 AO51RvpBoXksWvL05so+UDFyIw5XCzm25EHJdVkMOl/OO2CF/lfyOc5oObgP23BNFR
 cQigtY9LR4YBmOrunSyABoGtY4EFj+4Xh+4cLipZZ/rAuz8GEnzUA+HUFWANViGJTA
 HF6nK3Bq3wdAi+a2OoLLKEzlP2jkXWbefn5jIsGqv6618MxSNlr8JWW+fKAdsLKAm0
 to2bwfcOmZYU9iz88ewW70NKHWhbfoshWUz+wOadIzPQyvVmmN3Eh77uMOPYdIgf+h
 heiH1ncR1zmdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BodwOku7
Subject: Re: [Buildroot] [PATCH] configs/{canaan_kd233,
 sipeed*}: use BR2_LINUX_KENREL_IMAGE_TARGET_NAME
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/08/2025 09:54, Thomas Petazzoni via buildroot wrote:
> Since commit cb4f11a6964902990ce774ff7144b24a1ffd635c ("linux: handle
> empty BR2_LINUX_KERNEL_IMAGE_TARGET_NAME situation"), we error out if
> BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y but
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME is empty, which is exactly the case
> of the RISC-V configurations being fixed by this commit.
> 
> They define the BR2_LINUX_KERNEL_IMAGE_NAME variable, but not
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME, while BR2_LINUX_KERNEL_IMAGE_NAME
> will automatically default to BR2_LINUX_KERNEL_IMAGE_TARGET_NAME if
> BR2_LINUX_KERNEL_IMAGE_NAME is not provided.
> 
> It probably used to work because specifying an empty make target was
> generating the right images, and they did have the name specified in
> BR2_LINUX_KERNEL_IMAGE_TARGET_NAME. But with the additional check
> added in cb4f11a6964902990ce774ff7144b24a1ffd635c this scenario is no
> longer supported.
> 
> Fixes:
> 
>               canaan_kd233 | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273088
>            sipeed_maix_bit | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771237
>     sipeed_maix_bit_sdcard | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771342
>           sipeed_maix_dock | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771387
>    sipeed_maix_dock_sdcard | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771472
>             sipeed_maix_go | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771505
>      sipeed_maix_go_sdcard | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771581
>           sipeed_maixduino | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771663
>    sipeed_maixduino_sdcard | 
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11026771885
> 
> Cc: Damien Le Moal <dlemoal@kernel.org>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
