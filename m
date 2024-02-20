Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EB7C48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 10:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D3681F7A;
	Tue, 20 Feb 2024 10:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G-jMMJt-2K39; Tue, 20 Feb 2024 10:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E02481ECA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E02481ECA;
	Tue, 20 Feb 2024 10:04:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE9F71BF2CB
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 10:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B91D281ECA
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 10:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umFJ7pFoyKeX for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 10:03:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5B41881E17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B41881E17
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B41881E17
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 10:03:58 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50eac018059so7756464e87.0
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 02:03:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708423436; x=1709028236;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6U3fXVHFasQLtO/ISpuKRU8ySyG7OJK+0ecIxivQ77k=;
 b=re/5O0jrWS2ZBL/iuFjhN09cpoP0kUCWT/gldAoqH7Ke6Q6l+UOtyEDwE8SkpIRVyb
 2LR79idZ9my3NsJHpUvQi9r+hHYMnsVHIIgQDXYUqYgkz9d0m0EjXcGbTX8RgyF4fV+G
 5MyHVZGA1GKNMzRFhKrUD3yVKf8SssSIzT3FFCbWX1+HGl4u3YVl+0UBQ6QbxKT7Czoc
 K6RNCi2SYOvan3YHD5AYu1sEwOOH6dae9DoFm7MQzP4xKqS8PGTEG4LlOsRf50IDcGMD
 3AQmiCJfycyiR4IFTAPChhsM1tVbb83fls+Xxq+QO/RjMmRHHTiGE9OPGfonp5vIjcMN
 ZS2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9r231lFM9mSJhQqTEsfM/iOu/jJoHBXxSOzVrWb82I3qprcJtF3P6BP2EbS+d2BC5zVkOIKdujOa5AbpZPMGfBiTZ34wCRw==
X-Gm-Message-State: AOJu0YzL4kWM3EFsjIe25y8IZkwQdcXWdKk7kllaisF9NoYmjIElYQ1J
 9lTsnb/9kZQD7B6bm6szvL+uU6dQmHm9VF813ElFzO/ifuKQXtPZaX4fpyKupLM=
X-Google-Smtp-Source: AGHT+IHj1Slm30lxsdkLaqbgHbWmg9OdClNyX0KTyD2OZOnruUtbkykUuFjMS4ngYwd9VV3nQxxspA==
X-Received: by 2002:ac2:5f6a:0:b0:512:b426:53e8 with SMTP id
 c10-20020ac25f6a000000b00512b42653e8mr2827883lfc.30.1708423435884; 
 Tue, 20 Feb 2024 02:03:55 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 fa24-20020a05600c519800b004126e2fd39csm1775802wmb.25.2024.02.20.02.03.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 02:03:55 -0800 (PST)
Message-ID: <0b6dbe1f-2591-4290-b620-880d63eee7d0@smile.fr>
Date: Tue, 20 Feb 2024 11:03:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Andreas Dannenberg <dannenberg@ti.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <90dd167b-bceb-4e42-86c3-255caf825f41@smile.fr>
 <CAOf5uwka5w7DEAOox1pAfZ=mkpostmNATBJ_Ny1xuyYesXUwoQ@mail.gmail.com>
 <bf687add-2677-45fe-8eb1-cf04bd95bf57@smile.fr>
 <20240220004100.3yzqapeplx6olarz@dasso>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240220004100.3yzqapeplx6olarz@dasso>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708423436; x=1709028236;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6U3fXVHFasQLtO/ISpuKRU8ySyG7OJK+0ecIxivQ77k=;
 b=XEzW4/Az+vin0Ayrbsip4pnDnhcd3T3wDoX+wHJL7d04jY4+6rv7tf09PknyApkYho
 FSaszODCnJ3T7t9qStvqb9y4DOrMhYgRidUoY+uCr4KN4/lKJ+FVtW15F77P37V62hYx
 pJSJOdWZcmw3FGJvsVt2u7Aqf6PTi6RFAOvSeuFI4hBUqeWNi5R/P06ywNGPpbN53uWl
 0nhL+ZaYJ13eSJ2fGqYSyu7qCaw0rzuiiIAe6Re1eTS5MuRvFUUeZoA1IgCMLSQuKu3b
 vGeJl5/FuAtS7bsu1AuWyPlrVo0DptXRY8Hisv2megry7PHCtH0FvOngYhBi8KXAoSLJ
 H7eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=XEzW4/Az
Subject: Re: [Buildroot] [PATCH v4 00/20] Add support for AM62x-SK HS-FS
 devices
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQW5kcmVhcywKCkxlIDIwLzAyLzIwMjQgw6AgMDE6NDEsIEFuZHJlYXMgRGFubmVuYmVy
ZyBhIMOpY3JpdMKgOgo+IE9uIE1vbiwgRmViIDE5LCAyMDI0IGF0IDEyOjI0OjUyUE0gKzAxMDAs
IFJvbWFpbiBOYW91ciB3cm90ZToKPj4gSGVsbG8gTWljaGFlbCwKPj4KPj4gTGUgMTkvMDIvMjAy
NCDDoCAxMjowMiwgTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIGEgw6ljcml0wqA6Cj4+PiBI
aSBSb21haW4KPj4+Cj4+PiBPbiBNb24sIEZlYiAxOSwgMjAyNCBhdCAxMDozMOKAr0FNIFJvbWFp
biBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4+Pgo+Pj4+IEhlbGxvIERh
cmlvLAo+Pj4+Cj4+Pj4gTGUgMTcvMDIvMjAyNCDDoCAxNzowMiwgRGFyaW8gQmluYWNjaGkgYSDD
qWNyaXQgOgo+Pj4+PiBUaGUgU0stQU02MkItUDEgaXMgdGhlIG5ld2VzdCB2ZXJzaW9uIG9mIFNL
LUFNNjIgd2hpY2ggaW5jbHVkZXMKPj4+Pj4gaGlnaC1zZWN1cml0eSBmaWVsZC1zZWN1cmFibGUg
KEhTLUZTKSBzaWxpY29uIHRvIG9wdGlvbmFsbHkgY3VzdG9taXplIGtleXMKPj4+Pj4gYW5kIGVu
Y3J5cHRpb24gZm9yIHNlY3VyaXR5IGFwcGxpY2F0aW9ucy4KPj4+Pj4gVGhpcyByZXF1aXJlcyBl
bmFibGluZyB0aGUgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9IU19GUyBvcHRp
b24sCj4+Pj4+IHdoaWNoLCBob3dldmVyLCB3YXMgYnVnZ3kuIFRoaXMgc2VyaWVzIGZpeGVzIHRo
ZSBlcnJvcnMgYW5kIGJ1bXBzIHRoZSBMaW51eAo+Pj4+PiBrZXJuZWwgYW5kIFUtQm9vdCByZXF1
aXJlZCBmb3Igc3VjaCBhIG5ldyBkZXZpY2UuCj4+Pj4+Cj4+Pj4+IFRoaXMgc2VyaWVzLCB3aGlj
aCBpbiBteSBodW1ibGUgb3Bpbmlvbiwgc2hvdWxkIGhhdmUgYmVlbiBpbW1lZGlhdGVseQo+Pj4+
PiBjb25zaWRlcmVkIHRvIGNvcnJlY3QgdGhlIGNvbXBpbGF0aW9uIGVycm9ycyBpbiBjYXNlIG9m
IEhTLUZTIGRldmNpZXMsIGhhcwo+Pj4+PiBzZWVuIGFuIGluY3JlYXNlIGluIHBhdGNoZXMgaW4g
dmVyc2lvbiA0IHRvIHJlbW92ZSB0aGUgdGktazMtaW1hZ2UtZ2VuCj4+Pj4+IHBhY2thZ2UgdGhh
bmtzIHRvIEJpbm1hbi4gQWRkaXRpb25hbGx5LCBpdCBzaGFyZXMgc29tZSBtb2RpZmljYXRpb25z
IGFuZAo+Pj4+PiB2aWV3cyBvbiBob3cgdG8gaW1wbGVtZW50IGNlcnRhaW4gY2hhbmdlcyB3aXRo
IHRoZSBzZXJpZXMKPj4+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1
aWxkcm9vdC9saXN0Lz9zZXJpZXM9Mzk0ODQwLgo+Pj4+PiBUaGVyZWZvcmUsIEkgdGhpbmsgaXQg
aXMgbmVjZXNzYXJ5IG5vdCB0byBydW4gdGhlbSBpbiBwYXJhbGxlbCBidXQgdG8gZGVjaWRlCj4+
Pj4+IHdoZXRoZXIgdG8gbWVyZ2Ugb25lIGJlZm9yZSB0aGUgb3RoZXIgb3IgdG8gY29uc2lkZXIg
YSBzaW5nbGUgc2VyaWVzIHdoZXJlCj4+Pj4+IHRoZSBwYXRjaGVzIGNhbiBiZSBjb2hlcmVudCB3
aXRoIGVhY2ggb3RoZXIuIEkgYW0gYXZhaWxhYmxlIGZvciBib3RoIHNvbHV0aW9ucy4KPj4+Pj4g
TGV0IG1lIGtub3cuCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRoaXMgbmV3IHZlcnNpb24uIEkgYmVs
ZWl2ZSBib3RoIHNlcmllcyBzaG91bGQgYmUgbWVyZ2VkIGludG8gb25lCj4+Pj4gc2luY2Ugd2Ug
d2FudCB0byBmb2xsb3cgdS1ib290IHN3aXRjaCB0byBiaW5tYW4sIGFkZCBtb3JlIFRJIEszIFNv
QyBzdXBwb3J0IGFuZAo+Pj4+IGtlZXBpbmcgZXhpc2luZyBhbTYyeCBhbnMgYW02NHggd29ya2lu
ZyBpbiBHUCBvciBIUy9IUy1GUy4KPj4+Pgo+Pj4KPj4+IEJlY2F1c2UgdGhlIERhcmlvIHBhdGNo
c2V0IHdhcyBzZW50IGJlZm9yZSAoZW5kIG9mIE5vdmVtYmVyKSwgaXQncwo+Pj4gcmVhc29uYWJs
ZSB0byByZXZpZXcgYW5kIGFkanVzdCB0aGF0IG9uZQo+Pj4gYW5kIGFwcGx5IHlvdXIgY2hhbmdl
cyBmb3IgdGlfajcyMWVfc2sgb24gdG9wIG9mIGl0LiBJdCB0aGluayB0aGF0IGlzCj4+PiBhIHN0
YW5kYXJkIHdheSB0byBtYWtlIHBlb3BsZSBoYXBweSBhYm91dAo+Pj4gdGhlaXIgd29yayBhbmQg
Y29udHJpYnV0aW9uLgo+Pgo+PiBBY3R1YWxseSwgdGhlIHR3byBzZXJpZXMgYXJlIGFib3V0IHRo
ZSBzYW1lIHRvcGljOiBUSSBLMyBTb0Mgc3VwcG9ydCAoR1AsIEhTLAo+PiBIUy1GUykgbm90IG9u
bHkgQU02MngtU0sgSFMtRlMgZGV2aWNlcwo+Pgo+PiBCdXQgZHVlIHRvIHRoZSBjb21wbGV4aXR5
IG9mIHRoZSBCU1AsIHRoZSBib290IGZsb3cgKDQgd2F5IHRvIGJvb3QhKSBhbmQgdGhlCj4+IHN3
aXRjaCBmcm9tIGN1c3RvbSB0b29sIHRvIGJpbm1hbi4uLiB0aGlzIHNlcmllcyBpcyByZWFsbHkg
ZGlmZmljdWx0IHRvIHJldmlldwo+PiB3aXRob3V0IGhhdmluZyBhIGdvb2QgdW5kZXJzdGFuZGlu
ZyBvZiBUSSBLMyBhcmNoaXRlY3R1cmUgcGVjdWxpYXJpdHkgYW5kIGhhdmluZwo+PiBvbmUgb2Yg
ZWFjaCBUSSBldmFsdWF0aW9uIGJvYXJkcyDwn5mCCj4gCj4gQWx0aG91Z2ggSSBoZWxwZWQgY29u
Y2VpdmUgc29tZSBvZiB0aGlzIGFuZCB0aGUgYXNzb2NpYXRlZCB0b29saW5nIGVhcmx5Cj4gb24s
IHNvbWUgb2YgdGhlIHdoYXQgbWF5IGxvb2sgc3RyYW5nZSBhcmNoaXRlY3R1cmFsIGRlY2lzaW9u
cyB3ZXJlIGRyaXZlbgo+IGJ5IGRpZmZlcmVudCB1c2UgY2FzZXMgYW5kIHJlcXVpcmVtZW50cyBm
b3IgdGhlIGRpZmZlcmVudCBkZXZpY2VzCj4gKGVzcGVjaWFsbHkgYXJvdW5kIGF1dG9tb3RpdmUg
ZmFzdC9lYXJseSBib290LCBidXQgYWxzbyBzZWN1cml0eSkgaW4KPiBjb21iaW5hdGlvbiB3aXRo
IGxpbWl0ZWQgb24tY2hpcCBTUkFNLi4uIFNvIHRoaXMgd2hlcmUgd2UgYXJlIGF0IG5vdy4gQQo+
IGZ1dHVyZSBBTTZ4IGRldmljZSB2YXJpYW50IHdpbGwgaGF2ZSB5ZXQgYW5vdGhlciBib290IGZs
b3csIGJ1dCBJIGNhbgo+IGFscmVhZHkgc2F5IGl0IHdpbGwgYmUgdmVyeSBtdWNoIHNpbXBsaWZp
ZWQgb3ZlciB3aGF0IHdlIGhhdmUgdG9kYXkgOikKCkFib3V0IGV4aXN0aW5nIGJvb3QgZmxvdywg
SSBmb3VuZCB0d28gcmVjZW50IGNvbW1pdCBpbiB1LWJvb3QgdGhhdCBzdGF0ZSB0aGF0CnRoZSAi
U3BsaXQgYmluYXJ5IiAodGhhdCByZXF1aXJlcyBzeXNmdy5pdGIpIGlzIGFscmVhZHkgYSBsZWdh
Y3kgYm9vdCBmbG93OgoKYXJtOiBkdHM6IGszLWJpbm1hbjogQWRkIHN1cHBvcnQgZm9yIEZJVCB0
ZW1wbGF0ZXMKCiAgICBBZGQgdGVtcGxhdGVzIGZvciBGSVQgaW1hZ2VzIHVzZWQgZXh0ZW5zaXZl
bHkgYWNyb3NzIEszIGJvYXJkcyB3aXRoIG1vc3QKICAgIG9mIHRoZSBjb2RlIGNvbW1vbi4gVGhp
cyBpbmNsdWRlcyB0aGUgRklUIHBvcnRpb25zIG9mOgogICAgCS0gdGlzcGwuYmluCiAgICAJLSB1
LWJvb3QuaW1nCiAgICAJLSBzeXNmdy5pdGIgKGluIGNhc2Ugb2YgbGVnYWN5IGJvb3QgZmxvdykK
Cmh0dHBzOi8vZ2l0bGFiLmNvbS91LWJvb3QvdS1ib290Ly0vY29tbWl0L2IxNTNiYWQwZjE0MTY4
ZDVmY2MwMmJhNmJmMWEyY2Q5OGRhYmE5YjUKCiAgICBhcm06IGR0czogazMtKi1iaW5tYW46IE1v
dmUgdG8gdXNpbmcgdGVtcGxhdGVkIEZJVHMKCiAgICBSZWR1Y2UgcmVkdW5kYW5jeSBpbiBjb2Rl
IGJ5IHVzaW5nIHRlbXBsYXRlcyB0byBnZW5lcmF0ZSB0aGUgQTcyIGJvb3QKICAgIGJpbmFyaWVz
ICh0aXNwbC5iaW4gYW5kIHUtYm9vdC5pbWcpIGFzIHdlbGwgYXMgUjUgYm9vdCBiaW5hcnkgc3lz
ZncuaXRiCiAgICAoZm9yIGxlZ2FjeSBib290IGZvbGxvd2luZyBkZXZpY2VzIEo3MjFFIGFuZCBB
TTY1eCkuCgpodHRwczovL2dpdGxhYi5jb20vdS1ib290L3UtYm9vdC8tL2NvbW1pdC80NTA5Yjlm
ZjBiOGNiMjY5MDdmOWU5YzM1NzFiNDM1NjVjODU5Mjc1CgpXaGljaCBvbmUgc2hvdWxkIGJlIHJl
Y29tbWVuZGVkIG9yIGF2b2lkZWQgZm9yIGEgbmV3IGRlc2lnbj8KCkJlc3QgcmVnYXJkcywKUm9t
YWluCgoKPiAKPj4gVGhlIHNlcmllcyAoYmFzZWQgb24gRGFyaW8ncyB3b3JrKSBhYm91dCB0aV9q
NzIxZV9zayBzdWdnZXN0ZWQgdG8gcmVtb3ZlIFRJCj4+IGN1c3RvbSB0b29scyByZXBsYWNlZCBi
eSBiaW5tYW4gYWxvbmcgd2l0aCBvdGhlciBpbXByb3ZlbWVudHMuCj4+Cj4+IEknbGwgd2F5IGZv
ciB2NSBhbmQgcmViYXNlIHRoZSB0aV9qNzIxZV9zayBvbiB0b3Agb2YgaXQuCj4gCj4gVGhhbmsg
eW91IFJvbWFpbiBmb3IgeW91ciBidXktaW4uIExldCdzIGZvY3VzIG9uIGdldHRpbmcgRGFyaW8n
cyBzZXJpZXMKPiBpbiBnb29kIHNoYXBlIGFuZCB0aGVuIG1vdmUgb250byB5b3Vycy4gSSdkIGFs
c28gbGlrZSB0byByZS1pbnRyb2R1Y2UKPiBncmFwaGljcyAoSSBoYWQgdGhhdCB3b3JraW5nIGJl
Zm9yZSkgYnV0IEkgbmVlZCB0byB3YWl0IGZvciBhbGwgdGhlCj4gImJhc2VsaW5lIiBzdHVmZiB0
byBzZXR0bGUgZmlyc3QuCj4gCj4gCj4gLS0KPiBBbmRyZWFzIERhbm5lbmJlcmcKPiBUZXhhcyBJ
bnN0cnVtZW50cyBJbmMKPiAKPiAKPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+PiBSb21haW4KPj4K
Pj4KPj4+Cj4+PiBNaWNoYWVsCj4+Pgo+Pj4+IE15IG1haW4gY29uY2VybiBpcyB0byBhdm9pZCBh
ZGRpbmcgYSBuZXcgcGFja2FnZSBmb3IgYSB0b29sIHRoYXQgaXMgYWxyZWFkeQo+Pj4+IGRlcHJl
Y2F0ZWQgdGktazMtaW1hZ2UtZ2VuIChub3Qgc3VyZSBpZiB0aS1rMy1jb3JlLXNlY2RldiBpcyBy
ZWFsbHkgZGVwcmVjYXRlZCkgWzFdLgo+Pj4+Cj4+Pj4gQWxzbyB0aGUgdG9waWMgaXMgbm90IG9u
bHkgIkFNNjJ4LVNLIEhTLUZTIGRldmljZXMiIGJ1dCAiVEkgSzMgSFMtRlMgZGV2aWNlcyIuCj4+
Pj4KPj4+PiBbMV0gaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L3BpcGVybWFpbC9idWlsZHJvb3Qv
MjAyNC1GZWJydWFyeS82ODU4MjAuaHRtbAo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+IFJv
bWFpbgo+Pj4+Cj4+Pj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
