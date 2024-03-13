Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852FEC54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 10:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BEE0408D5;
	Wed, 13 Mar 2024 10:05:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RdRrpUFlCiVD; Wed, 13 Mar 2024 10:05:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1342408C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1342408C7;
	Wed, 13 Mar 2024 10:05:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 214DF1BF577
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 10:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C4B8408C7
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 10:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mzBWxnq3mwR9 for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 10:05:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 323BA408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 323BA408AF
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 323BA408AF
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 10:05:14 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso367450f8f.0
 for <buildroot@buildroot.org>; Wed, 13 Mar 2024 03:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710324313; x=1710929113;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tzREaD/zq+83Rz+BccczJamsx/qfcVpG9jhl6Zt1sc4=;
 b=gYBRBDzmCMmpBzpDO7RkVybw1psQne4C82fnaGHewfMj3Pag4bsmalzP8IZPVNE4GL
 GLZH1PxLvi0QT4fPqqs3gCzObLfVEbBja0JKHJ5F7Cb/fqREF4H/KoL7wRQDzZBrSM/5
 sNGIUL2UbDBmyaBCYrjOMC3t1/kafhk/rOJl1S7XDqTGDnS/BLB+Mf8iN1rh/txwWZXI
 U9dyauLT/zlVIyazg2KCd3GtSa/+l6rlNwduQ74LPtJyGWn+TcpxEtfO+q8ZjaV3WPOv
 RRB9jH6uQtjM59/u7RzTe2jwFDQtNhSfHjgVPkP9SOzam7sQWgrsC0UiTy9+LRA8QvTB
 0fcA==
X-Gm-Message-State: AOJu0Ywn3dyvGirdS5lPKdYPwAKSEfGyPKINmA8vys3/qudvHvjlXVwR
 6NOWnPgN3K2nso7Kd4S2OMO9v53JIll53bnmgU+FomjC+Z2x7O5imnjhsagFnVs=
X-Google-Smtp-Source: AGHT+IF4MfdrjV2wBPhE2thgof72s1Ip9pdZ40y/sLnncuqokjDFdg1WaafRAstveY5JQDk10ZNIug==
X-Received: by 2002:a5d:604c:0:b0:33e:63c2:c43a with SMTP id
 j12-20020a5d604c000000b0033e63c2c43amr2057758wrt.26.1710324312839; 
 Wed, 13 Mar 2024 03:05:12 -0700 (PDT)
Received: from [10.5.0.26] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b0033d8ce120f2sm11243680wrr.95.2024.03.13.03.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 03:05:12 -0700 (PDT)
Message-ID: <389f8820-ed61-43df-aa8f-a9334a161b5c@smile.fr>
Date: Wed, 13 Mar 2024 11:05:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andreas Dannenberg <dannenberg@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-16-dario.binacchi@amarulasolutions.com>
 <d7921628-c7ad-4de1-b131-dd0b895200c5@smile.fr>
 <CABGWkvoW80Lr0Y_8yn0S5TxvBjcHrPvdhOK4Rt4qxhNx0JwzJg@mail.gmail.com>
 <20240305070724.4qveiubco6knoioa@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240305070724.4qveiubco6knoioa@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1710324313; x=1710929113;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tzREaD/zq+83Rz+BccczJamsx/qfcVpG9jhl6Zt1sc4=;
 b=V+VCNXr/s752/GvXdGf2fOZqnb43usPIOfWz+umf6p5b1kcpPtv4nriM7MdAMtJM+0
 ok1Ez06HK0VzEoIctIdJnynWp9WBad8bCpcBWea8ihuf8ITtj1HdK9/TM44qRkmoKTNd
 vRksqp/7/4BFpEQTg9woID6WVe3+Ky0NnqzlgebzIrK9prpiWP07XNVxPrhAPuQMUNuU
 bz6dAm9Lw/FtLKFNsWFo9nP0xC4gOYmPFYirzRCkoFy0BJ55quNP0OUOgClmVB3aiO4M
 ciBeTbn7zbiYhRxjvc0DV3YPG6IgZoOLIVylFFZyoXRa78UWEIzFYIJLTEj0c2F2VvYD
 pjqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=V+VCNXr/
Subject: Re: [Buildroot] [PATCH v8 15/23] boot/ti-k3/ti-k3-r5-loader:
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
Cc: linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQW5kcmVhcywgRGFyaW8sIEFsbCwKCkxlIDA1LzAzLzIwMjQgw6AgMDg6MDcsIEFuZHJlYXMg
RGFubmVuYmVyZyBhIMOpY3JpdMKgOgo+IEhpIERhcmlvLCBSb21haW4sCj4gCj4gT24gU3VuLCBN
YXIgMDMsIDIwMjQgYXQgMTA6NTQ6MDlBTSArMDEwMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+
IEhlbGxvIFJvbWFpbiwKPj4KPj4gT24gU3VuLCBNYXIgMywgMjAyNCBhdCAxMjowM+KAr0FNIFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4+Cj4+PiBIZWxsbyBE
YXJpbywKPj4+Cj4+PiBMZSAwMS8wMy8yMDI0IMOgIDE0OjM2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdCA6Cj4+Pj4gUmVjZW50IHZlcnNpb25zIG9mIFUtQm9vdCBhcmUgY2FwYWJsZSBvZiBidWls
ZGluZyB0aWJvb3QzLmJpbiB1c2luZwo+Pj4+IEJpbm1hbi4gSW4gdGhpcyBjYXNlLCBsZXQncyBj
b3B5IGl0IHRvIHRoZSBiaW5hcmllcyBkaXJlY3RvcnkuCj4+Pj4KPj4+PiBUaGUgdXNlIG9mIGBm
aW5kJyBjb21tYW5kIGlzIGp1c3RpZmllZCBieSB0aGUgbmVlZCB0byB1c2UgYSByZWdleAo+Pj4+
IGV4cHJlc3Npb24gdG8gc2VsZWN0IHRoZSBjb3JyZWN0IGZpbGUuIFRoaXMgaXMgbm90IHBvc3Np
YmxlIHdpdGggYQo+Pj4+IHNpbXBsZSBgY3AnIGNvbW1hbmQuCj4+Pj4KPj4+PiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4+Pj4KPj4+PiAtLS0KPj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjg6Cj4+Pj4gLSBVc2UgdGhlIGBm
aW5kJyBjb21tYW5kIGluIHBpcGUgd2l0aCB0aGUgYGNwJyBjb21tYW5kLgo+Pj4+Cj4+Pj4gQ2hh
bmdlcyBpbiB2NjoKPj4+PiAtIFJlcGxhY2UgYGZpbmQnIGNvbW1hbmQgd2l0aCBgY3AnIG9uZS4K
Pj4+Pgo+Pj4+IENoYW5nZXMgaW4gdjU6Cj4+Pj4gLSBSZXBsYWNlIHRpYm9vdDMtKi0kKFRJX0sz
X1I1X0xPQURFUl9TRUNUWVBFKS0qLmJpbiB3aXRoCj4+Pj4gICB0aWJvb3QzLSQoVElfSzNfUjVf
TE9BREVSX1NPQyktJChUSV9LM19SNV9MT0FERVJfU0VDVFlQRSktKi5iaW4KPj4+Pgo+Pj4+IEFk
ZGVkIGluIHY0Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8u
YmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGJvb3QvdGktazMt
cjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tayB8IDQgKysrKwo+Pj4+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1yNS1s
b2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUt
bG9hZGVyLm1rCj4+Pj4gaW5kZXggZmRiMDU4ZjNiNzJhLi45YTA1ZDAwNTA2N2EgMTAwNjQ0Cj4+
Pj4gLS0tIGEvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4+Pj4gKysr
IGIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rCj4+Pj4gQEAgLTcwLDgg
KzcwLDEyIEBAIGRlZmluZSBUSV9LM19SNV9MT0FERVJfQlVJTERfQ01EUwo+Pj4+ICAgICAgICQo
VEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKFRJX0szX1I1X0xPQURFUl9NQUtFKSAtQyAkKEBEKSAk
KFRJX0szX1I1X0xPQURFUl9NQUtFX09QVFMpCj4+Pj4gIGVuZGVmCj4+Pj4KPj4+PiArVElfSzNf
UjVfTE9BREVSX1NFQ1RZUEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BBQ0tBR0VfVElfSzNfU0VD
VFlQRSkpCj4+Pj4gK1RJX0szX1I1X0xPQURFUl9TT0MgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1BB
Q0tBR0VfVElfSzNfU09DKSkKPj4+PiArCj4+Pj4gIGRlZmluZSBUSV9LM19SNV9MT0FERVJfSU5T
VEFMTF9JTUFHRVNfQ01EUwo+Pj4+ICAgICAgIGNwICQoQEQpL3NwbC91LWJvb3Qtc3BsLmJpbiAk
KEJJTkFSSUVTX0RJUikvcjUtdS1ib290LXNwbC5iaW4KPj4+PiArICAgICBjZCAkKEBEKTsgZmlu
ZCAuLyAtdHlwZSBmIC1yZWdleCAiXC5cL3RpYm9vdDMtJChUSV9LM19SNV9MT0FERVJfU09DKS0k
KFRJX0szX1I1X0xPQURFUl9TRUNUWVBFKS1bXi1dKi4uYmluIiAtZXhlYyBjcCB7fSAkKEJJTkFS
SUVTX0RJUikvdGlib290My5iaW4gXDsKPj4+Cj4+PiBJIGJlbGlldmUgdGhlcmUgaXMgbWlzc2lu
ZyBzdGVwIGhlcmUgZm9yIHRoZSBBTTY1IHZhcmlhbnQgKHVzaW5nIHNwbGl0IGJpbmFyeQo+Pj4g
YmFzZWQgQm9vdCBGbG93KSBbMV0uCj4+Pgo+Pj4gV2l0aCB0aGUgdGktazMtaW1hZ2UtZ2VuIHJl
bW92YWwsIHdlIG5lZWQgdG8gY29weSBzeXNmdyouaXRiIGdlbmVyYXRlZCBieSBiaW5tYW4KPj4+
ICh0aS1rMy1yNS1sb2FkZXIpIG90aGVyd2lzZSB0aGUgc3lzdGVtIHdvbid0IGJvb3QuCj4gCj4g
Q29ycmVjdCwgZ29vZCBjYXRjaCBSb21haW4uCj4gCj4+PiBUb28gYmFkIHRoYXQgd2UgZG9uJ3Qg
aGF2ZSBhIEFNNjUgZGVmY29uZmlnIGZvciB0ZXN0aW5nLgo+Pj4gQW5kcmVhcywgRG8geW91IHRo
aW5rIHlvdSBjYW4gY29udHJpYnV0ZSBhIG5ldyBkZWZjb25maWcgZm9yIHRoZSBUTURYNjU0SURL
RVZNID8KPj4+Cj4+PiBPbiBteSBzaWRlLCBJIGhhdmUgYSBwYXRjaCBzZXJpZXMgZm9yIHRoZSBT
Sy1UREE0Vk0gdGhhdCBhbHNvIHJlcXVpcmVzCj4+PiBzeXNmdyouaXRiIGJpbmFyeS4KPiAKPiBS
b21haW4sIFdvdWxkIHlvdSBtaW5kIHJvbGxpbmcgdGhpcyAnY3AnIGFkZGl0aW9uIGludG8geW91
ciB1cGNvbWluZwo+IEo3MjFFKiB2YXJpYW50IHNlcmllcz8gIFNpbmNlIGl0J3MgdGhlIHNhbWUg
Ym9vdCBhcmNoaXRlY3R1cmUgSSB0aGluawo+IHRoYXQgd291bGQgYmUgYSBnb29kIGNvbWJpbmF0
aW9uLCBhbmQgdGhpcyB3YXkgeW91IGNhbiBtYWtlIHN1cmUgaXQKPiByZWFsbHkgd29ya3MgZm9y
IHlvdS4KClNvcnJ5LCBJIHdhcyBBRksgbGFzdCB3ZWVrIGFuZCBJIGhhdmVuJ3QgcmV2aWV3ZWQg
dGhlIHY5IHlldC4KCj4gCj4gVGhlbiwgYXMgYSBmb2xsb3ctdXAsIEkgd291bGQgdGhlbiBsaWtl
IHRvIHByZXBhcmUvdGVzdCBhbiBBTTY1Cj4gZGVmY29uZmlnIGFuZCByZWxhdGVkIGJvYXJkIHN1
cHBvcnQgYW5kIHN1Ym1pdCBpdCB1cHN0cmVhbS4gSSBmZWVsCj4gSSByZWFsbHkgd2FudCB0byB0
YWtlIHRoaXMgb24gc2luY2UgSSBjb25zaWRlciBBTTY1IHRvIGJlICJteSBiYWJ5IiAoSQo+IHdh
cyB0aGUgZmlyc3QgdG8gaW50ZWdyYXRlL2RlYnVnL2JyaW5ndXAgYW5kIHN1Y2Nlc3NmdWxseSBl
eGVjdXRlIHRoZQo+IGZ1bGwgUk9NLT5VLUJvb3QtPkxpbnV4IGJvb3QgZmxvdyBiZWZvcmUgd2Ug
ZXZlbiBoYWQgc2lsaWNvbi4uLjopCgo6KQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRo
YW5rcywgQW5kcmVhcwo+IAo+IC0tCj4gQW5kcmVhcyBEYW5uZW5iZXJnCj4gVGV4YXMgSW5zdHJ1
bWVudHMgSW5jCj4gCj4+Pgo+Pj4gWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1h
aWwvYnVpbGRyb290LzIwMjQtRmVicnVhcnkvNjg1NjY2Lmh0bWwKPj4KPj4gQ2FuIHdlLCBmb3Ig
bm93LCBjb25zaWRlciB0aGlzIG1vZGlmaWNhdGlvbiB1bm5lY2Vzc2FyeSwgbWVyZ2UgdGhlCj4+
IHNlcmllcywgYW5kIHByb2NlZWQgbGF0ZXIKPj4gd2l0aCBhbnkgZnVydGhlciBpbXByb3ZlbWVu
dHM/IEVzcGVjaWFsbHkgY29uc2lkZXJpbmcgdGhhdCB0aGVyZSBpc24ndAo+PiBjdXJyZW50bHkg
YSBjb25maWd1cmF0aW9uCj4+IGZvciBhbTY1IGluIEJ1aWxkcm9vdD8KPj4KPj4gVGhhbmtzIGFu
ZCByZWdhcmRzLAo+PiBEYXJpbwo+Pgo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+IFJvbWFpbgo+
Pj4KPj4+Cj4+Pj4gIGVuZGVmCj4+Pj4KPj4+PiAgJChldmFsICQoa2NvbmZpZy1wYWNrYWdlKSkK
Pj4+Cj4+Cj4+Cj4+IC0tIAo+Pgo+PiBEYXJpbyBCaW5hY2NoaQo+Pgo+PiBTZW5pb3IgRW1iZWRk
ZWQgTGludXggRGV2ZWxvcGVyCj4+Cj4+IGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMu
Y29tCj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4KPj4KPj4gQW1h
cnVsYSBTb2x1dGlvbnMgU1JMCj4+Cj4+IFZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlz
bywgVmVuZXRvLCBJVAo+Pgo+PiBULiArMzkgMDQyIDI0MyA1MzEwCj4+IGluZm9AYW1hcnVsYXNv
bHV0aW9ucy5jb20KPj4KPj4gd3d3LmFtYXJ1bGFzb2x1dGlvbnMuY29tCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
