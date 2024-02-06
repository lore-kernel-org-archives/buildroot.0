Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7D7C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30A0861162;
	Tue,  6 Feb 2024 13:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30A0861162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QyzOGT5e5Q4c; Tue,  6 Feb 2024 13:59:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53A3560608;
	Tue,  6 Feb 2024 13:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A3560608
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 681361BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4117E41E42
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4117E41E42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skHvgq6EAW-I for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:59:28 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4396341E3A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4396341E3A
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33b4b121e28so57691f8f.1
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 05:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707227966; x=1707832766;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tfMUvUR5X/l0jfN1uRoG178eNIGap0iWbtzsRQvu58g=;
 b=uq5b4LR9X5qMMRFn7kGkej6sT606eVzQRuw3D1j6dzrFisV8qIUXuhUM/Fn7BBLkEr
 e0Crg9cZaVfRu1H3sYfq30k6JKgjrBsX8gJAT7Ys9Rl+7LL9NjWoPQszKFiS8sG8saPN
 /V/aSoD4avMGvq9Q8hiJjXBsyaihE7nxir8Oo3q2MIFuxi+Xsv+BFjz0mj5H8gBO4Qe5
 NQtfQdV6MRZVKbLuoiXMmXT54Ko/IuQHrAamcj7HJ44RJuEuJcYTdaAqPAywYerbMS+C
 W8uHbGUcZ5X8wBqigyshLHO9OFlL+PN8UYLHU+Neos6AGVDRnY1fxGCEebOMFdA1i6ya
 nAJw==
X-Gm-Message-State: AOJu0Yzo2VBa9NtL0oejpZVDMErlWFghMzfgPmlmrP3AUuns9jGuoqTm
 i2fYMFeLCR6nRaWSnuXGIKwAulpYoPXDRPS2+m2Gdu4MAiVy31yCgqY0TG971NM=
X-Google-Smtp-Source: AGHT+IFtnb6nLwHZIzlf1Lxe8OJ7TIT0NCAjJvkfj1poewfj+7+TdEsJ1Gi1vwsSXFlOpFgW6Z0LCQ==
X-Received: by 2002:a5d:480a:0:b0:33b:3cb0:3081 with SMTP id
 l10-20020a5d480a000000b0033b3cb03081mr1322714wrq.6.1707227966198; 
 Tue, 06 Feb 2024 05:59:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVgwaMf64O4UvRlCecemGnd3blLT3uW/XKBvTMVcllYbBkh8mUu51OznNI5hMG5ZsTEJeEnu3ctruYibQ83wffuLRrI8fpcIHRmdG5HTcOzs8SWjtvE+EoNBHzjECr6kMcSMw==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a05600c2a5300b0040fbdd6f69bsm2063181wme.33.2024.02.06.05.59.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 05:59:25 -0800 (PST)
Message-ID: <11005254-f77b-46ed-8b65-7e23bd97f37d@mind.be>
Date: Tue, 6 Feb 2024 14:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Marleen Vos via buildroot <buildroot@buildroot.org>
References: <20231219121508.1695768-1-marleen.vos@mind.be>
 <20231219121508.1695768-5-marleen.vos@mind.be>
 <20240206142549.2ad91f3b@windsurf>
 <018bc3f7-2ae5-4d36-8c6b-485f41b4f319@mind.be>
In-Reply-To: <018bc3f7-2ae5-4d36-8c6b-485f41b4f319@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707227966; x=1707832766; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tfMUvUR5X/l0jfN1uRoG178eNIGap0iWbtzsRQvu58g=;
 b=gYt4durIL1rwWiPQbX9vBBPZI7DvYaWidXGpI73yg061TDO5fh71awq9f40M06zPzk
 icce5xW69BLzR41bJpLUG7nGJUks7MKrZtxrjueC2tT1W6s+pEt3LPyaFMcTpNDI0Xnr
 OjigHK10Ce6TmFrEa/BNxaqJ7itprsznA2R/wYBd1hXhLziCBMlBPIwn311NQS65zgC7
 yFlfcauV9oSHHPCeXxa+6ULJNo8PB7bb/ie9Ni9cDEbnf7pZ00flYjhUEvQWvF+37EIj
 D4kLeQBc8PsRapq8r1yyPKKAspkw/z2IjzhcBA95cbc9+gLZqb2LZvrfTdw6FgZ+rJIA
 HT8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gYt4durI
Subject: Re: [Buildroot] [PATCH 4/7] boot/arm-trusted-firmware: add config
 option to use latest lts-v2.8.13
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
Cc: Marleen Vos <marleen.vos@mind.be>, marleen.vos@essensium.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA2LzAyLzIwMjQgMTQ6MzgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwNi8wMi8yMDI0IDE0OjI1LCBUaG9tYXMgUGV0YXp6b25pIHZpYSBidWlsZHJvb3Qgd3JvdGU6
Cj4+IEhlbGxvIE1hcmxlZW4sCj4+Cj4+IE9uIFR1ZSwgMTkgRGVjIDIwMjMgMTM6MTU6MDUgKzAx
MDAKPj4gTWFybGVlbiBWb3MgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+
IHdyb3RlOgo+Pgo+Pj4gRnJvbTogTWFybGVlbiBWb3MgPG1hcmxlZW4udm9zQG1pbmQuYmU+Cj4+
Pgo+Pj4gUGF0Y2ggMDAwMS1mZWF0LWJ1aWxkLWFkZC1zdXBwb3J0LWZvci1uZXctYmludXRpbHMt
dmVyc2lvbnMucGF0Y2ggYXMKPj4+IGZvdW5kIGluIHYyLjggcGF0Y2ggZGlyIGhhcyBhbHJlYWR5
IGJlZW4gYXBwbGllZCBpbiBsdHMtdjIuOC4xMwo+Pj4gUGF0Y2ggMDAwMi1idWlsZC10b29scy1h
dm9pZC11bm5lY2Vzc2FyeS1saW5rLnBhdGNoIGZyb20gdjIuOCBoYXMKPj4+IGJlZW4gaW5jbHVk
ZWQgYXMgMDAwMS1idWlsZC10b29scy1hdm9pZC11bm5lY2Vzc2FyeS1saW5rLnBhdGNoIGZvcgo+
Pj4gbHRzLXYyLjguMTMKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXJsZWVuIFZvcyA8bWFybGVl
bi52b3NAbWluZC5iZT4KPj4+IC0tLQo+Pj4gwqAgYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZS9D
b25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKwo+Pj4gwqAgLi4uL2FybS10cnVz
dGVkLWZpcm13YXJlLmhhc2jCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAr
Cj4+PiDCoCAuLi4xLWJ1aWxkLXRvb2xzLWF2b2lkLXVubmVjZXNzYXJ5LWxpbmsucGF0Y2ggfCA3
NyArKysrKysrKysrKysrKysrKysrCj4+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDg0IGluc2VydGlv
bnMoKykKPj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCAKPj4+IGJvb3QvYXJtLXRydXN0ZWQtZmly
bXdhcmUvbHRzLXYyLjguMTMvMDAwMS1idWlsZC10b29scy1hdm9pZC11bm5lY2Vzc2FyeS1saW5r
LnBhdGNoCj4+Cj4+IFRoYW5rcyBhIGxvdCBmb3IgdGhpcyBwYXRjaC4gSG93ZXZlciwgSSBkb24n
dCB0aGluayB3ZSB3YW50IHRvIGFkZAo+PiBleHBsaWNpdCBjaG9pY2Ugb3B0aW9ucyBmb3IgYWxs
ICJyYW5kb20iIHZlcnNpb25zIG9mIFRGLUEuCj4KPiDCoFRoaXMgaXMgdGhlIGN1cnJlbnQgc2l0
dWF0aW9uIGhvd2V2ZXI6CgoKIMKgU29ycnksIEkgbWlzcmVhZCB5b3VyIGNvbW1lbnQuCgoKIMKg
VGhlIGlkZWEgaXMgbm90IHRvIGNyZWF0ZSB2ZXJzaW9uIG9wdGlvbnMgZm9yIGFsbCAicmFuZG9t
IiB2ZXJzaW9ucyBvZiBURi1BLiAKSW5zdGVhZCwgdGhlIGlkZWEgaXMgdG8gaGF2ZSAzIG9wdGlv
bnM6IGxhdGVzdCwgbHRzLCBhbmQgY3VzdG9tLgoKIMKgVGhlIGlkZWEgaXMgYWxzbyB0aGF0IGJv
YXJkIGNvbmZpZ3Mgc2hvdWxkIGJlIGFibGUgdG8gdXNlIHRoZSBsdHMgdmVyc2lvbiwgCnNpbmNl
IHRoZSBhc3N1bXB0aW9uIGlzIHRoYXQgbHRzIGlzIG5vdCBnb2luZyB0byBicmVhayB0aGluZ3Mu
IEkndmUgdGFrZW4gYSBsb29rIAphdCB0aGUgVEYtQSBMVFMgYnJhbmNoIGFuZCB0aGUgY29tbWl0
cyBpbiB0aGVyZSBsb29rIHJlbGF0aXZlbHkgc2FmZS4gRnJvbSBhIAp1c2VyIHBlcnNwZWN0aXZl
LCBJIHRoaW5rIGl0IG1ha2VzIHNlbnNlIHRoYXQgeW91IGNhbiB1cGRhdGUgQnVpbGRyb290IGFu
ZCBnZXQgCmFuIGF1dG9tYXRpYyB1cGRhdGUgb2YgVEYtQSBvbiB0aGUgbHRzIGJyYW5jaCBhcyB3
ZWxsICh3aGljaCBpcyBub3QgcG9zc2libGUgaWYgCnlvdSBzcGVjaWZ5IGEgY3VzdG9tIHZlcnNp
b24pLiBJLmUuIGZyb20gYSBwcmFjdGljYWwgcG9pbnQgb2YgdmlldywgSSB0aGluayB0aGlzIAps
dHMgdmVyc2lvbiBpcyB0aGUgb25lIHRoYXQgcGVvcGxlIHNob3VsZCB1c2UuIEl0IHNob3VsZCBw
cm9iYWJseSBldmVuIGJlIHRoZSAKZGVmYXVsdC4uLgoKIMKgV2UgY291bGQgYWxzbyBoYXZlIHJl
bW92ZWQgdGhlICJsYXRlc3QiIG9wdGlvbiBlbnRpcmVseS4gUGVyaGFwcyB3ZSBzaG91bGQsIApy
ZWFsbHksIEkgZG9uJ3QgaGF2ZSBhIHJlYWxseSBnb29kIHVzZSBjYXNlIGZvciBpdC4gTWF5YmUg
Zm9yICJob2JieSIgdXNlcnMgd2hvIAp3YW50IGJsZWVkaW5nIGVkZ2Ugd2hlbiB0aGV5IGZvbGxv
dyBCdWlsZHJvb3QgbWFzdGVyLgoKIMKgU28gdGhhdCdzIHRoZSBiYWNrZ3JvdW5kIGZvciBhZGRp
bmcgdGhlIExUUyBvcHRpb24sIGFuZCB1c2luZyBpdCBpbiB0aGUgCmRlZmNvbmZpZy4gVGhhdCBs
ZWF2ZXMgdGhlIHF1ZXN0aW9uIHdoeSBpdCBpcyBjYWxsZWQgCkJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfTEFURVNUX0xUU192Ml84X1ZFUlNJT04gaW5zdGVhZCBvZiAKQlIyX1RBUkdF
VF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9MQVRFU1RfTFRTX1ZFUlNJT04uIFRoZSByZWFzb24gYmVo
aW5kIHRoYXQgaXMgCnRoYXQgd2hlbiB3ZSBtb3ZlIHRvIGEgbmV3IExUUywgd2Ugd2FudCB0aGlz
IHRvIGJlIGV4cGxpY2l0LCB3aXRoIGxlZ2FjeSAKaGFuZGxpbmcgYW5kIGV2ZXJ5dGhpbmcgLSB5
b3UgcmVhbGx5IF9kb24ndF8gd2FudCBhIHNpbGVudCB1cGRhdGUgZnJvbSAyLjggdG8gCjIuMTIg
KG9yIHdoYXRldmVyKSB3aGVuIHlvdSB1cGRhdGUgQnVpbGRyb290LiBTbyBieSBnaXZpbmcgYSBk
aWZmZXJlbnQgbmFtZSB0byAKdGhlIGNvbmZpZyBzeW1ib2wgd2hlbiB0aGUgTFRTIGJyYW5jaCBp
cyB1cGRhdGVkLCB3ZSBjYW4gbWFrZSBzdXJlIHRoYXQgdGhlcmUgaXMgCmxlZ2FjeSBoYW5kbGlu
ZyBhbmQgdGhpbmdzIGJyZWFrIGxvdWRseSBpbnN0ZWFkIG9mIHNpbGVudGx5LgoKCiDCoElzIHRo
aXMgc3VmZmljaWVudCBleHBsYW5hdGlvbj8KCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCgo+Cj4+
IEluc3RlYWQsIGlmCj4+IHlvdSB3YW50IHRvIHVzZSB0aGlzIGx0cy12Mi44LjEzIHZlcnNpb24g
Zm9yIFNUTTMyTVAxIGRlZmNvbmZpZ3MsIHlvdQo+PiBzaG91bGQgc2ltcGx5IHNldCBCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFCj4+IHRvIGx0cy12
Mi44LjEzLCBhbmQgaGF2ZSBhIEJSMl9HTE9CQUxfUEFUQ0hfRElSIHdpdGggdGhlIHBhdGNoIHRo
YXQgeW91Cj4+IG5lZWQgdG8gYXBwbHkgb24gdG9wIG9mIGl0Lgo+Pgo+PiBEdWUgdG8gdGhpcywg
SSB3aWxsIG1hcmsgeW91ciBwYXRjaGVzIDQsIDUgYW5kIDYgaW4gdGhpcyBzZXJpZXMgYXMKPj4g
Q2hhbmdlcyBSZXF1ZXN0ZWQuIElmIHlvdSBoYXZlIHRoZSBjaGFuY2UgdG8gZG8gdGhpcyB1cGRh
dGUgYW5kIHNlbmQgYQo+PiBuZXcgaXRlcmF0aW9uLCBpdCB3b3VsZCBiZSBuaWNlIQo+Pgo+PiBC
ZXN0IHJlZ2FyZHMsCj4+Cj4+IFRob21hcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
