Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EFBC38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 17:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8395A4011F;
	Wed,  1 Feb 2023 17:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8395A4011F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtJa7-qcMHPw; Wed,  1 Feb 2023 17:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F7EF419C1;
	Wed,  1 Feb 2023 17:45:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F7EF419C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF87B1BF29F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 17:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2BEE60FB0
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 17:45:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BEE60FB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f2kF-Zb-1HJn for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 17:45:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01EE860E73
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 01EE860E73
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 17:45:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.15]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLR1f-1p5TKx3NfH-00IT3v; Wed, 01
 Feb 2023 18:45:16 +0100
Date: Wed, 1 Feb 2023 18:45:15 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230201184515.0e6a9a53@gmx.net>
In-Reply-To: <CAPi7W82--bdBw2xRnVq+gVwnfrzcbUzmpQT24FbRAaZWqkDu4w@mail.gmail.com>
References: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
 <20230130205603.GA3864@scaer>
 <CAPi7W82--bdBw2xRnVq+gVwnfrzcbUzmpQT24FbRAaZWqkDu4w@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:WLP3l0YEHOQjLHhgtpG7sK1ZdkoI9S1zoTnULCoThX+ye75hSXZ
 8sApPrBB3tXrLRWbZ5LLpBSwYObfCU91dEacc4zYGL3ph/pf8uPwThX0k9X0uFu0gJW9xEf
 dEVRksQo/mbCqxCmTxn6kq04k7kmEmqQyuchz0OOVAQR+OftFMiQD5KptDCp21apRxn8J6E
 UA4RjjevpLFrFxspkk3aA==
UI-OutboundReport: notjunk:1;M01:P0:7+XtvWAUC8w=;g/6dKOxfFeKl3J3kMOq77ihH+Au
 5XWgaIPGKZT3EdS30og3GiwPAJ1HDgDXmqaEYL8IUbved0nlla/M28IVNafvlKzJPulLo6EHG
 bFrJ6t7O2V0yuVhYxfBwI2YpNZMZLbmbK11SW/OGQWtvUhlIFkYpDJ11foXtUADI9r+TnJvlp
 CBU9xqPGOzLHjbIsTzZKmf7TnkY1JCUk2tfivB2y8zgmrGyeLWz02ZUk8+Gi1f4XfNfJE/EfQ
 czRwMcYOyEtfUsDqxGXvQZWV1k6dJwqAQhUlKx9E0VEdI90WM68C27xfk2J8LIw1L9CKbythN
 5uIMuQNJs5kBtryy3IfTBHDUYUHXHwqyjMsxFXhpnQlhq8SCaiaw6gEIc2Tq9oJCTl0Rfa54I
 5F4gDh8xf6M5WR+riZemrPw87ZnHVob64vZaXdSaalw8O3BlT7URsfKL5D38zYAcv7aj2vlPM
 BSf6P7LWLO3Ds3tWJta+FfA/W6LRZ41mX16PNVYy1LekmygiJc0vkj/HwWWfNrG1ZjinmigEd
 ofpyE+2H3djCRN/ylf4JleneoVXQtVnllO4gv79xUGkwL+SFFVrgEXoN776LU+U1b/kLQhjoF
 XWXWyX6PSGegfXijlxubDnPhqjcaDzCagPu0/GH9ZyI9Bhv4MjMEUZOE+6NH5BwdOj2rxoJ1B
 6niU9XyJvTMKQKQxYaob+Oz9nYs80m2wYotp3VtVz0lbbS52dxSI6c6SBQVJL1Wg3FBMfU7sa
 QjPRrXVEs7EQTZ9KMtc8W4ZgTVA8HgIWRL9FEKm8lVtRErXe2LxBmH0MiprJN5CUIChMJWr8A
 e99PQfMTPJagYgJGhrlG3pICWec2IcGeLf0Yalar8od1nOohBWuiUuIYQlsduV9xA0VDG1BvI
 jtLfCgnyLUzJUPsBGWxScFM7ejzHeFZnWVGwG+AzZwdMfuRaJg8MgohThrEPdwWBz8ywaag1X
 oN3ZbA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1675273517; bh=n+wf0Y1sG6l9809siAoBeKoPA0lwCC0UsNcmxfN54Rw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=lffmrRZRGOjaIlLlZF3XdfJI0w872Sh5fe9sbLBaZJQPb3Rv1S4EPFgA/TFE8Vpk0
 b2/fEV63q7ekwW9Fal3Cs3doNJ3jXChqKqn1JxqAhxZLiZv+Ge2UPP48gkSS2SZ/yl
 yCAqfmobftfCSjXbGR0r0U70dvz+7oWQSfspxO86Np6yuPoNvIFWnl76iir5cogkA4
 JbP4LH6/AaG/2lHlGdfbArKwE6T6f1N4UaOfS8aijgISxQntRniLv6lwopfk5DvrtO
 rpV9Kby2fTUJFTwGf+S+dZBiRWe1pQ6sqfA23GlbSwn5rmBAhQ84gETaIMSXUc9TwV
 bysti67DqwfWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=lffmrRZR
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.16
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
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gKiwKCk9uIFdlZCwgMSBGZWIgMjAyMyAxODozNToxNyArMDEwMCwgRmFicmljZSBGb250
YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgoKPiBIaSBZYW5uLAo+IAo+
IExlIGx1bi4gMzAgamFudi4gMjAyMyDDoCAyMTo1NiwgWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jp
bi4xOTk4QGZyZWUuZnI+IGEKPiDDqWNyaXQgOgo+IAo+ID4gRmFicmljZSwgQWxsLAo+ID4KPiA+
IE9uIDIwMjMtMDEtMTQgMTc6MTAgKzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5
OiAgCj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9uaG9ybWFuL3JuZy10b29scy9yZWxlYXNlcy90
YWcvdjYuMTYgIAo+ID4gWy0tU05JUC0tXSAgCj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3Ju
Zy10b29scy9ybmctdG9vbHMuaGFzaCAgCj4gPiBiL3BhY2thZ2Uvcm5nLXRvb2xzL3JuZy10b29s
cy5oYXNoICAKPiA+ID4gaW5kZXggYmUyZWUxMzk2OS4uNGM4Njc5MTI2NyAxMDA2NDQKPiA+ID4g
LS0tIGEvcGFja2FnZS9ybmctdG9vbHMvcm5nLXRvb2xzLmhhc2gKPiA+ID4gKysrIGIvcGFja2Fn
ZS9ybmctdG9vbHMvcm5nLXRvb2xzLmhhc2gKPiA+ID4gQEAgLTEsMyArMSwzIEBACj4gPiA+ICAj
IExvY2FsbHkgY29tcHV0ZWQKPiA+ID4gLXNoYTI1NiAgCj4gPiBiZmYwYzU4ZGZmOTBlYzEwYmQ2
MWY2NzJlNDg2MThlMDQ1MTU1ZWFiZDYwYjMyZDYzYTljNGZmYmRhZDA1ZjNhCj4gPiBybmctdG9v
bHMtNi4xNS50YXIuZ3ogIAo+ID4gPiArc2hhMjU2ICAKPiA+IDE3NjY2YzQ3NDVmYjYzNWQ5MWRm
MjkzYmUxODhkYWY5NGI5ZTQ2NWQ1MWQ4NTAzYzAxOTVmYTNiZWIzOTA4OTQKPiA+IHJuZy10b29s
cy02LjE2LnRhci5nego+ID4KPiA+IFRoaXMgaGFzaCBkb2VzIG5vdCBtYXRjaCBoZXJlLCBhbmQg
d2UndmUgaGFkIGEgcmVwb3J0IG9uIElSQyB0aGF0IGl0Cj4gPiBkb2VzIG5vdCB3b3JrIGVpdGhl
ci4gSW4gYm90aCBjYXNlcywgd2UgZ2V0IHRoaXMgaGFzaCBpbnN0ZWFkOgo+ID4gICAgIDhlNTE4
ZDQ1YmU2OGY0MmQwODczNzMyYTlhYzNlY2ZlMGYxMGM0YTliZDVkNWY0NDE4MGE0OWJlOGViZGE5
NmYKPiA+Cj4gPiBDYW4geW91IGNoZWNrIG9uIHlvdXIgc2lkZSwgaG93IHlvdSBlbmRlZCB1cCB3
aXRoIDE3NjY2Li4uOTA4OTQ/Cj4gPiAgCj4gCj4gSSBzZWUgdGhhdCB0aGVyZSBpcywgb25seSwg
b25lIGF1dG9idWlsZGVyIGZhaWx1cmUuCj4gSG93ZXZlciwgSSByZXRlc3RlZCBhZ2FpbiBvbiBh
IGZyZXNoIHRhcmJhbGwgYW5kCj4gMTc2NjZjNDc0NWZiNjM1ZDkxZGYyOTNiZTE4OGRhZjk0Yjll
NDY1ZDUxZDg1MDNjMDE5NWZhM2JlYjM5MDg5NCBpcyB0aGUKPiBjb3JyZWN0IHNoYTI1NiBmb3IK
PiBodHRwczovL2dpdGh1Yi5jb20vbmhvcm1hbi9ybmctdG9vbHMvYXJjaGl2ZS92Ni4xNi9ybmct
dG9vbHMtNi4xNi50YXIuZ3ouCgpTZWUgaHR0cHM6Ly9naXRodWIuYmxvZy9jaGFuZ2Vsb2cvMjAy
My0wMS0zMC1naXQtYXJjaGl2ZS1jaGVja3N1bXMtbWF5LWNoYW5nZS8KZm9yIGFuIHBvc3NpYmxl
IGV4cGxhbmF0aW9uIGZvciB0aGUgZG93bmxvYWQgaGFzaCBkaWZmcy4uLgoKUmVnYXJkcywKUGV0
ZXIKCgo+IAo+IAo+ID4gUmVnYXJkcywKPiA+IFlhbm4gRS4gTU9SSU4uCj4gPiAgCj4gPiA+ICBz
aGEyNTYgIAo+ID4gODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4ZmY5ODZjNjc1YWZiNTE0ZDRl
NjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORyAgCj4gPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L3JuZy10b29scy9ybmctdG9vbHMubWsgYi9wYWNrYWdlL3JuZy10b29scy8gIAo+ID4gcm5nLXRv
b2xzLm1rICAKPiA+ID4gaW5kZXggZjczNjE5M2EyMy4uM2U1NjUxMDNlNCAxMDA2NDQKPiA+ID4g
LS0tIGEvcGFja2FnZS9ybmctdG9vbHMvcm5nLXRvb2xzLm1rCj4gPiA+ICsrKyBiL3BhY2thZ2Uv
cm5nLXRvb2xzL3JuZy10b29scy5tawo+ID4gPiBAQCAtNCwxNCArNCwxNCBAQAo+ID4gPiAgIwo+
ID4gPiAgCj4gPiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyAgCj4gPiA+Cj4gPiA+IC1STkdfVE9P
TFNfVkVSU0lPTiA9IDYuMTUKPiA+ID4gK1JOR19UT09MU19WRVJTSU9OID0gNi4xNgo+ID4gPiAg
Uk5HX1RPT0xTX1NJVEUgPSAkKGNhbGwgIAo+ID4gZ2l0aHViLG5ob3JtYW4sJChSTkdfVE9PTFNf
TkFNRSksdiQoUk5HX1RPT0xTX1ZFUlNJT04pKSAgCj4gPiA+ICBSTkdfVE9PTFNfTElDRU5TRSA9
IEdQTC0yLjAKPiA+ID4gIFJOR19UT09MU19MSUNFTlNFX0ZJTEVTID0gQ09QWUlORwo+ID4gPiAg
Uk5HX1RPT0xTX0NQRV9JRF9WRU5ET1IgPSBybmctdG9vbHNfcHJvamVjdAo+ID4gPiAgUk5HX1RP
T0xTX1NFTElOVVhfTU9EVUxFUyA9IHJuZ2QKPiA+ID4KPiA+ID4gLVJOR19UT09MU19ERVBFTkRF
TkNJRVMgPSBob3N0LXBrZ2NvbmYgb3BlbnNzbAo+ID4gPiArUk5HX1RPT0xTX0RFUEVOREVOQ0lF
UyA9IGhvc3QtcGtnY29uZiBsaWJjYXAgb3BlbnNzbAo+ID4gPiAgIyBGcm9tIGdpdAo+ID4gPiAg
Uk5HX1RPT0xTX0FVVE9SRUNPTkYgPSBZRVMKPiA+ID4KPiA+ID4gQEAgLTQ1LDYgKzQ1LDEzIEBA
IGVsc2UKPiA+ID4gIFJOR19UT09MU19DT05GX09QVFMgKz0gLS13aXRob3V0LW5pc3RiZWFjb24K
PiA+ID4gIGVuZGlmCj4gPiA+Cj4gPiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1JOR19UT09MU19R
UllQVCkseSkKPiA+ID4gK1JOR19UT09MU19ERVBFTkRFTkNJRVMgKz0gamFuc3NvbiBsaWJjdXJs
Cj4gPiA+ICtSTkdfVE9PTFNfQ09ORl9PUFRTICs9IC0td2l0aC1xcnlwdAo+ID4gPiArZWxzZQo+
ID4gPiArUk5HX1RPT0xTX0NPTkZfT1BUUyArPSAtLXdpdGhvdXQtcXJ5cHQKPiA+ID4gK2VuZGlm
Cj4gPiA+ICsKPiA+ID4gIGRlZmluZSBSTkdfVE9PTFNfSU5TVEFMTF9JTklUX1NZU1YKPiA+ID4g
ICAgICAgJChJTlNUQUxMKSAtRCAtbSA3NTUgcGFja2FnZS9ybmctdG9vbHMvUzIxcm5nZCBcCj4g
PiA+ICAgICAgICAgICAgICAgJChUQVJHRVRfRElSKS9ldGMvaW5pdC5kL1MyMXJuZ2QKPiA+ID4g
LS0KPiA+ID4gMi4zOS4wCj4gPiA+Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+ID4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+ID4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290ICAKPiA+Cj4gPiAtLQo+ID4KPiA+IC4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCj4gPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8
IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycKPiA+IGNvbnNwaXJhY3k6IHwKPiA+IHwgKzMzIDY2
MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18K
PiA+ICAgICAgfAo+ID4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMKPiA+IG5vICB8Cj4gPiB8IGh0dHA6Ly95
bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYKPiA+
ICBjb25zcGlyYWN5LiAgfAo+ID4KPiA+ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCj4gPiAgCj4g
Cj4gQmVzdCBSZWdhcmRzLAo+IAo+IEZhYnJpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
