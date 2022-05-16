Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB07C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 154AC830C1;
	Mon, 16 May 2022 22:16:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkiBfs4DsklZ; Mon, 16 May 2022 22:16:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16F408309A;
	Mon, 16 May 2022 22:16:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76E261BF2CF
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7320341939
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 22:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfCLDocp0HPR for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 22:16:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B43641932
 for <buildroot@buildroot.org>; Mon, 16 May 2022 22:16:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a5so18487182wrp.7
 for <buildroot@buildroot.org>; Mon, 16 May 2022 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0dp+/M71i5Ey4np3ZUKbLHRcgKXYpa20Jsgex4X8IIA=;
 b=YPgmYDBE/b5SrZsajHVyQCG3nPy4RznvByJTQMPeaMChIMecdCqSvR8djiiTBQEusY
 sZCKHsocOG5kpft254Hh3EC3SVy3jRyXzmGyL56RfaLXg420CHxUqeKDwn/P5WO2JL0S
 Tq2uPEGQmCr47qhT4Rw82yCtNYoM554QtQ0Nx+Z/4LbnMAq0UxrKl6nc+tbaUlIIbkX8
 tM2VW3L6NSnU8RN6VBBCU7MMl/tA/eWfPIF0SkrV22dSPfIGfW0CUVb+STB/s+qWJ6iG
 cpUpNDSiHvy2ECNQnilpbas8pQmT6jra/xD8zpYchFvi9wQXm9J/KNoYUjHyXatTxZhP
 a4Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0dp+/M71i5Ey4np3ZUKbLHRcgKXYpa20Jsgex4X8IIA=;
 b=3eanZG7GHhb57ZYxG3K505UKrcgxb30pYeYKPIt68q7wr5LCkTMktK6kMZuxMUavef
 Obof7LVaQWGeAx0hYZviAZo40bbGJFlK8vxraqc1go2HZMjo+MgG+5PUmtQbeDDLA7KB
 kSF/EWQDgZQrn65fbgOa7h24x7yZFvAw8wfNmGOVbKAT451Dy61Th/nuppLllFoHFwN1
 cKIab/UedEy1jmNvT9evjnKQWXZxPh+vFQpvnVINfsiVTLntIbPMEQwNDthrYxdUfaVl
 agcsiJAWevYeHL7ag8lXcv4wUlbglnIERkznL3H2e4wJx+uUnYNKC2W/bcsGVubXgFrA
 1gWw==
X-Gm-Message-State: AOAM5309j5B025A/Rc3NYxJfut4anzGI0PiF1mZ9XqgKVnNgZdmBAhGu
 agghsju1Hd3/xmBC9UUXK+yahHfcTC8=
X-Google-Smtp-Source: ABdhPJy0usufVXrzAsAG0gMQtKGV45UR/qgNAD+z75qFHNU9wLQuZ3FBZWnOvoF6nT3sjsC2JNBUxQ==
X-Received: by 2002:a5d:6b07:0:b0:20d:97f:ca6b with SMTP id
 v7-20020a5d6b07000000b0020d097fca6bmr5307131wrw.390.1652739368032; 
 Mon, 16 May 2022 15:16:08 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 r14-20020adfa14e000000b0020c5253d8cesm10481636wrr.26.2022.05.16.15.16.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 15:16:07 -0700 (PDT)
Message-ID: <ea7b7264-e6a6-0093-4ffb-735edba718dd@gmail.com>
Date: Tue, 17 May 2022 00:16:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220515193633.180221-1-romain.naour@gmail.com>
 <20220516214438.GL1597494@scaer>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220516214438.GL1597494@scaer>
Subject: Re: [Buildroot] [PATCH] package/gcc: restrict hs4x_rel31 to arc gcc
 fork
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCkxlIDE2LzA1LzIwMjIgw6AgMjM6NDQsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiBPbiAyMDIyLTA1LTE1IDIxOjM2ICswMjAwLCBSb21haW4gTmFvdXIgc3Bha2UgdGh1
c2x5Ogo+PiBBUkMgaHM0eF9yZWwzMSBjcHUgaXMgbm90IHN1cHBvcnRlZCBieSB1cHN0cmVhbSBn
Y2MgdmVyc2lvbi4KPj4gT25seSB0aGUgZ2VuZXJpYyBIUzQ4IHByb2Nlc3NvciAoQlIyX2FyY2hz
NHgpIGlzIHN1cHBvcnRlZAo+PiBieSB1cHN0cmVhbSBnY2MuCj4+Cj4+IEZpeGVzOgo+PiBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8zNTdhNzRkNTNhZjk2ZDRiODY4YTlk
NWI5ZjljZTk0MzJlMGM1M2I1Cj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1
bHRzL2JjZGYxNjBhM2Q1ZmZjY2NkNDQwMmY2NWFjYTE1M2ZhY2E0YjMyYzIKPj4KPj4gU2lnbmVk
LW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiBDYzogQVJD
IE1haW50YWluZXJzIDxhcmMtYnVpbGRyb290QHN5bm9wc3lzLmNvbT4KPj4gLS0tCj4+ICBwYWNr
YWdlL2djYy9Db25maWcuaW4uaG9zdCB8IDYgKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9Db25maWcuaW4uaG9z
dCBiL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4+IGluZGV4IGY2YjliNGZhOWQuLjJiMTIw
MzVjNGIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4+ICsrKyBi
L3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4+IEBAIC0zMSw2ICszMSw4IEBAIGNvbmZpZyBC
UjJfR0NDX1ZFUlNJT05fOV9YCj4+ICAJIyB1cHN0cmVhbSBnY2MuIEMtU0tZIGdjYyB1cHN0cmVh
bSBzdXBwb3J0IG5vdCB0ZXN0ZWQKPj4gIAkjIHdpdGggdXBzdHJlYW0gYmludXRpbHMgYW5kIGds
aWJjLgo+PiAgCWRlcGVuZHMgb24gIUJSMl9jc2t5Cj4+ICsJIyBBUkMgSFM0OCByZWwgMzEgb25s
eSBzdXBwb3J0ZWQgYnkgZ2NjIGFyYyBmb3JrLgo+PiArCWRlcGVuZHMgb24gIUJSMl9hcmNoczR4
X3JlbDMxCj4gCj4gU28sIGluIHRoZSBjb21taXQgbG9nLCB5b3Ugc2F5IHRoYXQgQlIyX2FyY2hz
NHggaXMgdGhlIG9ubHkgdmFyaWFudAo+IHN1cHBvcnRlZCBieSB1cHN0cmVhbSBnY2MsIHlldCB0
aGlzIGNoYW5nZSBzdGlsbCBhbGxvd3MgYWxsIHRoZSBoczM4Cj4gYW5kIHRoZSA3eDBkIHZhcmlh
bnRzIHRvIHVzZSB0aGUgdXBzdHJlYW0gZ2NjLgoKSSdtIG9ubHkgc3BlYWtpbmcgYWJvdXQgQVJD
IGhzNDgsIG5vdCBvdGhlciBBUkMgdmFyaWFudC4KCj4gCj4gRGlkIEkgbWlzcmVhZCB0aGUgY29t
bWl0IGxvZywgYW5kIHlvdSByZWFsbHkgbWVhbnQ6Cj4gCj4gICAgIE9mIHRoZSBoczQ4IHNlcmll
cywgb25seSB0aGUgZ2VuZXJpYyBIUzQ4IHByb2Nlc3NvciAoQlIyX2FyY2hzNHgpIGlzCj4gICAg
IHN1cHBvcnRlZCBieSB1cHN0cmVhbSBnY2MsIHdoaWxlIHRoZSBoczQ4IHJlbDMxIChoczR4X3Jl
bDMxKSBpcyBub3QsCj4gICAgIGFuZCBpcyBvbmx5IHN1cHBvZXJ0ZWQgYnkgdGhlIEFSQyBmb3Jr
Lgo+IAo+ICAgICBBbGwgdGhlIG90aGVyIHZhcmlhbnRzLCA3eDBkIGFuZCBoczM4LCBhcmUgYWxs
IHN1cHBvcnRlZCBpbiB1cHN0cmVhbQo+ICAgICBnY2MuPgo+IFRob3VnaHRzPwoKaHM0eF9yZWwz
MSBzZWVtcyB0aGUgb25seSBvbmUgbm90IHN1cHBvcnRlZCBieSB1cHN0cmVhbSBnY2MuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAo+PiAg
CXNlbGVjdCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF85Cj4+ICAKPj4gIGNvbmZpZyBCUjJf
R0NDX1ZFUlNJT05fMTBfWAo+PiBAQCAtNDMsNiArNDUsOCBAQCBjb25maWcgQlIyX0dDQ19WRVJT
SU9OXzEwX1gKPj4gIAkjIHVwc3RyZWFtIGdjYy4gQy1TS1kgZ2NjIHVwc3RyZWFtIHN1cHBvcnQg
bm90IHRlc3RlZAo+PiAgCSMgd2l0aCB1cHN0cmVhbSBiaW51dGlscyBhbmQgZ2xpYmMuCj4+ICAJ
ZGVwZW5kcyBvbiAhQlIyX2Nza3kKPj4gKwkjIEFSQyBIUzQ4IHJlbCAzMSBvbmx5IHN1cHBvcnRl
ZCBieSBnY2MgYXJjIGZvcmsuCj4+ICsJZGVwZW5kcyBvbiAhQlIyX2FyY2hzNHhfcmVsMzEKPj4g
IAlzZWxlY3QgQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfMTAKPj4gIAo+PiAgY29uZmlnIEJS
Ml9HQ0NfVkVSU0lPTl8xMV9YCj4+IEBAIC01NCw2ICs1OCw4IEBAIGNvbmZpZyBCUjJfR0NDX1ZF
UlNJT05fMTFfWAo+PiAgCSMgdGhhdCBuZWVkIHRvIGJlIHJldmVydGVkIHNpbmNlIGdjYyA4LjQs
IDkuMyBhbmQgMTAuMS4KPj4gIAkjIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19i
dWcuY2dpP2lkPTk4Nzg0Cj4+ICAJZGVwZW5kcyBvbiAhQlIyX3NwYXJjCj4+ICsJIyBBUkMgSFM0
OCByZWwgMzEgb25seSBzdXBwb3J0ZWQgYnkgZ2NjIGFyYyBmb3JrLgo+PiArCWRlcGVuZHMgb24g
IUJSMl9hcmNoczR4X3JlbDMxCj4+ICAJc2VsZWN0IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNU
XzExCj4+ICAKPj4gIGVuZGNob2ljZQo+PiAtLSAKPj4gMi4zNS4zCj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
