Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A153DCD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 12:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0D6613D4;
	Wed, 27 May 2026 12:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xenkbTx5NAd; Wed, 27 May 2026 12:24:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 270FD613D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779884673;
	bh=ObuENDnsD0g8amVHQLnw3MvV/iKrcg1eZ2jaS5AnU/8=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QdP3gw1qt8ok+XYOMiXFVA/gFUIMhz7Gft9U6zYXoLUiAslmn2tewXGj6XLWYTjT3
	 iJANS077/GKpg/JA3vfx0H34WBx87U3qV8WrBudDG8MwTyt3tlYj34AvfAePYyHlUy
	 0gXA0v4nCqn7Gx9WuYN6gQLw+H4S5ON9f3mG/wawiXld0/cQDbnj7FDs4K/aw9N8ZX
	 vSf3BGRunVavpbsB9K+gQemCuku91W8W+EH5345Nsgt4tkP+O6y/wF8E0iSHgx+NV9
	 FuepBALL7q20mUKR/QfYblsXxH7OHGClcnqVv1psio1TWYTEs04gfx3oXmIfDe0yO2
	 aerDCGCe+nbnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 270FD613D5;
	Wed, 27 May 2026 12:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4880F297
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:24:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E6F9613D5
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:24:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cVqUmYvxJogA for <buildroot@buildroot.org>;
 Wed, 27 May 2026 12:24:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C362E613C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C362E613C8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C362E613C8
 for <buildroot@buildroot.org>; Wed, 27 May 2026 12:24:30 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso100525145e9.2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 05:24:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779884668; x=1780489468;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=snQKDFOv74F2RSDUVV115AYy2ueL/f4arOe4yzpqr7Q=;
 b=KiNdvp4h0wi/PN7kZOUpxWQI4bTCR8exF3XSsFkp26BkH4aO0pgK6tXtPKLtC1/Npa
 XOICT6rrUhVDZU7xoqHTfZHxNTSdeJ5il/olaGl9kdcw1IG6nPlieVzMvWMGCwexhLAi
 tuMGmS6R0mTAO/9cJViTvbRbFhS3T8XL2s2g/Ipba/klh/iVka5kOvC23OrD8FHgyRsL
 wkZZEYi+OpcVbOtJdEQVhM+dHpwl+Bgsiq39vR4RrSfoWDFAClDXtClSWE2ksUfh55RO
 GyHWh4M4B9QgCBkLw6BQqUcEEYW9o8kNCJbYk/ULUlReypwp6XTHoY+H61uNyd/2CqCP
 CUhw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/x1e7HhfnZ/LaBbVv+iMMyG8cA5Nym086snk0CmcrWfVHdSAeSZxa0WDMd7hUfhc4UASMZz0KhQWY=@buildroot.org
X-Gm-Message-State: AOJu0YwifZ60ZbIECds9aGuaOgVD2CXR4MGnQjVHQry1h4spf4qLxS+l
 OSDl6PM4H9R3JJdk9o9dCiYnLxsQyaA9c3W1CAiVktY/J9BWsLlotC+f7XtHK/id01PKJv4P4qc
 2IIck
X-Gm-Gg: Acq92OGI3W79YHd3+RElaGgZG78JUeUo394d9evQZrIF0RiwY3iRH+MW5zpCGzNLnip
 ZA3hUEXxEJ+5pewcCKf7SmojB5Yrc5NPuxSeQ4pPLBPS4ZKT9KT9azbVbTI/xkQBwzYGJjsOJhV
 4OelQIWRQPmSzbY4sC4GXA3Hk4u9F+dgAOSvpb0Ek2Ecb3X0wJmo+/A3wWq4Sp9nb7KN+5hQ9h9
 WYhZalJvr5Pwbsxtk6f+u/X3LjTixu5VgdX7mjN3sUuYjzW6yBeYgVorDRPQof3T9RZrdvRgRPL
 dyQ5inC9v0UAnl/Kq/2Y8ZYIBXtPth9H6WGx+Ov3c5CM2vdddHXcGwp1B59yqUXskNTbftn1LWR
 6nzVFokJGa0hS8s9HoVGFzXliVYjh/bO71GA6d98Q+uQIBT3jEihrZGeoZEJzQFRnrt7SIlYubS
 yA6lGbAd160VGRlPgVtfJEgshNtsVf8geRTScrGaMbAEvjjNRLG1bUMdO+Y+BKVqGBUMeV0L+2j
 NWl6gp3K7Y9rfU=
X-Received: by 2002:a05:600c:8484:b0:490:3c94:a3c6 with SMTP id
 5b1f17b1804b1-490428e205cmr394600045e9.26.1779884668334; 
 Wed, 27 May 2026 05:24:28 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490809d0713sm22376115e9.5.2026.05.27.05.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 05:24:26 -0700 (PDT)
Message-ID: <47189b6c-3e9f-4aba-82d5-b0bc0f94246a@smile.fr>
Date: Wed, 27 May 2026 14:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
References: <20260517213626.3730308-1-romain.naour@smile.fr>
 <a82cb31d-fa76-44d3-a868-e45e48d007c4@rnout.be>
Content-Language: fr, en-US
In-Reply-To: <a82cb31d-fa76-44d3-a868-e45e48d007c4@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779884668; x=1780489468; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=snQKDFOv74F2RSDUVV115AYy2ueL/f4arOe4yzpqr7Q=;
 b=gV8GWkm9F/7UjcKqzJeJNyDHG8eSTbKgnv7UlB8lpZD6qagSGz3H+lUyrjxBm2dpuS
 duO/jaVgaDzOW378loFCXcmLePOVDdg3gb1HbuZ+tiT+UNEIGXpS223Vgs3xrED09bqu
 hrNI+AlK25V956S6pWTKutnXQDBUPbqjKGa4M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=gV8GWkm9
Subject: Re: [Buildroot] [PATCH 1/3] support/testing: add gitlab-runner.json
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LCBBbGwsCgpMZSAxOC8wNS8yMDI2IMOgIDA5OjI5LCBBcm5vdXQgVmFuZGVjYXBw
ZWxsZSBhIMOpY3JpdMKgOgo+IMKgSGkgUm9tYWluLAo+IAo+IMKgRmlyc3QgcmVtYXJrOiBJIGRv
bid0IHRoaW5rIHNwbGl0dGluZyBpbiAzIGNvbW1pdHMgaXMgdmVyeSB1c2VmdWwsIGl0IGFjdHVh
bGx5Cj4gbWFrZXMgaXQgaGFyZGVyIHRvIHNlZSB0aGUgd2hvbGUgcGljdHVyZS4KPiAKPiBPbiAx
Ny8wNS8yMDI2IDIzOjM2LCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gR2l0
TGFiIG9mZmVycyB0aGUgZm9sbG93aW5nIG1hY2hpbmUgdHlwZXMgZm9yIGhvc3RlZCBydW5uZXJz
IG9uIExpbnV4Cj4+IHg4Ni02NCBbMV06Cj4+Cj4+IFJ1bm5lciBUYWfCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZDUFVzwqDCoMKgIE1lbW9yecKgwqDCoCBT
dG9yYWdlCj4+IHNhYXMtbGludXgtc21hbGwtYW1kNjQgKGRlZmF1bHQpwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAywqDCoMKgIDggR0LCoMKgwqAgMzAgR0IKPj4gc2Fhcy1saW51eC1tZWRpdW0tYW1k
NjTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNMKgwqDCoCAxNiBHQsKgwqDCoCA1MCBH
Qgo+PiBzYWFzLWxpbnV4LWxhcmdlLWFtZDY0IChQcmVtaXVtIGFuZCBVbHRpbWF0ZSBvbmx5KcKg
wqDCoCA4wqDCoMKgIDMyIEdCwqDCoMKgIDEwMCBHQgo+PiBzYWFzLWxpbnV4LXhsYXJnZS1hbWQ2
NCAoUHJlbWl1bSBhbmQgVWx0aW1hdGUgb25seSnCoMKgwqAgMTbCoMKgwqAgNjQgR0LCoMKgwqAg
MjAwIEdCCj4+IHNhYXMtbGludXgtMnhsYXJnZS1hbWQ2NCAoUHJlbWl1bSBhbmQgVWx0aW1hdGUg
b25seSnCoMKgwqAgMzLCoMKgwqAgMTI4IEdCwqDCoMKgIDIwMCBHQgo+Pgo+PiBUaGFua3MgdG8g
R2l0TGFiIE9TUyBwcm9ncmFtLCBCdWlsZHJvb3QgYmVuZWZpdCBhIGZyZWUgR29sZAo+IAo+IMKg
VWx0aW1hdGUsIGFjdHVhbGx5Lgo+IAo+PiBzdWJzY3JpcHRpb24gYW5kIGNhbiB1c2UgR2l0bGFi
IHNoYXJlZCBydW5uZXJzIHRhZ2dlZCB3aXRoCj4+IHNhYXMtbGludXgte2xhcmdlLCB4bGFyZ2Us
IDJ4bGFyZ2V9LWFtZDY0Lgo+Pgo+PiBJbiBvcmRlciB0byB1c2Ugb25lIG9mIHRob3NlcyB0YWdz
IGluIEJ1aWxkcm9vdCBHaXRsYWItQ0kgam9icywgd2UgaGF2ZQo+PiB0byBjbGFzc2lmeSBhbGwg
dGVzdHMgYnkgcmVzc291cmNlIHJlcXVpcmVtZW50Lgo+IAo+IMKgcy9yZXNzb3VyY2UvcmVzb3Vy
Y2UvCj4gCj4+Cj4+IE1vc3Qgb2Ygb3VyIHRlc3RzIGFyZSBmYXN0IChjaGVja3BhY2thZ2UsIHRl
c3RfZXh0ZXJuYWxfYm9vdGxpbi4uLiksIHNvCj4+IHNhYXMtbGludXgtc21hbGwtYW1kNjQgcnVu
bmVyIHRhZyBpcyBlbm91Z2guIE5vdGUgdGhhdCB1bnRhZ2dlZCBqb2JzCj4+IHJ1biBvbiB0aGUg
c21hbGwgTGludXggeDg2LTY0IHJ1bm5lciBbM10uCj4gCj4gwqBBRkFJVSwgaWYgaXQgaGFzIF9h
bnlfIHRhZywgaXQgd2lsbCBuZXZlciBydW4gb24gYSBzaGFyZWQgcnVubmVyLiBBbmQgd2UgYWx3
YXlzCj4gYWRkIHRoZSBidWlsZHJvb3QtcnVubmVyIHRhZy4KPiAKPiDCoE1heWJlIHRoYXQncyB3
aGF0IHlvdSBtZWFudCwgYnV0IGl0J3Mgbm90IHNvIGNsZWFyIGZyb20gdGhpcyBwYXJhZ3JhcGgu
CgpJIGFkZGVkIGJ1aWxkcm9vdC1ydW5uZXIgdGFnIGF0IHRoZSB2ZXJ5IGxhc3QgbWludXRlLCBp
bml0aWFsbHkgVGllcjEgdGVzdHMKZGlkbid0IGhhdmUgYSB0YWcuLi4KCiJUaWVyMSIgbWVhbnMg
dGhhdCBhIGpvYiBjYW4gcnVuIG9uIGFueSBydW5uZXIuIFNvIGl0IHNob3VsZCBub3QgdXNlIGEg
dGFnIGluZGVlZC4KCj4gCj4gCj4+IFNoYXJlZCBHaXRsYWItQ0kgcnVubmVycyB0aW1lIG91dCBh
ZnRlciAzIGhvdXJzIGJ1dCBzb21lIG9mIG91ciB0ZXN0cwo+PiByZXF1aXJlcyBtb3JlIHRpbWUg
dG8gZmluaXNoLiBTb21lIHRlc3RzIG1heSBhbHNvIHJlcXVpcmVzIG1vcmUgc3RvcmFnZQo+PiBk
dWUgdG8gZG93bmxvYWQgc291cmNlcyBhbmQgZ2VuZXJhdGVkIGZpbGVzLCBzbyBzdWNoIHRlc3Qg
bXVzdCB1c2UgYQo+PiBydW5uZXIgdGhhdCBwcm92aWRlIG1vcmUgc3RvcmFnZS4KPj4KPj4gSW50
cm9kdWNlIGEgIlRpZXIgbGlzdCIgdGhhdCB3aWxsIGJlIHVzZWQgdG8gc2VsZWN0IHRoZSBSdW5u
ZXIgVGFnLgo+Pgo+PiDCoMKgIFRpZXIxIFMgKGRlZmF1bHQpCj4+IMKgwqAgVGllcjIgTQo+PiDC
oMKgIFRpZXIzIEwKPj4gwqDCoCBUaWVyNCBYTAo+PiDCoMKgIFRpZXI1IDJYTAo+IAo+IMKgTml0
cGljazogZ2VuZXJhbGx5IFRpZXIxIG1lYW5zICJ0aGUgYmVzdCIuCgpPay4KCj4gCj4gwqBBY3R1
YWxseSBJIGRvbid0IHRoaW5rIGl0IG1ha2VzIG11Y2ggc2Vuc2UgdG8gdXNlIFRpZXIgdGVybWlu
b2xvZ3ksIHdoeSBub3QKPiBqdXN0IHN0aWNrIHRvIHNtYWxsL21lZGl1bS8uLi4/CgpJIHdhcyBu
b3Qgc3VyZSBhYm91dCBzbWFsbC9tZWRpdW0vLi4uIHRvIGRlc2NyaWJlIGEgcnVudGltZSB0ZXN0
IHJlc291cmNlCnJlcXVpcmVtZW50LiBUaGlzIGlzIGEgR2l0bGFiIHRlcm1pbm9sb2d5LgoKIlRp
ZXIiIHRlcm1pbm9sb2d5IGlzIGluc3BpcmVkIGJ5IHRoZSBydXN0IHBsYXRmb3JtLXN1cHBvcnQ6
Cmh0dHBzOi8vZG9jLnJ1c3QtbGFuZy5vcmcvbmlnaHRseS9ydXN0Yy9wbGF0Zm9ybS1zdXBwb3J0
Lmh0bWwKCkknbSBmaW5lIHdpdGggc21hbGwvbWVkaXVtLy4uLiB0b28uCgo+IAo+PiBHaXRsYWIg
cnVubmVycyBvd25lZCBieSB0aGUgQnVpbGRyb290IHByb2plY3QgY2FuIHN0aWxsIHJ1biBhbnkK
Pj4gam9iIHVzaW5nICJidWlsZHJvb3QtcnVubmVyIiB0YWcuIFdlIGV4cGVjdCBzdWNoIHJ1bm5l
cnMgYWJsZSB0bwo+PiBydW4gYW55IGpvYnMgd2l0aG91dCBhbnkgbGltaXRhdGlvbi4KPj4KPj4g
SWYgYSB0ZXN0IGNhbid0IGJlIGV4ZWN1dGVkIGJ5IGFueSBzaGFyZWQgR2l0bGFiLUNJIHJ1bm5l
ciwgd2UgaGF2ZSB0bwo+PiB1c2UgYSBydW5uZXIgb3duZWQgYnkgdGhlIEJ1aWxkcm9vdCBwcm9q
ZWN0LiBJbiB0aGlzIGNhc2Ugd2UgaGF2ZSB0bwo+PiB1c2UgYSBzcGVjaWZpYyB0YWcgImJ1aWxk
cm9vdC1ydW5uZXItb25seSIuCj4gCj4gwqBJcyB0aGVyZSBhbnl0aGluZyB3aGVyZSAyWEwgd29u
J3Qgd29yaz8KCkkgaG9wZSAyWEwgd2lsbCBiZSBmaW5lIGZvciBvdXIgQ1BVIGludGVuc2l2ZSBy
dW50aW1lIHRlc3RzLgpCdXQgdGhlcmUgaXMgc3RpbGwgYSAzIGhvdXJzIGxpbWl0LgoKPiAKPj4g
WzFdIGh0dHBzOi8vZG9jcy5naXRsYWIuY29tL2NpL3J1bm5lcnMvaG9zdGVkX3J1bm5lcnMvbGlu
dXgvI21hY2hpbmUtdHlwZXMtCj4+IGF2YWlsYWJsZS1mb3ItbGludXgtLS14ODYtNjQKPj4gWzJd
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2dpdGxhYi1vc3MKPj4gWzNdIGh0dHBz
Oi8vZG9jcy5naXRsYWIuY29tL2NpL3J1bm5lcnMvaG9zdGVkX3J1bm5lcnMvI2dpdGxhYmNvbS1o
b3N0ZWQtCj4+IHJ1bm5lci13b3JrZmxvdwo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+IMKgIHN1cHBvcnQvdGVzdGluZy9n
aXRsYWItcnVubmVyLmpzb24gfCA3NjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4g
wqAgMSBmaWxlIGNoYW5nZWQsIDc2NSBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBzdXBwb3J0L3Rlc3RpbmcvZ2l0bGFiLXJ1bm5lci5qc29uCj4+Cj4+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L3Rlc3RpbmcvZ2l0bGFiLXJ1bm5lci5qc29uIGIvc3VwcG9ydC90ZXN0aW5nL2dp
dGxhYi0KPj4gcnVubmVyLmpzb24KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAw
MDAwMDAwMC4uYzE2M2I0YjFmYQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3N1cHBvcnQvdGVz
dGluZy9naXRsYWItcnVubmVyLmpzb24KPiAKPiDCoEluc3RlYWQgb2YgYSBzZXBhcmF0ZSBmaWxl
LCB3b3VsZG4ndCBpdCBiZSBlYXNpZXIgdG8gcHV0IHRoZSBpbmZvcm1hdGlvbgo+IGRpcmVjdGx5
IGluIHRoZSB0ZXN0IGZpbGUgaXRzZWxmPyBJIHRoaW5rIHRoZSBwYXRoIHRvIHRoZSBzb3VyY2Ug
ZmlsZSBjYW4gYmUKPiBlYXNpbHkgc3Vic3QtZWQgZnJvbSB0aGUgdGVzdCBuYW1lLCBhbmQgZnJv
bSB0aGVyZSB3ZSBjYW4gcGFyc2UgYSBjb21tZW50LgoKSSB0cmllZCB0byBmaW5kIGEgd2F5IHRv
IGFkZCBhIHByb3BlcnR5IGludG8gdGhlIGNsYXNzIHRoYXQgZGVmaW5lIGEgdGVzdC4KQnV0IHRo
ZSBub3NlMiBpbmZyYSBpcyBub3QgcmVhbGx5IGNvb3BlcmF0aXZlLi4uCgpJbnN0ZWFkLCB5b3Ug
c3VnZ2VzdCB0byB1c2UgYSBjb21tZW50IG5leHQgdG8gdGhlIGNsYXNzIG5hbWUgdG8gcmV0cmll
dmUgdGhlIHRhZwp0aGF0IGRlc2NyaWJlIHRoZSBydW5uZXIgdG8gdXNlPwoKSSdsbCBnaXZlIGEg
dHJ5LgoKPiAKPj4gQEAgLTAsMCArMSw3NjUgQEAKPj4gK3sKPj4gK8KgwqDCoCAidGVzdHMiOiB7
Cj4+ICvCoMKgwqDCoMKgwqDCoCAidGVzdHMuYm9vdC50ZXN0X2F0Zi5UZXN0QVRGQWxsd2lubmVy
LnRlc3RfcnVuIjogeyAicnVubmVyIjogIlRpZXIxIiB9LAo+PiArwqDCoMKgwqDCoMKgwqAgInRl
c3RzLmJvb3QudGVzdF9hdGYuVGVzdEFURkFsbHdpbm5lci50ZXN0X3J1biI6IHsgInJ1bm5lciI6
ICJUaWVyMSIgfSwKPiAKPiDCoENhbid0IHdlIGRyb3AgZXZlcnl0aGluZyB3aGljaCBpcyBUaWVy
MSBmcm9tIHRoZSBsaXN0IGFuZCBqdXN0IGRlZmF1bHQgdG8gaXQ/CgpZZXMsIGZvciB0aGlzIGZp
cnN0IHByb3Bvc2FsIEkgbGlzdGVkIGFsbCB0ZXN0cyBmcm9tIHRoZSB0ZXN0c3VpdGUuCih0aGlz
IHNlcmllcyBzaG91bGQgaGF2ZSBiZWVuIGFuIFJGQykKCj4gCj4gwqBJZiBub3QsIHdlJ2xsIG5l
ZWQgYSBjaGVjay1wYWNrYWdlIGNoZWNrIHRoYXQgZXZlcnkgdGVzdCBpcyBtZW50aW9uZWQgaW4K
PiBnaXRsYWItcnVubmVyLmpzb24uCgpJbmRlZWQgdGhpcyBpcyBub3QgcHJhY3RpY2FsLgpSZW1l
bWJlciBhYm91dCB0aGUgLmdpdGxhYi1jaS55bWwgZmlsZSB3aGVuIGl0IHdhcyB3cml0dGVuIGJ5
IGhhbmQuCgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21t
aXRzLzRmODYzZDc3YTY2NmY5NzZhMTA5NmM5YzlmOTc5MDQ3ZDk5OTVmOTQKCj4gCj4gwqBIb3cg
ZGlkIHlvdSBkZWNpZGUgb24gVGllcjEvMi8uLi4/IENhbiB0aGF0IGJlIGRvY3VtZW50ZWQ/CgpJ
IHVzZWQgcHJldmlvdXMgcnVudGltZSB0ZXN0cyByZXN1bHRzIGFuZCB0aGVpciBidWlsZCB0aW1l
LgpXZSBwcm9iYWJseSB3aWxsIGhhdmUgdG8gdXBkYXRlIHNvbWUgdGVzdCB0byB1c2UgYSBiZXR0
ZXIgcnVubmVyLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gCj4gW3NuaXBdCj4gCj4gwqBS
ZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
