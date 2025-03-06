Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33431C282D1
	for <buildroot@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5C57405E6;
	Thu,  6 Mar 2025 09:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e3t0fqyNYQcu; Thu,  6 Mar 2025 09:55:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A254A405F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A254A405F9;
	Thu,  6 Mar 2025 09:55:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A18E2E
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 09:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86DBC8114F
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 09:55:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DST2u_SGaTDC for <buildroot@buildroot.org>;
 Thu,  6 Mar 2025 09:55:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6CCB381147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CCB381147
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CCB381147
 for <buildroot@buildroot.org>; Thu,  6 Mar 2025 09:55:45 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id A2213C03EB;
 Thu,  6 Mar 2025 10:55:42 +0100 (CET)
Message-ID: <c9a593c0-e4a8-48e1-ba81-e12c2754a983@grenoble.cnrs.fr>
Date: Thu, 6 Mar 2025 10:55:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: Buildroot development <buildroot@buildroot.org>
References: <310eae0e-6e47-45a9-a35a-184211d1dcbe@grenoble.cnrs.fr>
 <fca5f92a41186df235bcf35c7722f18f@free.fr>
Content-Language: en-US, fr
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <fca5f92a41186df235bcf35c7722f18f@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1741254942;
 bh=lrdLUylElV0Z4Bw6ZdF5VIcg9vU4ILBhN0m8JbIlTyM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Cmy9LMdLdcZhyI2A9lNHsO/hSBWRYyXvXWePaKi9DMd+VGeoB6f03DPSDgH6giHTO
 hMbDEFAWUv+DdGfcMJPd7ERI8pietG+z/zXDeJ7KUqZ2+2WpSzfa0+L43TCXV6EltN
 SVAnp+keisB5+m7N6yKPqyPUfa9h9BmdZx82pa8HTrdu125UqI2miQgF16mFM364KE
 D1dLAGmWrqGuz3CGjNpLO7J93ybWmY+CGfGHOlYaxDqVW0/LqkxV3besq/A33pkxTw
 VxZeFMupyaF0vDb00v6iWfld7veyxe9UqiJx7Sm9/vB0ibn48Tsb2r/rNX1SlpXAMJ
 j76nzafW/FBog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=Cmy9LMdL
Subject: Re: [Buildroot] [PATCH 0/2] Bump Acqua boards to Linux 6.12.17
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpKdWxpZW4gT2xpdmFpbiB3cm90ZToKPiBGb3IgeW91ciBpbmZvcm1hdGlvbiwgSSBt
ZXJnZWQgdGhlIHNlcmllczoKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
YnVpbGRyb290L2xpc3QvP3Nlcmllcz00NDU1ODImc3RhdGU9Kgo+IGludG8gbWFzdGVyLgoKR3Jl
YXQhIFRhbmtzLgoKPiBTbyB0aGUgYnVtcHMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIHBvc3Rwb25l
ZCBhZnRlciB0aGUgcmVsZWFzZQo+ICh1bmxlc3MgdGhlcmUgaXMgc29tZXRoaW5nIGVsc2UgdG8g
Zml4KS4gCgpBY3R1YWxseSwgdGhpcyBvbmUgd2FzIG9ubHkgbWVhbnQgYXMgYSB3b3JrYXJvdW5k
LCB1bmRlciB0aGUgYXNzdW1wdGlvbgp0aGF0IHRoZSBwcmV2aW91cyBvbmUgd2FzIGdvaW5nIHRv
IG1pc3MgdGhlIEJ1aWxkcm9vdCAyMDI1LjAyIHJlbGVhc2UuClRoZSBhc3N1bXB0aW9uIGJlaW5n
IHdyb25nLCB0aGlzIHNlcmllcyBoYXMgbm8gcHVycG9zZSBhbnltb3JlLiBJIGp1c3QKbWFya2Vk
IGl0IGFzIOKAnHN1cGVyc2VkZWTigJ0gaW4gcGF0Y2h3b3JrLgoKSGF2ZSBhIG5pY2UgZGF5IQoK
RWRnYXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
