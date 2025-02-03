Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993E2C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 12:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E70D605F9;
	Mon,  3 Feb 2025 12:48:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zUKhqt-E7PwP; Mon,  3 Feb 2025 12:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22147606EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22147606EA;
	Mon,  3 Feb 2025 12:48:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B39AE12A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 12:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97B3D81E65
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 12:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIxbnB5IhSOF for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 12:48:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 56ADB818D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56ADB818D4
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56ADB818D4
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 12:48:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso30007515e9.0
 for <buildroot@buildroot.org>; Mon, 03 Feb 2025 04:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738586931; x=1739191731;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H0t4ZwKl8w/aTkhXNScG62Wc+zN+yick/Sg5toCKRJY=;
 b=a160yIWWlD2m8ULZ/SPwzJj1RQg2W9ZOuHBEw/feeYuQp1WBRD1o+v66bS8+QMnn23
 DZkttdz7hMBZ8Vjn8KSy437owaNtqKkvmj9TsJzfWnJmxQdFhvdrk5qjZNP9lhguC7Pm
 wcGhgkCNgsCqvCmGj1dnYx9YiaZB1tjxSFLuORnTKPyK/Kmn0uL9gWryijPX9bFY/WPe
 36WIfyCcDOvOWQbyDzP6OwrRZLFVU2u0lvXqba7gxNhtgeKe26j4pkGiHSwDeGn1hCh7
 7eftuC5tJw8mP9Vav35J8Nj/pYJPg2k+zgCBoAZYYPJ7DJdx1nZzcqIdCmaGbbvcSfrb
 A8Hw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2RQNHG27DZwE2ty0zTe4qamLSUWLpDOhCbPmG9PiiTBKfXE+rxbBZNyoF30/cSKrMO9uPLzg+OBg=@buildroot.org
X-Gm-Message-State: AOJu0Yx2DdTvibJKzY805N60W55dSPUD59Ele97ikJ4qx3GhvY0sCKcU
 POeNPyo2k1rRxNou04fqf/xFgu/QpPfCBiZQQPHrF8xYacetShK6k5v5g61Lm+A=
X-Gm-Gg: ASbGnctTU6rPrgq/sRiTu3wq9cskeHo4rc9PPvGNEJc1JREIJvcdwPEqzn7QF3DuwWQ
 IKD7Ie9c32n8SP13SiXTt72R2Vsmigm8UfYEtm4TlY60l4NuePljFP1pS9x6xEGNcaYQWCeEiS9
 eU87ZDRn4UsmRy+FAi+UY8mtUfNEn5abm3B9NE7+E08i3jbW7kNLwM4l5YnJvE4Y+xQYi4Iiztk
 ZeJaOKN4IknKjRnnnR2SxJFtZlNplY4ILWcCEQINCTnuGgCZei/BWm4Hx9lcmxaJFaPakJYKL6e
 ftZP0eUrV3fW8/9t51vkn2m2dIARB83jZrX2eJ0s5qxQZnA=
X-Google-Smtp-Source: AGHT+IHCgMswRa/lKPfqeFI5tv7zegc5wV99YuwXP46sI12BJtycqefnKijfv9SIoRIJRoFn9u4lWg==
X-Received: by 2002:a05:600c:1d1e:b0:436:a3a3:a70c with SMTP id
 5b1f17b1804b1-438dc4214c3mr157325375e9.28.1738586930841; 
 Mon, 03 Feb 2025 04:48:50 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e245efbcsm151169185e9.33.2025.02.03.04.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 04:48:50 -0800 (PST)
Message-ID: <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
Date: Mon, 3 Feb 2025 13:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20250203120130.2332720-1-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738586931; x=1739191731; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=H0t4ZwKl8w/aTkhXNScG62Wc+zN+yick/Sg5toCKRJY=;
 b=Cf6uTn0DGDip+6XD/m69umx8imjattPaL9EGBKVZBk4qL6o6yPMW9nMAl/MLPfyiHp
 CUqHSHoXez0P+VzY9K9fmGEhuv/uRsChSNNOhzsgoC0ODPeJn/EWGUDatl31ZE0Ks15V
 /AK0ZkE1z4jil8PkXarK7e9pwfr6JaJmBpI+v8u6jhNK2RLxbu+54hazm91lnEGpFp33
 wx+8SyAU+IaPbW/ZLwyVfR0QjCYSCHcDtnJuM3tLZwe0FH6abDrGDQmtjz55klTF7vJR
 qsKcI5VEs3wLsPYbUAV4PwzfrH5GizDjt6gdNFsuacoz1QuMfxuEFC1l4GPyCk/S9Ssf
 M53g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Cf6uTn0D
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBGaW9uYSwKCk9uIDAzLzAyLzIwMjUgMTM6MDEsIEZpb25hIEtsdXRlIHdyb3RlOgo+IEZy
b206ICJGaW9uYSBLbHV0ZSAoV0lXQSkiIDxmaW9uYS5rbHV0ZUBnbXguZGU+Cj4gCj4gR28gZm9y
Y2VzIHRoZSBHT0xEIGxpbmtlciB3aGVuIGR5bmFtaWNhbGx5IGxpbmtpbmcgR28gY29kZSwgYmVj
YXVzZQo+IG9sZCB2ZXJzaW9ucyBvZiBCRkQgY2F1c2VkIGVycm9ycy4gVGhlIGlzc3VlIGhhcyBi
ZWVuIGZpeGVkIGluCj4gQmludXRpbHMgc2luY2UgYXQgbGVhc3QgMi40MSBhY2NvcmRpbmcgdG8g
dGhlIHVwc3RyZWFtIGRlc2NyaXB0aW9uIG9mCj4gdGhlIHBhdGNoIGFkZGVkIHdpdGggdGhpcyBj
b21taXQgWzFdLCBhbmQgbm93IGZvcmNpbmcgR09MRCBjYXVzZXMKPiBsaW5raW5nIGZhaWx1cmUg
aWYgbGQuZ29sZCBpcyBub3QgYXZhaWxhYmxlLiBUaGUgYXNzb2NpYXRlZCBHb2xhbmcKPiBpc3N1
ZSBbMl0gaXMgc3RpbGwgb3Blbi4KPiAKPiBJbXBvcnQgdGhlIHBhdGNoIHRvIHN0b3AgZm9yY2lu
ZyBHT0xELgoKICBUaGlzIGZpeGVzIHRoZSBpc3N1ZSBmb3IgZ28tc3JjLCBidXQgbm90IGZvciBn
by1iaW4gdW5mb3J0dW5hdGVseS4uLiBBbmQgCmdvLWJpbiBpcyB0aGUgZGVmYXVsdC4uLgoKICBP
biB0aGUgb3RoZXIgaGFuZCwgd2UgZG9uJ3QgaGF2ZSBhbnkgYXV0b2J1aWxkZXIgZmFpbHVyZXMg
eWV0LCBzbyBtYXliZSBpdCdzIGEgCmNvcm5lciBjYXNlIHByb2JsZW0gYW5kIHdlIGNhbiBsaXZl
IHdpdGggaXQgdW50aWwgZ28tYmluIGdldHMgYnVtcGVkIHRvIDEuMjMuNiAKKGFzc3VtaW5nIHVw
c3RyZWFtIGFwcGxpZXMgdGhlIGZpeCB0byB0aGVpciBzdGFibGUgYnJhbmNoIG9mIGNvdXJzZSku
CgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IFsxXSBodHRwczovL2dvLXJldmlldy5nb29nbGVz
b3VyY2UuY29tL2MvZ28vKy8zOTExMTUKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2dvbGFuZy9n
by9pc3N1ZXMvMjIwNDAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAoV0lXQSkgPGZp
b25hLmtsdXRlQGdteC5kZT4KPiAtLS0KPiAgIC4uLi1iaW51dGlscy1nb2xkLWRlcGVuZGVuY3kt
b24tYWFyY2g2NC5wYXRjaCB8IDcwICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFu
Z2VkLCA3MCBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9n
by1zcmMvMDAwMy1jbWQtbGluay1zdG9wLWZvcmNpbmctYmludXRpbHMtZ29sZC1kZXBlbmRlbmN5
LW9uLWFhcmNoNjQucGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nby9nby1zcmMvMDAw
My1jbWQtbGluay1zdG9wLWZvcmNpbmctYmludXRpbHMtZ29sZC1kZXBlbmRlbmN5LW9uLWFhcmNo
NjQucGF0Y2ggYi9wYWNrYWdlL2dvL2dvLXNyYy8wMDAzLWNtZC1saW5rLXN0b3AtZm9yY2luZy1i
aW51dGlscy1nb2xkLWRlcGVuZGVuY3ktb24tYWFyY2g2NC5wYXRjaAo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMWJhMzFiNjU3Nwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wYWNrYWdlL2dvL2dvLXNyYy8wMDAzLWNtZC1saW5rLXN0b3AtZm9yY2luZy1iaW51dGls
cy1nb2xkLWRlcGVuZGVuY3ktb24tYWFyY2g2NC5wYXRjaAo+IEBAIC0wLDAgKzEsNzAgQEAKPiAr
RnJvbSA2ZDI2NWIwMDhlM2QxMDZiMjcwNjY0NWU1YTg4Y2Q4ZTJmYjk4OTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBEaXJrIE3DvGxsZXIgPGRpcmtAZG1sbHIuZGU+Cj4gK0Rh
dGU6IFdlZCwgMDkgTWFyIDIwMjIgMTc6NDc6MjMgKzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBj
bWQvbGluazogc3RvcCBmb3JjaW5nIGJpbnV0aWxzLWdvbGQgZGVwZW5kZW5jeSBvbiBhYXJjaDY0
Cj4gKwo+ICtUaGUgYmZkIGxpbmtlciBhcHBlYXJzIHRvIGJlIHdvcmtpbmcganVzdCBmaW5lIGF0
IGxlYXN0IGluIHZlcnNpb24KPiArMi40MSBvciBhYm92ZS4gUmVqZWN0IHRoZSBrbm93biBicm9r
ZW4gb25lIGluc3RlYWQsIHdoaWNoCj4gK2F2b2lkcyBhbiBhcmNoaXRlY3R1cmUgc3BlY2lmaWMg
bGlua2VyIGRlcGVuZGVuY3kgdGhhdAo+ICtpcyBjdW1iZXJzb21lIGZvciBkaXN0cmlidXRpb25z
Lgo+ICsKPiArRml4ZXMgIzIyMDQwLgo+ICsKPiArQ2hhbmdlLUlkOiBJOWYzNzdlNDdjMjJlZjIw
NDk3NDc5YzA5NzhjMDUzZWQ1ZGU0NmEzOAo+ICtVcHN0cmVhbTogaHR0cHM6Ly9nby1yZXZpZXcu
Z29vZ2xlc291cmNlLmNvbS9jL2dvLysvMzkxMTE1Cj4gK1NpZ25lZC1vZmYtYnk6IEZpb25hIEts
dXRlIChXSVdBKSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+ICstLS0KPiArCj4gK2RpZmYgLS1naXQg
YS9zcmMvY21kL2xpbmsvaW50ZXJuYWwvbGQvbGliLmdvIGIvc3JjL2NtZC9saW5rL2ludGVybmFs
L2xkL2xpYi5nbwo+ICtpbmRleCAyZDhmOTY0Li5mY2YwYmM3IDEwMDY0NAo+ICstLS0gYS9zcmMv
Y21kL2xpbmsvaW50ZXJuYWwvbGQvbGliLmdvCj4gKysrKyBiL3NyYy9jbWQvbGluay9pbnRlcm5h
bC9sZC9saWIuZ28KPiArQEAgLTE2NzAsMjcgKzE2NzAsNiBAQAo+ICsgCQkJLy8gVXNlIGxsZCB0
byBhdm9pZCBlcnJvcnMgZnJvbSBkZWZhdWx0IGxpbmtlciAoaXNzdWUgIzM4ODM4KQo+ICsgCQkJ
YWx0TGlua2VyID0gImxsZCIKPiArIAkJfQo+ICstCj4gKy0JCWlmIGN0eHQuQXJjaC5JbkZhbWls
eShzeXMuQVJNNjQpICYmIGJ1aWxkY2ZnLkdPT1MgPT0gImxpbnV4IiB7Cj4gKy0JCQkvLyBPbiBB
Uk02NCwgdGhlIEdOVSBsaW5rZXIgd2lsbCBmYWlsIHdpdGgKPiArLQkJCS8vIC16bm9jb3B5cmVs
b2MgaWYgaXQgdGhpbmtzIGEgQ09QWSByZWxvY2F0aW9uIGlzCj4gKy0JCQkvLyByZXF1aXJlZC4g
U3dpdGNoIHRvIGdvbGQuCj4gKy0JCQkvLyBodHRwczovL3NvdXJjZXdhcmUub3JnL2J1Z3ppbGxh
L3Nob3dfYnVnLmNnaT9pZD0xOTk2Mgo+ICstCQkJLy8gaHR0cHM6Ly9nby5kZXYvaXNzdWUvMjIw
NDAKPiArLQkJCWFsdExpbmtlciA9ICJnb2xkIgo+ICstCj4gKy0JCQkvLyBJZiBnb2xkIGlzIG5v
dCBpbnN0YWxsZWQsIGdjYyB3aWxsIHNpbGVudGx5IHN3aXRjaAo+ICstCQkJLy8gYmFjayB0byBs
ZC5iZmQuIFNvIHdlIHBhcnNlIHRoZSB2ZXJzaW9uIGluZm9ybWF0aW9uCj4gKy0JCQkvLyBhbmQg
cHJvdmlkZSBhIHVzZWZ1bCBlcnJvciBpZiBnb2xkIGlzIG1pc3NpbmcuCj4gKy0JCQluYW1lLCBh
cmdzIDo9IGZsYWdFeHRsZFswXSwgZmxhZ0V4dGxkWzE6XQo+ICstCQkJYXJncyA9IGFwcGVuZChh
cmdzLCAiLWZ1c2UtbGQ9Z29sZCIsICItV2wsLS12ZXJzaW9uIikKPiArLQkJCWNtZCA6PSBleGVj
LkNvbW1hbmQobmFtZSwgYXJncy4uLikKPiArLQkJCWlmIG91dCwgZXJyIDo9IGNtZC5Db21iaW5l
ZE91dHB1dCgpOyBlcnIgPT0gbmlsIHsKPiArLQkJCQlpZiAhYnl0ZXMuQ29udGFpbnMob3V0LCBb
XWJ5dGUoIkdOVSBnb2xkIikpIHsKPiArLQkJCQkJbG9nLkZhdGFsZigiQVJNNjQgZXh0ZXJuYWwg
bGlua2VyIG11c3QgYmUgZ29sZCAoaXNzdWUgIzE1Njk2LCAyMjA0MCksIGJ1dCBpcyBub3Q6ICVz
Iiwgb3V0KQo+ICstCQkJCX0KPiArLQkJCX0KPiArLQkJfQo+ICsgCX0KPiArIAlpZiBjdHh0LkFy
Y2guRmFtaWx5ID09IHN5cy5BUk02NCAmJiBidWlsZGNmZy5HT09TID09ICJmcmVlYnNkIiB7Cj4g
KyAJCS8vIFN3aXRjaCB0byBsZC5iZmQgb24gZnJlZWJzZC9hcm02NC4KPiArZGlmZiAtLWdpdCBh
L3NyYy9tYWtlLmJhc2ggYi9zcmMvbWFrZS5iYXNoCj4gK2luZGV4IGI2N2FlMTUuLjdkZjQ5MTAg
MTAwNzU1Cj4gKy0tLSBhL3NyYy9tYWtlLmJhc2gKPiArKysrIGIvc3JjL21ha2UuYmFzaAo+ICtA
QCAtOTQsNiArOTQsMTYgQEAKPiArIAk7Owo+ICsgZXNhYwo+ICsKPiArKyMgVGVzdCBmb3IgYmFk
IGJmZC5sZAo+ICsraWYgdGVzdCAiJCh1bmFtZSAtbSkiID0gImFhcmNoNjQiICYmIGxkIC12IHwg
Z3JlcCAtRSAiR05VIGxkLiogMlwuKFswLTNdfDQwKSI7IHRoZW4KPiArKwllY2hvICdFUlJPUjog
WW91ciBzeXN0ZW0gdXNlcyBiZmQuTEQgMi40MCBvciBvbGRlciB3aGljaCBoYXMgaXNzdWVzIHdp
dGggZHluYW1pYyBsaW5raW5nIG9uIGFhcmNoNjQnCj4gKysJZWNobyAnQ29uc2lkZXIgdXBncmFk
aW5nIG9yIHN3aXRjaGluZyB0byBiaW51dGlscy1nb2xkLicKPiArKwllY2hvCj4gKysJZWNobyAn
U2VlIGh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTMwNDM3
Jwo+ICsrCj4gKysJZXhpdCAxCj4gKytmaQo+ICsrCj4gKyAjIFRlc3QgZm9yIGJhZCBsZC4KPiAr
IGlmIGxkIC0tdmVyc2lvbiAyPiYxIHwgZ3JlcCAnZ29sZC4qIDJcLjIwJyA+L2Rldi9udWxsOyB0
aGVuCj4gKyAJZWNobyAnRVJST1I6IFlvdXIgc3lzdGVtIGhhcyBnb2xkIDIuMjAgaW5zdGFsbGVk
LicKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
