Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9292D1BDF3
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 21:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DBE180D5E;
	Mon,  4 Nov 2024 21:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnrWgfhVs-0c; Mon,  4 Nov 2024 21:03:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980AD80D78
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 980AD80D78;
	Mon,  4 Nov 2024 21:03:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 239B6B8
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FC96403DE
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdUmONblqo12 for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 21:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72f; helo=mail-qk1-x72f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CBAF540521
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBAF540521
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CBAF540521
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 21:03:09 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id
 af79cd13be357-7b1601e853eso336093885a.2
 for <buildroot@buildroot.org>; Mon, 04 Nov 2024 13:03:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730754188; x=1731358988;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P0RoaUDPxpR7BemNl8e3n0pPlhl+n4xWrSIi2i8g6Qs=;
 b=hrFubvVjDCGLPn77qC+igT5AVdO52gbezy60DCwyetbyG41PEbjOfJ6yrRw6uFsuz8
 VCImgcZY0Sjp0+mst7Rjgod996XRFQm02YSBBwlU9f8R/hqbnGZa2gDwpglNzgVfeB/I
 EyR/HlIEsvW5vbGoBd5LOjbflbeGCiWWVSwE0Gmupcg5/H08RLT8dujmmJsaI8FsBamw
 4xowRsd23h5y+VYG2c5YHH9RZ6s6UhWq3uV2NLCG90M9DTdAICkLjnR9BX7/gxwG//Pu
 VRSlk3X7L8pqkUm173sIpJMbjsG+wybYdTB4r5HFsVtgPC1EvgFbyOLQznM7SuHtU0ja
 E5/A==
X-Gm-Message-State: AOJu0YxCWGU3HGbqdFq6cbUW6zPVZBSiPYMKh7xTS91k8GvOvPU01zXu
 ZSYncB0Dgx8JYU/x+Xr4FNHqT2ZdJiI/M6bFcxQFAn8I0RKVB7ArcjVeD3dye8mqVHcP6SdqHid
 h6xJC/1XeEieY8Ut9Zk1jMtKl1FNwyA==
X-Google-Smtp-Source: AGHT+IFojw8xvM5W7h9bV3DqPOCNVDxQxxJaF1vq9xq7+DCnsauXE/WxU1AWRpYN0FUKdaz4N8Vo8oxNqKLWoIsiXGc=
X-Received: by 2002:a05:620a:2494:b0:7b1:4579:61fa with SMTP id
 af79cd13be357-7b2fb9dc3e4mr2215977785a.55.1730754187973; Mon, 04 Nov 2024
 13:03:07 -0800 (PST)
MIME-Version: 1.0
References: <20241101180635.1028681-1-james.hilliard1@gmail.com>
 <349dca54-4070-4f4f-b3ab-6f453a2f4aa3@mind.be>
In-Reply-To: <349dca54-4070-4f4f-b3ab-6f453a2f4aa3@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 4 Nov 2024 14:02:56 -0700
Message-ID: <CADvTj4om=e1HnCj26PQmf3sCjTs5y4Jv6Fz_ZD=CHFTJxzOsRw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730754188; x=1731358988; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0RoaUDPxpR7BemNl8e3n0pPlhl+n4xWrSIi2i8g6Qs=;
 b=HfGUM2uYjWo6rHIzg+uznsH8XPFH0Hou3TO9iaIoLBAv3HYCCz1MLBAZMiMnNjibPy
 bMFh576dl1COfQAR9VpNbHnKnvoSFZ6JlIaQ/GmM1ISEWrGtKfp6iFrbTdrJZr6N0jRK
 Ldgn4ppsgNNSAsRgHscrLM8gKQrEzP7CrP4eBDoyPBAoUh4Itd36n2mtEMfzigKhACW+
 uOhHmQu9T/pRh7FOzJ7hK3I+D6R7v0lN7dQVVxkJf7+ohKnybya1X8eE0srityg+qRq0
 KIm1KMgMgqZWSfbBacmif/NLuB+ch+1hARcStkj3DN8PQ1WSk34UKCuKtB3a/6jmBgZB
 Oawg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HfGUM2uY
Subject: Re: [Buildroot] [PATCH 1/1] package/swig: bump to version 4.3.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBOb3YgNCwgMjAyNCBhdCAxOjEx4oCvUE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFy
bm91dEBtaW5kLmJlPiB3cm90ZToKPgo+ICAgSGkgSmFtZXMsCj4KPiBPbiAwMS8xMS8yMDI0IDE5
OjA2LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiA+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxp
YXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgIHBhY2thZ2Uvc3dp
Zy9zd2lnLmhhc2ggfCAyICstCj4gPiAgIHBhY2thZ2Uvc3dpZy9zd2lnLm1rICAgfCA0ICsrLS0K
PiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3dpZy9zd2lnLmhhc2ggYi9wYWNrYWdlL3N3aWcv
c3dpZy5oYXNoCj4gPiBpbmRleCAyMTU5MGM0MjJhLi45YzFkYmNjMmZjIDEwMDY0NAo+ID4gLS0t
IGEvcGFja2FnZS9zd2lnL3N3aWcuaGFzaAo+ID4gKysrIGIvcGFja2FnZS9zd2lnL3N3aWcuaGFz
aAo+ID4gQEAgLTEsNSArMSw1IEBACj4gPiAgICMgTG9jYWxseSBjb21wdXRlZDoKPiA+IC1zaGEy
NTYgIDJhZjA4YWNlZDhmY2Q2NWNkYjVjYzYyNDI2NzY4OTE0YmVkYzczNWIxYzI1MDMyNTIwMzcx
NmY3OGUzOWFjOWIgIHN3aWctNC4xLjEudGFyLmd6Cj4gPiArc2hhMjU2ICBmNzIwM2VmNzk2ZjYx
YWY5ODZjNzBjMDU4MTYyMzZjYmQwZDMxYjdhYTk2MzFlNWFiNTMwMjBhYjc4MDRhYTllICBzd2ln
LTQuMy4wLnRhci5nego+ID4gICBzaGEyNTYgIGY1M2FiYWVlZDc3NTAxOGQ1MTlhMWI5NjE1ZjBj
YTE3ODk0NzcyYmQ5Y2EyMWMyYTE1NmJmMzQwYWM0MWMxM2UgIExJQ0VOU0UKPiA+ICAgc2hhMjU2
ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0
NWViNjViOTAzICBMSUNFTlNFLUdQTAo+ID4gICBzaGEyNTYgIDdmNTBkOTQyMzczYTg3MTIxMWM1
ZWZlZTAzZjNkYjJmOWVmZDFjZmYxMDAyYjBlZjhlMzc0OGJhYTYxMWE1YzIgIExJQ0VOU0UtVU5J
VkVSU0lUSUVTCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zd2lnL3N3aWcubWsgYi9wYWNrYWdl
L3N3aWcvc3dpZy5tawo+ID4gaW5kZXggYWQ1ODVjM2Y5Ny4uN2U4NGJkZDQzMSAxMDA2NDQKPiA+
IC0tLSBhL3BhY2thZ2Uvc3dpZy9zd2lnLm1rCj4gPiArKysgYi9wYWNrYWdlL3N3aWcvc3dpZy5t
awo+ID4gQEAgLTQsOCArNCw4IEBACj4gPiAgICMKPiA+ICAgIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKPiA+Cj4gPiAtU1dJR19WRVJTSU9OX01BSk9SID0gNC4xCj4gPiAtU1dJR19WRVJTSU9OID0g
JChTV0lHX1ZFUlNJT05fTUFKT1IpLjEKPiA+ICtTV0lHX1ZFUlNJT05fTUFKT1IgPSA0LjMKPiA+
ICtTV0lHX1ZFUlNJT04gPSAkKFNXSUdfVkVSU0lPTl9NQUpPUikuMAo+Cj4gICBJJ3ZlIHRyaWVk
IGJ1aWxkaW5nIGxpYnNlbGludXggYW5kIHB5dGhvbi1weWxpYmZkdCBhZnRlciB0aGlzIGJ1bXAs
IGFuZCBib3RoCj4gZ2l2ZSBtZSBhbiBlcnJvciBsaWtlIHRoaXM6Cj4KPiAyMDI0LTExLTA0VDIx
OjAzOjU1IGxpYmZkdC9saWJmZHRfd3JhcC5jOiBJbiBmdW5jdGlvbiDigJhfd3JhcF9mZHRfZ2V0
X3Byb3BlcnR5X3figJk6Cj4gMjAyNC0xMS0wNFQyMTowMzo1NSBsaWJmZHQvbGliZmR0X3dyYXAu
Yzo2ODI5OjE5OiBlcnJvcjogdG9vIGZldyBhcmd1bWVudHMgdG8KPiBmdW5jdGlvbiDigJhTV0lH
X1B5dGhvbl9BcHBlbmRPdXRwdXTigJkKPiAyMDI0LTExLTA0VDIxOjAzOjU1IDY4MjkgfCAgICAg
ICByZXN1bHRvYmogPSBTV0lHX1B5dGhvbl9BcHBlbmRPdXRwdXQocmVzdWx0b2JqLAo+IGJ1ZmYp
Owo+IDIwMjQtMTEtMDRUMjE6MDM6NTUgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn4KPiAyMDI0LTExLTA0VDIxOjAzOjU1IGxpYmZkdC9saWJmZHRfd3JhcC5jOjEy
NTk6MTogbm90ZTogZGVjbGFyZWQgaGVyZQo+IDIwMjQtMTEtMDRUMjE6MDM6NTUgMTI1OSB8IFNX
SUdfUHl0aG9uX0FwcGVuZE91dHB1dChQeU9iamVjdCogcmVzdWx0LCBQeU9iamVjdCoKPiBvYmos
IGludCBpc192b2lkKSB7Cj4gMjAyNC0xMS0wNFQyMTowMzo1NSB8IF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgo+Cj4KPiAgIE5vdywgSSBoYXZlbid0IGludmVzdGlnYXRlZCB0b28gbXVjaCwgYW5k
IEkgaGF2ZW4ndCBkb25lIGEgY2xlYW4gYnVpbGQgc28gdGhhdAo+IG1heSBiZSB0aGUgcHJvYmxl
bSAodGhvdWdoIEkgZG9uJ3QgaW1tZWRpYXRlbHkgc2VlIGhvdykuIEJ1dCBJIGp1c3Qgd2FudGVk
IHRvCj4gY2hlY2s6IGhhdmUgeW91IGJ1aWxkLXRlc3RlZCBhIGJ1bmNoIG9mIHBhY2thZ2VzIHRo
YXQgdXNlIHN3aWc/CgpIbW0sIEkgdGhpbmsgSSBoYWQgb25seSB0ZXN0ZWQgb25lIG9yIHR3byBw
YWNrYWdlcywgSSdsbCB0YWtlIGEgbG9vay4KCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5vdXQKPgo+
Cj4gPiAgIFNXSUdfU0lURSA9IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L3Byb2pl
Y3Qvc3dpZy9zd2lnL3N3aWctJChTV0lHX1ZFUlNJT04pCj4gPiAgIEhPU1RfU1dJR19ERVBFTkRF
TkNJRVMgPSBob3N0LWJpc29uIGhvc3QtcGNyZTIKPiA+ICAgSE9TVF9TV0lHX0NPTkZfT1BUUyA9
IFwKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
