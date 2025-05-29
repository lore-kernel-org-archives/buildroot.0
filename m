Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B9AC54FB3
	for <buildroot@archiver.kernel.org>; Thu, 29 May 2025 22:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEA0F4197F;
	Thu, 29 May 2025 22:09:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f12O8PfQSVYm; Thu, 29 May 2025 22:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 277AA4179B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 277AA4179B;
	Thu, 29 May 2025 22:09:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22A40236
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1AE9C83F3E
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j1wen_-bFslg for <buildroot@buildroot.org>;
 Thu, 29 May 2025 22:08:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2936983F35
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2936983F35
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2936983F35
 for <buildroot@buildroot.org>; Thu, 29 May 2025 22:08:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7DB45780316;
 Fri, 30 May 2025 00:08:51 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 30 May 2025 00:08:51 +0200
MIME-Version: 1.0
Date: Fri, 30 May 2025 00:08:51 +0200
From: Julien Olivain <ju.o@free.fr>
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, Daniel Sangue <daniel.sangue@sangue.ch>
In-Reply-To: <20250514065700.453431-1-yegorslists@googlemail.com>
References: <20250514065700.453431-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <42fac08a253f4d03a396fd909f8d651c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748556533;
 bh=UJV9//PYExhZkZBWJXnLURLiC0ndFCgf9XbwV3rfGMw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=A/nSsN7rWKwwdq7ev67s+93vXsyycArYEWMDKcXHzSAkh2v/M0LGxvX5pNZ1hi3eV
 HJdEjaQTnGGMlwz1PqsIRGcgK0OVVeG/4SJUyfp+rNTFT3xjO0FrysdyIGV11MtdHB
 z/5R9RNga9MxrC31cNl/o0x17VcycDZu8NlSeLME9smpr9+8pzGSE0Wsif0/X5/HUK
 UVjEUfJ21VcxPyJJK6XB+jgktG5amv4McrIdT7ajdXJXtH+ZCXbC25jMIWIFsqE5Ia
 tw1P7iLLFI5WYwYesn4V4S4BQhwIAqWL6QYe+hbJphoqOUn85tNOp0zBX/rJ5ulkVM
 HVPaXE3fOZ4rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A/nSsN7r
Subject: Re: [Buildroot] [PATCH] package/libftdi1: bump to version
 22b4667a8c3bc483494ba735ba4ae4d5cb8a0f03
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

Hi Yegor,

On 14/05/2025 08:57, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> As the project doesn't have frequent releases, switch to git to avoid
> the piling of patches.
> 
> The latest git version bumps the minimum CMake version and adds SWIG 
> 4.3
> compatibility.
> 
> Fixes:
> https://autobuild.buildroot.org/results/188811e73dd52eed3c66d7efb590165e4340fc30/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Since this bump contains mostly CMake bug fixes, I applied this
patch on master (while we are in release client cycle).

I changed the _VERSION to use the "git describe --abbrev=40" format
which is slightly more readable. This changed the archive hash,
which I also updated. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/d8173e084eb9ccd700b964e1b8117b96e0fed387

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
