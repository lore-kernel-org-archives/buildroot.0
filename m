Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F144CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 23:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 784D080E20;
	Wed,  8 Dec 2021 23:23:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tzVWY2qP6anz; Wed,  8 Dec 2021 23:23:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF8F480DE3;
	Wed,  8 Dec 2021 23:23:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60F1B1BF3E1
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 23:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DFB640140
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 23:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jD8EWjagPIC for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 23:23:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1B0A400FC
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 23:23:47 +0000 (UTC)
Received: from [192.168.50.18] ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v6HpmQ0Xgq3qKv6Hpm2lUs; Thu, 09 Dec 2021 00:23:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639005825; bh=xm3I0HeqpPLAvro2XdTZhz+ZpdLpsDPDrEa20CrqFw8=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=bDEOiLABJnrOF5yjbJ6bf7mE/Xvck+5fpDE0ZmmiCxTJYR1s44nNwg1hoxBhdrjWu
 ZiWyV2t6rSP3MoSKbXg67g3pNWV9ZG0zephh0Wi8cmHrCO3SN5MlhS+CfFZRe781r8
 Xl8PArnjRRel4HpcyH5taOElnHIysbbuUZGQCqle2bwJmHK3Wv/qFsZhQYjLFsCWu9
 e96+xUiLNLdVmmOGZu3Y+5puDZkrfLLdcbFrSI4ncDW1c9jZrtQRPPp9nOMLkvFq9G
 c5Hi3TlswGPJ2gMZxsZ9WwIxJ03CQi+WZYk2kCifKMRyPJKqlC+FOyjllvWBU9vRNh
 /IsRri4/JAK3A==
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
References: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <43244970-b07e-a1b0-9bcd-54c00806717e@benettiengineering.com>
Date: Thu, 9 Dec 2021 00:23:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211208232148.3694208-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfHVC7yfy3D+/BmNLuXHCQ5YOI28ezWAob9BrB5/rN7G7dRtME9Op5c9N1Y8Mwv1L61ZXffmiW4tbGaVBrml6EzmpqB7WYLYb6zYX5wJB75E6hArgipEf
 pepf2cPmNV2q6Bp6EkDjkndgLUI2hTza6TQExZ5zbqRHCcB1MuE1dXuceYilE+Oh7M5eTsVNJgCnsp2nFmJqAYusMbOlHWPEU9o6Rn0g5O0vrrVT6GI5HfLg
 Qd7tzJIaWfTSDp5ZY6a7Hg==
Subject: Re: [Buildroot] [PATCH] package/postgis: re-enable Microblaze
 architecture
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDkvMTIvMjEgMDA6MjEsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IFdoaWxlIGFkZGluZyB0
aGlzIHBhY2thZ2Ugd2l0aCBjb21taXRbMV0gTWljcm9ibGF6ZSBhcmNoaXRlY3R1cmUgaGFzIGJl
ZW4KPiBkaXNhYmxlZCBieSBkZWZhdWx0IHBvaW50aW5nIHRoYXQgaXQgc3VmZmVycyBmcm9tIGdj
YyBJQ0UsIGJ1dCB0aGlzIGlzIG5vdAo+IHRydWUsIGluZGVlZCB0aGUgYnVpbGQgZXJyb3IgaXMg
cmVmZXJyZWQgdG8gbGliZ2VvcyB0aGF0IGlzIHBvc3RnaXMKPiBkZXBlbmRlbmN5Ogo+IGBgYAo+
ICAgIGR1cmluZyBSVEwgcGFzczogcmVsb2FkCj4gICAgLi4uL2Jvb3RsaW4tbWljcm9ibGF6ZWVs
LXVjbGliYy9idWlsZC9saWJnZW9zLTMuOS4wL3NyYy9nZW9tL3V0aWwvRGVuc2lmaWVyLmNwcDog
SW4gc3RhdGljIG1lbWJlciBmdW5jdGlvbiDigJhzdGF0aWMgc3RkOjp1bmlxdWVfcHRyPHN0ZDo6
dmVjdG9yPGdlb3M6Omdlb206OkNvb3JkaW5hdGU+ID4gZ2Vvczo6Z2VvbTo6dXRpbDo6RGVuc2lm
aWVyOjpkZW5zaWZ5UG9pbnRzKGdlb3M6Omdlb206OkNvb3JkaW5hdGU6OlZlY3QsIGRvdWJsZSwg
Y29uc3QgZ2Vvczo6Z2VvbTo6UHJlY2lzaW9uTW9kZWwqKeKAmToKPiAgICAuLi4vYm9vdGxpbi1t
aWNyb2JsYXplZWwtdWNsaWJjL2J1aWxkL2xpYmdlb3MtMy45LjAvc3JjL2dlb20vdXRpbC9EZW5z
aWZpZXIuY3BwOjEyODoxOiBpbnRlcm5hbCBjb21waWxlciBlcnJvcjogaW4gZ2VuX3JlZ19ydHgs
IGF0IGVtaXQtcnRsLmM6MTE1NQo+ICAgIDEyOCB8IH0KPiAgICAgICAgfCBeCj4gYGBgCj4gCj4g
VGhpcyBidWlsZCBlcnJvciBoYXMgYmVlbiB3b3JrZWQgYXJvdW5kIHdpdGggdGhpcyBjb21taXRb
Ml0gYW5kIEkndmUganVzdAo+IHRlc3RlZCB0aGlzIGJ1aWxkIHdpdGggTWljcm9ibGF6ZSBnY2Mg
OS4zLzkuNC8xMC4zIGFuZCAxMS4yIGFuZCBpdCBidWlsZHMKPiBzdWNjZXNmdWxseSBzaW5jZSB0
aGUgYnVnIGFib3ZlIGlzIGdjYyBidWcgOTA2MjBbM10gYW5kIGl0J3MgYmVlbiBoYW5kbGVkCj4g
aW4gbGliZ2VvcyBhbHJlYWR5Lgo+IAo+IFNvIGxldCdzIGFsbG93IE1pY3JvYmxhemUoZWwvYmUp
IHRvIGJ1aWxkIHRoaXMgcG9zdGdpcy4KPiAKPiBbMV06IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5u
ZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9OWJiMTAzNDQ1NWRlMjk5ODc2ZGZkMDNjNTA3NGQ4YmI5
NjIyZjg3MzliYjEwMzQ0NTVkZTI5OTg3NmRmZDAzYzUwNzRkOGJiOTYyMmY4NzMKClsxXSBpczoK
aHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD05YmIxMDM0NDU1
ZGUyOTk4NzZkZmQwM2M1MDc0ZDhiYjk2MjJmODczCgpzb3JyeSBmb3IgdGhlIG5vaXNlLgoKQmVz
dCByZWdhcmRzCi0tIApHaXVsaW8gQmVuZXR0aQpCZW5ldHRpIEVuZ2luZWVyaW5nIHNhcwoKPiBb
Ml06IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ODQ3YjQ0
MWIxY2EyMjMwYzRmMjZhNDlhYWVkZTY5ZWNhNWU3ZTdhZAo+IFszXTogaHR0cHM6Ly9nY2MuZ251
Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTA2MjAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBH
aXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPiAt
LS0KPiAgIHBhY2thZ2UvcG9zdGdpcy9Db25maWcuaW4gfCAyIC0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wb3N0Z2lzL0NvbmZp
Zy5pbiBiL3BhY2thZ2UvcG9zdGdpcy9Db25maWcuaW4KPiBpbmRleCBkMzgxYTRiYWY5Li40MDVj
NWM3MjNhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcG9zdGdpcy9Db25maWcuaW4KPiArKysgYi9w
YWNrYWdlL3Bvc3RnaXMvQ29uZmlnLmluCj4gQEAgLTEsNyArMSw2IEBACj4gICBjb25maWcgQlIy
X1BBQ0tBR0VfUE9TVEdJUwo+ICAgCWJvb2wgInBvc3RnaXMiCj4gICAJZGVwZW5kcyBvbiBCUjJf
UEFDS0FHRV9QT1NUR1JFU1FMX0ZVTEwKPiAtCWRlcGVuZHMgb24gIUJSMl9taWNyb2JsYXplZWwg
JiYgIUJSMl9taWNyb2JsYXplYmUgIyBJQ0UKPiAgIAlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJ
QlNURENQUCAjIGxpYmdlb3MsIHByb2oKPiAgIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0ND
X0FUX0xFQVNUXzRfNyAjIEMrKzExLCBwcm9qCj4gICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlO
X0hBU19USFJFQURTICMgbGliZ2VvcywgcHJvago+IEBAIC0yMCw3ICsxOSw2IEBAIGNvbmZpZyBC
UjJfUEFDS0FHRV9QT1NUR0lTCj4gICAJICBodHRwczovL3Bvc3RnaXMubmV0Lwo+ICAgCj4gICBj
b21tZW50ICJwb3N0Z2lzIG5lZWRzIGEgdG9vbGNoYWluIHcvIEMrKywgdGhyZWFkcywgd2NoYXIs
IGdjYyA+PSA0LjcsIG5vdCBiaW51dGlscyBidWcgMjc1OTciCj4gLQlkZXBlbmRzIG9uICFCUjJf
bWljcm9ibGF6ZWVsICYmICFCUjJfbWljcm9ibGF6ZWJlICMgSUNFCj4gICAJZGVwZW5kcyBvbiAh
QlIyX0lOU1RBTExfTElCU1REQ1BQIHx8ICFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80Xzcg
fHwgXAo+ICAgCQkhQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUyB8fCAhQlIyX1VTRV9XQ0hBUiB8
fCBcCj4gICAJCUJSMl9UT09MQ0hBSU5fSEFTX0JJTlVUSUxTX0JVR18yNzU5Nwo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
