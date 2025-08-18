Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88761CA0ED1
	for <buildroot@archiver.kernel.org>; Mon, 18 Aug 2025 05:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4527F40D38;
	Mon, 18 Aug 2025 05:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XGHaP_3m56a; Mon, 18 Aug 2025 05:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8991040F64
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8991040F64;
	Mon, 18 Aug 2025 05:42:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C0EF975
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 05:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB3E041213
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 05:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KAFERJIlDswU for <buildroot@buildroot.org>;
 Mon, 18 Aug 2025 05:42:48 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Aug 2025 05:42:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3AD140D38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3AD140D38
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.248.49.38;
 helo=mx.socionext.com; envelope-from=hayashi.kunihiko@socionext.com;
 receiver=<UNKNOWN> 
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3AD140D38
 for <buildroot@buildroot.org>; Mon, 18 Aug 2025 05:42:46 +0000 (UTC)
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
 by mx.socionext.com with ESMTP; 18 Aug 2025 14:35:32 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
 by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id C675B2091489;
 Mon, 18 Aug 2025 14:35:32 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with
 ESMTP; Mon, 18 Aug 2025 14:35:32 +0900
Received: from [10.213.136.211] (unknown [10.213.136.211])
 by iyokan3.css.socionext.com (Postfix) with ESMTP id 47F7D10A014;
 Mon, 18 Aug 2025 14:35:32 +0900 (JST)
Message-ID: <a157bd56-9c4a-4598-9299-d1bbb1fa4e46@socionext.com>
Date: Mon, 18 Aug 2025 14:35:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>
References: <20250724102514.2188530-1-hayashi.kunihiko@socionext.com>
 <7eae7b05-02e6-4b55-80e9-25742a17a113@smile.fr>
Content-Language: en-US
Cc: buildroot@buildroot.org
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <7eae7b05-02e6-4b55-80e9-25742a17a113@smile.fr>
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=socionext.com
Subject: Re: [Buildroot] [PATCH] package/qemu: add zstd support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKVGhhbmsgeW91IGZvciByZXZpZXdpbmcuCgpPbiAyMDI1LzA4LzEwIDI6MTQs
IFJvbWFpbiBOYW91ciB3cm90ZToKPiBIZWxsbyBLdW5paGlrbywKPiAKPiBMZSAyNC8wNy8yMDI1
IMOgIDEyOjI1LCBLdW5paGlrbyBIYXlhc2hpIGEgw6ljcml0IDoKPj4gQWRkIG9wdGlvbmFsIHpz
dGQgY29tcHJlc3Npb24gdHlwZSBzdXBwb3J0IGZvciBRRU1VLgo+Pgo+PiBJbiBvcmRlciB0byBh
IGZpbGUgY29tcHJlc3NlZCB3aXRoIHpzdGQgb24gaG9zdCB0byBiZSBhcHBsaWVkIHRvCj4+IHRh
cmdldCBRRU1VLCB6c3RkIG9uIGJvdGggaG9zdCBhbmQgdGFyZ2V0IHNob3VsZCBiZSBlbmFibGVk
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLdW5paGlrbyBIYXlhc2hpIDxoYXlhc2hpLmt1bmloaWtv
QHNvY2lvbmV4dC5jb20+Cj4+IC0tLQo+PiAgIHBhY2thZ2UvcWVtdS9xZW11Lm1rIHwgMTQgKysr
KysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11L3FlbXUubWsgYi9wYWNrYWdlL3FlbXUvcWVtdS5tawo+
PiBpbmRleCBmZGM4NTkxZTU0NmEuLmExYTRiNjA4NTVkNyAxMDA2NDQKPj4gLS0tIGEvcGFja2Fn
ZS9xZW11L3FlbXUubWsKPj4gKysrIGIvcGFja2FnZS9xZW11L3FlbXUubWsKPj4gQEAgLTI3MSw2
ICsyNzEsMTMgQEAgZWxzZQo+PiAgIFFFTVVfT1BUUyArPSAtLWRpc2FibGUtaW5zdGFsbC1ibG9i
cwo+PiAgIGVuZGlmCj4+Cj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1pTVEQpLHkpCj4+ICtRRU1V
X09QVFMgKz0gLS1lbmFibGUtenN0ZAo+PiArUUVNVV9ERVBFTkRFTkNJRVMgKz0genN0ZAo+PiAr
ZWxzZQo+PiArUUVNVV9PUFRTICs9IC0tZGlzYWJsZS16c3RkCj4+ICtlbmRpZgo+PiArCj4+ICAg
IyBPdmVycmlkZSBDUFAsIGFzIGl0IGV4cGVjdHMgdG8gYmUgYWJsZSB0byBjYWxsIGl0IGxpa2Ug
aXQnZAo+PiAgICMgY2FsbCB0aGUgY29tcGlsZXIuCj4+ICAgZGVmaW5lIFFFTVVfQ09ORklHVVJF
X0NNRFMKPj4gQEAgLTQ2MCw2ICs0NjcsMTMgQEAgZWxzZQo+PiAgIEhPU1RfUUVNVV9PUFRTICs9
IC0tZGlzYWJsZS1saWJ1c2IKPj4gICBlbmRpZgo+Pgo+PiAraWZlcSAoJChCUjJfUEFDS0FHRV9I
T1NUX1pTVEQpLHkpCj4+ICtIT1NUX1FFTVVfT1BUUyArPSAtLWVuYWJsZS16c3RkCj4+ICtIT1NU
X1FFTVVfREVQRU5ERU5DSUVTICs9IGhvc3QtenN0ZAo+PiArZWxzZQo+PiArSE9TVF9RRU1VX09Q
VFMgKz0gLS1kaXNhYmxlLXpzdGQKPj4gK2VuZGlmCj4gCj4gSSdtIHdvbmRlcmluZyBpZiBpdCdz
IHJlYWxseSBuZWNlc3NhcnkgdG8gbWFrZSB6c3RkIHN1cHBvcnQgb3B0aW9uYWwgZm9yIHRoZQo+
IGhvc3QgdmFyaWFudC4gQnV0IHNpbmNlIEJSMl9QQUNLQUdFX0hPU1RfWlNURCBleGlzdCwgaXQn
cyBvayBhcyBpcy4KCkkgdGhpbmsgdGhlIGhvc3QgdmFyaWFudCByZXF1aXJlcyB0aGF0IHFlbXUt
aW1nIG9uIHRoZSBob3N0IGNyZWF0aW5nIHRoZSBpbWFnZQpzdXBwb3J0cyB6c3RkLgoKVGhhbmsg
eW91LAoKLS0tCkJlc3QgUmVnYXJkcwpLdW5paGlrbyBIYXlhc2hpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
