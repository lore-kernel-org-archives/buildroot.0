Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C81D606A31F
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eaj3PeiC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B57F810B0;
	Fri, 27 Nov 2026 18:48:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vc6jcGyFLrHs; Fri, 27 Nov 2026 18:48:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 73D5281045
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795805300;
	b=lSlQ6CP69x8u66sAIlQS2WZVZoFimecsNViIOu5ZdzbLPmFEc9RuPom/DmYusQwVlgiC
	 o8BvvLl8Ahyy+fHDPZi6GQrJ7s37ASyC3XIoeNgFCNYoYa4AumreMJ4xc0tAW+h95jlsa
	 f0NO95IBFk0nxiDobFj2vrgVO/AJHm3B8jIY/NPcWY2Kg/VMZNes+YuPkJRXobaA2G4wD
	 3Pwo7yCyTwyBenKDFwFG6vTgrdgxLDcdKJutONLIh52sjXZHMK4Anclqf2Q61GB9gVeHm
	 m07nscQlRhd+YD7ujE/CfegPBoBrxdCOhIebSyJTsZH+OR2uw/GGGNAfiKQi+Xe/EbQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795805300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:Cc:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AEwm0YR93boNiKSkVGUjcY6xHZ9fhGPDpjITGe2p2KE=;
	b=WW7C2uSwOyDpe3ayZsicfDQV2DxNUo4ZTEmKyZbFozvKfqkphyRW6X/fyppEzCcANYBa
	 /8+z+yJ6DSBA6gghF4vEum47woSalMvkN7zPCoY2VsfxcgBgb7/gGzVvvnkhAue1CnSCe
	 BITltwo9uzkWLvlKJhP5mhuhXRlFS0cDO5E0snJucbSEGERnZAnQzsOW0SXghQ8tdD6jH
	 rftH5VAbqdb1WEkjdLClGHIRSXGKXNmBu7mSg9dTf/mdrI4Vn0MC+MewSHoHXVSGnqN8n
	 lKZYM+BIH4r63ryRY4WwTzyM6yhcm7dzq6ktvpHWZzWDfTeiw6ZZx9x+8VhnxqxIEDg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795805300;
	bh=AEwm0YR93boNiKSkVGUjcY6xHZ9fhGPDpjITGe2p2KE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eaj3PeiCpdMPkYegRueaozgNMylHcvCWPFsBK7vtGlrxkYFRJ0eIOhrGS0R4ghkcp
	 A5WAmdLwm+c8YSOnif+zcWD5eS1/+5CdSKQWrwm0NraUuB2AN9m87DLjr8X8LgFdZB
	 uDND54ixOFSm1H2As1quJp6+ePzo28RGVwvl7/tGC+DXdnYrPQabtDGPX3l4ALtgMs
	 Z/6HsOvJ3rdz1rHIG54Y4CruY5zne+J8Lv6IJPXREY0UXd8YXGeHkSQjzFNb4LprNO
	 zJpZ1PYzmmUW89oM3Kmi+B1mc212AkvN4it+XF0GUuQlNIcZlryQSc1Yi3rug3rb8r
	 qKrAgI0RG+kWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73D5281045;
	Fri, 27 Nov 2026 18:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA3952BD
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC39E81045
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bkh0GmwNmKqG for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 18:48:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5CC6481036
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CC6481036
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 18:48:16 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id A21192C81C33;
 Fri, 27 Nov 2026 19:48:14 +0100 (CET)
Message-ID: <da914cab-7ac3-4a9d-af6c-3e0cb26ea834@bubu1.eu>
Date: Fri, 27 Nov 2026 19:48:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Cc: Christian Hitz <christian@klarinett.li>,
 Christian Hitz <christian.hitz@bbv.ch>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240326163750.2211753-1-christian@klarinett.li>
 <20261123195838.3045677-1-angelo.compagnucci@gmail.com>
Content-Language: en-US
In-Reply-To: <20261123195838.3045677-1-angelo.compagnucci@gmail.com>
Subject: Re: [Buildroot] [PATCH v3] package/zic: enable installation on
 target
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/23/26 20:58, Angelo Compagnucci wrote:
> From: Christian Hitz <christian.hitz@bbv.ch>
> 
> When we configure a time zone on our device's GUI we use the standard
> time zones. This gives us the usual benefits e.g. automatic daylight
> saving time switching.
> We also need to support an API that wants to set the "time zone" by
> specifying the offset in minutes from GMT. The given information
> is not enough to reliably selecting one of the existing time zones.
> Instead, when the time zone is set over this API we dynamically create
> and configure a "Custom" time zone with the given offset. For this
> we use the `zic` tool on target.
> 
> Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
> Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
Applied to next, thanks! I've moved the kconfig option into "System 
Tools" though.

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
