Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42EEC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2494C40C1F;
	Wed,  8 Feb 2023 15:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2494C40C1F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cXESYl_ntPjq; Wed,  8 Feb 2023 15:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3928540465;
	Wed,  8 Feb 2023 15:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3928540465
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE5F1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 161A8811F9
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 161A8811F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bIfTPW7Hk6f4 for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:43:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96F5480DB3
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96F5480DB3
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:43:44 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r2so17191727wrv.7
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:43:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MNQiS8ipVM87eZKtkzULthWAaQAJ8h+pKDbnXUpbBZs=;
 b=t9UzAe1qFxJpQFG3Xi/uw9ExfGkBTrz1ZTeSC+15I+30vOmtS6nvNnfc9/KIV8dc9z
 zLuoRGBI3eWcmoTUmGJCYBO/tbvZX11OosPvPhR0cPVxf5y5tAsIerLoWF554938LiuZ
 tS5OveP0mmDGf7yotHiBLVqWfwJ3HtjL6u8UwKIHBlYYmzto51FLta9Ak3ymauFLgzp+
 aaI8xug+C3O4NMoZ1gDFkjB3TALzN87cq1tUkkA/solpw9e9rkS/LWnRUXyylYyQyGJT
 mJAZvSWQ8vazVI5oyeq5j4U1jWrurQJ/nuEtD4W9G6RTN8d96cdqV4fi2z+waPOJemxs
 ojXA==
X-Gm-Message-State: AO0yUKVAzX3JUWL/0iRPDBSZCv+fupFpkwF9aOwImY5qQoqyOvcYlW+i
 aPNSjfYAVwMeyV5Ad54U47UeTA==
X-Google-Smtp-Source: AK7set87r4XW3wH2Y/IyMUdV3XKH+T+4O1s05OA3J9etuXYR5h2WC2NWH5b9oTixIz9JGD6ac5cKQA==
X-Received: by 2002:a05:6000:1d2:b0:2bf:b661:87d9 with SMTP id
 t18-20020a05600001d200b002bfb66187d9mr6993867wrx.50.1675871022698; 
 Wed, 08 Feb 2023 07:43:42 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a5d5957000000b002366e3f1497sm13907041wri.6.2023.02.08.07.43.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:43:42 -0800 (PST)
Message-ID: <c049a0c7-6b96-228c-2a10-c5cb21db6caf@smile.fr>
Date: Wed, 8 Feb 2023 16:43:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20220925192030.1648496-1-thomas.petazzoni@bootlin.com>
 <20220925192030.1648496-2-thomas.petazzoni@bootlin.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220925192030.1648496-2-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MNQiS8ipVM87eZKtkzULthWAaQAJ8h+pKDbnXUpbBZs=;
 b=Dl3GZDy/oSgvM8yVHo9gYs+Xk78BUwQplXjddZDndGyUBgbkOpaNYkKNmcv4uUVDwx
 cX/NNSmUzep3qClNSiutWT1JB9SGUWtldlbDnUECC9Rie0CFhj9BaP5MHOQ+/hjyMImO
 UPjNIwrUq5QwXfIfTkkT9B9/whfPjyUxNXKdaoXwmkguxae80f/z1fIHbuJWl/OWZNQ/
 Q8ufU/gf72FnNU2hcIJXCYvhSk4nLGV9FBMR10usDtwdaEgt69UpLdKmMUSPYh7kPvmI
 kSKuZ3zdqF25vxhrFL2IuaPemWg6rHmZyM5guG/C87oT1EdHdXpDOazmJDXnOnnbMqEh
 35ww==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Dl3GZDy/
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing/tests: add NodeJS
 tests
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNS8wOS8yMDIyIMOgIDIxOjIwLCBUaG9tYXMgUGV0YXp6b25pIGEgw6ljcml0
wqA6Cj4gVGhpcyBjb21taXQgYWRkcyB0d28gbmV3IHRlc3QgY2FzZXM6Cj4gCj4gIC0gVGVzdE5v
ZGVKU0Jhc2ljIHdoaWNoIGJ1aWxkcyBhIHRhcmdldCBjb25maWd1cmF0aW9uIHdpdGgganVzdAo+
ICAgIE5vZGVKUyBlbmFibGVkLCBhbmQgd2hpY2ggcnVucyBhIHZlcnkgc2ltcGxlIE5vZGVKUyBz
Y3JpcHQgb24gdGhlCj4gICAgdGFyZ2V0Lgo+IAo+ICAtIFRlc3ROb2RlSlNNb2R1bGUsIHdoaWNo
IGJ1aWxkcyBhIHRhcmdldCBjb25maWd1cmF0aW9uIHdpdGggTm9kZUpTCj4gICAgZW5hYmxlZCAr
IHRoZSBpbnN0YWxsYXRpb24gb2Ygb25lIGV4dHJhIG1vZHVsZSwgd2hpY2ggbWVhbnMgbnBtIG9u
Cj4gICAgdGhlIGhvc3QgKGZyb20gaG9zdC1ub2RlanMpIGlzIHVzZWQsIGFuZCB3aGljaCBydW5z
IGEgdmVyeSBzaW1wbGUKPiAgICBOb2RlSlMgc2NyaXB0IG9uIHRoZSB0YXJnZXQgdGhhdCB1c2Vz
IHRoaXMgZXh0cmEgbW9kdWxlLgo+IAo+IEhhdmluZyBib3RoIHRlc3RzIHNlcGFyYXRlbHkgYWxs
b3dzIHRvIHZhbGlkYXRlIHRoYXQgYm90aCBub2RlanMtb25seQo+IGFuZCBub2RlanMraG9zdC1u
b2RlanMgY29uZmlndXJhdGlvbnMgYmVoYXZlIGNvcnJlY3RseSwgYXQgbGVhc3QgaW4KPiBtaW5p
bWFsIHNjZW5hcmlvcy4KCk5vZGVKUyB0YWtlcyBhZ2VzIHRvIGJ1aWxkCgpUZXN0ZWQtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4K
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlA
Ym9vdGxpbi5jb20+Cj4gLS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrCj4gIC4uLi90ZXN0cy9wYWNrYWdlL3NhbXBsZV9ub2RlanNfYmFz
aWMuanMgICAgICB8ICAzICsrCj4gIC4uLi90ZXN0cy9wYWNrYWdlL3NhbXBsZV9ub2RlanNfbW9k
dWxlLmpzICAgICB8ICA3ICsrKwo+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X25vZGVqcy5weSAgfCA1MiArKysrKysrKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwg
NjUgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX25vZGVqc19iYXNpYy5qcwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX25vZGVqc19tb2R1bGUuanMKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfbm9k
ZWpzLnB5Cj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJTCj4gaW5kZXgg
NTFkMDI1MTczYS4uNTY0MTQ5ZGUwZiAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJTCj4gKysrIGIv
REVWRUxPUEVSUwo+IEBAIC0yOTI3LDExICsyOTI3LDE0IEBAIEY6CXBhY2thZ2Uvd2VzdG9uLwo+
ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2dydWIucHkKPiAgRjoJc3VwcG9y
dC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9ncnViLwo+ICBGOglzdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvYm9vdC90ZXN0X3N5c2xpbnV4LnB5Cj4gK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3NhbXBsZV9ub2RlanNfYmFzaWMuanMKPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2Uvc2FtcGxlX25vZGVqc19tb2R1bGUuanMKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9hdWdlYXMucHkKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9mbGFzay5weQo+ICBGOglzdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2ZsYXNrX2V4cGVjdHNfanNvbi5weQo+ICBGOglz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX2dpdC5weQo+ICBGOglz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfcHl0aG9uX3VuaXR0ZXN0X3htbF9y
ZXBvcnRpbmcucHkKPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9ub2Rl
anMucHkKPiAgRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fYXVn
ZWFzLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2Zs
YXNrLnB5Cj4gIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX2Zs
YXNrX2V4cGVjdHNfanNvbi5weQo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMv
cGFja2FnZS9zYW1wbGVfbm9kZWpzX2Jhc2ljLmpzIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3Bh
Y2thZ2Uvc2FtcGxlX25vZGVqc19iYXNpYy5qcwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uNzYzMzE3M2M2NAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfbm9kZWpzX2Jhc2ljLmpzCj4gQEAgLTAsMCAr
MSwzIEBACj4gK3ZhciBhc3NlcnQgPSByZXF1aXJlKCdhc3NlcnQnKTsKPiArYXNzZXJ0LnN0cmlj
dEVxdWFsKDEsIDEpOwo+ICtjb25zb2xlLmxvZygiSGVsbG8gV29ybGQiKTsKPiBkaWZmIC0tZ2l0
IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX25vZGVqc19tb2R1bGUuanMg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVfbm9kZWpzX21vZHVsZS5qcwo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNTdhZWU3MzQwOAo+IC0t
LSAvZGV2L251bGwKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
bm9kZWpzX21vZHVsZS5qcwo+IEBAIC0wLDAgKzEsNyBAQAo+ICt2YXIgYXNzZXJ0ID0gcmVxdWly
ZSgnYXNzZXJ0Jyk7Cj4gK3ZhciBsb2Rhc2ggPSByZXF1aXJlKCdsb2Rhc2gnKTsKPiArcmVzdWx0
ID0gbG9kYXNoLmNodW5rKFsnYScsICdiJywgJ2MnLCAnZCddLCAyKTsKPiArZXhwZWN0ZWQgPSBb
IFsgJ2EnLCAnYicgXSwgWyAnYycsICdkJyBdIF07Cj4gK2Fzc2VydC5kZWVwU3RyaWN0RXF1YWwo
cmVzdWx0LCBleHBlY3RlZCkKPiArCj4gKwo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X25vZGVqcy5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3Rfbm9kZWpzLnB5Cj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi45NDYzYzc2YjcyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3Rfbm9kZWpzLnB5Cj4gQEAgLTAsMCArMSw1MiBAQAo+ICtpbXBvcnQg
b3MKPiArCj4gK2ltcG9ydCBpbmZyYS5iYXNldGVzdAo+ICsKPiArCj4gK2NsYXNzIFRlc3ROb2Rl
SlNCYXNpYyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICsgICAgY29uZmlnID0gXAo+ICsgICAg
ICAgICIiIgo+ICsgICAgICAgIEJSMl9hcm09eQo+ICsgICAgICAgIEJSMl9jb3J0ZXhfYTk9eQo+
ICsgICAgICAgIEJSMl9BUk1fRU5BQkxFX1ZGUD15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJTl9F
WFRFUk5BTD15Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfTk9ERUpTPXkKPiArICAgICAgICBCUjJf
VEFSR0VUX1JPT1RGU19DUElPPXkKPiArICAgICAgICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBp
cyBub3Qgc2V0Cj4gKyAgICAgICAgQlIyX1JPT1RGU19QT1NUX0JVSUxEX1NDUklQVD0ie30iCj4g
KyAgICAgICAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSJ7fSIKPiArICAgICAgICAiIiIu
Zm9ybWF0KGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9wYWNrYWdlL2NvcHktc2FtcGxlLXNjcmlwdC10
by10YXJnZXQuc2giKSwKPiArICAgICAgICAgICAgICAgICAgIGluZnJhLmZpbGVwYXRoKCJ0ZXN0
cy9wYWNrYWdlL3NhbXBsZV9ub2RlanNfYmFzaWMuanMiKSkKPiArCj4gKyAgICBkZWYgdGVzdF9y
dW4oc2VsZik6Cj4gKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRk
aXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQo+ICsgICAgICAgIHNlbGYuZW11bGF0b3IuYm9v
dChhcmNoPSJhcm12NyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIGtlcm5lbD0iYnVp
bHRpbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwg
Y3Bpb19maWxlXSkKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKPiArICAgICAgICBz
ZWxmLmFzc2VydFJ1bk9rKCJub2RlIHNhbXBsZV9ub2RlanNfYmFzaWMuanMiKQo+ICsKPiArCj4g
K2NsYXNzIFRlc3ROb2RlSlNNb2R1bGUoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPiArICAgIGNv
bmZpZyA9IFwKPiArICAgICAgICAiIiIKPiArICAgICAgICBCUjJfYXJtPXkKPiArICAgICAgICBC
UjJfY29ydGV4X2E5PXkKPiArICAgICAgICBCUjJfQVJNX0VOQUJMRV9WRlA9eQo+ICsgICAgICAg
IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX05PREVKUz15
Cj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfTk9ERUpTX01PRFVMRVNfQURESVRJT05BTD0ibG9kYXNo
Igo+ICsgICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQo+ICsgICAgICAgICMgQlIyX1RB
UkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKPiArICAgICAgICBCUjJfUk9PVEZTX1BPU1RfQlVJ
TERfU0NSSVBUPSJ7fSIKPiArICAgICAgICBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Int9
Igo+ICsgICAgICAgICIiIi5mb3JtYXQoaW5mcmEuZmlsZXBhdGgoInRlc3RzL3BhY2thZ2UvY29w
eS1zYW1wbGUtc2NyaXB0LXRvLXRhcmdldC5zaCIpLAo+ICsgICAgICAgICAgICAgICAgICAgaW5m
cmEuZmlsZXBhdGgoInRlc3RzL3BhY2thZ2Uvc2FtcGxlX25vZGVqc19tb2R1bGUuanMiKSkKPiAr
Cj4gKyAgICBkZWYgdGVzdF9ydW4oc2VsZik6Cj4gKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0
aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8iKQo+ICsgICAgICAg
IHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12NyIsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGtlcm5lbD0iYnVpbHRpbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIG9w
dGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmxv
Z2luKCkKPiArICAgICAgICBzZWxmLmFzc2VydFJ1bk9rKCJub2RlIHNhbXBsZV9ub2RlanNfbW9k
dWxlLmpzIikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
