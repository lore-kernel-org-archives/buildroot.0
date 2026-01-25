Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B6DD7237B
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 21:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CAE648144A;
	Sun, 25 Jan 2026 21:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46F67THymrsB; Sun, 25 Jan 2026 21:49:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C439813FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769377790;
	bh=+CMp3Ve1lb8ApygNkn9PyWPhA1l0oqRavVi1wqaoUkM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W6DmjbO74zzhPOIfNOcojGEJdd2/t4GApbljH0v7Dc0b0ENeASA9kOV6lQjr/BGAQ
	 zqoBE2jCd/s+JEb/1c4sSWByfsy84mJJre+2Z1VXxK22vOdC3N/fsZEtrdT0LxGNHO
	 vS/eqm4xpWNJx5d3icwhobg5+I2cacM/cUnmNTDteiMcMukz+jvS0KptFRsoILVdMt
	 UXd8rDy1zcN1gS97XxQLI+gMQBOhGRHfUcl/ehoE9qafd6J5/qZ7AVeRNY1ReWTS0V
	 ZkHUJBRm5BrKM1RIuDRLALmt8dojEN4eIk5CQFUwGVa6fwueAmAmyVp2gddH1b83/s
	 mzGHsS9G6ikVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C439813FF;
	Sun, 25 Jan 2026 21:49:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 326181CE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 152B840445
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8Gn507YvsIL for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 21:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DBBF040330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBBF040330
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBBF040330
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 21:49:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id EF3F6B00539;
 Sun, 25 Jan 2026 22:49:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 25 Jan 2026 22:49:42 +0100
MIME-Version: 1.0
Date: Sun, 25 Jan 2026 22:49:42 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260124154406.1093087-1-dario.binacchi@amarulasolutions.com>
References: <20260124154406.1093087-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <44ded4f4ab8f06887e29953507c8f6b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1769377786;
 bh=P+k5BeowgWx1iWPCtLpmM5vHG9LBqezGBEDWEsxt4as=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ohcYQ8rOOFj8ukmz3vKHoAzpG99LenIMmkHrNACAshwgCNZPFmMWF6cKPdsyURZXj
 giaJk/gEnd9TQ+73jVicJCgOsN1U6qxR2l35Gn5dMI6DdO6k4yiJPVwgBnIWW8iSa2
 PP9thgRiR1M/mQV4CByJCX5iFqWHcOK1XZRtW2aMLBLeQnUtG2jO7Wo3hgYGqYIpqi
 PRq0CuIqOxkc3kwm6VQiyFCoRQ+xLuhI953/7ZxmjUqJP2Wz6yh+9t7jUVMKcFo/tV
 EAR3pZ+5Rs8zsvEkIejdlw+1i4eLROfnxja9JnLE6VdzRovjecnFzWqbNZp4m9vzb6
 3ruSCyyS593hA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ohcYQ8rO
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx6ulz-bsh-smm-m2: exit
 post-build.sh on error
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

On 24/01/2026 16:44, Dario Binacchi wrote:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
