Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90A1CCD193
	for <buildroot@archiver.kernel.org>; Tue, 14 Oct 2025 16:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACA2760F17;
	Tue, 14 Oct 2025 16:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LDoNFyfI7fwk; Tue, 14 Oct 2025 16:13:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D96DB60F3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D96DB60F3F;
	Tue, 14 Oct 2025 16:13:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 39F1FBC
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BB5682F06
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7UU1V64qXN8 for <buildroot@buildroot.org>;
 Tue, 14 Oct 2025 16:13:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5073812C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5073812C7
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5073812C7
 for <buildroot@buildroot.org>; Tue, 14 Oct 2025 16:13:50 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 123D12C89163;
 Tue, 14 Oct 2025 18:13:48 +0200 (CEST)
Message-ID: <97d70f60-4403-4305-b26b-3be499e7c6c5@bubu1.eu>
Date: Tue, 14 Oct 2025 18:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20251014142954.2579135-1-buildroot@bubu1.eu>
 <PH1P110MB1603E98157823E32754215B79FEBA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <PH1P110MB1603E98157823E32754215B79FEBA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1760458428; bh=v1zL6KM52uAve6d5Dmw7AOvIBzCzQFEywLVCkxExnW0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YoNgF1Lpm8e9dCgMnPX59zkS8TodEWttSDtmMUsrki4Ebf6d36Om7/g9Kg5z3yvw+
 DTz5ywNbWC/5w4vaqCARFyKq4ZePFWTUh0TCOLdHzRagAiiZSU4mt9EAG2+TQyHkBL
 8g921R3Vr0iIhSKOnQ5h0Uy3ZmT6KJRc4CDUCEx6cGbCUWxWCtK/hEqU7GU385QSaU
 ZI8GUqCRKw04wIhXZEiiOQL0TaAawTnHJk+/iGWWd24/v/8MI4+j9W6FjovksmbnAq
 SN1CUyF1bojziONmV3v/3IthCazjDXV8UnvDcWqEbQ2sh1GsPhVXHLSAQG72AZzDsH
 wOSHhOQNHMrAA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=YoNgF1Lp
Subject: Re: [Buildroot] [External] - [PATCH] package/python-anyio: bump to
 4.11.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On 10/14/25 17:46, Vincent Fazio wrote:
> Apologies to Marcus and James for getting this twice, the last email had a Reply-to and I didn't see the list was excluded from my response
> 

[...]

>> -PYTHON_ANYIO_VERSION = 4.10.0
>> +PYTHON_ANYIO_VERSION = 4.11.0
> 
> Just as a heads up, if anyio 4.11 is being used with trio as the backend, it requires trio 0.31:
> https://github.com/agronholm/anyio/commit/b2c933cd5540b4e703d0ee204ec6b64641dd180f
> 
> I don't think the bump to trio 0.31 has been submitted to the ML yet?

Thanks for the heads up, I've sent that now:
https://patchwork.ozlabs.org/project/buildroot/patch/20251014161134.2592291-1-buildroot@bubu1.eu/

> 
> -Vincent
> 
> 

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
