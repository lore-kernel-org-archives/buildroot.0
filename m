Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A780C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 18:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8A5D8272C;
	Tue,  5 Apr 2022 18:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No6cxX3YHuBd; Tue,  5 Apr 2022 18:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5D4781D02;
	Tue,  5 Apr 2022 18:52:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21E7F1BF83E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 18:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 090A56101E
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 18:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZ7GqoJwN7Wd for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 18:52:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EAAFB60EA5
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 18:52:16 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id w127so20642oig.10
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 11:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oWhBvRzzxlfPROv5JxpdLao0vV29bIy5gqN1Mr7ipBU=;
 b=FBCP3nq32DWfgX0//MKE/hmsxqgyrD5BUz9Cm0l4ZmiR2ck2TJvqTSOIdSHmRl5fm6
 f2wDL6LowAShxX96JYQUxUsyxr9ELTVpi/hfK7dJkLfsMrUcortN/WSG6RbMTKppXFqJ
 VQJhZgugjeoTPlk8EvukpHNnk3+o8Dl2dso64W4T5fE34XvkUu4Ey5FXudvKgmDEeaea
 eWcgcCjyZ/CFGA3lP2IsTnSOUeYrtDLSYfx452e5W7QVnt6Dpr5W31X7okotUPNWtb+i
 uilo1100DSYx9OxRrYBDYx9yOhwkedu8gSP/eoWPwLu6JbuVb6dvQ75mCYbuWYDf0FFL
 1tag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oWhBvRzzxlfPROv5JxpdLao0vV29bIy5gqN1Mr7ipBU=;
 b=5FLMZMDZ5ZpupjRhH3Q6n+FL7lqxL8T3XkGuVywP3XyNJIDFR9G/r3jpYE0AUZ5Di+
 bkMBlFLZIJFfj8JHVjgUJX2NpHEyQWA5HhYvGkACkYohDiPMU6uOgk89gZH/xe6In6Y0
 4RrcZ4EbNMaeqefHT3SPi1zDGUh7TXDkQu4vkrWCzfAOiZoDhTvwddbHu9IuPi5CW1/O
 PxAY1ivW8g/UkBsGHoODfmGa1FU77mcke2uJIVkJKFGBEZdQd60h+9t5O1RAsgAhEe9r
 y5n0Gwp1ExUBQSdGUnEDVZEFnVjJNTRzKmk3i++Wt7JGcn3nBbVz8FuWqEOFflxZ/PYy
 VYUw==
X-Gm-Message-State: AOAM5322A1iD3ko/f6/IRUYqzg9bx5pwi3Jib7BUg0e/XGsAm4I7+Qk3
 XwzakDiXc3zK0gSBiC/UIKek2AqTAmbzg/M6dS9dYW/kKy8=
X-Google-Smtp-Source: ABdhPJyRn7wR69jFrn3TO6H9UUfVZCC1xqqr7AQQ80rZynHNdN1LNEZ5cYMHVefn+IVfYCaKEXShdyfwlB5oUFCl3W0=
X-Received: by 2002:aca:c182:0:b0:2ef:8fd4:7523 with SMTP id
 r124-20020acac182000000b002ef8fd47523mr2117864oif.148.1649184735982; Tue, 05
 Apr 2022 11:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220405163540.9277-1-fontaine.fabrice@gmail.com>
 <f9f85a6c-9c40-a36d-faaa-9b86dcbc02ed@mind.be>
In-Reply-To: <f9f85a6c-9c40-a36d-faaa-9b86dcbc02ed@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 5 Apr 2022 20:50:28 +0200
Message-ID: <CAPi7W80yZee_5ZwcxXOHFreV6Z8k8QyzThD_dL-WxC94G97NnA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/libkcapi: fix build with
 BR2_OPTIMIZE_0
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiA1IGF2ci4gMjAyMiDDoCAxOToyOCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91
dEBtaW5kLmJlPiBhIMOpY3JpdCA6Cj4KPgo+Cj4gT24gMDUvMDQvMjAyMiAxODozNSwgRmFicmlj
ZSBGb250YWluZSB3cm90ZToKPiA+IE92ZXJyaWRlIENPTU1PTl9DUFBGTEFHUyB0byBmaXggdGhl
IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIHdpdGgKPiA+IEJSMl9PUFRJTUlaRV8wIHJhaXNlZCBz
aW5jZSBidW1wIHRvIHZlcnNpb24gMC4xNC4wIGluIGNvbW1pdAo+ID4gY2Q3MDdhOTExMmUzOGI0
Y2U5ODMyNmI5NmMwZWQxMjA1NGNhMWNjYSBhbmQKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9zbXVl
bGxlckREL2xpYmtjYXBpL2NvbW1pdC8wZTdiMmIwMzAwNzgyYWNhMTljMzI0ZjMzNTJmMTA5Nzc3
YjRjNTFhOgo+ID4KPiA+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2UtMTUvb3V0
cHV0LTEvaG9zdC9pNjg2LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9m
ZWF0dXJlcy5oOjQxMjo0OiBlcnJvcjogI3dhcm5pbmcgX0ZPUlRJRllfU09VUkNFIHJlcXVpcmVz
IGNvbXBpbGluZyB3aXRoIG9wdGltaXphdGlvbiAoLU8pIFstV2Vycm9yPWNwcF0KPgo+ICAgSSBo
YXZlbid0IGxvb2tlZCBhdCB0aGUgZGV0YWlscywgYnV0IGluIHRoaXMgY2FzZSBpdCBzZWVtcyB0
byBtZSB0aGUgcHJvcGVyCj4gc29sdXRpb24gaXMgdG8gbWFrZSBzdXJlIF9GT1JUSUZZX1NPVVJD
RSBpcyBub3QgZW5hYmxlZC4KPgo+ICAgQnV0IHBlcmhhcHMgdGhhdCBpcyBleGFjdGx5IHdoYXQg
dGhpcyBwYXRjaCBkb2VzPwoKVGhpcyBwYXRjaCB3YXMgcmVtb3ZpbmcgdGhlIGZvbGxvd2luZyBm
bGFncyAoaW5jbHVkaW5nIC1XZXJyb3IpOgpDT01NT05fQ1BQRkxBR1MgPSAtV2V4dHJhIC1XYWxs
IC1wZWRhbnRpYyAtZndyYXB2IC0tcGFyYW0Kc3NwLWJ1ZmZlci1zaXplPTQgLU8yIC1XZXJyb3Ig
LXN0ZD1nbnU5OSAtV2NvbnZlcnNpb24KCkhvd2V2ZXIsIC1EX0ZPUlRJRllfU09VUkNFPTIgd2Fz
IHN0aWxsIHNldCAoaW4gQ1BQRkxBR1MpCgpJIGNhbiBzZW5kIGEgdjIgdG8gc2V0IENQUEZMQUdT
IHRvICQoVEFSR0VUX0NQUEZMQUdTKSBpZiB5b3UgcHJlZmVyCnRoaXMgc29sdXRpb24uCgo+Cj4g
ICBSZWdhcmRzLAo+ICAgQXJub3V0Cj4KPiA+Cj4gPiBJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCB1
cHN0cmVhbSBhbHJlYWR5IHJlamVjdGVkIGEgUFIgdG8gcmVtb3ZlCj4gPiAtV2Vycm9yOiBodHRw
czovL2dpdGh1Yi5jb20vc211ZWxsZXJERC9saWJrY2FwaS9wdWxsLzEzMgo+ID4KPiA+IEZpeGVz
Ogo+ID4gICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzM1MTQxZWEz
MDQ2ZjVhNDU5M2UwYjI3ZWY5MmU0YWNlNmJjMGJlNjYKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBG
YWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4g
ICBwYWNrYWdlL2xpYmtjYXBpL2xpYmtjYXBpLm1rIHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmtjYXBpL2xp
YmtjYXBpLm1rIGIvcGFja2FnZS9saWJrY2FwaS9saWJrY2FwaS5tawo+ID4gaW5kZXggNzFkZmJk
OWVmZi4uMzUzOTM5YmIzMSAxMDA2NDQKPiA+IC0tLSBhL3BhY2thZ2UvbGlia2NhcGkvbGlia2Nh
cGkubWsKPiA+ICsrKyBiL3BhY2thZ2UvbGlia2NhcGkvbGlia2NhcGkubWsKPiA+IEBAIC0xNSw2
ICsxNSw3IEBAIExJQktDQVBJX0NPTkZfRU5WID0gXAo+ID4gICAgICAgYWNfY3ZfcGF0aF9EQjJQ
REY9IiIgXAo+ID4gICAgICAgYWNfY3ZfcGF0aF9EQjJQUz0iIiBcCj4gPiAgICAgICBhY19jdl9w
YXRoX1hNTFRPPSIiCj4gPiArTElCS0NBUElfTUFLRV9PUFRTID0gQ09NTU9OX0NQUEZMQUdTPSIi
Cj4gPgo+ID4gICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJQktDQVBJX0VOQ0FQUCkseSkKPiA+ICAg
TElCS0NBUElfQ09ORl9PUFRTICs9IC0tZW5hYmxlLWtjYXBpLWVuY2FwcAoKQmVzdCBSZWdhcmRz
LAoKRmFicmljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
