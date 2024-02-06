Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A649C48286
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 09:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C36820F0;
	Tue,  6 Feb 2024 09:28:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZIEB9NJlZLL5; Tue,  6 Feb 2024 09:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4009A820F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4009A820F5;
	Tue,  6 Feb 2024 09:28:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4CC41BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB16A41184
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB16A41184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OI7u4wJL-itK for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 09:28:27 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EC6D41183
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 09:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EC6D41183
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so4103395f8f.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 01:28:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707211705; x=1707816505;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IQy5hyeH8w4cv581VAu3/hOo2ISdYwWT0y2ITaCeoUs=;
 b=G8r4VBUQeNcFD1HMl93QzGgvh15DpmG0/JgoSl7aHL0Nw9T13d5BzDvgv8Akr3begP
 Vi4TnKIlpu+9nW4jEMgLlOSKilh2aZu1gZDcGv6CqGao46H3BIH01cIP5j8Klz0nFXk6
 hBs3JakvoRrhIwawmKItkEDKQ9LmebPA9pnofHHe8jRH8t4hgcsK21DVIlSOtiCUAsg4
 LLtTEf1yrXS3i/jqJ7J20u7lewKOkyjb+bZD4nUIEBbawptLCMumMs3CS+aDlb9g10Wh
 P+Z6Ui+8i4HyXIRvMFW4qmJ/a5TRDqbZuHeLfxBrKrF5dF1dEupsRYCr4v0BpKw71uW5
 h6jw==
X-Gm-Message-State: AOJu0YwPj5B8y+A7iD5Feyr2CjxT/pR9qThGTfMQ7r8nQLgiFnX6o0Zt
 2OuH7c0zBaycd4Exdwvhpe3MpCkCkdf0sODtWJ9ja9y9TKpCgv9+oYaYvo/n/uY=
X-Google-Smtp-Source: AGHT+IF1/oJCNyuKOrmif/fRbxosPTsIm2R+MwvxtipqrIHBXaSebXWuZJDX+8NZH6uYS/GAk1vXLA==
X-Received: by 2002:a05:6000:1f04:b0:33b:48ef:1d6 with SMTP id
 bv4-20020a0560001f0400b0033b48ef01d6mr810487wrb.60.1707211705336; 
 Tue, 06 Feb 2024 01:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXLMaNfq6mwGEPEBxIFYLLX3DQQO0Y+o+jlazBXtD6Mjg2Pf4SEhn8WUrWiDVVzDpiW4tEkjg7/HtysyLqRzcsWKw9Ybsf8MA==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a5d4b47000000b0033ae4a3b285sm1594681wrs.36.2024.02.06.01.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:28:24 -0800 (PST)
Message-ID: <3a235bc3-897e-4dc0-b2a1-3573467e31e4@mind.be>
Date: Tue, 6 Feb 2024 10:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <2716329.mvXUDI8C0e@laptop>
 <b52d94dd-072c-42bc-8958-58141e8a20e2@mind.be>
In-Reply-To: <b52d94dd-072c-42bc-8958-58141e8a20e2@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707211705; x=1707816505; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IQy5hyeH8w4cv581VAu3/hOo2ISdYwWT0y2ITaCeoUs=;
 b=RBOraDqB7n7gKg/EgfneMsCJ5EzWv2zYG17VdXqNh1Wsg4Q/JWsM69D83Vd0M6drtQ
 NxZEf/EwaaLWF1VAleaw26ng0B0rhtzhMFRlTWMp84TUAMvJ3VR6/Z5gih/A1aaFvKLF
 bKf09JNkfXKLemcX4vdCq4vqQSb2j42PQUK1Qh8/lz6MGYJ+47zHiD64jQfTqXtmpGa+
 KoE48+ZQf/tC2Veyizc96s2EQpmDKBYiT3sxbG1IAiJofuQuP4bmKREYOODXThSKH109
 JCBbCDdKqWAxTOZV5Gisbwy9+BonPEO9lD4n7zZzAaeYxMbtt4PbJ6eElQlc9rUfHoke
 SqBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RBOraDqB
Subject: Re: [Buildroot] [help] configs/rock5b_defconfig: Switch to mainline
 kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA2LzAyLzIwMjQgMTA6MjUsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IMKgSGkg
S2lsaWFuLAo+Cj4gT24gMDYvMDIvMjAyNCAwNzo0MSwga2lsaWFuLnppbm5lY2tlci0tLSB2aWEg
YnVpbGRyb290IHdyb3RlOgo+Cj4+IE9mIGNvdXJzZSBpdCBjb3VsZCBiZSwgdGhhdCBpdCBpcyBq
dXN0IG5vdCBjb25maWd1cmVkIGFueW1vcmUgdG8gcHV0IGEgc2hlbGwgb24KPj4gdGhlIHNlcmlh
bCBpbnRlcmZhY2UsIGJ1dCBJIGFscmVhZHkgdHJpZWQgdG8gYWRkcmVzcyB0aGF0IHdpdGg6Cj4+
Cj4+IEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWT15Cj4+IEJSMl9UQVJHRVRfR0VORVJJQ19HRVRU
WV9QT1JUPSJzZXJpYWwyIgoKIMKgT2gsIGFuZCBpdCdzIHNhZmVyIHRvIGtlZXAgdGhpcyBhdCB0
aGUgZGVmYXVsdCAiY29uc29sZSIgLSBpZiB5b3UgZ2V0IGtlcm5lbCAKb3V0cHV0IG9uIGNvbnNv
bGUsIHRoZSBnZXR0eSBvbiB0aGUgc2FtZSBsb2NhdGlvbiBzaG91bGQgd29yayBmaW5lLiBXaXRo
IAoic2VyaWFsMiIgeW91IGhhdmUgdG8gYmUgc3VyZSB0aGF0IHRoYXQgaXMgcmVhbGx5IGNvcnJl
Y3QgYW5kIHRoYXQgeW91J3JlIG5vdCAKY29uZnVzaW5nIHdpdGggdGhlIG5hbWUgaW4gZGV2aWNl
IHRyZWUgb3IgaW4gVS1Cb290LCBib3RoIG9mIHdoaWNoIG1heSBiZSAKZGlmZmVyZW50LiBBY3R1
YWxseSwgInNlcmlhbDIiIGlzIGFsbW9zdCBjZXJ0YWlubHkgd3JvbmcsIHNlcmlhbCBwb3J0cyBh
bG1vc3QgCmFsd2F5cyBzdGFydCB3aXRoIHR0eS4KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
