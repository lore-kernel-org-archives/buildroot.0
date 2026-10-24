Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F87E606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ChW/3/L7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55B5480E13;
	Sat, 24 Oct 2026 21:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NlzPp00NSIXI; Sat, 24 Oct 2026 21:55:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F96580DAE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792878905;
	b=pnxl0pkJalbOUfhpvJCLbPJsSJEiWKDmBz1eemQJD6NoXY0qsKraegC3EaeGYZScZSmx
	 szg23S0RWsKYp2w9BUp3+56rwFcOj3S93urUc19ylanZF9CCwVcaHJeWVXyEikQXoouts
	 2BH3iTd6ocOD/7Z01fQWHeI1LSyvHoqITaxJOVQUuqSELLixL0TmiC6jyz44wDKn5IyVJ
	 05umNYnsMZnXAOPrbN05MZ9uYjIesGEJY+zhJ+u4mYZBxkbILCvI4qYqhtofuKYN6RwHE
	 ANwCLxcnyGeTSkf6esJT0colX1b2h9akyldMNQdxhhi+P3ytJ7LZ2hp4XVHDPOT2/xw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792878905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=r+jH9obvC/AGkSqINhxCfi5Ev/vItWlZuscGsL5wX8s=;
	b=sdoUi6Trl17KysP/RCP0TwikRaPafsuaJb80UytPqIveMEYs+t9UtXb2ZgN+25fHDHMj
	 VBW9y/00RbS96pRDrCQ6+l8AGFajVR3uFE2evGZoLwcjafWl63iHRc49u2kdFlwRM6UPo
	 /V9JKV1tuo6/HEPzgiktZrKCOWv4KGcA7tbcrgw2BgZNeAhs84MIMsFOeXLzxSzaDwHUI
	 LgwHF8p3RpdcZ/t2Ltns5aocrpVfJwkhQApbrGAJhWDzTXucu512okYG9jDLOZJPPhS0m
	 v2ULhyl/Nbk0lQuL7C+9d6CcoXCMtwlqSIy+muk6wiGWG6A8fkn/NK3IS3jFn0nhuYg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792878905;
	bh=r+jH9obvC/AGkSqINhxCfi5Ev/vItWlZuscGsL5wX8s=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ChW/3/L7r/kFuMQ75P2aIgN30dPxOusukg4o+IWznjNT+BB7FVzjNRJKQyeAQgFT+
	 cQEqYHpJMy+/+Ui+X7Tr8AIbcxr/78XNyAoDtM7arTegDqzURS5olChfP20vqZgiHC
	 n/FcJlYLM/mbWl74mk7dO667DBJFpoltt+NVpTEYi0KmmjNcWkqEm4IrqC3TeWup5M
	 KQy1M+S0PFnua6xYmIP6SYz5MYxKP62fHoBoHIgA5o1OsUWyTD9Z0MpMFjMQfux0f6
	 jQWO9cgdohdlCa+TzHXiUptUht7Q7yATXdO9KPC4yDiUdaOJvvH4Eh30eeo/2rLwAD
	 Sw+tzAdiWBEFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F96580DAE;
	Sat, 24 Oct 2026 21:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 82215380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67BAB6061C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRRyOD2QWFI1 for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:55:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 61F7260614
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792878904;
 b=ccpboNqVOzUuVfcDHHhVGSk4akGPz48m0WOekkGT9NFobylNvBoXb6jcWXq1U+5kkUXL
 U++W/xcE9/c2tKbaV8VfstzE/w40g93SWs3udNpxK/ArAD4YDurdjfLcm51E2DW8MC3e2
 nT8eFEi8NhkU5Qbecc0mdnJcDgxhy8ukHHhhNjIX+AdOon5nj44VlWx2z7oxzwGMN+TGJ
 lx8GymZLJbrnPA0z+9fyuL8FxTaN//fqDYDuLCCMlrrLCnkHZAApsUPrfQI0q4aT+8dy9
 ZhQEujNJWgNXJ2jGA7FPSGlUsKwVCMdWElfVg9yX4Df2XRF8R6vEzyg+m8vaRK4spCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792878904;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=F/Fl3YlkdNskcwjwTq9MiJB6OC+cd3au3sFMTZYmllc=;
 b=iDC1A2+AkJgONoKKfk2zi2qMBbtKWJNnNaB8GA+O+a2prV8o3bnFW1A/+Tk4LhqZ+D7u
 f+DXkCXtFZxuoFzv/SlhY1pY/WTiWXumJ/DMjxkGjX6v+vwl5Fwl14MCfUSzAEsuL9dyc
 5wY+ejQz20e5wgeqWsU5CfprjY2XaTc/7Psy7hH5f+gIbbTFxOKOf0i3ZgMP6XBsPaJ0o
 4uY6r65Bx/P87oiKf0pAOfiKJNGira3rao3v+Rsq81Ow+u/8IUKlnamAFI8hr9WzyPK6c
 cbT7Y4B+9yEZ1h5/DeN99NRuLI4lS+IlUJx3VNc56qu5s4iSnbHZ+d3QZ3B26e30pgQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=rampyTBm; 
 arc=none smtp.remote-ip=212.227.17.21
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61F7260614
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:55:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrQEx-1wpEtf3lfb-00qOkK; Sat, 24
 Oct 2026 23:54:53 +0200
Message-ID: <5396e8ee-aa5c-477b-bfd1-ddff302c89e4@gmx.de>
Date: Sat, 24 Oct 2026 23:54:52 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Meena Murthy <meena.murthy@amarulasolutions.com>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20261024151043.1971569-1-fiona.klute@gmx.de>
 <20261024151043.1971569-2-fiona.klute@gmx.de> <at0jJBq7FyrLSsHr@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <at0jJBq7FyrLSsHr@windsurf>
X-Provags-ID: V03:K1:SsbzRmh8LNwhM0NwzLSD7C7omU80NCkBQzZJqH7U7DMNoWg9cp8
 4h5/T8PYodMw4uGbRAKzkZZEpeggHdflzFL8rBMv8xUJRmzcNsy0io76RwS7ZWER4xy/PJZ
 mkGBfayt3V2dJ0RmiSqCrmwfLPC/SS444S5annS01HqVtPrHpnys8RQ6fKNkvyKXh3uxDUU
 Kfm6rq9sc5FoUEi8+HrsA==
UI-OutboundReport: notjunk:1;M01:P0:hznxUplUeOA=;xVysOeOdmLRmZ/jkFZLMKIWFJfA
 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
 KV6DD9Oq4nep/PQsCs7uEalAc6FI4zD+p
Subject: Re: [Buildroot] [PATCH 2/2] configs/engicam_px30_core_defconfig:
 require pkg_resources for binman
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 24.10.26 um 23:29 schrieb Thomas Petazzoni:
> On Sat, Oct 24, 2026 at 05:10:43PM +0200, Fiona Klute via buildroot wrote:
>> The defconfig uses U-Boot 2025.04, so binman fails without
>> pkg_resources. Also update the kernel to the latest release of the
>> 6.12 series.
> 
> Thanks for the patch. However, I don't think we should do the Linux
> kernel version bump in the same patch.
That's fair. Also I forgot to update the hash file, which would've 
worked only as long as it's the most recently packaged version. Anyway, 
sent v2 without the kernel version bump.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
