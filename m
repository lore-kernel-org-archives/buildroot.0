Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0683C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 09:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FA0560E2A;
	Fri, 13 May 2022 09:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SanLbwOX506T; Fri, 13 May 2022 09:42:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C9960D52;
	Fri, 13 May 2022 09:42:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 743581BF2E5
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 09:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 711DD828BA
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 09:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 34Qn3kP2g6ua for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 09:42:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7089282660
 for <buildroot@buildroot.org>; Fri, 13 May 2022 09:42:09 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id a5so6856328wrp.7
 for <buildroot@buildroot.org>; Fri, 13 May 2022 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=Iokn4iwvyOLMHjf4dORtDUAKMGT3qFkRaYUPKZhhUeg=;
 b=IUQhtxqhCc/olY5SKU/LhKp8mjtvmxTDKXG2ICIA+mPm3Be93WhDyaAg4Msyn2hM+G
 9Viu6Bu709mac/RlvOcwukDA1+KYHU8Nf7e/tINbCy1BIXHQAVu+XoUH75sWv6KyHwtg
 6zr9sIlwCcHbfpPqcb+/LpsDO25jFp7HPUK75jOBmK0nyzg24dK/Takz/7wKB0Q4WUkN
 rzNPBvOvFbosmlZrq4IAhQL157PLY1uvcrdpWua+ZcNP1E3JoKL50hznouLPUZoGryJo
 EFmwvhpZsYa/B3PcC5rQGc6WO4ZNIktYdtPSYv/4ZGNRbJYBpfn0OgxJ6+OUEaOr0Una
 +BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=Iokn4iwvyOLMHjf4dORtDUAKMGT3qFkRaYUPKZhhUeg=;
 b=sfSLbDDf02AtIJ6UaqxyDp2czs9a/pOKWMvV3L7h77VRy/RKccmdIiEXUpedMTE48W
 Df637JLzbjWTj6gjlLV/mgkWSX0wH/acbgAXeo4FGv+AhodNpwolQoHgdg4lnNeSQ8UY
 mJj03P969nmlFKawtNvYJ7wflfgM/zKa4KUn8LULvL7FuawEzBWhY5P3Fgs4kuLUR8lU
 VputB7fBeZ+g8FvvGF0GQ1YzlK9tjCRffbhD6vgC5qluaoVjIJLqv+zQwcR17ndz9Fvz
 04YJNnW6HdsG3Z5DBsHU5ZkBDBne5yECVaKoo0mnqgWrJvN6Lpcbzxgp8xhyIQaUjKD2
 Yx8A==
X-Gm-Message-State: AOAM5313Ng1KnBh0u05LpDicWc+FFjS3IZf+v3H2Pm+YhRFCf27WGt8V
 Mstl+ObqjmhFZ/EUfegLiw==
X-Google-Smtp-Source: ABdhPJzAKNlq02Rx+bYSFivo7igwDZJmSUfR5BJe7cvlCOTzKrtVvGcnNVr1FRnZa/MTXbraN2DTeg==
X-Received: by 2002:a5d:47ac:0:b0:20c:550b:4cf2 with SMTP id
 12-20020a5d47ac000000b0020c550b4cf2mr3238518wrb.420.1652434927249; 
 Fri, 13 May 2022 02:42:07 -0700 (PDT)
Received: from [192.168.10.198] (bbcs-119-245.pub.wingo.ch. [144.2.119.245])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a7bc116000000b003945f955b51sm4852781wmi.3.2022.05.13.02.42.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 02:42:06 -0700 (PDT)
Message-ID: <34bf150f-42b9-1f32-e693-5cc011afc609@gmail.com>
Date: Fri, 13 May 2022 11:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>,
 Alistair Francis <alistair23@gmail.com>
References: <20220427131400.223113-1-noahhuetter@gmail.com>
 <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
 <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
 <e7ca5854-27eb-a416-1783-15193b0e898b@mind.be>
From: =?UTF-8?Q?Noah_H=c3=bctter?= <noahhuetter@gmail.com>
In-Reply-To: <e7ca5854-27eb-a416-1783-15193b0e898b@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
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
Cc: Alistair Francis <alistair@alistair23.me>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============9136058845910503608=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============9136058845910503608==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eAOKuaHMO3JimAViWXrY4puM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eAOKuaHMO3JimAViWXrY4puM
Content-Type: multipart/mixed; boundary="------------Zo1nVOn3Patckll3JcoiSVSM";
 protected-headers="v1"
From: =?UTF-8?Q?Noah_H=c3=bctter?= <noahhuetter@gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>,
 Alistair Francis <alistair23@gmail.com>
Cc: Alistair Francis <alistair@alistair23.me>,
 buildroot <buildroot@buildroot.org>
Message-ID: <34bf150f-42b9-1f32-e693-5cc011afc609@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
References: <20220427131400.223113-1-noahhuetter@gmail.com>
 <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
 <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
 <e7ca5854-27eb-a416-1783-15193b0e898b@mind.be>
In-Reply-To: <e7ca5854-27eb-a416-1783-15193b0e898b@mind.be>

--------------Zo1nVOn3Patckll3JcoiSVSM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCk9uIDUvMTIvMjIgMjM6NTcsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOg0KPiAN
Cj4gDQo+IE9uIDEyLzA1LzIwMjIgMDg6NTAsIE5vYWggSMO8dHRlciB3cm90ZToNCj4+IEhp
IEFsaXN0YWlyLA0KPj4NCj4+IElzIHRoZXJlIGFueSBhY3Rpb24gbmVlZGVkIGZyb20gbXkg
c2lkZSB0byBnZXQgdGhpcyBjb21taXR0ZWQ/DQo+IA0KPiAgwqBJdCdzIGp1c3Qgb25lIG9m
IHRoZSArLTIwMCBwZW5kaW5nIHBhdGNoZXMgdGhhdCBhcmUgbm90IHRyaXZpYWwuDQoNClRo
YW5rcyBmb3IgdGhlIHVwZGF0ZSwgSSBkaWRuJ3Qgd2FudCB0byBwdXQgcHJlc3N1cmUgb24g
YW55b25lLCBJJ20gYSANCmZpcnN0IHRpbWUgY29udHJpYnV0b3IgYW5kIHdhbnQgdG8gbWFr
ZSBubyBtaXN0YWtlcyA6KS4NCg0KPj4NCj4+IE5vYWgNCj4+DQo+PiBPbiA0LzI4LzIyIDAw
OjU1LCBBbGlzdGFpciBGcmFuY2lzIHdyb3RlOg0KPj4+IE9uIFdlZCwgQXByIDI3LCAyMDIy
IGF0IDExOjE0IFBNIE5vYWggSHVldHRlciA8bm9haGh1ZXR0ZXJAZ21haWwuY29tPiANCj4+
PiB3cm90ZToNCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogTm9haCBIdWV0dGVyIDxub2Fo
aHVldHRlckBnbWFpbC5jb20+DQo+Pj4NCj4+PiBSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJh
bmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPg0KPj4+DQo+Pj4gQWxpc3RhaXINCj4+
Pg0KPj4+PiAtLS0NCj4+Pj4gwqAgYm9vdC9vcGVuc2JpL0NvbmZpZy5pbsKgIHwgNiArKysr
KysNCj4+Pj4gwqAgYm9vdC9vcGVuc2JpL29wZW5zYmkubWsgfCAzICsrLQ0KPj4+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0K
Pj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9vcGVuc2JpL0NvbmZpZy5pbiBiL2Jvb3Qvb3BlbnNi
aS9Db25maWcuaW4NCj4+Pj4gaW5kZXggZjE0NDM0OThkOS4uZmYwOTVlYTgwMCAxMDA2NDQN
Cj4+Pj4gLS0tIGEvYm9vdC9vcGVuc2JpL0NvbmZpZy5pbg0KPj4+PiArKysgYi9ib290L29w
ZW5zYmkvQ29uZmlnLmluDQo+Pj4+IEBAIC0xMTksNCArMTE5LDEwIEBAIGNvbmZpZyBCUjJf
VEFSR0VUX09QRU5TQklfRldfRkRUX1BBVEgNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bXVzdCBiZSBzZXQgaW4gdGhlIFUtQm9vdCBjb25maWd1cmF0aW9uIGZvciB0aGlzIGZpbGUg
dG8gYmUNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHJvZHVjZWQuDQo+Pj4+DQo+Pj4+
ICtjb25maWcgQlIyX1RBUkdFVF9PUEVOU0JJX0NVU1RPTV9NQUtFT1BUUw0KPj4+PiArwqDC
oMKgwqDCoMKgIHN0cmluZyAiQ3VzdG9tIG1ha2Ugb3B0aW9ucyINCj4+Pj4gK8KgwqDCoMKg
wqDCoCBoZWxwDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgIExpc3Qgb2YgY3VzdG9tIG1ha2Ug
b3B0aW9ucyBwYXNzZWQgYXQgYnVpbGQgdGltZS4gQ2FuIGJlDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgIHVzZWQgZm9yIGV4YW1wbGUgdG8gcGFzcyBhIEJVSUxEX0lORk89IHZhbHVlLg0K
PiANCj4gIMKgSW4gdGhpcyBjYXNlLCBpdCdzIG5vdCB0cml2aWFsIGJlY2F1c2UgdGhlIHVz
ZSBjYXNlIGlzIG5vdCBjbGVhci4gDQo+IEFsbW9zdCBldmVyeSBwYWNrYWdlIGhhcyBzb21l
IHJhbmRvbSBtYWtlLCBjbWFrZSwgbWVzb24gb3Igd2hhdGV2ZXIgDQo+IG9wdGlvbnMgdGhh
dCB5b3UgY291bGQgcGFzcyB0byBpdC4gV2hhdCBtYWtlcyBPcGVuU0JJIHNvIHNwZWNpYWwg
dGhhdCANCj4geW91IG5lZWQgdG8gcGFzcyBhIGZyZWVmb3JtIGxpc3Qgb2YgYWRkaXRpb25h
bCBvcHRpb25zPw0KDQpJbiBteSBzcGVjaWZpYyBjYXNlIGFzIGRlc2NyaWJlZCBpbiB0aGUg
aGVscCwgdGhlIHZhbHVlIHRvIGBCVUlMRF9JTkZPYC4gDQogRnJvbSBsb29raW5nIGF0IG90
aGVyIHBhY2thZ2VzIEkgZGVkdWNlZCB0aGF0IHRoZSBfQ1VTVE9NX01BS0VPUFRTIGlzIGEg
DQpjb21tb24gY29uZmlnIHRvIHBhY2thZ2VzIGFuZCBhZGRlZCBpdCB0byBPcGVuU0JJLiBE
aWQgSSBvdmVybG9vayBzb21ldGhpbmc/DQoNCkJlc3QsDQpOb2FoDQoNCj4+Pj4gKw0KPj4+
PiDCoCBlbmRpZg0KPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC9vcGVuc2JpL29wZW5zYmkubWsg
Yi9ib290L29wZW5zYmkvb3BlbnNiaS5taw0KPj4+PiBpbmRleCA4ZTA1NTYzM2E4Li5kMDA3
YWUxMjk5IDEwMDY0NA0KPj4+PiAtLS0gYS9ib290L29wZW5zYmkvb3BlbnNiaS5taw0KPj4+
PiArKysgYi9ib290L29wZW5zYmkvb3BlbnNiaS5taw0KPj4+PiBAQCAtMzEsNyArMzEsOCBA
QCBCUl9OT19DSEVDS19IQVNIX0ZPUiArPSAkKE9QRU5TQklfU09VUkNFKQ0KPj4+PiDCoCBl
bmRpZg0KPj4+Pg0KPj4+PiDCoCBPUEVOU0JJX01BS0VfRU5WID0gXA0KPj4+PiAtwqDCoMKg
wqDCoMKgIENST1NTX0NPTVBJTEU9JChUQVJHRVRfQ1JPU1MpDQo+Pj4+ICvCoMKgwqDCoMKg
wqAgQ1JPU1NfQ09NUElMRT0kKFRBUkdFVF9DUk9TUykgXA0KPj4+PiArwqDCoMKgwqDCoMKg
ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX09QRU5TQklfQ1VTVE9NX01BS0VPUFRTKSkN
Cj4+Pj4NCj4+Pj4gwqAgT1BFTlNCSV9QTEFUID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJH
RVRfT1BFTlNCSV9QTEFUKSkNCj4+Pj4gwqAgaWZuZXEgKCQoT1BFTlNCSV9QTEFUKSwpDQo+
Pj4+IC0tIA0KPj4+PiAyLjM1LjENCj4+Pj4NCj4+Pj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dA0KPj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZw0KPj4+PiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCj4+DQo+Pg0KPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QNCj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+PiBodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCg==


--------------Zo1nVOn3Patckll3JcoiSVSM--

--------------eAOKuaHMO3JimAViWXrY4puM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEolGDkVmJCU4HR2toNiocWEVt2g8FAmJ+J+0FAwAAAAAACgkQNiocWEVt2g/V
4AgAhW6XYnKxOa2Q7VdbZV3acymaP2jZSAVyGXkKgqmBpmYducEJHpoa8uPDZ+MRbiM+DLNOhU8C
EcADIQIBMjTMJ8EMjF6ea/BStn9TDcVw582WWQywG2AEUZl/t8Ds4v0urxEF2pYTNLkbaRtRVcWF
YktX4POBqh+OGQQ/41LScOduiTYSMx765I/Na+6SAOFFjb9Db8GjJuEwzZ9mQ6/fUwVgJB8XJTqI
a8mpG50ELlSUA2kh4SC1JAmeyxp+5UElWcZZotiu4xuDJH3d1rfjvCXN3tHdnjvk9dEYkvzPCznN
O9n51RPFLDiXRodtaSExaZZ/v5vEp6BPsTXER318pw==
=/wgZ
-----END PGP SIGNATURE-----

--------------eAOKuaHMO3JimAViWXrY4puM--

--===============9136058845910503608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9136058845910503608==--
