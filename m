Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334FAC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 11:45:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7B0F409B1;
	Tue, 16 Jul 2024 11:45:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INiAruLRPt6D; Tue, 16 Jul 2024 11:45:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A591140B24
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A591140B24;
	Tue, 16 Jul 2024 11:45:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A97FC1BF387
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 11:45:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3DF06090B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 11:45:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gZmUQkVRadVl for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 11:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.53.144.211;
 helo=mail.selirafood.com; envelope-from=foss@athaariq.my.id;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F53360908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F53360908
Received: from mail.selirafood.com (mail.selirafood.com [117.53.144.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F53360908
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 11:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.selirafood.com (Postfix) with ESMTP id 57D2A1F961;
 Tue, 16 Jul 2024 18:45:40 +0700 (WIB)
Received: from [192.168.111.115] (unknown [192.168.100.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by mail.selirafood.com (Postfix) with ESMTPSA id 9DECE1FA3B;
 Tue, 16 Jul 2024 18:45:39 +0700 (WIB)
Message-ID: <8c2efc93-e2a8-402e-adf0-5679ef6c7cc8@athaariq.my.id>
Date: Tue, 16 Jul 2024 18:45:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>,
 buildroot@buildroot.org
References: <20240715160941.90353-1-foss@athaariq.my.id>
 <D2QRF2XRV54A.YI13SBIAUJMY@gmail.com>
Content-Language: en-US
From: Athaariq Ardhiansyah <foss@athaariq.my.id>
Autocrypt: addr=foss@athaariq.my.id; keydata=
 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
 GMviPu198f0Mg1RQmg==
In-Reply-To: <D2QRF2XRV54A.YI13SBIAUJMY@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=athaariq.my.id; 
 h=content-transfer-encoding:content-type:content-type
 :in-reply-to:from:from:content-language:references:subject
 :subject:user-agent:mime-version:date:date:message-id:received;
 s=dkim20240121; t=1721130340; x=1722339941; bh=XWNgDnSmQSsts5h9
 O53nD4EzOIhH7vlP8X9RUiN1ssw=; b=nt1Ax1GoBSg8CYY2s77SssmZ3bNjVGB1
 MQKUeK48Aoy0gkl79nqKp7Mrfh7U0c0tlAEamcjOADvavel8zhFExMd+jJ0fM+0h
 Rld/rSJZpF+tSfHX79SRprCnF3RomywEBW419JmGzwCtFxwBLGHGIGtZ1ykGbDPr
 G7xemJPpyPbv/XIP9VR+10+HqMqNFuMb6XOwsE0OlPk+e98wvaRXq+Hh1lgfoi5b
 /M4dl/kYgyJSd/KHLaZ+tYDJVhjxAUV94I6dpysH2f/7ih54f7sD4dTlOnp7+yfX
 a1N0gnn9noD4Yqo+DJwpnvA1UDAHQ1crACIWqQftQwrYaNjX/H6A6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=athaariq.my.id
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=athaariq.my.id header.i=@athaariq.my.id
 header.a=rsa-sha256 header.s=dkim20240121 header.b=nt1Ax1Go
Subject: Re: [Buildroot] [PATCH v5 1/3] package/rpi-firmware: bump version
 to 1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2HDq2wsCgogPiBBcyBpdCB3YXMgc2FpZCwgQlIgaW5zdGFsbHMgdGhlIGR0YnMgZnJv
bSB0aGUgbGludXgga2VybmVsIHBhY2thZ2UsIGFuZAogPiB0aHVzLCB0aGUgZHRicyBhcmUgKipO
T1QqKiBmcm9tIHRoZSBycGktZmlybXdhcmUgcGFja2FnZSwgc28gSSBndWVzcyB0aGUKID4gYnVt
cCB3b3VsZCBub3QgZml4IGFueXRoaW5nLgogPgogPiBVbmxlc3MgdGhlIGZpeGVzIGNvbWUgZnJv
bSB0aGUgZHRiIG92ZXJsYXlzIHlvdSBoYXZlIGluc3RhbGxlZC4gQnV0LCBpZgogPiBub3QsIEkg
d291bGQgbGVhdmUgaXQgYmxhbmssIGJlY2F1c2UgaXQgY291bGQgYmUgd3JvbmcgYW5kIGNvbmZ1
c2luZy4KClllYWggSSBhZ3JlZS4gSSB0aGluayB0aGlzIHBhdGNoIHNlcmllcyBpcyBubyBsb25n
ZXIgcmVsZXZhbnQgZm9yIG5vdy4KVGhlIFdpLUZpIGJyZWFrYWdlIGZpeCBvbmx5IGV4aXN0IG9u
IGxpbnV4IHY2LjYuMzksIG5vdCB2Ni42LjMxIHdoaWNoIGlzCmN1cnJlbnRseSBsYXRlc3Qgc3Rh
YmxlIG5vdy4gVGhlcmVmb3JlLCB0aGUgYnVtcCB3b24ndCBkbyBhbnl0aW5nIHVzZWZ1bAp1bnRp
bCB0aGUgbmV3ZXIgc3RhYmxlIHRhZy4KCiA+IEFzIHJlcXVlc3RlZCBieSBUaG9tYXMsIHlvdSBj
YW4gYWRkIHRoZSBmb2xsb3dpbmcgY29tbWVudDoKID4JIyBQbGVhc2Uga2VlcCBpbiBzeW5jIHdp
dGggY29uZmlncy9yYXNwYmVycnlwaSpfZGVjb25maWcKClRoaXMgZ29pbmcgdG8gYmUgc3VibWl0
dGVkIG9uIHRoZSBuZXh0IHJhc3BiZXJyeSdzIGxpbnV4IGtlcm5lbCBzdGFibGUKdGFnLCBhcyBJ
IHdhbnQgdG8gZXhwZXJpbWVudCB0byBtYWtlIHRoZSB2ZXJzaW9uIHRhZyBzeW5jaHJvbml6ZWQg
b24KYm90aCBrZXJuZWwgYW5kIHJwaS1maXJtd2FyZSB2ZXJzaW9uLiBJZiBpdCBpbXBvc3NpYmxl
LCB0aGVuIFRob21hcycKc3VnZ2VzdGlvbiB3b3VsZCBiZSB0aGUgYmVzdCBvcHRpb24uIEknbSBn
b2luZyB0byBidW1wIGFsbCBvZgpyYXNwYmVycnkgcGkgYm9hcmRzIGF0IG9uY2Ugb24gdGhhdCBw
YXRjaCBzdWJtaXNzaW9uLgoKUmVnYXJkcywKQXRoYWFyaXEgQXJkaGlhbnN5YWgKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
