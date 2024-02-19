Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B15C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6282A4027F;
	Mon, 19 Feb 2024 10:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abR-LQdYhuUb; Mon, 19 Feb 2024 10:47:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F4340912
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F4340912;
	Mon, 19 Feb 2024 10:47:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A9541BF3DB
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84CBC81F9C
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id np3JpZlKVBjv for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:47:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6745481F88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6745481F88
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6745481F88
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:47:26 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso1961603f8f.1
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:47:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708339644; x=1708944444;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJ4g4sSmgfhlbaRwIOMtqo68vjmqfTL6JfNmzf7FMeA=;
 b=CEsDktgdIxSPi+O2O3xHHEgkUycfq7Npjg3lqx3F1xNRkTFEnbavr1XnUe/UusCYhU
 /001wlD/s8Pj1TvhrIPVeqmRC8XKG1uv2CjiGRFZXN+Tx0NXCGDN7UEG03EVBl9yKNP8
 6884SROmDdZb4KvRNmEQ7xyNdk5nv40UV45PJo3FgKKKQof2jbOP57VNbUOhm7ATmPG8
 RikkelcFm/K4PIc0t+A+2Nby+dHRjxzMVdrQ0I2gr3LS8BMsWjwo0Qy3oh7c6k27+hnc
 xqA4La0aZkXcS9kS2vfSIOsAM4LteWa/CR75DPzC49m4SC31ciaPUUH7Wg/7+FnNujpI
 M+KQ==
X-Gm-Message-State: AOJu0Yxxvg7Bazfj8I0vLr2ScuaFVKhMH2nyfGKkOwDYXjweaX5YIkCn
 RkcGquYmJ8jzTaieylwsBZRGqO7xLIqn9v+RSEhH8e+CxPb0qmpUv0YwUOFBKzU=
X-Google-Smtp-Source: AGHT+IFnjnvko8HWw9dQqtRwcEQ1eeCNvMcMKNl4nLm0gHPPn2e/wiMvaRi0PUHXG7IaZpRxPBKi1w==
X-Received: by 2002:a5d:474b:0:b0:33d:52f:a2a8 with SMTP id
 o11-20020a5d474b000000b0033d052fa2a8mr7444860wrs.61.1708339644454; 
 Mon, 19 Feb 2024 02:47:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adfe111000000b0033d56d43fbesm1564210wrz.115.2024.02.19.02.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:47:24 -0800 (PST)
Message-ID: <89254b90-c849-4be3-b77b-f076b0439b4d@smile.fr>
Date: Mon, 19 Feb 2024 11:47:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-20-dario.binacchi@amarulasolutions.com>
 <8662a0c59b8cea111c15cabb121c6b598d5a1d04.camel@gmail.com>
 <CABGWkvq6Q5b+ozb6Vhccagg3gsYgMqa7x2tBVtEAxCp2S72evg@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvq6Q5b+ozb6Vhccagg3gsYgMqa7x2tBVtEAxCp2S72evg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708339644; x=1708944444;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NJ4g4sSmgfhlbaRwIOMtqo68vjmqfTL6JfNmzf7FMeA=;
 b=K0WDXxuPhlKpvr0o15UPV/kYFnzR3u7yzFaWupK6g/Shmksd7LdMNqwniBbiTM+TwM
 feSiMpFC+VSUuolwp+uj8inXGQY8oYlilKthWZdHxp57rU2OKofK/R48bx0F4CjJbwY6
 //ygToBUWJPYMT4s7WSBtDDkYyGcKjH1u2oLFm8FkK/+TXYgmaQmcW2J+AGWvkil0A+e
 wINplaf/UhAi8g4rvT6qwsBUNq981fPCOHnQDz8+mGBNR284xZudoS+nQzGAxMgY5kdY
 vZDDjllddyRHYzKAUgVmXnVTIj9Dq6Mb9Z+we+0DJm3mLd1084W8nImwJn/vYg8bqJwV
 Bhcw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=K0WDXxuP
Subject: Re: [Buildroot] [PATCH v4 19/20] boot/ti-k3/ti-k3-r5-loader:
 install tiboot3.bin
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Andreas Dannenberg <dannenberg@ti.com>, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAxOC8wMi8yMDI0IMOgIDE0OjM4LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IEhpIEFsZXhhbmRlciwKPiAKPiBPbiBTYXQsIEZlYiAxNywgMjAyNCBhdCA2OjI4
4oCvUE0gQWxleGFuZGVyIFN2ZXJkbGluCj4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+
IHdyb3RlOgo+Pgo+PiBIaSBEYXJpbywKPj4KPj4gT24gU2F0LCAyMDI0LTAyLTE3IGF0IDE3OjAy
ICswMTAwLCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4+IFJlY2VudCB2ZXJzaW9ucyBvZiBVLUJv
b3QgYXJlIGNhcGFibGUgb2YgYnVpbGRpbmcgdGlib290My5iaW4gdXNpbmcKPj4+IEJpbm1hbi4g
SW4gdGhpcyBjYXNlLCBsZXQncyBjb3B5IGl0IHRvIHRoZSBiaW5hcmllcyBkaXJlY3RvcnkuCj4+
Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPgo+Pgo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2pl
Y3QvYnVpbGRyb290L3BhdGNoLzIwMjQwMjEzMTcyODE3LjI4NzI4NDktMTItcm9tYWluLm5hb3Vy
QHNtaWxlLmZyLwo+Pgo+PiBsb29rcyBtb3JlIGNvbXBsZXRlIHdpdGggc3lzZncuaXRiPwo+IAo+
IEluIG15IHVzZSBjYXNlLCB0aGVyZSB3YXMgbm8gbmVlZCBhcyBpdCB3YXMgbmVjZXNzYXJ5IHRv
IGVuYWJsZQo+IHRpLWszLWJvb3QtZmlybXdhcmU6Cj4gCj4gZGVmaW5lIFRJX0szX0JPT1RfRklS
TVdBUkVfSU5TVEFMTF9JTUFHRVNfQ01EUwo+IGNwIC1kcGZyICQoQEQpL3RpLXN5c2Z3ICQoQklO
QVJJRVNfRElSKS8KPiBjcCAtZHBmciAkKEBEKS90aS1kbSAkKEJJTkFSSUVTX0RJUikvCj4gZW5k
ZWYKPiAKPiBJIGFsc28gd29uZGVyIHdoZXRoZXIgaXQgaXMgbmVjZXNzYXJ5IHRvIHJlbW92ZSB0
aGUKPiBjcCAtZHBmciAkKEBEKS90aS1zeXNmdyAkKEJJTkFSSUVTX0RJUikvCj4gdG8gYXZvaWQg
Y29uZmxpY3RzLgo+IAo+IEFsdGVybmF0aXZlbHksIGFzIGhhcHBlbmVkIHdpdGggdGktazMtaGVu
LWltYWdlLCBvbmUgZGF5IHdlIG1heSBubwo+IGxvbmdlciBuZWVkIHRpLWszLWJvb3QtZmlybXdh
cmUsCj4gYW5kIHRoZXJlZm9yZSB3ZSBjb3VsZCBhZGQgYSBjb3B5IG9mIHN5c2Z3Lml0YiBmcm9t
IHRpLWszLXI1LWxvYWRlci4gSQo+IGFtIGF3YWl0aW5nIHN1Z2dlc3Rpb25zLgo+IEhvd2V2ZXIs
IG15IHBhdGNoIGRvZXMgbm90IHJlcXVpcmUgbW9kaWZ5aW5nIHRoZSBnZW5pbWFnZS5jZmcgZmls
ZS4gSW4KPiBhbnkgY2FzZSwgSSB3b3VsZCB0cnkgdG8gZW5zdXJlCj4gdGhpcyBhbHNvIGZvciBz
eXNmdy5pdGIuCgpzeXNmdy5pdGIgaXMgYnVpbGQgYnkgdGktazMtcjUtbG9hZGVyIGFuZCBpdCdz
IG5vdCBwcm92aWRlZCBieQp0aS1rMy1ib290LWZpcm13YXJlLiBUaGlzIGZpbGUgZGVwZW5kcyBv
biB0aGUgVEkgSzMgIlNwbGl0IGJpbmFyeSIgYm9vdCBmbG93IFsxXToKCiAgICAtIFNwbGl0IGJp
bmFyeSB3aXRoIGEgY29tYmluZWQgZmlybXdhcmU6IChlZzogQU02NSkKICAgIC0gQ29tYmluZWQg
YmluYXJ5IHdpdGggYSBjb21iaW5lZCBmaXJtd2FyZTogKGVnOiBBTTY0KQogICAgLSBTcGxpdCBi
aW5hcnkgd2l0aCBhIHNwbGl0IGZpcm13YXJlOiAoZWc6IEo3MjFFKQogICAgLSBDb21iaW5lZCBi
aW5hcnkgd2l0aCBhIHNwbGl0IGZpcm13YXJlOiAoZWc6IEFNNjIpCgpbMV0gaHR0cHM6Ly9zb3Vy
Y2UuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vYmxvYi92MjAyNC4wMS9kb2MvYm9hcmQvdGkvazMu
cnN0CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+IERh
cmlvCj4gCj4+Cj4+PiAtLS0KPj4+Cj4+PiBBZGRlZCBpbiB2NAo+Pj4KPj4+IFNpZ25lZC1vZmYt
Ynk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4K
Pj4+IC0tLQo+Pj4gIGJvb3QvdGktazMvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5t
ayB8IDMgKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9ib290L3RpLWszL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsg
Yi9ib290L3RpLWszL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4+IGluZGV4
IDJhMTAwMjRhZWRhYS4uNjQzMjk4YTFlNzBhIDEwMDY0NAo+Pj4gLS0tIGEvYm9vdC90aS1rMy90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4+PiArKysgYi9ib290L3RpLWszL3Rp
LWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsKPj4+IEBAIC03NSw4ICs3NSwxMSBAQCBk
ZWZpbmUgVElfSzNfUjVfTE9BREVSX0JVSUxEX0NNRFMKPj4+ICAgICAgICQoVEFSR0VUX0NPTkZJ
R1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAkKEBEKSAkKFRJX0szX1I1X0xP
QURFUl9NQUtFX09QVFMpCj4+PiAgZW5kZWYKPj4+Cj4+PiArVElfSzNfUjVfTE9BREVSX1NFQ1RZ
UEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9USV9LM19TRUNUWVBFKSkKPj4+ICsKPj4+
ICBkZWZpbmUgVElfSzNfUjVfTE9BREVSX0lOU1RBTExfSU1BR0VTX0NNRFMKPj4+ICAgICAgIGNw
ICQoQEQpL3NwbC91LWJvb3Qtc3BsLmJpbiAkKEJJTkFSSUVTX0RJUikvcjUtdS1ib290LXNwbC5i
aW4KPj4+ICsgICAgIGZpbmQgJChARCkgLW5hbWUgInRpYm9vdDMtKi0kKFRJX0szX1I1X0xPQURF
Ul9TRUNUWVBFKS0qLmJpbiIgLXR5cGUgZiAtZXhlYyBjcCB7fSAkKEJJTkFSSUVTX0RJUikvdGli
b290My5iaW4gXDsKPj4+ICBlbmRlZgo+Pj4KPj4+ICAkKGV2YWwgJChrY29uZmlnLXBhY2thZ2Up
KQo+Pgo+PiAtLQo+PiBBbGV4YW5kZXIgU3ZlcmRsaW4uCj4+Cj4gCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
