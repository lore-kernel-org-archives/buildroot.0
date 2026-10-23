Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49CA606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XB6R+BlM
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C130811AD;
	Fri, 23 Oct 2026 10:28:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o301GQnf5exm; Fri, 23 Oct 2026 10:28:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 85774811BF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792751291;
	b=HDDxGfQ9i6j7L5n/vNI0td8/WNtwVwEnP1kPpF5cwSaT8I5v9WGS1yawcArEBQETlAfE
	 78l9+hbQyBDZ6QV3l5XKyjA1585fkNNstDytzK4qqViCYjmVqOW3HWxy8i50wxGTGp5Zf
	 LLYCLB4AHftGZ9ggajJZirJhOrox2VE0Yk/BjLXJFh9arm5X58inkITWnBDz0tsnQ+GKx
	 Doys1OPW7igvJxwJdJ3V1+XxSF0c/ikpxZi9DU2oc3EhKwlJoLnwJXlez/1A7G4Tbz7K9
	 zA8jvJUQEyWdOmm2XmwXURYbaNasgzPse7imNre9nyM6/ELPKatQLdA1EeJsoikctOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792751291;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=5d3sjwLFnuAiLQMa3Av5Z046W4DZQrQXEv9MMJiEAlA=;
	b=NxkWqBu2xCzEsGgSfgcAlOBN+A2Kj9xH2vROS16RSqOzFLUbeAS1MtWAY5qGJJHV87z9
	 Yu7wQngGg5FK7QaYFZtTkZE2JW0w+LL7WeGzqVFRHaeu7R9tSlm7ht/9+HF0ov4m2UYov
	 aIhbT3WtFizAMpFfHb560djZg0Z8zEXnBk3piTw3RwvmQR16c6USeYqwu2xdeB8gTGhUq
	 C2vOHphbNC06KKTp8jG76G1ytXedD6rNScQ/sHRKwXOP2j/SE4gdSDD3sHxBT+o5PiaEW
	 OXKLjee+cmlumZUQGe0jUzpbMWcJuSnqE1go6Oys2yqOwRnQAcd7FcP5QfvYlXyOb2A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792751291;
	bh=5d3sjwLFnuAiLQMa3Av5Z046W4DZQrQXEv9MMJiEAlA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XB6R+BlMr26cmLSF92z4Ma3swg4ANZY3Pg0WFqx2Qaec1MSum8Oe8ErClDCXiFe6Z
	 cY0xtXzhQNCV/V+uXhoIqCac59OSK/aODBHekyl1M/Uduavp18YB9jnZRVd7pWwneI
	 zJ7mFSFXehsL0wOPMEHCDclmgVO4iTT8ybjZdV7agru9uFYTzCnNQRWJUU7ynK/LMi
	 HcChIgThRIH6oiF14b/vUTG5rf5DpHnR7ijWVH4hoMQDNs5s1H/1MeErWp1pQBuEES
	 UFJd9PwzxfIvG0IEv2jNNnpFRiLT+7AaU7+2n2seocY8+smetKtFAqQ+rm3dD3SiL+
	 BNDqaNwYHhE/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85774811BF;
	Fri, 23 Oct 2026 10:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF43A49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACCA9811BF
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bjKdLSr5LvV for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:28:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C8739811AD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792751288;
 b=VUJGTbwaqABhomLc/nf/UlDvx0N4ntnVLV+b+9QdNFNHxFUAfMWE6Hz5OjQS9OEZK7oP
 8kpzOI71kNzppTa6v/y7dR0kY97Dm2UjYj9BaDq6xP0AOUJ4YGqJj/cxYsas9oHEbo2wz
 7AAWZWj9miv5i7cFstNIeWNcmrv8nhhwdQwnUmdZp9lfk8ZU7RzovhVLd0V58+DT+yIdT
 BH3GXZuNxZ0D8L3IaJiDAhODm+mwaOpF/TSf83a3KfVlog/5jDlPJfRcGbaERnW1yu/nG
 PEHDw1Gxq1SFFGgbzJODmbapsya7nAgaupKJuYSunOB9okp5NrW1MnckWO2dVAddSXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792751288;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=0I7q6vuf/PK8heTy9yJ1A20212p25IwRznKo3mm/a3I=;
 b=jmKr8USjNPMXEDp3qmKHcDNRjVd1lIMr88erHwCVZpop6r0ndYMPD9nFKqjMVYfDIpHP
 kDclhPLIFcf7Fs6wMpZMYyXY16YkIMUmz8FIMQj+fED7/ij2DO4aQZozZ8UOT/KNVRBU+
 5o+edtI38omBDLwHmoOUgnP1brYe/jk88HIFj6WJZxSZ8Vwa2s0tN3tkR9dDbNfhPbcXm
 9pHQm6wo5x/2P/jx8E9UJ3FwXrOpDGemRR3M7zlfCYGpk5A/agEHO64tVrh/ICGKygO5K
 //T8ZgwXJTWHXb2n+IjgnBX2ASFKhtMX3ACxq5OeojI9BnW+OCNbiAzsIUmNx+ZhEVQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=VkdMunyc; 
 arc=none smtp.remote-ip=212.227.15.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8739811AD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:28:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1wsXFA2Kh3-00br5d; Fri, 23
 Oct 2026 12:27:57 +0200
Message-ID: <a4247a1f-0c42-47b1-a739-139fdc026776@gmx.de>
Date: Fri, 23 Oct 2026 12:27:56 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <aq4_lUtScguSDLRY@waldemar-brodkorb.de>
 <atfRLgIqqBBd6TuN@windsurf> <atfrauVhAXrHeul4@waldemar-brodkorb.de>
 <atsOH2BI10KVAnRX@windsurf> <atszrpfaNpx3zWmi@waldemar-brodkorb.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <atszrpfaNpx3zWmi@waldemar-brodkorb.de>
X-Provags-ID: V03:K1:Zjs/VvFv4AIPZUSDALJeF1aGcCa+fnU+hlvQaKyyRw0WXzk89Rv
 HP0tJyP/Ju0cxc+O87feR8cY4lPYsUye91wpDJdVi3nnK5crUx0FZjPXhZD7VNzYGufAnOU
 NcFoyX0lL6+hbuZdiT9fORT7HxWLuT7nfecvw/meBPnMeouPh6uo3mp14yo8OL3sO4+u3Gd
 xJOyUOcZ/3faonqH7YY6g==
UI-OutboundReport: notjunk:1;M01:P0:Oyg+9h11tIY=;j3qg/xeCfj9ljI2dc1dFQ7p6hms
 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
 hoH8ctEiwbNsiDDzU1J3g=
Subject: Re: [Buildroot] [PATCH v2 2/2] package/chawan: new package
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
	SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 23.10.26 um 12:15 schrieb Waldemar Brodkorb:
> Hi Thomas,
> Thomas Petazzoni wrote,

[snip]

>>      or1k     |          chawan-0.4.4          | NOK | https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b |
>   
> OpenRISC is not supported. How would I express this in Config.in?
> Any suggestion?

If it's about the specific architecture:

depends on !BR2_or1k

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
