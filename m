Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D4C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0EA461002;
	Tue, 22 Apr 2025 19:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OALGu9s1fuuL; Tue, 22 Apr 2025 19:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB63760FE0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB63760FE0;
	Tue, 22 Apr 2025 19:14:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92E101BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65E12810BE
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:14:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1g9iFVMOnW6u for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6A4E680CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A4E680CDC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A4E680CDC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3C9C11C0E3A; Tue, 22 Apr 2025 21:14:28 +0200 (CEST)
Message-ID: <fb3b5067-a6e4-4fdf-bf77-3088cf8a4182@rnout.be>
Date: Tue, 22 Apr 2025 21:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250328162509.923423-1-peter@korsgaard.com>
Content-Language: en-GB
In-Reply-To: <20250328162509.923423-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1745349268; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IxyX7dx2bBAXuVhcyakTellHO5a5wdy21lhMqg8HYeE=;
 b=hejil/ggpDEFPWvEXi3XFwEUh6/kxBNLllCiabg2q2IA3dsNcEYv7HB+cJDwSU0g9eGiYY
 5izH+23ermKe8gwqGE56XbHA7z/F2NSR9R91zQY9gJt2WTBxKySXoKOUM4HTJqkOG2cwmX
 i1DFIOvxCdvrIQvKjMte/dMt4KPSvTthky/mpcwyYCO2W96iisue5CLH1kBwHdybVVj3qZ
 3hNVD65lkV+OT0TIALnBSnCwcZKCxex5QVjOracWAB9lv08SPbt3gfMH618BxGWeAAMUi0
 ifvywnkAv2uy9MXhRorK+oqghJLNw/khLGi5nrcvtDvCJo+05X/xTUXozDdD2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH] package/libopenh264: security bump to
 version 2.5.1
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI4LzAzLzIwMjUgMTc6MjUsIFBldGVyIEtvcnNnYWFyZCB3cm90ZToKPiBGaXhlcyB0aGUg
Zm9sbG93aW5nIHNlY3VyaXR5IGlzc3VlOgo+Cj4gQ1ZFLTIwMjUtMjcwOTE6IE9wZW5IMjY0IERl
Y29kaW5nIEZ1bmN0aW9ucyBIZWFwIE92ZXJmbG93IFZ1bG5lcmFiaWxpdHkKPgo+IEEgdnVsbmVy
YWJpbGl0eSBpbiB0aGUgZGVjb2RpbmcgZnVuY3Rpb25zIG9mIE9wZW5IMjY0IGNvZGVjIGxpYnJh
cnkgY291bGQKPiBhbGxvdyBhIHJlbW90ZSwgdW5hdXRoZW50aWNhdGVkIGF0dGFja2VyIHRvIHRy
aWdnZXIgYSBoZWFwIG92ZXJmbG93Lgo+Cj4gVGhpcyB2dWxuZXJhYmlsaXR5IGlzIGR1ZSB0byBh
IHJhY2UgY29uZGl0aW9uIGJldHdlZW4gYSBTZXF1ZW5jZSBQYXJhbWV0ZXIKPiBTZXQgKFNQUykg
bWVtb3J5IGFsbG9jYXRpb24gYW5kIGEgc3Vic2VxdWVudCBub24gSW5zdGFudGFuZW91cyBEZWNv
ZGVyCj4gUmVmcmVzaCAobm9uLUlEUikgTmV0d29yayBBYnN0cmFjdGlvbiBMYXllciAoTkFMKSB1
bml0IG1lbW9yeSB1c2FnZS4gIEFuCj4gYXR0YWNrZXIgY291bGQgZXhwbG9pdCB0aGlzIHZ1bG5l
cmFiaWxpdHkgYnkgY3JhZnRpbmcgYSBtYWxpY2lvdXMgYml0c3RyZWFtCj4gYW5kIHRyaWNraW5n
IGEgdmljdGltIHVzZXIgaW50byBwcm9jZXNzaW5nIGFuIGFyYml0cmFyeSB2aWRlbyBjb250YWlu
aW5nIHRoZQo+IG1hbGljaW91cyBiaXRzdHJlYW0uICBBbiBleHBsb2l0IGNvdWxkIGFsbG93IHRo
ZSBhdHRhY2tlciB0byBjYXVzZSBhbgo+IHVuZXhwZWN0ZWQgY3Jhc2ggaW4gdGhlIHZpY3RpbSdz
IHVzZXIgZGVjb2RpbmcgY2xpZW50IGFuZCwgcG9zc2libHksIHBlcmZvcm0KPiBhcmJpdHJhcnkg
Y29tbWFuZHMgb24gdGhlIHZpY3RpbSdzIGhvc3QgYnkgYWJ1c2luZyB0aGUgaGVhcCBvdmVyZmxv
dy4KPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9jaXNjby9vcGVuaDI2NC9zZWN1cml0eS9hZHZpc29y
aWVzL0dIU0EtbTk5cS01ajd4LTdtOXgKPiBodHRwczovL2dpdGh1Yi5jb20vY2lzY28vb3Blbmgy
NjQvcmVsZWFzZXMvdGFnLzIuNS4xCj4KPiBUaGUgdXBzdHJlYW0gdGFnIG5vdyBoYXMgbm8gJ3Yn
IHByZWZpeCwgc28gZHJvcCBpdCBmcm9tIF9TSVRFLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPgoKIMKgQXBwbGllZCB0byAyMDI1LjAyLngs
IDIwMjQuMTEueCBhbmQgMjAyNC4wMi54LCB0aGFua3MuCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0
Cgo+IC0tLQo+ICAgcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5oYXNoIHwgMiArLQo+
ICAgcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tayAgIHwgNCArKy0tCj4gICAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2xpYm9wZW5oMjY0L2xpYm9wZW5oMjY0Lmhhc2ggYi9wYWNrYWdlL2xpYm9w
ZW5oMjY0L2xpYm9wZW5oMjY0Lmhhc2gKPiBpbmRleCA2ZWI3OGUyMDA5Li4yMzBiMzNjNTdkIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQuaGFzaAo+ICsrKyBi
L3BhY2thZ2UvbGlib3BlbmgyNjQvbGlib3BlbmgyNjQuaGFzaAo+IEBAIC0xLDMgKzEsMyBAQAo+
ICAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICA4ZmZiZTk0NGU3NDA0M2QwZDNmYjUz
ZDRhMmExNGM5NGRlNzFmNThkYmVhNmEwNmQwZGM5MjM2OTU0Mjk1OGVhICBsaWJvcGVuaDI2NC0y
LjQuMS50YXIuZ3oKPiArc2hhMjU2ICBhMWI1Yzg4YmZiMzFjNGQyMjUxODM1ZTU3YTdkZjk5Zjkx
MTgxOTU1Y2VhNmVjM2RkZDRhYjgyYWE1NGFlOWYxICBsaWJvcGVuaDI2NC0yLjUuMS50YXIuZ3oK
PiAgIHNoYTI1NiAgZGQ1YzFjOTY2ODUxMjUzMGZhNWE5NmU0YzI5YWM0MDMzZDcwYTdlZWIwZWVk
N2E0MmZkZGI2ZGQ3OTRlYmRiYiAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm9w
ZW5oMjY0L2xpYm9wZW5oMjY0Lm1rIGIvcGFja2FnZS9saWJvcGVuaDI2NC9saWJvcGVuaDI2NC5t
awo+IGluZGV4IGUzNzFlNGNkYzAuLmY5YTUwZTRjNjEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
aWJvcGVuaDI2NC9saWJvcGVuaDI2NC5tawo+ICsrKyBiL3BhY2thZ2UvbGlib3BlbmgyNjQvbGli
b3BlbmgyNjQubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCj4gICAKPiAtTElCT1BFTkgyNjRfVkVSU0lPTiA9IDIuNC4xCj4gLUxJQk9QRU5IMjY0
X1NJVEUgPSAkKGNhbGwgZ2l0aHViLGNpc2NvLG9wZW5oMjY0LHYkKExJQk9QRU5IMjY0X1ZFUlNJ
T04pKQo+ICtMSUJPUEVOSDI2NF9WRVJTSU9OID0gMi41LjEKPiArTElCT1BFTkgyNjRfU0lURSA9
ICQoY2FsbCBnaXRodWIsY2lzY28sb3BlbmgyNjQsJChMSUJPUEVOSDI2NF9WRVJTSU9OKSkKPiAg
IExJQk9QRU5IMjY0X0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UKPiAgIExJQk9QRU5IMjY0X0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFCj4gICBMSUJPUEVOSDI2NF9DUEVfSURfVkVORE9SID0gY2lzY28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
