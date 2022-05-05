Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4C8C433EF
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 21:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E961E8408C;
	Thu,  5 May 2022 21:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xCTqfqeWgRK8; Thu,  5 May 2022 21:23:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E115984089;
	Thu,  5 May 2022 21:23:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EDB11BF308
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB974189E
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 21:23:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m3FUFkWXHDJ6 for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 21:23:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C73B941907
 for <buildroot@buildroot.org>; Thu,  5 May 2022 21:23:19 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id dk23so11041887ejb.8
 for <buildroot@buildroot.org>; Thu, 05 May 2022 14:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=DxEABT2ddGfkaBetQ/qee4G60U9xZUtwk1VBewdre3k=;
 b=CdpF39ZbcQGLPA+sUagrVBBhzUqmxKCi4SuOzRF2rbUnZOqOo6CP5iGHuMaTegY1KE
 bBj+U8flYalKwzsO594aFdxxaIG3ZhM73kfETI25DKyyyMKBn2yEC/yEbygaf5UwPe0z
 61njdjwVWth8YMCfzso9w6hoVrkAzbG6DYmaMTPk4SzH0S+MLxRVIEcaUTqC9LLAeg+C
 IgEfIZPDAfbJiip+33a7X9nsDawtuu1Tc+1UhNKo1f9Xjz1efLnYCMF6tZUM76Y4ip/v
 Wa0dft7hppSBkRxeW8Vwb3oeYu6JEWnVJj8VXqGpxI5DGyB3b7O4z0IytzQj3ZVAeuJX
 N37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=DxEABT2ddGfkaBetQ/qee4G60U9xZUtwk1VBewdre3k=;
 b=3Kbr5xTDKTT78mBU/S9EOXPrXdMJ+8DOSr9FYu0s9xMRXuhb5ELD6KTUz5WVyr596S
 C8+GC3xEcO7CBc2JU5iGmQrUoz2oYX6PdA54n6PFcW1Hj65FkM4+ePYDw86eLNlRP+fz
 GOFx6qJ74e6KiVaR/VXGKxBS2ujwCrMHuefZMoRFtKoYpF/T6vxMzqvhbi0Mi03P3rmi
 GGMqKDO3zhCXSFymYcHa+r6dwPzBj8Xndmtl/UvFGLMNedcuDMilTT23ZO7wqDX5Wol6
 CFTvJ+z2d9ls0ykNapiSdVIwiKvRVzdKZPgB5FfjQadGB5khl09qLPuoWAC30A8P7wKO
 LDpA==
X-Gm-Message-State: AOAM533IDaYK6P/GMb5l+8peXGCcukr1UrvCrTEURlvhb0W9b4LIwlrG
 HBW/BOT6n3gDTZ1FWSVRkoevgA==
X-Google-Smtp-Source: ABdhPJyTLmFo1FqyDUyGqg3Fz1WyHjcqE4sCRsE2kdbi8KP6XpaPg/uH3E7XsanJ/8bf0/WF6dY4bQ==
X-Received: by 2002:a17:907:7f9e:b0:6f4:d3d0:8d8e with SMTP id
 qk30-20020a1709077f9e00b006f4d3d08d8emr109474ejc.501.1651785797845; 
 Thu, 05 May 2022 14:23:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a1709066ad600b006f3ef214dcbsm1175326ejs.49.2022.05.05.14.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 14:23:17 -0700 (PDT)
Message-ID: <77943f14-2555-091f-a0dd-3d1d0ea305a9@mind.be>
Date: Thu, 5 May 2022 23:23:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: Yannick Brosseau <yannick.brosseau@gmail.com>, buildroot@buildroot.org
References: <20220504205413.1219619-1-yannick.brosseau@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220504205413.1219619-1-yannick.brosseau@gmail.com>
Subject: Re: [Buildroot] [PATCH v2] package/openocd: Fix segfault when using
 ST-Link driver
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNC8wNS8yMDIyIDIyOjU0LCBZYW5uaWNrIEJyb3NzZWF1IHdyb3RlOgo+IFJlY2VudCBj
aGFuZ2VzIGluIGxpYnVzYiBoYXZlIGV4cG9zZWQgYSBidWcgaW4gT3Blbk9DRCB3aGljaCBub3cg
Y3Jhc2ggd2hlbiB0cnlpbmcKPiB0byB1c2UgdGhlIFNULUxpbmsgZHJpdmVyLgo+IAo+IFVwc3Ry
ZWFtIGhhcyBhIGZpeCBhcyBjb21taXQgY2ZmMGU0MTdkYTU4YWRlZjFjZWVmOWE2M2E5OTQxMmMy
Y2M4N2ZmMy4gVGhpcyBhZGQgdGhlIGNvbW1pdAo+IGFzIGEgc3RhbmQgYWxvbmUgcGF0Y2guIFRo
ZSBjcmFzaCBhbHNvIGhhcHBlbiBvbiBMaW51eCwgd2hpY2ggd2FzIG5vdCBtZW50aW9ubmVkIGlu
IHRoYXQKPiBjb21taXQgbWVzc2FnZS4KPiAKPiBTaG91bGQgYmUgcmVtb3ZlZCB3aGVuIE9wZW5P
Q0QgaXMgdXBkYXRlZCB0byBhIHJlbGVhc2UgbmV3ZXIgdGhhbiAwLjExCj4gCj4gU2lnbmVkLW9m
Zi1ieTogWWFubmljayBCcm9zc2VhdSA8eWFubmljay5icm9zc2VhdUBnbWFpbC5jb20+CgogIEFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAg
Li4uR1Ytd2l0aC1saWJ1c2ItdjEuMC4yNC0zMy1nMzJhMjIwNi0xLnBhdGNoIHwgODkgKysrKysr
KysrKysrKysrKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKykKPiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL29wZW5vY2QvMDAwMy1zdGxpbmstZml4LVNJR1NFR1Yt
d2l0aC1saWJ1c2ItdjEuMC4yNC0zMy1nMzJhMjIwNi0xLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2Uvb3Blbm9jZC8wMDAzLXN0bGluay1maXgtU0lHU0VHVi13aXRoLWxpYnVzYi12MS4w
LjI0LTMzLWczMmEyMjA2LTEucGF0Y2ggYi9wYWNrYWdlL29wZW5vY2QvMDAwMy1zdGxpbmstZml4
LVNJR1NFR1Ytd2l0aC1saWJ1c2ItdjEuMC4yNC0zMy1nMzJhMjIwNi0xLnBhdGNoCj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi43NzY4MTY4OTJiCj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL3BhY2thZ2Uvb3Blbm9jZC8wMDAzLXN0bGluay1maXgtU0lHU0VHVi13aXRo
LWxpYnVzYi12MS4wLjI0LTMzLWczMmEyMjA2LTEucGF0Y2gKPiBAQCAtMCwwICsxLDg5IEBACj4g
K0Zyb20gY2ZmMGU0MTdkYTU4YWRlZjFjZWVmOWE2M2E5OTQxMmMyY2M4N2ZmMyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogQW50b25pbyBCb3JuZW8gPGJvcm5lby5hbnRvbmlvQGdt
YWlsLmNvbT4KPiArRGF0ZTogV2VkLCAyMyBKdW4gMjAyMSAxNjo1MjoxNiArMDIwMAo+ICtTdWJq
ZWN0OiBbUEFUQ0hdIHN0bGluazogZml4IFNJR1NFR1Ygd2l0aCBsaWJ1c2IgdjEuMC4yNC0zMy1n
MzJhMjIwNiAoMTE2MTgpCj4gK01JTUUtVmVyc2lvbjogMS4wCj4gK0NvbnRlbnQtVHlwZTogdGV4
dC9wbGFpbjsgY2hhcnNldD1VVEYtOAo+ICtDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
Cj4gKwo+ICtUaGUgc3RsaW5rIGRyaXZlciBpbmNvcnJlY3RseSB1c2VzIGEgTlVMTCBwb2ludGVy
IGZvciBsaWJ1c2Incwo+ICtzdHJ1Y3QgbGlidXNiX2NvbnRleHQuCj4gK1RoZSBjb3JyZWN0IHZh
bHVlIHRvIGJlIHVzZWQgaXMgbG9jYWwgaW4gbGlidXNiX2hlbHBlci5jLgo+ICsKPiArTW92ZSBp
biB0aGUgaGVscGVyIGZpbGUsIGluIGEgd3JhcHBlciBmdW5jdGlvbiwgdGhlIG9ubHkgY2FsbCB0
aGF0Cj4gK3JlcXVpcmVzIHRoZSBhYm92ZSB2YWx1ZSwgYW5kIGxldCBzdGxpbmsgZHJpdmVyIHRv
IHVzZSB0aGlzCj4gK3dyYXBwZXIuCj4gKwo+ICtUaGlzIGlzc3VlIGhhcyBub3QgdHJpZ2dlcmVk
IGFueSB2aXNpYmxlIHByb2JsZW0gdW50aWwgYSBjb2RlCj4gK3JlZmFjdG9yaW5nIFsxXSBpbiBs
aWJ1c2IgaGFzIG1hZGUgT3Blbk9DRCBjcmFzaGluZyBvbiBXaW5kb3dzIGFuZAo+ICtvbiBNYWNP
Uy4KPiArCj4gK0NoYW5nZS1JZDogSWQxODE4YzhhZjdjZjBkNGQxN2RmYTFkMjJhYWQwNzlkYTAx
ZWY3NDAKPiArU2lnbmVkLW9mZi1ieTogQW50b25pbyBCb3JuZW8gPGJvcm5lby5hbnRvbmlvQGdt
YWlsLmNvbT4KPiArRml4ZXM6IGh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Avb3Blbm9jZC90aWNr
ZXRzLzMwOC8KPiArRml4ZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ1c2IvbGlidXNiL2lzc3Vl
cy85MjgvCj4gK0ZpeGVzOiA0MmQ4ZmE4OTljNmEgKCJzdGxpbmtfdXNiOiBTdWJtaXQgbXVsdGlw
bGUgVVNCIFVSQnMgYXQgb25jZSB0byBpbXByb3ZlIHBlcmZvcm1hbmNlIikKPiArTGluazogWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9saWJ1c2IvbGlidXNiL2NvbW1pdC8zMmEyMjA2OTQyOGMKPiAr
UmVwb3J0ZWQtYnk6IEFuZHJ6ZWogU2llcsW8xJlnYSA8YXNpZXI3MEBnbWFpbC5jb20+Cj4gK0Nv
LWRldmVsb3BlZC1ieTogQW5kcnplaiBTaWVyxbzEmWdhIDxhc2llcjcwQGdtYWlsLmNvbT4KPiAr
Q28tZGV2ZWxvcGVkLWJ5OiBYaWFvZmFuIENoZW4gPHhpYW9mYW5jQGdtYWlsLmNvbT4KPiArUmV2
aWV3ZWQtb246IGh0dHA6Ly9vcGVub2NkLnp5bGluLmNvbS82MzMxCj4gK1Rlc3RlZC1ieTogamVu
a2lucwo+ICtSZXZpZXdlZC1ieTogTWFyYyBTY2hpbmsgPGRldkB6YXBiLmRlPgo+ICtSZXZpZXdl
ZC1ieTogWGlhb2ZhbiA8eGlhb2ZhbmNAZ21haWwuY29tPgo+ICtSZXZpZXdlZC1ieTogQW5kcnpl
aiBTaWVyxbzEmWdhIDxhc2llcjcwQGdtYWlsLmNvbT4KPiArUmV2aWV3ZWQtYnk6IE9sZWtzaWog
UmVtcGVsIDxsaW51eEByZW1wZWwtcHJpdmF0LmRlPgo+ICtSZXZpZXdlZC1ieTogQW5kcmVhcyBG
cml0aW9mc29uIDxhbmRyZWFzLmZyaXRpb2Zzb25AZ21haWwuY29tPgo+ICtTaWduZWQtb2ZmLWJ5
OiBZYW5uaWNrIEJyb3NzZWF1IDx5YW5uaWNrLmJyb3NzZWF1QGdtYWlsLmNvbT4KPiArLS0tCj4g
KyBzcmMvanRhZy9kcml2ZXJzL2xpYnVzYl9oZWxwZXIuYyB8IDUgKysrKysKPiArIHNyYy9qdGFn
L2RyaXZlcnMvbGlidXNiX2hlbHBlci5oIHwgMSArCj4gKyBzcmMvanRhZy9kcml2ZXJzL3N0bGlu
a191c2IuYyAgICB8IDcgKy0tLS0tLQo+ICsgMyBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4gKwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2p0YWcvZHJpdmVycy9s
aWJ1c2JfaGVscGVyLmMgYi9zcmMvanRhZy9kcml2ZXJzL2xpYnVzYl9oZWxwZXIuYwo+ICtpbmRl
eCBmMDEyMmQ1MzQuLjE4ZmU0YmFkNCAxMDA2NDQKPiArLS0tIGEvc3JjL2p0YWcvZHJpdmVycy9s
aWJ1c2JfaGVscGVyLmMKPiArKysrIGIvc3JjL2p0YWcvZHJpdmVycy9saWJ1c2JfaGVscGVyLmMK
PiArQEAgLTM2MywzICszNjMsOCBAQCBpbnQganRhZ19saWJ1c2JfZ2V0X3BpZChzdHJ1Y3QgbGli
dXNiX2RldmljZSAqZGV2LCB1aW50MTZfdCAqcGlkKQo+ICsKPiArIAlyZXR1cm4gRVJST1JfRkFJ
TDsKPiArIH0KPiArKwo+ICsraW50IGp0YWdfbGlidXNiX2hhbmRsZV9ldmVudHNfY29tcGxldGVk
KGludCAqY29tcGxldGVkKQo+ICsrewo+ICsrCXJldHVybiBsaWJ1c2JfaGFuZGxlX2V2ZW50c19j
b21wbGV0ZWQoanRhZ19saWJ1c2JfY29udGV4dCwgY29tcGxldGVkKTsKPiArK30KPiArZGlmZiAt
LWdpdCBhL3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5oIGIvc3JjL2p0YWcvZHJpdmVy
cy9saWJ1c2JfaGVscGVyLmgKPiAraW5kZXggZmE3ZDA2ZTI4Li4zZTc3ODY1ZDYgMTAwNjQ0Cj4g
Ky0tLSBhL3NyYy9qdGFnL2RyaXZlcnMvbGlidXNiX2hlbHBlci5oCj4gKysrKyBiL3NyYy9qdGFn
L2RyaXZlcnMvbGlidXNiX2hlbHBlci5oCj4gK0BAIC02MCw1ICs2MCw2IEBAIGludCBqdGFnX2xp
YnVzYl9jaG9vc2VfaW50ZXJmYWNlKHN0cnVjdCBsaWJ1c2JfZGV2aWNlX2hhbmRsZSAqZGV2aCwK
PiArIAkJdW5zaWduZWQgaW50ICp1c2Jfd3JpdGVfZXAsCj4gKyAJCWludCBiY2xhc3MsIGludCBz
dWJjbGFzcywgaW50IHByb3RvY29sLCBpbnQgdHJhbnNfdHlwZSk7Cj4gKyBpbnQganRhZ19saWJ1
c2JfZ2V0X3BpZChzdHJ1Y3QgbGlidXNiX2RldmljZSAqZGV2LCB1aW50MTZfdCAqcGlkKTsKPiAr
K2ludCBqdGFnX2xpYnVzYl9oYW5kbGVfZXZlbnRzX2NvbXBsZXRlZChpbnQgKmNvbXBsZXRlZCk7
Cj4gKwo+ICsgI2VuZGlmIC8qIE9QRU5PQ0RfSlRBR19EUklWRVJTX0xJQlVTQl9IRUxQRVJfSCAq
Lwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2p0YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMgYi9zcmMvanRh
Zy9kcml2ZXJzL3N0bGlua191c2IuYwo+ICtpbmRleCBjNjhiYmIzY2EuLjdiMTkzMmI5ZiAxMDA2
NDQKPiArLS0tIGEvc3JjL2p0YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMKPiArKysrIGIvc3JjL2p0
YWcvZHJpdmVycy9zdGxpbmtfdXNiLmMKPiArQEAgLTQ5NywxMyArNDk3LDggQEAgc3RhdGljIHZv
aWQgc3luY190cmFuc2Zlcl93YWl0X2Zvcl9jb21wbGV0aW9uKHN0cnVjdCBsaWJ1c2JfdHJhbnNm
ZXIgKnRyYW5zZmVyKQo+ICsgewo+ICsgCWludCByLCAqY29tcGxldGVkID0gdHJhbnNmZXItPnVz
ZXJfZGF0YTsKPiArCj4gKy0JLyogQXNzdW1pbmcgYSBzaW5nbGUgbGlidXNiIGNvbnRleHQgZXhp
c3RzLiAgVGhlcmUgbm8gZXhpc3RpbmcgaW50ZXJmYWNlIGludG8gdGhpcwo+ICstCSAqIG1vZHVs
ZSB0byBwYXNzIGEgbGlidXNiIGNvbnRleHQuCj4gKy0JICovCj4gKy0Jc3RydWN0IGxpYnVzYl9j
b250ZXh0ICpjdHggPSBOVUxMOwo+ICstCj4gKyAJd2hpbGUgKCEqY29tcGxldGVkKSB7Cj4gKy0J
CXIgPSBsaWJ1c2JfaGFuZGxlX2V2ZW50c19jb21wbGV0ZWQoY3R4LCBjb21wbGV0ZWQpOwo+ICsr
CQlyID0ganRhZ19saWJ1c2JfaGFuZGxlX2V2ZW50c19jb21wbGV0ZWQoY29tcGxldGVkKTsKPiAr
IAkJaWYgKHIgPCAwKSB7Cj4gKyAJCQlpZiAociA9PSBMSUJVU0JfRVJST1JfSU5URVJSVVBURUQp
Cj4gKyAJCQkJY29udGludWU7Cj4gKy0tCj4gKzIuMzUuMQo+ICsKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
