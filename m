Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15BEC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4F060BAF;
	Thu, 24 Sep 2026 19:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l379JkfJMgN8; Thu, 24 Sep 2026 19:15:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7F7A560BB0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790277316;
	b=IGpxza6jt1YcrqTopLMRhB4sfbbSvIsE0MCwgCcBcNAACZy5UgkCsCybj03pKqNeFs+2
	 OfT8tcMpedhL0CCZdIoh74LZzNtw3OaLlYNXqRAwzeEzaCTW/wQkpe7qEVTuoxBb/pyun
	 X/Q+jaTqOqgEncuCkToETpIX4lF8WaU3BManK0Zri3Igj0+2OpXOqrmsDlF0vGDdJJk2r
	 u8dsIJY3+1epaxYxwN1ggeFdV8+3Rs/VcVLNz7szgM1dHHBykyffBDBdLb2C678zJU/Es
	 vWxzjfdnl2mbLpP3Hev/abRTfJcX5rl4GtXMzkeBmzBx8Rhc9a+U/vDUmNgvXWIeXrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790277316;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=poCU1Mt9aEcC4wqVFYuI0z+EYXm6nkFwvvX/o2H8SK4=;
	b=FIHklZHIaiZzMpXHU5PRplbsoKVRzRQKEDGEOb6GtWje4Hy9t9UpWcTg+Lr8F4Ue71yh
	 gB5AzyzgY/jPwhGjRumJGUMA00cSUj9ZUSklUvmP9wGECTJUdqcgQ1Eknnc55WQH9s5+A
	 l6PzknBvlSUm2nw6Ka0Cyp7+orJTsoQDgDFR6M889KuPpdJid4hXvFP5vP4zil01Pe/Oe
	 4ZSHor0M60X6rjIJ5ALbkw46yO4U/JaPRCrGRcGRPamaiXPNJ15kPnNew743UO7yuDIVG
	 v75m9THGEt3rIe04T51qMYvIIin6f+l4eafjLCTksoIVrQ0n73bHYmoVcg7LCmv+g+Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790277316;
	bh=poCU1Mt9aEcC4wqVFYuI0z+EYXm6nkFwvvX/o2H8SK4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hl+S9mbXU+c2UsmWyhCtI4pmxP1UYOqZgSt3R/J9N6oj7QwFxibk+bD3hnrvcp9ob
	 XPe/YdQbYeDNw2k0ClMqn9HlY5TVvcNgtGoJAKZjV7Jaw2ReKsKYsJJ9h3VQ2W4Pb9
	 7/pvI15pkLKvm2dbf5Owi/XnGA+DF253/NB8RvYD5TsczJMldAgyhvJuLlgri0Ss8X
	 vQU8968jb9TyIGRKUwQ4r/1vJwUxrRQEEheAzc6dKPwAgs8nT4OGvSTnrp2MSuYSme
	 sVdLq0T1Kq7PxGh+cIVoSnT11d4azj90hOT8HpfugcXIIE8l6L/QOe9vG4wiYw20rZ
	 GQqsEgA2Oi2eQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F7A560BB0;
	Thu, 24 Sep 2026 19:15:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF102355
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C52AB410EE
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:15:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lnNyPIighi5 for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 19:15:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 82682410E8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790277313;
 b=Hzl+pOhsYw1TU/D10rsraiAMVCRhDy8Bo4WRe27dpZucPQpF/sOt70SGKyCwdQHVfgrA
 duQXRiJtgleT8G8c9wbn8mhcgIJiYRvCt9NPUj+mKFblvUf5ef7qkwCFdjqH/iSvadmI0
 CsDTkwtYllCtRm5lwOO9fvlXBQWPP3bRfk2zWn81X3WsQ6zMfqwzkSbpByevino3Aq4/+
 fZRPpRICFH4IFp3/W+X8MXAX4teAcofBZDLrbBpM5bQjoKUOFFdiFm1qMSen0Sqa5mZpX
 IB0CUkUd1wuDOeAk4F3WrMXtvWw1AeHtHAa/Hk78EiUxtRNmqen+VDhs6seYx6hearQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790277313;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=hgJB6OX41Nh4psW9catXMTIMzakxL3l3UmrHmChOYBA=;
 b=LiCnOk1rbTIsf8vKfP5uQDVy+esac9/FPBK8D7KFhLtNRiKX2Uc77kuCHxsBFX9gLn+P
 jAHt7X2rIMQxmc7ykpHX1FDcZ/WRc0AZ4GAFKCASwiZYISArVLvQijYZ0IeCQi1CQRlQw
 YehvALufpECrAki1IwgMoFc5VYL1taD2ghwkQxCl6Zmf6PBEj87Kxrog8pf2AEwwDob99
 2W1UOCM8lTdUE0hI2I2ZuF9xb03QIDs8OySGKiW71rjcGZfeDfnUX/QST9ZdDnykG6s0M
 r3Wm20hjyEoSF3uWs/icg43OY2UDpSGfNsK2S0Kze617EQD0b5qFZHIYXFQhrug6xfw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ooP1FToA; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82682410E8
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:15:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 189C15FFB1;
 Thu, 24 Sep 2026 21:15:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 24 Sep 2026 21:15:09 +0200
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 21:15:09 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260923175346.2187135-1-bernd@kuhls.net>
References: <20260923175346.2187135-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <5edb7f4c98b19d641b8ee0d4bc878a05@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.6.8
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

On 23/09/2026 19:53, Bernd Kuhls wrote:
> https://sourceforge.net/p/fetchmail/mailman/message/59396310/
> "It also includes fetchmail 6.6.7's security bugfix for NTLM, which
> has now been assigned CVE-2026-94184."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
