Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56029C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 17:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C63B3400E8;
	Fri, 10 Dec 2021 17:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ndOLlLwFG99; Fri, 10 Dec 2021 17:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFF22401C4;
	Fri, 10 Dec 2021 17:34:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C03FD1BF35D
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 17:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD198401C4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W8Yv7lnHvZEw for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 17:34:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AE29400E8
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 17:34:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ad31:90cb:f019:b3ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7E07CB0053D;
 Fri, 10 Dec 2021 18:34:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639157666;
 bh=eKNU3ZTkCNiISam+HOLwHaiXEY3KvIQRxeivUM5V7PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c8xxlQxEWLvFGMQBfgOGCFtGLV1Z4tNDK/6Ul7mEMtJdrJGdmmjo6/LfPz9LAyyJA
 xYTnfrB09Yz92nNGyv27JcRR3u3FCronfkzj8sWSFBBbzdeRlqgzDIz/5/+S3athc3
 +ZzB9lKv3RWXUGr/OfmHvvTMWQuybQtPN0mFOPJvmirxc37ZSuf7tPSqjLm14BHCAx
 C/LgqnfVJfxymAx5d30vaTrtrD3eTbfCicPelvIED90jZ8aukB7VB9PPVMt86rp2tt
 FXGmu2SCbC93bzpk+Se/QajUvmvuimecbMjv6BHXg4xYO8SM2YtWIGkoBxHMvdqFS+
 0SkQNF5VZ/tUw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 10 Dec 2021 18:34:23 +0100
Date: Fri, 10 Dec 2021 18:34:23 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211210173423.GI2603@scaer>
References: <20211210141209.1812043-1-jose.pekkarinen@unikie.com>
 <4FFF798B-288E-4D58-A87C-D967EF7E43D8@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4FFF798B-288E-4D58-A87C-D967EF7E43D8@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/7] package/opensc: new package
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
Cc: =?utf-8?B?Sm9zw6k=?= Pekkarinen <jose.pekkarinen@unikie.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sm9zw6ksIEFsbCwKCk9uIDIwMjEtMTItMTAgMTU6MzIgKzAxMDAsIEdpdWxpbyBCZW5ldHRpIHNw
YWtlIHRodXNseToKPiA+IElsIGdpb3JubyAxMCBkaWMgMjAyMSwgYWxsZSBvcmUgMTU6MTIsIEpv
c8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPiBoYSBzY3JpdHRvOgo+
ID4gCj4gPiDvu79UaGUgcGF0Y2ggd2lsbCBhZGQgYSBiYXNpYyBvcGVuc2MgcGFja2FnZSB0byBi
dWlsZAo+ID4gb24gYnVpbGRyb290Lgo+IAo+IFBsZWFzZSBhcyBwb2ludGVkIHByZXZpb3VzbHkg
cmV3b3JkIGxpa2UgdGhpczoKPiDigJxUaGlzIHBhdGNoIGFkZHMgb3BlbnNjIHBhY2thZ2XigJ0K
ClllcywgcGxlYXNlIHVzZSB0aGUgcHJlc2VudCBmb3JtLgoKQWRkaXRpb25hbGx5LCB3ZSBsaWtl
IHRoYXQgdGhlIGNvbW1pdCBsb2cgZXhwbGFpbnMgdGhlIHBhY2thZ2luZywgbGlrZQp0aGUgcmVh
c29uIGZvciB0aGUgcGF0Y2hlcyBmb3IgZXhhbXBsZS4KCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb3PD
qSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5pa2llLmNvbT4KPiA+IC0tLQpbLS1TTklQ
LS1dCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc2MvMDAwMS1GaXgtbWF5YmUtdW5pbml0
aWFsaXplZC1lcnJvcnMucGF0Y2ggYi9wYWNrYWdlL29wZW5zYy8wMDAxLUZpeC1tYXliZS11bmlu
aXRpYWxpemVkLWVycm9ycy5wYXRjaAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4
IDAwMDAwMDAwMDAuLjE3ZWY0M2E5ODQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3BhY2th
Z2Uvb3BlbnNjLzAwMDEtRml4LW1heWJlLXVuaW5pdGlhbGl6ZWQtZXJyb3JzLnBhdGNoCj4gPiBA
QCAtMCwwICsxLDgxIEBACj4gPiArRnJvbSBiNzRhNjI0ZjIxZGIzYmZkNDVlMGNiNmVkMDE3Y2Vk
YTlmMjlhZGZjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ID4gK0Zyb206ID0/VVRGLTg/cT9K
b3M9QzM9QTk9MjBQZWtrYXJpbmVuPz0gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29tPgo+ID4g
K0RhdGU6IEZyaSwgMTAgRGVjIDIwMjEgMTM6NTQ6MjYgKzAyMDAKPiA+ICtTdWJqZWN0OiBbUEFU
Q0hdIEZpeCBtYXliZSB1bmluaXRpYWxpemVkIGVycm9ycwo+ID4gK01JTUUtVmVyc2lvbjogMS4w
Cj4gPiArQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04Cj4gPiArQ29udGVu
dC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAo+ID4gKwo+IAo+IEhlcmUgY29tbWl0IGxvZyBpcyBt
aXNzaW5nLiBJbiB0aGUgY2FzZSBpdCBpcyB0cml2aWFsLCBwbGVhc2UgcmVwZWF0IHRoZSBzdW1t
YXJ5IGluIHRoZSBjb21taXQgbG9nIGJvZHksIGxpa2U6Cj4g4oCcRml4IG1heWJlIHVuaW5pdGlh
bGl6ZWQgZXJyb3Jz4oCdCgpBbHNvLCBwbGVhc2Ugc3VibWl0IHRob3NlIGNoYW5nZXMgdXBzdHJl
YW07IGlmIHRoYXQncyBhbHJlYWR5IGRvbmUsIHRoZW4KYWRkIGFuIFVSTCB0byB0aGUgdXBzdHJl
YW0gUFIvTVIuIElmIHRoaXMgaXMgaXMgYSBiYWNrcG9ydCwgdGhlbiBzYXkgc28KYW5kIHBvaW50
IHRvIHRoZSB1cHN0cmVhbSBjb21taXQgKGI3NGE2MjRmMjFkYjNiZmQ0NWUwY2I2ZWQwMTdjZWRh
OWYyOWFkZmMKZG9lcyBub3QgYXBwZWFyIHRvIGJlIGFuIHVwc3RyZWFtIGNvbW1pdCkuCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
