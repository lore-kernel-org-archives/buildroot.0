Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65447C433F5
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 06:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AE5F4198B;
	Thu, 12 May 2022 06:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F734UgKcWBIo; Thu, 12 May 2022 06:51:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9BF94197D;
	Thu, 12 May 2022 06:50:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 59C2F1BF300
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 06:50:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41587400FD
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 06:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N3U6Dc1XLbCb for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 06:50:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43907400B8
 for <buildroot@buildroot.org>; Thu, 12 May 2022 06:50:55 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id be20so5007337edb.12
 for <buildroot@buildroot.org>; Wed, 11 May 2022 23:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=K2vWQlRSy4v5wZf2x+TnlGZl9YWr40vC/gvd/th7cE8=;
 b=KB9OYj1eJ9zw8UAaRujdarqOZNvjs11cvNKcicPye0VLk5vdVjr0FdAHFHCM44SO9R
 YGSP2N8cnrJlIQwnXhZyQJMmnjUVaeinMgurnkN88w/Euk7moz+tEoHvKLRYeoozkHbx
 /SvbZpsblmpNc1ZPUyvOE8V94da8RQWeQPUML6y+twbsrDwFMrRtf4UBxDULrurRjSZJ
 Gf12fVxJXwwJ8CxUiBBDAIXgQ6fMA40/c77+u756jGA9OrS4COKue7x7TpYj5BhyTnIX
 5JUS1WsPw16mjf9ZWrRtfdOmBqPe8WV+L5zrraoFOA12m+wjgYFYYnIHNDrGE1NvIsiK
 urGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=K2vWQlRSy4v5wZf2x+TnlGZl9YWr40vC/gvd/th7cE8=;
 b=rFyiAuuMpEHDk+XkDYr8D4B5n6L2H3OywKp/y/G/zVHbY5EalMIK/AdA/KNiLUFrgl
 RVs3UW3rvKQ/kUGvHArcGuUVRSMuORp6Kj5Nap+uHPOoJw4G9J6pMzFXtzZccaalk0ol
 ab66B36fQ85GJFI4ORle/myO4bBiTQQxNoW7FX8D+nObzSXwy1Y9+v03JXnEVi/hJIdC
 qrts54Ovb0hEE2HLbrGekZYcVTht7qRsen/7+dkA9JfWs+zf3/fEU7W3SSJJPYdkj9GE
 EQ+OZwkZZHimzCwI3z78TcF+0kITzNZDzCJKG66714VGi4w6yisHNCHV3Gp4xnRprpVp
 2RJw==
X-Gm-Message-State: AOAM531Xdg7RgZJIFRRTZm+efjX6UD+Upzlb+fyI5QFYDD+3zbb458Ag
 /fEXSpAUGH3TJ1iLCuBM5Q==
X-Google-Smtp-Source: ABdhPJytY3DgFCkf6xASh1woYLhbwQsabE4rbusSkZ1rbFz5ZsU2M6Hv8Fngrv0p2+V/nbrbN/CZ3Q==
X-Received: by 2002:a05:6402:5242:b0:427:cade:4737 with SMTP id
 t2-20020a056402524200b00427cade4737mr33777024edd.398.1652338253003; 
 Wed, 11 May 2022 23:50:53 -0700 (PDT)
Received: from [192.168.10.198] (bbcs-119-245.pub.wingo.ch. [144.2.119.245])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a05640213c900b0042617ba63c8sm2110343edx.82.2022.05.11.23.50.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 23:50:52 -0700 (PDT)
Message-ID: <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
Date: Thu, 12 May 2022 08:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Alistair Francis <alistair23@gmail.com>
References: <20220427131400.223113-1-noahhuetter@gmail.com>
 <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
From: =?UTF-8?Q?Noah_H=c3=bctter?= <noahhuetter@gmail.com>
In-Reply-To: <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1381340365881603105=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1381340365881603105==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0v0HohrVrB6H8LFk4M8R5tAn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0v0HohrVrB6H8LFk4M8R5tAn
Content-Type: multipart/mixed; boundary="------------w3g2ttsGE0UxrOarkj4cTHba";
 protected-headers="v1"
From: =?UTF-8?Q?Noah_H=c3=bctter?= <noahhuetter@gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: buildroot <buildroot@buildroot.org>,
 Alistair Francis <alistair@alistair23.me>
Message-ID: <04ff514d-0de7-279f-f443-0339fad4865f@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] boot/opensbi: introduce
 BR2_TARGET_OPENSBI_CUSTOM_MAKEOPTS
References: <20220427131400.223113-1-noahhuetter@gmail.com>
 <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>
In-Reply-To: <CAKmqyKPcAFNmd5tz=JTZZVcUKKZeTpQsockEDL66pfjJM2FhKQ@mail.gmail.com>

--------------w3g2ttsGE0UxrOarkj4cTHba
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQWxpc3RhaXIsDQoNCklzIHRoZXJlIGFueSBhY3Rpb24gbmVlZGVkIGZyb20gbXkgc2lk
ZSB0byBnZXQgdGhpcyBjb21taXR0ZWQ/DQoNCk5vYWgNCg0KT24gNC8yOC8yMiAwMDo1NSwg
QWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4gT24gV2VkLCBBcHIgMjcsIDIwMjIgYXQgMTE6
MTQgUE0gTm9haCBIdWV0dGVyIDxub2FoaHVldHRlckBnbWFpbC5jb20+IHdyb3RlOg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IE5vYWggSHVldHRlciA8bm9haGh1ZXR0ZXJAZ21haWwuY29t
Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5j
aXNAd2RjLmNvbT4NCj4gDQo+IEFsaXN0YWlyDQo+IA0KPj4gLS0tDQo+PiAgIGJvb3Qvb3Bl
bnNiaS9Db25maWcuaW4gIHwgNiArKysrKysNCj4+ICAgYm9vdC9vcGVuc2JpL29wZW5zYmku
bWsgfCAzICsrLQ0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9ib290L29wZW5zYmkvQ29uZmlnLmlu
IGIvYm9vdC9vcGVuc2JpL0NvbmZpZy5pbg0KPj4gaW5kZXggZjE0NDM0OThkOS4uZmYwOTVl
YTgwMCAxMDA2NDQNCj4+IC0tLSBhL2Jvb3Qvb3BlbnNiaS9Db25maWcuaW4NCj4+ICsrKyBi
L2Jvb3Qvb3BlbnNiaS9Db25maWcuaW4NCj4+IEBAIC0xMTksNCArMTE5LDEwIEBAIGNvbmZp
ZyBCUjJfVEFSR0VUX09QRU5TQklfRldfRkRUX1BBVEgNCj4+ICAgICAgICAgICAgbXVzdCBi
ZSBzZXQgaW4gdGhlIFUtQm9vdCBjb25maWd1cmF0aW9uIGZvciB0aGlzIGZpbGUgdG8gYmUN
Cj4+ICAgICAgICAgICAgcHJvZHVjZWQuDQo+Pg0KPj4gK2NvbmZpZyBCUjJfVEFSR0VUX09Q
RU5TQklfQ1VTVE9NX01BS0VPUFRTDQo+PiArICAgICAgIHN0cmluZyAiQ3VzdG9tIG1ha2Ug
b3B0aW9ucyINCj4+ICsgICAgICAgaGVscA0KPj4gKyAgICAgICAgIExpc3Qgb2YgY3VzdG9t
IG1ha2Ugb3B0aW9ucyBwYXNzZWQgYXQgYnVpbGQgdGltZS4gQ2FuIGJlDQo+PiArICAgICAg
ICAgdXNlZCBmb3IgZXhhbXBsZSB0byBwYXNzIGEgQlVJTERfSU5GTz0gdmFsdWUuDQo+PiAr
DQo+PiAgIGVuZGlmDQo+PiBkaWZmIC0tZ2l0IGEvYm9vdC9vcGVuc2JpL29wZW5zYmkubWsg
Yi9ib290L29wZW5zYmkvb3BlbnNiaS5taw0KPj4gaW5kZXggOGUwNTU2MzNhOC4uZDAwN2Fl
MTI5OSAxMDA2NDQNCj4+IC0tLSBhL2Jvb3Qvb3BlbnNiaS9vcGVuc2JpLm1rDQo+PiArKysg
Yi9ib290L29wZW5zYmkvb3BlbnNiaS5taw0KPj4gQEAgLTMxLDcgKzMxLDggQEAgQlJfTk9f
Q0hFQ0tfSEFTSF9GT1IgKz0gJChPUEVOU0JJX1NPVVJDRSkNCj4+ICAgZW5kaWYNCj4+DQo+
PiAgIE9QRU5TQklfTUFLRV9FTlYgPSBcDQo+PiAtICAgICAgIENST1NTX0NPTVBJTEU9JChU
QVJHRVRfQ1JPU1MpDQo+PiArICAgICAgIENST1NTX0NPTVBJTEU9JChUQVJHRVRfQ1JPU1Mp
IFwNCj4+ICsgICAgICAgJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfT1BFTlNCSV9DVVNU
T01fTUFLRU9QVFMpKQ0KPj4NCj4+ICAgT1BFTlNCSV9QTEFUID0gJChjYWxsIHFzdHJpcCwk
KEJSMl9UQVJHRVRfT1BFTlNCSV9QTEFUKSkNCj4+ICAgaWZuZXEgKCQoT1BFTlNCSV9QTEFU
KSwpDQo+PiAtLQ0KPj4gMi4zNS4xDQo+Pg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QNCj4+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnDQo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QNCg0KLS0gDQpOb2FoIEh1ZXR0ZXINCmh0
dHBzOi8vYmVlYmxlYnJveC5jaC8NCkZpbmdlcnByaW50OiBBMjUxIDgzOTEgNTk4OSAwOTRF
IDA3NDcgNkI2OCAzNjJBIDFDNTggNDU2RCBEQTBGDQo=

--------------w3g2ttsGE0UxrOarkj4cTHba--

--------------0v0HohrVrB6H8LFk4M8R5tAn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEolGDkVmJCU4HR2toNiocWEVt2g8FAmJ8rksFAwAAAAAACgkQNiocWEVt2g96
EAgApVtIYFcu9Lyz4A2Dmur03bzK2yukWyAY7eFnjvJ1nX8l4pwNw9lSDkjI6u57oHtT9/NdoO+B
WO3fVmhLKFqCV6tEVhpO5V+W65Q2EIDA70IfYI2nispyPloEZ3uwt1SVllc5vlGM569fogMIlDg/
INBv2rp/mJXR/EliU8/fvL9VTSwt0s5SFYdqnQSBSSo2x7QnTAqildLKGxqGLYnpYYiKVeKnbJt2
jGEI//pezjAqKIiR7nlJ+Git8JWbxPeUrSVsgS1oKJ4wi9t7icQtoCXrBHhLzEkF6Elj19+JPNL/
LIZFQkl38aZ7DSEJ7joTBW9qOEkPbgHslX9iS6N3nw==
=swzL
-----END PGP SIGNATURE-----

--------------0v0HohrVrB6H8LFk4M8R5tAn--

--===============1381340365881603105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1381340365881603105==--
