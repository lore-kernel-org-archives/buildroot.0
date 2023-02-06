Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF80C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 19:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CFA2410B5;
	Mon,  6 Feb 2023 19:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFA2410B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Iw1dqFhCA95d; Mon,  6 Feb 2023 19:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FFA641706;
	Mon,  6 Feb 2023 19:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FFA641706
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 456281BF2C1
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 19:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E57AC80FA2
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 19:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E57AC80FA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3bPqVMhJQ4V for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 19:04:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96CBB80D7B
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96CBB80D7B
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 19:04:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11512506wmb.2
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 11:04:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6uYWuzUXt4zyvMLW2zV5KX6t2uZfAz7ofy6PGB7QQBI=;
 b=cY+5OUGPYjbVpQY21fuhar5uVdKNWUot7pmyM7ylKiHX3WBsmyGi0Nmz6aH5lf29FY
 I9cunkQ+K3ZOY90fEj5s3BZaRY8DwpfDdGNT7fP6GH7x2tJsd062yINKyMeSLmtnH+1J
 mL61fTmyWss6owjDCEzTO05d1BvRYAbPf0/Bn7OVnXjGvQ+zDRmY78d9D4+yKeyztvaV
 Gui/vzHwBqOsezIE9FTRCTwotHmdfqbD6n55n0d9lO+yHCm8zlK2MzEoOuZpjm7qSqLB
 RjkfOTFPIqRtLeM10QX3AZ8AsJinj1akaJEpuJh4EmR65h4Rpyl4wRlUG1ZpIPC860JV
 Z9dw==
X-Gm-Message-State: AO0yUKUaMvzhVdL5leqabxQLdMh2jtT3EPP4YdyI/mIfsCdytCxR3X1e
 eVsDj2Jk9EDh1BjNtlzq2OcjySvsB0jrl1hj
X-Google-Smtp-Source: AK7set/+PtnjJ0k9YfxtSqOzvfH4mPnRnJtT2EgaqO9xTouNY0n6mA4bt7h7Hez7/BJYTpt5pxz5RQ==
X-Received: by 2002:a05:600c:3417:b0:3dc:5b79:2dbb with SMTP id
 y23-20020a05600c341700b003dc5b792dbbmr688286wmp.25.1675710264813; 
 Mon, 06 Feb 2023 11:04:24 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a05600c512300b003cffd3c3d6csm12742260wms.12.2023.02.06.11.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 11:04:24 -0800 (PST)
Message-ID: <1232ab4c-793d-7777-4a55-1f6fa45fcf8b@smile.fr>
Date: Mon, 6 Feb 2023 20:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: fr
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
 <20230130002854.2300661-4-james.hilliard1@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230130002854.2300661-4-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6uYWuzUXt4zyvMLW2zV5KX6t2uZfAz7ofy6PGB7QQBI=;
 b=cTSTPDJ+GLFr6GviIHoQSAlgvok2B9PWKHs/uNkKNjRFdr3Uej2lYfmedigUV1r/Da
 k6K159CH1cVgb6xoi1zGMRPpDAZ4GsMEHtcWhPpkX8zMKEQLeRruIxcyb22+z8bSRlAB
 zdNdJF6+sPgcNJC1YOtEN7kp/3WNPUq3A4R2J35RgVs2WMfn/1xutQeaU7lWcD4Nl5tt
 wdeB/st4eylymfCT7GHLE4JCIQGVUmzJUyv4uZZo1Jiqn/Cjs8Bk63sC1FOqWMTTNDVQ
 aZbAvm5WEAzVd6FqmBaA8CU1vKuMFlJ3E2NMnQt/2HfQyutUd+J9GYHfqZdmxEuLc+Si
 74qg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=cTSTPDJ+
Subject: Re: [Buildroot] [PATCH v5 04/10] package/pthreadpool: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMzAvMDEvMjAyMyDDoCAwMToyOCwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTCoDoKPiBUaGlz
IHBhY2thZ2UgaXMgcmVxdWlyZWQgYnkgdGVuc29yZmxvdy1saXRlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+IC0tLQo+ICBE
RVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIHBhY2thZ2UvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9wdGhyZWFkcG9vbC9D
b25maWcuaW4gICAgICAgIHwgIDggKysrKysrKwo+ICBwYWNrYWdlL3B0aHJlYWRwb29sL3B0aHJl
YWRwb29sLmhhc2ggfCAgNCArKysrCj4gIHBhY2thZ2UvcHRocmVhZHBvb2wvcHRocmVhZHBvb2wu
bWsgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgNSBmaWxlcyBjaGFuZ2Vk
LCA0NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B0aHJlYWRw
b29sL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9wdGhyZWFkcG9vbC9w
dGhyZWFkcG9vbC5oYXNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3B0aHJlYWRwb29s
L3B0aHJlYWRwb29sLm1rCj4gCj4gZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZFTE9QRVJT
Cj4gaW5kZXggMDFlNjRlNWZjNS4uNmQyNWY0NGRjZCAxMDA2NDQKPiAtLS0gYS9ERVZFTE9QRVJT
Cj4gKysrIGIvREVWRUxPUEVSUwo+IEBAIC0yNzI2LDYgKzI3MjYsNyBAQCBGOglwYWNrYWdlL3Rp
LWdmeC8KPiAgTjoJU3RlZmFuIEhhZ2VyIDxzdGVmYW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPiAg
RjoJcGFja2FnZS9jcHVpbmZvLwo+ICBGOglwYWNrYWdlL2dlbW1sb3dwLwo+ICtGOglwYWNrYWdl
L3B0aHJlYWRwb29sLwo+ICBGOglwYWNrYWdlL3J1eS8KPiAgCj4gIE46CVN0ZWZhbiBPdHQgPHN0
ZWZhbkBvdHQubmV0Pgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gaW5kZXggOGZkOGYwNWJkNi4uODczYWFkZTFhNiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIxMTgsNiAr
MjExOCw3IEBAIGVuZGlmCj4gIAlzb3VyY2UgInBhY2thZ2UvcHJvdG9idWYvQ29uZmlnLmluIgo+
ICAJc291cmNlICJwYWNrYWdlL3Byb3RvYnVmLWMvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNr
YWdlL3Byb3RvemVyby9Db25maWcuaW4iCj4gKwlzb3VyY2UgInBhY2thZ2UvcHRocmVhZHBvb2wv
Q29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL3FodWxsL0NvbmZpZy5pbiIKPiAgCXNvdXJj
ZSAicGFja2FnZS9xbGliYy9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvcmllbWFubi1j
LWNsaWVudC9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHRocmVhZHBvb2wvQ29u
ZmlnLmluIGIvcGFja2FnZS9wdGhyZWFkcG9vbC9Db25maWcuaW4KPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjE5NGFlMzNmODUKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvcGFja2FnZS9wdGhyZWFkcG9vbC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDggQEAKPiArY29u
ZmlnIEJSMl9QQUNLQUdFX1BUSFJFQURQT09MCj4gKwlib29sICJwdGhyZWFkcG9vbCIKClRoZSBD
TWFrZWxpc3RzLnR4dCByZXF1aXJlcyBDKysgc3VwcG9ydDoKClBST0pFQ1QocHRocmVhZHBvb2wg
QyBDWFgpCgpUb29sY2hhaW4gd2l0aCB0aHJlYWRzIHN1cHBvcnQgc2VlbXMgdG8gYmUgcmVxdWly
ZWQ6CgpzcmMvcHRocmVhZHMuYzojaW5jbHVkZSA8cHRocmVhZC5oPgpzcmMvdGhyZWFkcG9vbC1v
YmplY3QuaDojaW5jbHVkZSA8cHRocmVhZC5oPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsJ
c2VsZWN0IEJSMl9QQUNLQUdFX0ZYRElWCj4gKwloZWxwCj4gKwkgIFB0aHJlYWRwb29sIGlzIGEg
cG9ydGFibGUgYW5kIGVmZmljaWVudCB0aHJlYWQgcG9vbAo+ICsJICBpbXBsZW1lbnRhdGlvbi4K
PiArCj4gKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9NYXJhdHlzemN6YS9wdGhyZWFkcG9vbAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3B0aHJlYWRwb29sL3B0aHJlYWRwb29sLmhhc2ggYi9wYWNrYWdl
L3B0aHJlYWRwb29sL3B0aHJlYWRwb29sLmhhc2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAuLjE2NGFjNTUzOTAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9wdGhyZWFkcG9vbC9wdGhyZWFkcG9vbC5oYXNoCj4gQEAgLTAsMCArMSw0IEBACj4gKyMgTG9j
YWxseSBjYWxjdWxhdGVkCj4gK3NoYTI1NiAgYWU3NWFkYjE5ODA3ZWEyODU4MjY4M2IzOGRkNGU3
OWE2YjI4Nzc1MTQ1MjU2NGI0MmUyMTRiYjIxMjE2ZWYxNCAgcHRocmVhZHBvb2wtNDNlZGFkYzY1
NGQ2MjgzYjRiNmU0NWJhMDlhODUzMTgxYWU4ZTg1MC50YXIuZ3oKPiArIyBMaWNlbnNlIGZpbGVz
LCBsb2NhbGx5IGNhbGN1bGF0ZWQKPiArc2hhMjU2ICA1NzgxNGE2MDZiNGQwZmIwODdkOWE1MzQ5
MTkwODRiNmMxMWI1OGE0MTc0Y2I1YTRhZWYyMDAxODc3ODBkYzNhICBMSUNFTlNFCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcHRocmVhZHBvb2wvcHRocmVhZHBvb2wubWsgYi9wYWNrYWdlL3B0aHJl
YWRwb29sL3B0aHJlYWRwb29sLm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAw
MDAwMDAwLi40ZWY3OTQ5ZGEyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcHRocmVh
ZHBvb2wvcHRocmVhZHBvb2wubWsKPiBAQCAtMCwwICsxLDMzIEBACj4gKyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gKyMKPiArIyBwdGhyZWFkcG9vbAo+ICsjCj4gKyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gKwo+ICtQVEhSRUFEUE9PTF9WRVJTSU9OID0gNDNlZGFkYzY1NGQ2MjgzYjRiNmU0
NWJhMDlhODUzMTgxYWU4ZTg1MAo+ICtQVEhSRUFEUE9PTF9TSVRFID0gJChjYWxsIGdpdGh1YixN
YXJhdHlzemN6YSxwdGhyZWFkcG9vbCwkKFBUSFJFQURQT09MX1ZFUlNJT04pKQo+ICtQVEhSRUFE
UE9PTF9MSUNFTlNFID0gQlNELTItQ2xhdXNlCj4gK1BUSFJFQURQT09MX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFCj4gK1BUSFJFQURQT09MX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICtQVEhSRUFE
UE9PTF9ERVBFTkRFTkNJRVMgPSBmeGRpdgo+ICsKPiArUFRIUkVBRFBPT0xfQ0ZMQUdTID0gJChU
QVJHRVRfQ0ZMQUdTKQo+ICtQVEhSRUFEUE9PTF9DWFhGTEFHUyA9ICQoVEFSR0VUX0NYWEZMQUdT
KQo+ICsKPiAraWZlcSAoJChCUjJfUEFDS0FHRV9DUFVJTkZPKSx5KQo+ICtQVEhSRUFEUE9PTF9E
RVBFTkRFTkNJRVMgKz0gY3B1aW5mbwo+ICtQVEhSRUFEUE9PTF9DRkxBR1MgKz0gLURQVEhSRUFE
UE9PTF9VU0VfQ1BVSU5GTz0xCj4gK1BUSFJFQURQT09MX0NYWEZMQUdTICs9IC1EUFRIUkVBRFBP
T0xfVVNFX0NQVUlORk89MQo+ICtlbHNlCj4gK1BUSFJFQURQT09MX0NGTEFHUyArPSAtRFBUSFJF
QURQT09MX1VTRV9DUFVJTkZPPTAKPiArUFRIUkVBRFBPT0xfQ1hYRkxBR1MgKz0gLURQVEhSRUFE
UE9PTF9VU0VfQ1BVSU5GTz0wCj4gK2VuZGlmCj4gKwo+ICtQVEhSRUFEUE9PTF9DT05GX09QVFMg
PSBcCj4gKwktRENNQUtFX0NfRkxBR1M9IiQoUFRIUkVBRFBPT0xfQ0ZMQUdTKSIgXAo+ICsJLURD
TUFLRV9DWFhfRkxBR1M9IiQoUFRIUkVBRFBPT0xfQ1hYRkxBR1MpIiBcCj4gKwktREZYRElWX1NP
VVJDRV9ESVI9IiQoRlhESVZfRElSKSIgXAo+ICsJLURQVEhSRUFEUE9PTF9CVUlMRF9URVNUUz1P
RkYgXAo+ICsJLURQVEhSRUFEUE9PTF9CVUlMRF9CRU5DSE1BUktTPU9GRgo+ICsKPiArJChldmFs
ICQoY21ha2UtcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
