Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C428C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 19:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE2F81F18;
	Tue, 22 Apr 2025 19:11:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4L6Nq0uOqX9N; Tue, 22 Apr 2025 19:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0253181F0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0253181F0C;
	Tue, 22 Apr 2025 19:11:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 497E519F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E7E360F42
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3DMkOM9EI4ht for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 19:11:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38AE1600B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38AE1600B3
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38AE1600B3
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 19:11:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 85FB81C0F9B; Tue, 22 Apr 2025 21:11:00 +0200 (CEST)
Message-ID: <98fe829a-87f7-47d4-bb98-bf19e656aea8@rnout.be>
Date: Tue, 22 Apr 2025 21:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Leroy <maxime@leroys.fr>, buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, Julien Olivain <ju.o@free.fr>
References: <20250403190705.14994-1-maxime@leroys.fr>
 <20250407190338.7436-1-maxime@leroys.fr>
 <20250407190338.7436-3-maxime@leroys.fr>
Content-Language: en-GB
In-Reply-To: <20250407190338.7436-3-maxime@leroys.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1745349060; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XlKezt6iAXz65k9LGAHXw+ErwFh6kokOFOUOTdWZ39A=;
 b=FIYQojuoJAhUEF7hT2a8BoZ/BM6PjiHHl9kZHyyZb/LKwkJAZPcJdj01Ixa618kir7gTQj
 4dr4CAVITVfIMPNxRP1A4Gv5uswOmAaG0puPQcT+Y3fSOZAabgPvsIPayFO3ZJ7wrd98LJ
 8KF6GRXjfPUBEboz9HhWY3k8ulPi0a5aj9U/jsMR4fB3Gs/3EQW8jcGqwqZ7riph/iEpHp
 9kInJZZP6MS8bhkgDP4bDU171v6kEOK+PQDtGAziOnxjIALQH+czHPSn+JuvTKJzwcnOid
 YPE/SRw9RXVBGz2XyXdpvzb4dp/j46MGzbYx1osV6PeChc74N/VQBFs9pB/o3Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH v2 1/1] package/frr: security bump to
 version 10.3
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

Ck9uIDA3LzA0LzIwMjUgMjE6MDMsIE1heGltZSBMZXJveSB3cm90ZToKPiBVcGRhdGUgRlJSIHRv
IHRoZSBsYXRlc3Qgc3RhYmxlIHZlcnNpb24gKDEwLjMsIHNlZSBbMV0pLgo+Cj4gQSBuZXcgcGFj
a2FnZSBvcHRpb24gYEJSMl9QQUNLQUdFX0ZSUl9CRkRgIHRvIGVuYWJsZSBvciBkaXNhYmxlIHRo
ZQo+IGNvbXBpbGF0aW9uIG9mIHRoZSBCRkQgZGFlbW9uLiBUaGlzIG9uZSBoYXMgbm93IGEgZGVw
ZW5kZW5jaWVzIHdpdGggdGhlCj4ga2VybmVsIGhlYWRlcnMgNC4xMCAoaS5lLiBJUFY2X1NSQ1JU
X1RZUEVfNCBmcm9tIGxpbnV4L2lwdjYuaCBbMl0pLgo+Cj4gVGhlIGNvbmZpZ3VyZSBvcHRpb25z
IGhhdmUgYmVlbiB1cGRhdGVkIGFjY29yZGluZ2x5Ogo+IC0gVmVyc2lvbnMgb2YgRlJSIGJlZm9y
ZSA5LjIgdXNlZCBgc3lzY29uZmRpcmAgYW5kIGBsb2NhbHN0YXRlZGlyYCBhcy1pcywKPiAgICB3
aXRob3V0IGFwcGVuZGluZyBgL2ZycmAuIFRoZSBgL2ZycmAgc3VmZml4IGhhZCB0byBiZSBwYXNz
ZWQgZXhwbGljaXRseQo+ICAgIHRvIGAuL2NvbmZpZ3VyZWAsIHdoaWNoIGRpZCBub3QgYWxpZ24g
d2l0aCBzdGFuZGFyZCBjb252ZW50aW9ucy4KPiAgICBUaGlzIGJlaGF2aW9yIGhhcyBzaW5jZSBi
ZWVuIGZpeGVkIHVwc3RyZWFtIFszXS4gQXMgYHN5c2NvbmZkaXJgIGFuZAo+ICAgIGBsb2NhbHN0
YXRlZGlyYCBhcmUgYWxyZWFkeSBzZXQgYnkgYHBrZy1hdXRvdG9vbHMubWtgLCB0aGV5IGNhbiBu
b3cKPiAgICBiZSByZW1vdmVkIGZyb20gYGZyci5ta2AuCj4gLSBUaGUgYC0tZW5hYmxlLXNoZWxs
LWFjY2Vzc2Agb3B0aW9uIGhhcyBiZWVuIHJlbW92ZWQgYXMgb2YgRlJSIDEwIFs0XS4KPgo+IFsx
XSBodHRwczovL2Zycm91dGluZy5vcmcvcmVsZWFzZS8xMC4zLwo+IFsyXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29t
bWl0Lz9pZD0xYWJhYmViYTRhMjFmCj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9GUlJvdXRpbmcv
ZnJyL2NvbW1pdC9mZjYyZGYyZTQ0ODQKPiBbNF0gaHR0cHM6Ly9naXRodWIuY29tL0ZSUm91dGlu
Zy9mcnIvY29tbWl0L2FmYjAzNGIwYmI0Mgo+IEZpeGVzOiBodHRwczovL3d3dy5jdmUub3JnL0NW
RVJlY29yZD9pZD1DVkUtMjAyNC01NTU1Mwo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBMZXJveSA8
bWF4aW1lQGxlcm95cy5mcj4KCiDCoEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuIEV2ZW4g
dGhvdWdoIGl0J3MgYSBtYWpvciB2ZXJzaW9uIGJ1bXAsIGl0J3MgYWxzbyAKZml4aW5nIGEgQ1ZF
IGFuZCB0aGUgcGF0Y2ggaXMgbm90IHRyaXZpYWwgdG8gYmFja3BvcnQuCgogwqBSZWdhcmRzLAog
wqBBcm5vdXQKCj4gLS0tCj4gICBwYWNrYWdlL2Zyci9Db25maWcuaW4gfCAgNyArKysrKysrCj4g
ICBwYWNrYWdlL2Zyci9mcnIuaGFzaCAgfCAgMiArLQo+ICAgcGFja2FnZS9mcnIvZnJyLm1rICAg
IHwgMTEgKysrKysrKy0tLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zyci9Db25maWcuaW4gYi9w
YWNrYWdlL2Zyci9Db25maWcuaW4KPiBpbmRleCBjMjZiMTYwYjJhLi4yMTFlYjgzNDE5IDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvZnJyL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZnJyL0NvbmZp
Zy5pbgo+IEBAIC0yNCw2ICsyNCwxMyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfRlJSCj4gICAKPiAg
IGlmIEJSMl9QQUNLQUdFX0ZSUgo+ICAgCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GUlJfQkZECj4g
Kwlib29sICJCRkQgcHJvdG9jb2wiCj4gKwlkZWZhdWx0IHkKPiArCWRlcGVuZHMgb24gQlIyX1RP
T0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfMTAKPiArCWhlbHAKPiArCSAgQnVpbGQgQmlkaXJl
Y3Rpb25hbCBGb3J3YXJkaW5nIERldGVjdGlvbiBkYWVtb24uCj4gKwo+ICAgY29uZmlnIEJSMl9Q
QUNLQUdFX0ZSUl9CTVAKPiAgIAlib29sICJCTVAgcHJvdG9jb2wiCj4gICAJc2VsZWN0IEJSMl9Q
QUNLQUdFX0NfQVJFUwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2Zyci9mcnIuaGFzaCBiL3BhY2th
Z2UvZnJyL2Zyci5oYXNoCj4gaW5kZXggYWExM2VkNTYyNS4uNzc4NmNjODAwOSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2Zyci9mcnIuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZnJyL2Zyci5oYXNoCj4g
QEAgLTEsNSArMSw1IEBACj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDUzMjNl
NWVjMjM2MzQ2ODYwMzAxZTU3ZjY4NDU0NDM4NTVlOGYyNTA4ZDdjY2Q4N2VhZDM5NWE5OTkxYzAx
YzIgIGZyci05LjEuMy50YXIuZ3oKPiArc2hhMjU2ICAwZjEwYWNhOTA3NGM3NzNjMTJiZThhMDcz
ODJjNzU2MGQ2MjVkNGEyYzg0MmQ4MjI2MWQxOGJiOGY0YjI2ZjZjICBmcnItMTAuMy50YXIuZ3oK
PiAgIHNoYTI1NiAgN2JmMDUzOTU3ZDZjMzhlMzlhMDZhMTEyYzYwZmYzNWIyMjhkM2JkMDNlZGJl
OGM5YTAzNTA4YjA1MTEyOGQxNiAgQ09QWUlORwo+ICAgc2hhMjU2ICBmOWUwYzIxZmFmNzM4ZGE1
ODYyODFjMGJlYWFkM2NkNTYyMDRjMTkwODVhMTBmZTA1ZTRkM2Q3ZjhiNTg2M2QyICBkb2MvbGlj
ZW5zZXMvQlNELTItQ2xhdXNlCj4gICBzaGEyNTYgIGFjYTI5N2I4ZmQzYTQzZTNiYjIwMGYxZTJl
MDQzYzBkYjZjODk3MzI1ZjVmZjdmMjNmNzUzMDMwMmE2YmY3MTMgIGRvYy9saWNlbnNlcy9CU0Qt
My1DbGF1c2UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIvcGFja2FnZS9mcnIv
ZnJyLm1rCj4gaW5kZXggNTM5MWJjYjI2NS4uNzg5NzllMmJlYiAxMDA2NDQKPiAtLS0gYS9wYWNr
YWdlL2Zyci9mcnIubWsKPiArKysgYi9wYWNrYWdlL2Zyci9mcnIubWsKPiBAQCAtNCw3ICs0LDcg
QEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gICAKPiAtRlJSX1ZFUlNJT04g
PSA5LjEuMwo+ICtGUlJfVkVSU0lPTiA9IDEwLjMKPiAgIEZSUl9TSVRFID0gJChjYWxsIGdpdGh1
YixGUlJvdXRpbmcsZnJyLGZyci0kKEZSUl9WRVJTSU9OKSkKPiAgIEZSUl9MSUNFTlNFID0gR1BM
LTIuMCsKPiAgIEZSUl9MSUNFTlNFX0ZJTEVTID0gXAo+IEBAIC0zOCwxNCArMzgsMTEgQEAgRlJS
X0NPTkZfRU5WID0gXAo+ICAgIyBEbyBub3QgZW5hYmxlIC1mcGx1Z2luPWZyci1mb3JtYXQgZm9y
IHByb2R1Y3Rpb24sIHNlZSBkb2MvZGV2ZWxvcGVyL3dvcmtmbG93LnJzdCwKPiAgICMgaXQgaXMg
b25seSBpbnRlbmRlZCBmb3IgRlJSJ3MgZGV2ZWxvcG1lbnRzCj4gICBGUlJfQ09ORl9PUFRTID0g
LS13aXRoLWNsaXBweT0kKEhPU1RfRElSKS9iaW4vY2xpcHB5IFwKPiAtCS0tc3lzY29uZmRpcj0v
ZXRjL2ZyciBcCj4gLQktLWxvY2Fsc3RhdGVkaXI9L3Zhci9ydW4vZnJyIFwKPiAgIAktLXdpdGgt
bW9kdWxlZGlyPS91c3IvbGliL2Zyci9tb2R1bGVzIFwKPiAgIAktLWVuYWJsZS1jb25maWdmaWxl
LW1hc2s9MDY0MCBcCj4gICAJLS1lbmFibGUtbG9nZmlsZS1tYXNrPTA2NDAgXAo+ICAgCS0tZW5h
YmxlLW11bHRpcGF0aD0yNTYgXAo+ICAgCS0tZGlzYWJsZS1vc3BmY2xpZW50IFwKPiAtCS0tZW5h
YmxlLXNoZWxsLWFjY2VzcyBcCj4gICAJLS1lbmFibGUtdXNlcj1mcnIgXAo+ICAgCS0tZW5hYmxl
LWdyb3VwPWZyciBcCj4gICAJLS1lbmFibGUtdnR5LWdyb3VwPWZycnZ0eSBcCj4gQEAgLTg2LDYg
KzgzLDEyIEBAIGVsc2UKPiAgIEZSUl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLXplcm9tcQo+ICAg
ZW5kaWYKPiAgIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0ZSUl9CRkQpLHkpCj4gK0ZSUl9DT05G
X09QVFMgKz0gLS1lbmFibGUtYmZkZAo+ICtlbHNlCj4gK0ZSUl9DT05GX09QVFMgKz0gLS1kaXNh
YmxlLWJmZGQKPiArZW5kaWYKPiArCj4gICBpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0xJQkFU
T01JQykseSkKPiAgIEZSUl9DT05GX0VOViArPSBMSUJTPS1sYXRvbWljCj4gICBlbmRpZgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
