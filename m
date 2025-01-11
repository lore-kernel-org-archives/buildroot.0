Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C653E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 12:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A7558053D;
	Sat, 11 Jan 2025 12:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEblE-Kyl1Wz; Sat, 11 Jan 2025 12:00:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C8A380542
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C8A380542;
	Sat, 11 Jan 2025 12:00:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC3CC942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D1F280512
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 12:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cuj9kh29rE34 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 12:00:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A25358050A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25358050A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A25358050A
 for <buildroot@busybox.net>; Sat, 11 Jan 2025 12:00:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id C1B282003D3;
 Sat, 11 Jan 2025 12:59:57 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:52080])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 12:59:57 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 12:59:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@busybox.net
In-Reply-To: <20240626085207.21221-1-ps.report@gmx.net>
References: <20240626085207.21221-1-ps.report@gmx.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <eafd0cb086316b6d9ae61e11aa9af8cb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736596799;
 bh=np1kYMmf1IW4wSPpiJkuZzutGSNW5B1ysGS+Fh7685s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hk0RNhMcrpAUYJOujgHRRSVOZmr/ddIMOFAsUW7Z5v26WhAuQd1cci0BykPyfLySL
 ZQGYT2+R23CQv/R3Ec6Q4XYNYM7SDhwmgANZhcDakjtzYw+R7tQ7hMmHTlcqQ4aKZH
 row5KjgMEGLb0jbC1sz3Hes8z2nvLioAfyXDKVnlPfC6CDc1QJCGaDzbE5cPe1WyJv
 L9xIa9oc1C+eCFdTu2RGEvuoL1F8gbDRXnlmkrpDeGoa/BtRVgERw0va6pxldZ2jiD
 d1gRdxgQwcBsahIVsNHhWl788zzZuMOvB0Ly1r/Xq7AASvQqvXw69sX/fNo2pq+CKX
 ZRnL7HuPtK8fg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hk0RNhMc
Subject: Re: [Buildroot] [PATCH v1] package/smartmontools: bump version to
 7.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 26/06/2024 10:52, Peter Seiderer via buildroot wrote:
> For details see [1].
> 
> [1] 
> https://github.com/smartmontools/smartmontools/releases/tag/RELEASE_7_4
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

For info, I merged a similar patch from Akhilesh:
https://gitlab.com/buildroot.org/buildroot/-/commit/d5894b2dd670d828e517198f570dc7946209a042

I just saw after you had posted this one:
https://patchwork.ozlabs.org/project/buildroot/patch/20240626085207.21221-1-ps.report@gmx.net/
but for some reason, it was marked as "Deferred".

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
