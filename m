Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2125AC6FA82
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 11:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA4D54058F;
	Thu, 22 Sep 2022 11:54:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA4D54058F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ge_sAVDv7r88; Thu, 22 Sep 2022 11:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B056E40399;
	Thu, 22 Sep 2022 11:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B056E40399
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 722741BF409
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 11:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D6BE60687
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 11:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D6BE60687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dRb4QBMCImUR for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 11:54:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1333E60681
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1333E60681
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 11:54:46 +0000 (UTC)
Received: from smtpclient.apple ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPA
 id bKmyowUQb5z8NbKmyoj9xu; Thu, 22 Sep 2022 13:54:45 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 22 Sep 2022 13:54:44 +0200
Message-Id: <FD37A98E-8009-4495-B90F-568374563270@benettiengineering.com>
References: <87illgc4zn.fsf@dell.be.48ers.dk>
In-Reply-To: <87illgc4zn.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfBRtoqLceOrEieh26TWs/x9zYoYCpv1jXD78P3ErNWLPCtLGmnyEUtxuGYGYGfTYIOuJVVavuHyCTTiVEBxBBjusCMcS58miolqY70OWFWun4OwQ9hSR
 VIs5ZHpe3kANjxOjhN9j83COheKanauWP0z1BKB5OVb7s/W13Ljom977ymNWGg2uiEGQ5tNkSMuKUfTB8PeTps02sNpHQYYNtMIXIAJ8h2fGaAzF1/3bB3J1
 g2uLowTG6lIsyaX4Q5cOBg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663847685; bh=2Zd1EztKJkuz9CCxHgLwm68dsnTA0qxV/m8dXMN2Mf8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=kJcCUROp4YKZflRvkWTkBG4oTP7pk504PDFZoZ2v6zCudAHosRSV+CJX6baL8IvhS
 m9DE1wjAsOo+TBsXgsF9LXOQApx3+BtuXtYLZJlIPi6wy8gX0vK8yMH9tx8kQAFEVs
 gB1q5nww6p0Msr1V4c+Y2eo7wk1XFAtVEsP+v4EzdNJgrmRprN6MFY10bILn7OgyoT
 IsHn5bo3fEMGiBlGqSC8/zneRtXGLyyNw/bH6vPp5KkvfuwP7QXGC0Rah9hcPozelo
 KNPa8CRO8RwRWN63vG0Vt7595kWyOynrenTD7PluhfHrgdpaifAU3usk09HC0WsA8o
 kSxjuhBqopWCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kJcCUROp
Subject: Re: [Buildroot] [PATCH] package/rtl8723bu: bump to latest version
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUGV0ZXIsCgo+IElsIGdpb3JubyAyMiBzZXQgMjAyMiwgYWxsZSBvcmUgMDg6MTIsIFBldGVy
IEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4gaGEgc2NyaXR0bzoKPiAKPiDvu78KPj4g
Cj4+Pj4+PiAiR2l1bGlvIiA9PSBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4gd3JpdGVzOgo+IAo+PiBGaXhlczoKPj4gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNGJhLzRiYWY3Yjc1M2ExNmU5Y2Q3OThlYWY1MWE0Y2I5
OTRhMjJmNDM3ZTgvCj4gCj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8u
YmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+IAo+IFNvbWUgbW9yZSBpbmZvcm1hdGlv
biB3b3VsZCBiZSBnb29kIGZvciBtZSB0byBrbm93IGlmIHRoaXMgbmVlZHMgdG8gYmUKPiBiYWNr
cG9ydGVkIG9yIG5vdC4gU2luY2Ugd2hhdCBrZXJuZWwgdmVyc2lvbiBkb2VzIGl0IGJyZWFrPwo+
IAo+IEFsdGVybmF0aXZlbHkgYSBnaXQgc2hvcnRsb2cgc2luY2UgdGhhdCBwcmV2aW91cyBjb21t
aXQsIHdoaWNoIGFsc28KPiBwcmV0dHkgbXVjaCBleHBsYWlucyBpdDoKPiAKPiBnaXQgc2hvcnRs
b2cgLS1uby1tZXJnZXMgMTliNGJkYzA1NDgzYTFlNzlhNGY5NTVhODBmOGY3MmNkZDVkZWRjMy4u
Cj4gRGVuaXMgS2xlc3RlciAoMSk6Cj4gICAgICBmaXggYnVpbGQgZm9yIDUuMTkuMgo+IAo+IExh
cnJ5IEZpbmdlciAoNCk6Cj4gICAgICBydGw4NzIzYnU6IEZpeCBidWlsZCB1bmRlciBrZXJuZWwg
NS4xNyBhbmQgY2xlYW4gdXAgc29tZSB3YXJuaW5ncwo+ICAgICAgcnRsODcyM2J1OiBGaXggbXVs
dGlwbGUgZGVmaW5pdGlvbiBlcnJvcnMKPiAgICAgIHJ0bDg3MjNidTogRmluIGNvbXBpbGUgd2Fy
bmluZwo+ICAgICAgcnRsODcyM2J1OiBGaXggYnVpbGRzIGZvciBrZXJuZWwgNi4wCj4gCj4gU28g
YXBwYXJlbnRseSBpdCBmaXhlcyBidWlsZHMgd2l0aCBrZXJuZWwgNS4xNysuCgpZZXMgZXhhY3Rs
eS4KSeKAmXZlIGZvcmdvdHRlbiB0byBhZGQgYSBjb21taXQgbG9nIGF0IGFsbCBoZXJlLgpJ4oCZ
dmUgc2VlbiDigJxidW1wIHZlcnNpb27igJ0gYW5kIEkgZGlkbuKAmXQgY29tcGxldGUgdGhlIGNv
bW1pdCBsb2cuIEnigJlsbCB0YWtlIGNhcmUgbmV4dCB0aW1lLgoKVGhhbmtzCkdpdWxpbwoKPiAK
PiBDb21taXR0ZWQgdG8gMjAyMi4wMi54LCAyMDIyLjA1LnggYW5kIDIwMjIuMDgueCB3aXRoIGEg
bW9yZSBkZXRhaWxlZAo+IGNvbW1pdCBtZXNzYWdlLCB0aGFua3MuCj4gCj4+IC0tLQo+PiBwYWNr
YWdlL3J0bDg3MjNidS9ydGw4NzIzYnUuaGFzaCB8IDIgKy0KPj4gcGFja2FnZS9ydGw4NzIzYnUv
cnRsODcyM2J1Lm1rICAgfCAyICstCj4+IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQo+IAo+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ydGw4NzIzYnUvcnRs
ODcyM2J1Lmhhc2ggYi9wYWNrYWdlL3J0bDg3MjNidS9ydGw4NzIzYnUuaGFzaAo+PiBpbmRleCAx
ZGFkNzE1NGI0Li45MTE5YWJhZDc2IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3J0bDg3MjNidS9y
dGw4NzIzYnUuaGFzaAo+PiArKysgYi9wYWNrYWdlL3J0bDg3MjNidS9ydGw4NzIzYnUuaGFzaAo+
PiBAQCAtMSwyICsxLDIgQEAKPj4gIyBMb2NhbGx5IGNvbXB1dGVkCj4+IC1zaGEyNTYgIDFjZDY1
ODc0MmNlMTBiMjFjOTI4NzdlMDljZWNjOTg4ODA2ODBkNWYxNTBkZTM4NDU1NTMwMDVhYmM1NDI5
NzcgIHJ0bDg3MjNidS0xOWI0YmRjMDU0ODNhMWU3OWE0Zjk1NWE4MGY4ZjcyY2RkNWRlZGMzLnRh
ci5nego+PiArc2hhMjU2ICAwN2ZlY2UxNTI3MDRmNGI1ZGJkMGZkM2FmODQyODE2Zjk1ODI0MzE3
ZjMxNThmZWE3NzRmMTVhNmVkZGFjMDA5ICBydGw4NzIzYnUtZDc5YTY3NmE4ZDNmMGJiNmFjOGFm
MTI2Njg5YzZhYzY4NjljYjZmMi50YXIuZ3oKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnRsODcy
M2J1L3J0bDg3MjNidS5tayBiL3BhY2thZ2UvcnRsODcyM2J1L3J0bDg3MjNidS5tawo+PiBpbmRl
eCA4MzhiYmVkYjc0Li4zZGE4ZDljZWNmIDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3J0bDg3MjNi
dS9ydGw4NzIzYnUubWsKPj4gKysrIGIvcGFja2FnZS9ydGw4NzIzYnUvcnRsODcyM2J1Lm1rCj4+
IEBAIC00LDcgKzQsNyBAQAo+PiAjCj4+ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gCj4+IC1S
VEw4NzIzQlVfVkVSU0lPTiA9IDE5YjRiZGMwNTQ4M2ExZTc5YTRmOTU1YTgwZjhmNzJjZGQ1ZGVk
YzMKPj4gK1JUTDg3MjNCVV9WRVJTSU9OID0gZDc5YTY3NmE4ZDNmMGJiNmFjOGFmMTI2Njg5YzZh
YzY4NjljYjZmMgo+PiBSVEw4NzIzQlVfU0lURSA9ICQoY2FsbCBnaXRodWIsbHdmaW5nZXIscnRs
ODcyM2J1LCQoUlRMODcyM0JVX1ZFUlNJT04pKQo+PiBSVEw4NzIzQlVfTElDRU5TRSA9IEdQTC0y
LjAsIHByb3ByaWV0YXJ5ICgqLmJpbiBmaXJtd2FyZSBibG9icykKPiAKPj4gLS0gCj4gCj4+IDIu
MzQuMQo+IAo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+
IAo+IAo+IC0tIAo+IEJ5ZSwgUGV0ZXIgS29yc2dhYXJkCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
