Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189B9C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D740360E72;
	Fri, 18 Sep 2026 19:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzedBZp3CKgw; Fri, 18 Sep 2026 19:39:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E08F160EB2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789760345;
	b=Ir9f2/Mvg3OBoxX8fy0pTmqHFrSee0LLA5nHVzulRIfOO/9gRwhvYTsMfl2shMuiSU8I
	 doOViLHlbklBiLXDvSdLG3ddtR4d91V8Z/G+GOeWX7ahwN2QkYcTLyjEOQ7/SS+Gfe8o/
	 XVBO3isWiLDShu8WATGYOJZkUbpS/mDXod+SkRzDAE4c8b/z63e3CO17hU3wNfgul+f+z
	 sClakN9pXht5TG5mfRWDr1uIkbfF7r6960kekxGHcgxds2t4Rnc9TGsvQP85eB5VCTdGy
	 /JCYi7L+OH29jgjCZfx4HvtDbNmVcLMfCKiboe3GXy/vF5to08YS6uTAaM5/V1aXaAA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789760345;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=OHenco4XmrsAp71anqpVHMhux1iirALUyx1NVftvnUk=;
	b=lXh7S83rNAi8WDm9dmFSk21XffOXDB2CKeeTuRNW6XvEs5fFQ/7g3bFfoIt/Jvq6/67z
	 LaldgvSyL5zXVqOA8BQ7Ufdk+sE6rmHOsXtL+3hBKTSY7bl6b0z7fhZVYJ6cEjEt2OCTg
	 5KMXqpuOlH8P9378gxM9UXwcZ6qtwA9KFmMRHJoO+2SM8GCnu2zzqLbe90H73oDs4L0IW
	 H+QcBdzUpt/rc0PNLL8ExeLr0tlgM9L8VWuxpKQepKsLABitVTkwEBpxFHsbI8yVRRa6w
	 7ohblfwnq+TqN8h/l/eAV1C8FmCcUMau/zXqzg6AaIG1WpxiqdWi5k8ZoPEJtMk/BCA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789760345;
	bh=OHenco4XmrsAp71anqpVHMhux1iirALUyx1NVftvnUk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FyVSaH8GbswePP9KdnHf1zLm2ykWetmISRiCA17rt/TJ6X/fKjT426jA9ZnVVDPWO
	 VXCLrYuTAmRIBJzypXXHWi6s4DQCuxawbAXFfbRoiw7T4NgCxEIMYqjwJ3XE+a23V0
	 6rOM8n2pk0o4hxfIMwIijs6o4EJ23w75oeM9XZAwWpUzM686rr4D9dgYR6VC9nre2Z
	 Jxm80OBMxTk1rzBKiDTVyCxF6lPn45RAXn4GSSHPJPQDkeNQdk28+WNvb5jHMC2udP
	 IbltL3+6Yf4rbHBYNn/Lc0gK35aA4KUPJC3akVCJb1jBNxf7X1TG8Ho8vWumNJYHPq
	 sIYsJeWdnA+CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E08F160EB2;
	Fri, 18 Sep 2026 19:39:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C53B125B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE3C81325
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vUeZWhkteQBP for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:39:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C690081330
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789760343;
 b=cAyrEe8d+ps7PYA3KHamM7TU4ix2ne1DG1McB79ho0+LAjdiCd0FZsepaOi7tVunP9p6
 GtYQedYfy9DSA9Wo4g4GerZAyPAaFRO6hLHb/0lebzs2O4HUCTKBprUSeR6zv9OExx5K/
 RmRMi7fFiveCJxw2j5COcVCYhvyXszw18zZWg0Z+FdsZiCnVuJkp7KjHMWl0Njj8Df+Pq
 vDAjGNPzzIlCJA4M8jkQM7pwbPvV3AAvxDxGxUFF2nvWasnbGQ6s9Lq9rRfZqBxdRqLgE
 UxweqDl5UN616bnYSQ00yj9J5D3LPupax4uGmFv5fB8JALAS1QiP/1PrsjV5YIaaM2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789760343;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=sFB1lrrD5XI9oRR+278DbLmwlm5mx4RfyVXkxXGFc4E=;
 b=JPkxqT4Ysu6lM2gLD5hP5HT5n5Rya9CmMM28tkS6hnKTf08/R0DCLqYFT28FrWlGclsw
 /aK02qdDGSGpfVAwYWlt1GsKrCvrSxMnL5apj42GMb5WESTrPzf+TW7EjilCzIxr0VQW/
 D9PYoSb5xPMUT2GHYzasuqXNF5GEXnuyDNLTQrKe+ZrRWDg0c8GX+uq8xZnFeKLVQul00
 Z6ha0fFxV1uIjAaBmgLKEhzwsyppIpUwi4PocPqyrKtTe82UJ0dlzfZCNldog8xvmsa26
 6jx0Io3LFL8O8WDQlkf9dIBTqR8oSf5AAx8X9K0oTnoWxgKCPfFSzXZrBZwoPdFBoBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dpwfEmMD; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C690081330
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:39:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4DC812003DD;
 Fri, 18 Sep 2026 21:38:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:38:59 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:38:59 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260918132135.146448-1-thomas.petazzoni@bootlin.com>
References: <20260918132135.146448-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <bb7d4c0fbd61302a89bb153a73c1b1f4@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/screen: install screenrc without
 executable rights
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

On 18/09/2026 15:21, Thomas Petazzoni via buildroot wrote:
> There is no reason to install a configuration file in /etc with
> executable rights.
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/work_items/174
> Fixes: 98873717c2654e27ce069c44e9b5dbe3383c0f97 ("screen: enable 
> terminfo and install screenrc")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
