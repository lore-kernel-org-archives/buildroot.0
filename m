Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD255CA0EFF
	for <buildroot@archiver.kernel.org>; Wed, 27 Aug 2025 20:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 669D282A4E;
	Wed, 27 Aug 2025 20:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8x_Ia-2_qdkz; Wed, 27 Aug 2025 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE5382792
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AE5382792;
	Wed, 27 Aug 2025 20:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BE18114
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:58:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD2E82792
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:58:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_Mp-xrlmzjS for <buildroot@buildroot.org>;
 Wed, 27 Aug 2025 20:58:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61E6281173
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E6281173
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61E6281173
 for <buildroot@buildroot.org>; Wed, 27 Aug 2025 20:58:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6F0E26013F;
 Wed, 27 Aug 2025 22:58:42 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 27 Aug 2025 22:58:42 +0200
MIME-Version: 1.0
Date: Wed, 27 Aug 2025 22:58:42 +0200
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: buildroot@buildroot.org, Bartosz Bilas <b.bilas@grinn-global.com>,
 Marleen Vos <marleen.vos@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250827185147.396784-1-rgallaispou@gmail.com>
References: <20250827185147.396784-1-rgallaispou@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <9eff1d8b79fb1ab83582e64e96cab3aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756328327;
 bh=ic4+jD9LOkaOWaZG4UwqjO5pecPbdPj+aAVKN96mzHY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gYpQvGp+wMnmytw56LjLZWRj+6Q79K5duUqjnHtmF6AUuyp7oG3gwGDWWgXgolvVT
 KiA9mkE6XvEpK50WJvJ2R2ivtOqk8dkWJ8FuPjudiwXLKxUBiMz4iDzWDtCBuAHyFp
 CiWRC4MNghdBSZOQdoxq2RXeaz3c/eev2W4bFAGS2h8vqWWD5fp0DS0pLJbIWMdpmq
 CMXHtMtv5qqsHMtBPpNtSA3lArxSG1SvUKyX1eonfxFWNz5VSI3cUw7lfLgFacSkYB
 16EOjUiF2MF1d4Vi1Lpl/XU1ktZNM7/Wvmu0c30jmzrztmuqGKVpETry2w/oeU/av4
 Ysle9+Qw+c/2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gYpQvGp+
Subject: Re: [Buildroot] [PATCH] configs/stm32mp1*_dk*: switch to external
 Bootlin stable toolchain
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

On 27/08/2025 20:51, Raphael Gallais-Pou wrote:
> As Arnout stated[1], defconfigs should use a Bootlin toolchain (stable, 
> glibc).
> 
> [1] 
> https://lore.kernel.org/buildroot/e9576c4f-243b-4a89-a74d-3fee591100a8@mind.be/
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
