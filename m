Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7256C52D6F
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 20:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 699FD4037A;
	Sat, 24 Aug 2024 20:34:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlCqyVFjgScn; Sat, 24 Aug 2024 20:34:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8CC402F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8CC402F8;
	Sat, 24 Aug 2024 20:34:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C8B01BF2CF
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 20:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 147BF402F8
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 20:34:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gduKbIQRT7yN for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 20:34:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E9160402CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9160402CC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9160402CC
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 20:34:24 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:54d4:ec1:72a2:79d6])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EC9B25FFBA;
 Sat, 24 Aug 2024 22:34:18 +0200 (CEST)
Date: Sat, 24 Aug 2024 22:34:18 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ji7ykqasv5rrgcvsh4ppt3ygmcethpdqdqixk3qg5zhvpe3h5s@cs3lrmx5zk5q>
References: <20240820233830.5927db8d@windsurf>
 <20240821095044.10038-1-vjardin@free.fr>
 <20240821095044.10038-2-vjardin@free.fr>
 <20240824210017.06355474@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240824210017.06355474@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724531661;
 bh=egQpuiAwcLMBn9yUKiu3PWtqlhV4S79SRgGPbA85s8Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xx4pu6pXPag57zf2wEaFvgfOLWugwMf59GzrtoEKCxZcEwkc4nhb01oCUFysucjVs
 RKYhotIvJtU6XBGS1LoTH1f7SuVhk/HW05G0XODly786EHx2QbpiuGarRkrbEmVIxF
 2dF6/AZJCcCZfCk1/bdV1OkqEII9HMSjARvlzHUMoqxA1DFpBg0Xg0VaqYRYvxTr6Y
 I0wBNTHYjUOa+aBT4xug5lPbsIQt3CCoDnEZbH/6lItMSXNCkPnA9e3g1jMxXSTG+A
 dlA5VKP+2E89a+QV83vap3tgjnx/3DAYWcJarZkCmlFb82qWkvBBGudXF7RrGlGWvR
 Ks0Po1vhpr7Ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Xx4pu6pX
Subject: Re: [Buildroot] [PATCH v2 1/1] package/lsuio: bump to 2020 version
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
Cc: peter@digitalbrains.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Sat, Aug 24, 2024 at 09:00:17PM UTC, Thomas Petazzoni wrote:
> 
> There was no need to keep the hash for lsuio-0.2.0.tar.gz, and we
> normally put the tarball hash before the license file hash. I've fixed
> those minor details, did a few small tweaks in the commit title/log and
> applied to next. Thanks!

Thanks for this follow up.

Next: DPDK, it should be ok ?
      FRR, I'll provide a proper update.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
