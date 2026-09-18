Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4BCC982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF39A60E72;
	Fri, 18 Sep 2026 19:15:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFhOdDjcleVX; Fri, 18 Sep 2026 19:15:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E9BB460E56
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758912;
	b=ir3Mt/Gt24cCY2eofQTNqqSU0h0S7g+f4RGIBcGItI7Ky7Zq4H2kKux9mGqWq7vEGotp
	 0Xs6bUeZThA7BX98bEXem3uJeou1jt4V9Ebv1a3rQ36mMQPwtF+o/7VtEjkCtZzy7uXJ9
	 Y+X8d7n3RlpM6EPVP5z7Aj2Gn4KB+3bGJzT6/DcFNKmXecOzzCfzRr9wEWvL04i1oSmVP
	 OUZHr0aTnLzorLHMAWxT/5CxW487vvQRYphNA3o8nxsUnOgyYIoGB5OUXGsHobGd561Gy
	 GAbNEbz5BLIcBrvzIBh2aAa3FYjVENp/aQ5G36SWDIannd6UPsEKT4IQibuMlBNCTVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758912;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=JsHMltGgmmZWBtFQvhyWChFWZ5v5QEWorusSIZvFhKc=;
	b=mdrykPIQOVlQtAZKzaqgi9+gGMy24VocqYN/Tl603kvn1waUlh7B7F+Jl79hSOIR2Ojx
	 PexfrXN66lYpZwi73EvC+yfnlwK9ykfsTBmmhg5bK+4WwiJGtKdDiiBXzJyIcrkzJQLg5
	 60DLBEuUmP/BBH1k4APEJ9V5vaQPWiTD67wGqk/UdUVPaIVNbnkP3xY6hsB/Z/6XeREo3
	 ONku3lVic8H4dGA2JI8T4U0BONizOYCb+pJ/VAUtnwjFAXraFfArw9WsXDLrnRpSp0eHj
	 7arn9Qn+hGnTcS680+dwOubUZbrBHw2Pd1DbXyxhjtj9dlC6k2X9HNbD4dKKVA36oTw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758912;
	bh=JsHMltGgmmZWBtFQvhyWChFWZ5v5QEWorusSIZvFhKc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ANvbjQ/LGWpcUsk4coSplKimqtA2UjWqK7qIKljmtLvmQpz45D+/GlzWpdFD25GMI
	 5nDLKH2H++eWuezyokUQT02ZCrwCuZ+2aK2ctepkFYO2sT45uoK2vBApxZ/YtN8rI8
	 v3VNZPLAbl+pJxi0TyBBp4sgT4aD++Dk/zHV7XOesp1t5gVmf5v1IF+T6fuY8qbCfU
	 yPHc8MxwVeSPsoyVlNqvnIhRonW1OD7270/fRj+FPsOl6lliF9MLpZQUg7L7pXY/W6
	 //L32Rl0Zb0d4mT0vBnbU70nh920ebWQcvCDui9RNZHL5+kR+ArM8Tv68R8lf72Vn8
	 5mto0RbuFYSLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9BB460E56;
	Fri, 18 Sep 2026 19:15:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF42E237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C556340B60
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:15:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hvHF8n0IiPKm for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:15:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ECE5D4082B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758909;
 b=MdqQI2EIi2tYETgVUjBO1DY/j458IGWZV8E9OLKVPj5B9zi5ik7FTZhKGMfeUOGGFHE9
 M7K+SvLgb6UgGjtaJm3OnJ8lH+ZprcItRcbXgcr588JajLppyDdv/dopqaBb3kKxdL7VL
 D1yi6FIFmp7difB5iLanDfI7A70vwPVxV6nuA0/CK9gAkYw/ZP+dsk5fKSpMSHFK1/VYP
 PAy4WdgXtdTVrKeNWcbIWVnxkx5QwsUkzBKbsvd5t9KFK3sxaeCKhqUxFIg+tlfkRicqn
 c/6f+MxujL3R4PsnbX8UAENkGpzQINynAitOtLqAJloD6iHyIGjlMJ66YplE2+tew4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758909;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=rdJqIzvVlCOL9R+XzAx+odpMmSlsyx2PuULNuA+XxRM=;
 b=aw399vVKrXDoSpQiRg+BdowFiCao1VWK3THc+EU12Od8xHW0bCLut8QK1tsGUGvSe1TJ
 BqkMAi5woxqT1hY5JSvy5Z6+WnhrJ+0ebiAAODYwPil9phpEhUZZgZFAOhehpFK7OtCEy
 b0U2uRHFoSwzaatTPQDZ5P0+0K6+Byg6LND4st/csOSJRvMevuko5Q+8TyEBqrZ8cn++V
 cBJAGNVYDT4VSk480lWXbO2DhcKJ1e1qoDmI0JNkXcrua6v7x8yf800+N5rNfP3ezcDof
 N9OvNLpTRpu1+9VO9OGGkIDLlMdxYF163L04bOoCK9ASmfO8BjRWKus1/AP3vWNf+8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=q5sutvwa; 
 arc=none smtp.remote-ip=212.27.42.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECE5D4082B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:15:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 46D0C19F57B;
 Fri, 18 Sep 2026 21:15:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 18 Sep 2026 21:15:03 +0200
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 21:15:03 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260918124836.3563681-1-giulio.benetti@benettiengineering.com>
References: <20260918124836.3563681-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <fdc54d32416cbf3b0aef1f8078be6c8a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/rpcbind: bump version to 1.3.1
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

On 18/09/2026 14:48, Giulio Benetti wrote:
> Changelog:
> https://sourceforge.net/projects/rpcbind/files/rpcbind/1.3.1/1.3.1-ChangeLog/download
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
