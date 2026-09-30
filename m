Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A25CA5FC4
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 19:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71D4940323;
	Wed, 30 Sep 2026 19:22:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jB-WhIiBAy7; Wed, 30 Sep 2026 19:22:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 83B1040363
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790796165;
	b=SSd6bG727wN7NdyUxjbFaW22SOg55ra9qnX7Mk0x0anLCEyVQrhmYjG2C1YqkYoPyTHx
	 uAgGlKfi3uQbt9CU7GUCXDTrzr1qDHE4lYXfPE11WI9aV3rYeVPXlfSyDyS6M3MxoXzZw
	 bRXqtp7IhOoJVk143/kTKT/Wmuo9XJSwQIhzbSe8ucl7dcbjuv9z5WRYHvMGarS91GxI/
	 /8NCdS/d5JnuHbXHLtISdJ967T1lw+95QBx5ueTeMaXAMDvz4T1LJ04ukSkeYDqOx6Mrl
	 COQmx9FR/iV4RPJZJzUP78cWMAEuwq/7LoqWL5SRWc2jDkG0Z5Eid+wLdZ1+EP7MLqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790796165;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AMokBcxIBKzZpech8lclmPKYNSkDN36FxH9K52Jl9Qc=;
	b=M0m2NIdW7Q2M0pCbrwbQ8jYPuwjnodzJpHxqcwpvOjOO4bq+2rWsX31U9OxzgQNDuaHd
	 OfLTeWn8Mj9ML4eYG2f7P5NIDcrPXntyCJPlYcEwFHsGXCtJEHa6NXputSxyT7XnfnPwC
	 OfFyVlc1wd6IWbI8svWyJyRa5YKOGu2z3ZPeWQtbBmXDf3LgcMdlFJ7HlMlvKKQ64gmeJ
	 R3UsH+ym48/OSLKyMWzxpbrhrpbhK3LVPTMPzKNXL99J1i4o1gWndlNGYFj3NdXa/xFn3
	 NAYse1vTWDFt0Tgexoy2WWQIunK95XLX51IV/Ct8fYSFheQhgdDit9Pr4DSdLyrfswQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790796165;
	bh=AMokBcxIBKzZpech8lclmPKYNSkDN36FxH9K52Jl9Qc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SeESIG3F1pKe2i9PijCQylWN4t58R9o19NAHPIl2TJ6aavpm7lQkAn+grbDQ9qxDq
	 pVZldelevH/dLpto850mRxC+A5ZKo9OSkPgxMSHrYoHNBeOv7YWYTcsc7VdB/kE/jO
	 kofOVNI9kc6NFIr69N0IepKQX2KQN9du1doIK7Fi+2TbmEreRd23zi9HoxFl5WSqIC
	 wPSTu8kTgY/ZiQ++/LUH7uT/bR6iOMexKOsZCvHDh5kGAO9MeUT41HL7B75ZEfEer/
	 Kij/ElJsfELZ2ORLUEXu+Eb9CmqYezLOzrJd1j7eLOv7ENvLewBo80sDI/HB1N82yn
	 4nulhy2leRsLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B1040363;
	Wed, 30 Sep 2026 19:22:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 81AB63AC
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48F2E8091C
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:22:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQgy2GhNNm-q for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 19:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E0AFD806A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790796163;
 b=o2JcYrzWBWK74mEDbZrTa9syRMUOnz3rPcRzceblLrtflmSOpxU3Gas68EnBKzzqNglM
 2zdX1Vo6+w6uyF6h10edAYHueIE/nWBpUt9g4hOzJXN9L2xhpOV/R8VzTXpAypDkc21Il
 ZuSVeM8ry7psOH5g3pKCFOQsfC9ASK2geg+muSft5UOUZqgXOpq0hU7jRidNs80nb8BzB
 epkAvLIhuHQRKhNJkoHOJRHjFdh6J1+NlVTa70pUsc9+ZUodmWoQJ9r9QwzTymp7D1o52
 XCYht22WRcu9Oz21TTeeARDWh0n5+wrfUvOGeWQAmWELUXNdd0Dk8qiqEIBZX62uj4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790796163;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=RgotHtPbFmgYW1gd00BrYqQRbXZQTsI/OY2HqvZ3Ux4=;
 b=DkHTWIQJNyhQ2EVJQ6EQcgi0afBAUITdLBL9qewOY90cPG+v2JDysxVSJAIUWIiXVAY2
 4t43593APOAR1FW3Gp+4mN30fjsFpctuvDUcz51wdJD0ff/4LvVO1Y+LeCH8PZRqIeLFz
 ja9RFfP1j7+HAxM1wCzS0HWA6+QZ79FWd28/VZJIH9iOWqvHA74N+ZLw33nOklRd4uE78
 DiSgnjZdFp30Gbpe+QQ0k6DHrdX+gNRIopBstKNsHTWZiozX+7hrfkN7DX3ZikJvTgtzC
 se9YW3/dpZMJ3GV4O0Ih3JuIybGiYi40Fi7d8HHQnVHVP2nawveXFTq+bsDiyQs0bmQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=COjWAO4X; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0AFD806A3
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 19:22:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 4137B78035E;
 Wed, 30 Sep 2026 21:22:39 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 30 Sep 2026 21:22:39 +0200
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 21:22:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260929182124.1843719-1-bernd@kuhls.net>
References: <20260929182124.1843719-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <abd3bc0ffad5bea3d8b0cb1c714150c9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: security bump to version
 10.49
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

On 29/09/2026 20:21, Bernd Kuhls wrote:
> https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.49
> 
> This is a security-only release, to address GHSA-r9hj-j2rw-4q3m:
> https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
