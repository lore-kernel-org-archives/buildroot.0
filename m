Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578D4C433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 09:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B543640139;
	Thu,  6 Jan 2022 09:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YrYVATMrXy3M; Thu,  6 Jan 2022 09:25:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F2EC40242;
	Thu,  6 Jan 2022 09:25:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7D82D1BF868
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7986641632
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 09:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRz3o-r4MpGN for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 09:24:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5C1442864
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 09:24:56 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so3351564wmk.1
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 01:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d6KqpfaVs+mxaDe5xh5Y/VWF3keAKrW1idH9wLvsB/4=;
 b=wvt6FYZDnW7XJlr1izuqgyKyFBp2CLuX5sGSFWwWY+SQAeDLQD621Q0UZcymWd3nCM
 1wRmUm8uT0HyXH5TpYFXml9o6fStidusoe02k9nwWZizH4bhpZdKUyTbp+BcVLAgFnno
 dl7Fwa5Lv0SPJ7qNrz5qb6tZXXmUsTUuqyvjXF7DPj7msxCXklheI8sKFtyfIfd4KGSP
 Xq5rXkelLehoYsORuV/1aRKGEHfXkUAE6V8mJwzDRVj7ZrzdXl/SJndZKM/EKyvn6s4w
 ocwLqhVBZzBxDtvV3nS435cfvGuo3sN0QQRU87z1r5LJNIJwdg6PE0+Dwox7KiBecmHo
 xavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d6KqpfaVs+mxaDe5xh5Y/VWF3keAKrW1idH9wLvsB/4=;
 b=kyOQs3/UIpAy9EX2ZqFoNI8buPrWh4kvubfKNb0nLI36ENlTvnk6jFFa1rPDmJ7gYM
 +BWr9RoaD/EdT85Q23IJR6tPoQtmbf/R7ibU5kKSYcVlr9UJhC7KAMMBxEwE7TgyvnQY
 adC5oPMXEwtrPDT31nAOlQiTEsG1xdYVqzmOMxeqRsjhlEmwzSL2Re6O2FYgxAMqKCkV
 VdAHOurKaszm4X+NG2dUZ7cgM1/FkdbXkN9B3oG7aKSpj/OmK/D8NUm5xS1VxM/ko1hg
 P9D1+vfo1N+SudjeKyG1eIG8/18RHXU4XogrqsV5aJAHx9gJU+2UJQ0jr4c6z9OOeAXG
 u2yQ==
X-Gm-Message-State: AOAM533TMhGECuMh9OHxZ6wgmxgQ7Kv7ee37nRZqQHu6HYNNH1607OFY
 H/dD6iW2QkU3uEgxaXBLzUN+Yw==
X-Google-Smtp-Source: ABdhPJxrC+8eI6y7opBgdWC+ztRfd62dHSobe/PR24ltd9wt9mr6Rjmoo8PkGHjekm1hnWUE1lttvw==
X-Received: by 2002:a05:600c:4e08:: with SMTP id
 b8mr6305210wmq.31.1641461094841; 
 Thu, 06 Jan 2022 01:24:54 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id p21sm1268549wmq.20.2022.01.06.01.24.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 01:24:54 -0800 (PST)
Message-ID: <faf7a836-82a1-04b9-89de-d9a7825df776@smile.fr>
Date: Thu, 6 Jan 2022 10:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: marc.chalain@mailoo.org, buildroot@buildroot.org
References: <ea-mime-61d5bfe1-7547-225ebd37@www-7.net-c.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ea-mime-61d5bfe1-7547-225ebd37@www-7.net-c.com>
Subject: Re: [Buildroot] package/aravis: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Marc Chalain <marc.chalain@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFyYywKCkxlIDA1LzAxLzIwMjIgw6AgMTY6NTcsIG1hcmMuY2hhbGFpbkBtYWlsb28u
b3JnIGEgw6ljcml0wqA6Cj4gSGVsbG8gYW5kIEhhcHB5IG5ldyB5ZWFyLAo+IAo+IAo+IAo+IEkg
cHJvcG9zZSB0aGUgaW50ZWdyYXRpb24gb2YgYSBjYW1lcmEgY2FwdHVyZSBsaWJyYXJ5Ogo+IAo+
IAo+IAo+IEFyYXZpcyBpcyBhIGxpYnJhcnkgdG8gaGVscCBHaWdFIGNhbWVyYSBjYXB0dXJlLgo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9BcmF2aXNQcm9qZWN0L2FyYXZpcy9yZWxlYXNlcy90YWcvMC44
LjE2Cj4gVGhpcyBydWxlcyBpbnN0YWxsIG9uIHRhcmdldDoKPiDCoGxpYmFyYXZpcwo+IMKgYXJ2
LWNhbWVyYS10ZXN0Cj4gwqBhcnYtZmFrZS1ndi1jYW1lcmEKPiDCoGFydi10ZXN0Cj4gwqBhcnYt
dG9vbAo+IGFuZCBvbiBzdGFnaW5nCj4gwqBhcmF2aXMvKi5oCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWFyYyBDaGFsYWluIDxtYXJjLmNoYWxhaW5AZ21haWwuY29tPgo+IC0tLQo+IMKgREVWRUxPUEVS
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrKwo+IMKgcGFja2FnZS9D
b25maWcuaW7CoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+IMKgcGFja2FnZS9hcmF2aXMvQ29u
ZmlnLmluwqDCoCB8IDE2ICsrKysrKysrKysrKysrKysKPiDCoHBhY2thZ2UvYXJhdmlzL2FyYXZp
cy5oYXNoIHzCoCAxICsKPiDCoHBhY2thZ2UvYXJhdmlzL2FyYXZpcy5ta8KgwqAgfCAyMCArKysr
KysrKysrKysrKysrKysrKwo+IMKgNSBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9hcmF2aXMvQ29uZmlnLmluCj4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9hcmF2aXMvYXJhdmlzLmhhc2gKPiDCoGNyZWF0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL2FyYXZpcy9hcmF2aXMubWsKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMKPiBpbmRleCA2ZGMyZTY4ZTQyLi4wNWMxYzNjOTIxIDEwMDY0NAo+IC0t
LSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTE2NTMsNiArMTY1Myw5IEBA
IE46wqDCoMKgIE1hbnVlbCBWw7ZnZWxlIDxkZXZlbG9wQG1hbnVlbC12b2VnZWxlLmRlPgo+IMKg
RjrCoMKgwqAgcGFja2FnZS9weXRob24tcHlxdDUvCj4gwqBGOsKgwqDCoCBwYWNrYWdlL3B5dGhv
bi1yZXF1ZXN0cy10b29sYmVsdC8KPiDCoAo+ICtOOsKgwqDCoCBNYXJjIENoYWxhaW4gPG1hcmMu
Y2hhbGFpbkBnbWFpbC5jb20+Cj4gK0Y6wqDCoMKgIHBhY2thZ2UvYXJhdmlzCgpNaXNzaW5nICcv
JyBhdCB0aGUgZW5kIG9mIHRoZSBsaW5lCgo+ICsKPiDCoE46wqDCoMKgIE1hcmNpbiBCaXMgPG1h
cmNpbkBiaXMub3JnLnBsPgo+IMKgRjrCoMKgwqAgcGFja2FnZS9ibHVlejVfdXRpbHMvCj4gwqBG
OsKgwqDCoCBwYWNrYWdlL2NjLXRvb2wvCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmlu
IGIvcGFja2FnZS9Db25maWcuaW4KPiBpbmRleCA5ZmVkMGFiNGNiLi4yYTE3ODFhZmU5IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBA
QCAtMTY5OCw2ICsxNjk4LDcgQEAgbWVudSAiTG9nZ2luZyIKPiDCoGVuZG1lbnUKPiDCoAo+IMKg
bWVudSAiTXVsdGltZWRpYSIKPiArwqDCoMKgIHNvdXJjZSAicGFja2FnZS9hcmF2aXMvQ29uZmln
LmluIgoKUHJvYmFibHkgbW9yZSByZWxhdGVkIHRvICJIYXJkd2FyZSBIYW5kbGluZyIgc2luY2Ug
aXQgc3VwcG9ydCBjYW1lcmEgZGV2aWNlcy4KCj4gwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL2Jp
dHN0cmVhbS9Db25maWcuaW4iCj4gwqDCoMKgwqAgc291cmNlICJwYWNrYWdlL2RhdjFkL0NvbmZp
Zy5pbiIKPiDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2Uva3ZhemFhci9Db25maWcuaW4iCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvYXJhdmlzL0NvbmZpZy5pbiBiL3BhY2thZ2UvYXJhdmlzL0NvbmZp
Zy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMDJjNzFjNDRk
YQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2FyYXZpcy9Db25maWcuaW4KPiBAQCAt
MCwwICsxLDE2IEBACj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9BUkFWSVMKPiArwqDCoMKgIGJvb2wg
ImFyYXZpcyAtIEdpZ0UgQ2FtZXJhIgo+ICvCoMKgwqAgZGVwZW5kcyBvbiBCUjJfVVNFX1dDSEFS
Cj4gK8KgwqDCoCBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTAo+ICvC
oMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9QQ1JFXzE2Cj4gK8KgwqDCoCBkZXBlbmRzIG9u
IEJSMl9QQUNLQUdFX1BDUkVfMzIKPiArwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9MSUJHTElC
Mgo+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX0xJQlhNTDIKPiArwqDCoMKgIGhlbHAKPiAr
wqDCoMKgIMKgIGFyYXZpcyBwcm92aWRlcyB0aGUgc3VwcG9ydCBvZiBHaWdFIGNhbWVyYQo+ICvC
oMKgwqAgwqAgYW5kIFVTQjNWaXNpb24gY2FtZXJhLgoKQWRkIGFuIGVtcHR5IGxpbmUKCkFsc28g
dXNlIGNoZWNrLXBhY2thZ2Ugc2NyaXB0IHRvIGNoZWNrIHRoZSBjb2Rpbmcgc3R5bGUuCgo+ICvC
oMKgwqAgwqAgaHR0cHM6Ly9naXRodWIuY29tL0FyYXZpc1Byb2plY3QvYXJhdmlzCj4gKwo+ICtj
b21tZW50ICJhcmF2aXMgbmVlZHMgYSB0b29sY2hhaW4gdy8gd2NoYXIsIE5QVEwsIFBDUkUgMTYv
MzIiCj4gK8KgwqDCoCBkZXBlbmRzIG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlO
X0hBU19USFJFQURTX05QVEwgfHwgXAo+ICvCoMKgwqAgIUJSMl9QQUNLQUdFX1BDUkVfMTYgfHwg
IUJSMl9QQUNLQUdFX1BDUkVfMzIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hcmF2aXMvYXJhdmlz
Lmhhc2ggYi9wYWNrYWdlL2FyYXZpcy9hcmF2aXMuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uZjg1MTI0OTFlYwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL2FyYXZpcy9hcmF2aXMuaGFzaAo+IEBAIC0wLDAgKzEgQEAKPiArc2hhMjU2IDA1NzE2
Njc1MzQ0M2FjYzExNTI1OWNhMWY3NGJkMWIyOGVkNGQ0OGYzNTI2MWNiMjQ4ZWFmYjhmODY2NjRi
YzcgYXJhdmlzLTAuOC4xNi50YXIuZ3oKCkFkZCB0aGUgbGljZW5zZSBmaWxlIGhhc2ggaGVyZSAo
Q09QWUlORykKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYXJhdmlzL2FyYXZpcy5tayBiL3BhY2th
Z2UvYXJhdmlzL2FyYXZpcy5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMC4uYmQ3ODNhMDM3NAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2FyYXZpcy9h
cmF2aXMubWsKPiBAQCAtMCwwICsxLDIwIEBACj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
KyMKPiArIyBhcmF2aXMKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArQVJB
VklTX1ZFUlNJT04gPSAwLjguMTYKCkFyYXZpcyBwcm9qZWN0IGlzIG1vdmluZyBmYXN0LCB0aGVy
ZSBpcyBhIG5ldyB2ZXJzaW9uIDAuOC4yMCBhbHJlYWR5LgpJJ20gZmluZSB3aXRoIHRoaXMgdmVy
c2lvbiBzaW5jZSBpdCB3YXMgcmVsZWFzZWQgcmVjZW50bHk6Cmh0dHBzOi8vZ2l0aHViLmNvbS9B
cmF2aXNQcm9qZWN0L2FyYXZpcy9yZWxlYXNlcy90YWcvMC44LjE2Cgo+ICtBUkFWSVNfU0lURSA9
ICQoY2FsbCBnaXRodWIsQXJhdmlzUHJvamVjdCxhcmF2aXMsJChBUkFWSVNfVkVSU0lPTikpCj4g
K0FSQVZJU19ERVBFTkRFTkNJRVMgPSBcCj4gK8KgwqDCoCBob3N0LXBrZ2NvbmYgXAo+ICvCoMKg
wqAgbGliZ2xpYjIgXAo+ICvCoMKgwqAgbGlieG1sMgoKVGhlcmUgaXMgYSBsaXN0IG9mIGRlcGVu
ZGVuY2llcyBpbiB0aGUgUmVhZG1lOgoKaHR0cHM6Ly9naXRodWIuY29tL0FyYXZpc1Byb2plY3Qv
YXJhdmlzL2Jsb2IvbWFpbi9SRUFETUUubWQjaW5zdGFsbC1kZXBlbmRlbmNpZXMtb24tdWJ1bnR1
LTIwMDQKCmVzcGVjaWFsbHkgZ3N0cmVhbWVyIGFuZCBwbHVnaW5zIGV0Yy4uCgo+ICtBUkFWSVNf
SU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gK0FSQVZJU19MSUNFTlNFID0gTEdQTC0yCgpJdCdzIGEg
TEdQTC0yLjEgbGljZW5zZS4KCj4gK0FSQVZJU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ICtB
UkFWSVNfTERGTEFHUyA9ICQoVEFSR0VUX0xERkxBR1MpICQoVEFSR0VUX05MU19MSUJTKQoKSXMg
Z2V0dGV4dCBhIG1hbmRhdG9yeSBkZXBlbmRlbmN5ID8KQXQgbGVhc3QgZ2V0dGV4dCBzaG91bGQg
YmUgaW4gQVJBVklTX0RFUEVOREVOQ0lFUyB3aGVuIE5MUyBzdXBwb3J0IGlzIGVuYWJsZWQuCgpJ
IHJlY29tbWVuZCB0byB1c2UgdGVzdC1wa2cgc2NyaXB0IHRvIHN0cmVzcyB0aGUgYnVpbGRzeXN0
ZW0uClRoYW5rcyB0byBhIHJlY2VudCBjaGFuZ2UsIHlvdSBjYW4gdGVzdCB5b3VyIHBhY2thZ2Ug
d2l0aCB0ZXN0LXBrZyBpbiBnaXRsYWItY2k6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMTJjN2EwNWRhMTU0ZjIwNTZkMGEyYTFhNzJmNWQwNjZi
OGQ3Yjg3ZQoKQ2FuIHlvdSBzZW5kIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB5b3VyIHBhdGNoPwoK
QmVzdCByZWdhcmRzLApSb21haW4KCj4gKwo+ICtBUkFWSVNfQ09ORl9PUFRTICs9IC1EZG9jdW1l
bnRhdGlvbj1kaXNhYmxlZAo+ICsKPiArJChldmFsICQobWVzb24tcGFja2FnZSkpCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJv
b3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
