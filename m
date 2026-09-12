Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08125C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 11:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5D3E406F5;
	Sat, 12 Sep 2026 11:19:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwzhlayR6nzx; Sat, 12 Sep 2026 11:19:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AEEFC406F7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789211941;
	b=YAY0FZRR2uQCD1hXECBQ5AHbZPULPUz804UoNmB3MFYKZ5djEPs3VynYuZliqmqLJZLZ
	 uspF3dqStsMZJYDxufAkSO2l9f6DYA0LB0a/P7Ug3gSc98Pdg8zOwewmA3c7W/KSLXMNS
	 fLcxNsFaBg/tAbeZPBRDucBc7PvEYGVZO1r0WOaqLhbvX2KynuTGnNmyw3Os8BkB+pl+X
	 iX9YOZLiLZvct6x08EFtf+SpknpNCixEBx/cRViMpjH4Mi7LeDqorCG3NmD8kYqgSEXZF
	 drXbPWzHBq6RhzIIXrw9E3wPWRaluSFz6hLGShSQ7dG4ZUYw15fSPj8FMayF4waY7qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789211941;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=g+HRvb68G8P2Y7iSe66d5+HUDDTvdSIwzEdXTs/pCGw=;
	b=dDMSuvNC8L4Jp4WVtES6QluaC0Q8OI0I/cF8mNtjGXDKh78BkkcEwmGddgY2/Dptzllt
	 kll57Nu7bDArIsa9B1gDEiMXD8Td9IrhjT+4PEckel878vTTVenh0e5kBI7l2MGu07iq8
	 ymZ5snqZDqBTqQUnxgmrEuUAIcVFTIhrU2FMybcn7oP0g109WLfieanFMAIcFaiufDOkn
	 dCixPjYKluCBJWMfjTU1ohOVDRU+aQlJ9WEZBXk9uzaDjQWZCwrVAZNEAVVcxix8RBnB9
	 Zgk59z/yi1A8rm7vmnM5SqHmcn/PCJ+33UZU1n3JR6ko8ecQZu8MrQn/sXw0/AEMhpg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789211941;
	bh=g+HRvb68G8P2Y7iSe66d5+HUDDTvdSIwzEdXTs/pCGw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qUQyIBR7Xti+mmsIrBWvuwwjezu1P9zFVhtQx3ZmAgHDUcqGnbk8sMlpTDR/kdRRX
	 /9wgtqCPJ5KAHuBHLlFeMRpN6e3MRgC+11ZgQ4EOl9SpOk+ivWrvxkqse6QIcgHk3A
	 8SMquaUj+49a8JUnko7iMr/0ua8+XxclSRo2Ld4lCL/EAfJc5djwgvgo5DL+iNWy0W
	 y8fzOnyMVpG7eF5/5s7AcIE3IhFlUafcPVjBLn9Up9n/fR6mS9AQtESW/T/BEbvf4O
	 z25SeNBufiaK35CdF1Uo34Z1MHkit7CSIOczYzfFyEJNhGPYwO9EvceIz99MAGUffY
	 ebtgKfDtge/Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEEFC406F7;
	Sat, 12 Sep 2026 11:19:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A637D32F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97FF560614
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:18:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb-OxMBHFCnA for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 11:18:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5EE06605E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789211938;
 b=YUv+9nESREQ6nfqjOnuaFCy2QgyT62kgHkKvvTjrl0Q5fxfF6G31z5H1JLwU43gXsWvD
 EUODumbDRkVToqrsJdMvb7ZJtR+Xw7Xe9DRDeNy40OIQtwU0CnIRRG7SsNChQ7m7o1G4O
 81zTga3WyHPWnHdagMKE01QFTTjc0sg+G9zXhOY5Rqa99UWdkr4znrrdPELrdlJfZiubW
 E34RJGq3kMppkL1C3DdzCVEKAuHmsy7m/fTpXxbuISUkI9b8MKk3Y89AzqEo5VVE1OWkz
 yrJjBEiZUWge5pWbQqUyNFyPvbqzL7Iigx8vL90u0j9InBPJQJa5CNwrz6ci/7lwZ5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789211938;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=esgrPsteLxPRga0Xn/ZiEHPRDtZIkWYhcyWpoCtYNZM=;
 b=f8bUWKpSzKlTXzcJsjuRrtJtNcgPI0BXlXuQYbcvTBH6frIpbyOYWhI5f0YPVMr86vkf
 mgiYCTcEv65acYaYrh1LVbweh/U9geNm7g7SWIMdAxGAV1MFouyPMWd5Ca9sDnfCSlv3N
 LElpKInNbO/C49oDhgVUXywaRiCDcGY/+khNz7+LQD1uWbuZboY5NacpAZ882lyJ28gq5
 Rghe0I0MmBHEU9lIEeibty5E6i4tcqu9t2VTzSruB+de4bkqycL7foH1WxBQlsXjh0xHA
 dhZp3VLDqOnDUmJOgolD0mP/TkZZpF5zdEiHjWWspLKTb6llqKyDwMJxg1tUsQeoGgA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hmY2xg8+; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EE06605E9
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:18:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DFFCBB0051B;
 Sat, 12 Sep 2026 13:18:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 13:18:54 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 13:18:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260904164754.187571-1-bernd@kuhls.net>
References: <20260904164754.187571-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <4b49b5acb7b5d18a74d08fa4f0b92e38@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/utfcpp: bump version to 4.2.0
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

On 04/09/2026 18:47, Bernd Kuhls wrote:
> https://github.com/nemtrif/utfcpp/releases/tag/v4.2.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
