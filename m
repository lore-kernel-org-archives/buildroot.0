Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4ACD6AAEC
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 18:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD7040EFC;
	Thu,  2 Apr 2026 18:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QeL3MWDeU9P9; Thu,  2 Apr 2026 18:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E76764101C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775155646;
	bh=L2+4rcNwFW2YAQkriRN4tsZDM6uYpn/YCtXGunkq/c4=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pc4uAYMSLeM2M3VZn/AY1n37x7dwwdJYrL2hggt/ksVzFRzbLX3itXoTNRn9P82wB
	 4PUUl2sfp516eK9bjlhQHSNsEFgqyu57Gle06tRx8OB0vAHhnoXgV1qrQIUt6BMt4C
	 aAVqC75TPd0hWlIU05iOHlwpHjMGVy06G/UsSbVMUvCqVSst/fSOXb0Om0FI6t9nKk
	 9ORKn2K2Y1nPDPR31Pi5zxL3S2Iyt5Efga5H/MXIN7Fn+syN5tMw2v8fpdJZ/340Hh
	 VwUDwVOcIdtqUlv77gGc8WLDCSC4XpJL763r6AOeibOKRfCPAiqL8PlQ06+9Mcq/Jj
	 iGUbg9Z6BOLkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76764101C;
	Thu,  2 Apr 2026 18:47:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 777282D3
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D554401E0
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:47:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAotFFk4WKIT for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 18:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.149;
 helo=smtpdh19-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1BB37400BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1BB37400BE
Received: from smtpdh19-2.aruba.it (smtpdh19-2.aruba.it [62.149.155.149])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1BB37400BE
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 18:47:20 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 8N4XwHzH6clBZ8N4XwTSlF; Thu, 02 Apr 2026 20:47:17 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 2 Apr 2026 20:47:16 +0200
Message-Id: <65D304EF-DDB8-498C-AF36-1AE569200657@benettiengineering.com>
References: <20260402180419.2780025-1-bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260402180419.2780025-1-bernd@kuhls.net>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailer: iPhone Mail (23E246)
X-CMAE-Envelope: MS4xfKn6LAXTdS7Z6bSHRHjWSefi6SWkZ9+2F+LkFFD4APZl7Thh6jJk5mdNofxh1Xc5JUnQaTrry8nTgxJy/mZyMRXGIkmRHxS4x5nT1R1dCz6k9cm4R4w6
 os1Y5Vhxe8/0jviUrU5wOv3oMTDD0Ev/SlHZ2vVEyESGkvPsBzr/Y3VYR8yf51+8uBL/UUyEeeB6qHGZXs8+0Zu67whdaGLJXMx0ekAjKCuA0r7PjHOJRQH7
 md7BRqRW/WbPGSGiNWtaoQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775155637; bh=3+LtZkaOKr8KNpLG3TVXnek4lIvPwg5lgwJ5RuzZlxs=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=n1MXFx3Q+c1b/N6dIBdpu29C31YJxdqOh8zIolSAIxT4DD7JAcwLrQjgi/BADhZ3N
 Lp1X2w2m40oqSh/U4SJbBAjYafFKF2QJUdd9YEJc/K/R0URsK6gwOLesjtUv2G1OmB
 gDsXMqwWJxIfa0x832PvkDq0BpUmNFTOy9njTyJJbNNFZpN+QziBUYbgplAIvOm0JL
 EP2KoEny7ry9HZnf/+SRAS1Fj1LCCtHp5uyZpKxUjdD3Yca2frZG+mZdaiWNRXFN81
 nGx1821lsWaOKm75zOnEDF0zpXjXQ/Zb4wonn5NEbPVTURIMAUNex+lmCJqHknMv9y
 qjeVw+o/kx8BQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=n1MXFx3Q
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: bump version to 14.0.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpzaW5jZSB0aGlzIGlzIGEgbWFqb3IgdmVyc2lvbiBjaGFuZ2UgaGF2ZSB5b3Ug
YnVpbHQgaGFyZCBidXp6IHdpdGggYWxsIHBhY2thZ2VzIHRoYXQgZGVwZW5kIG9uIGl0IGFzIEni
gJl2ZSBhbHdheXMgZG9uZSBpbiB0aGUgcGFzdD8KCknigJltIGRvaW5nIGl0IHJpZ2h0IG5vdyBv
biBteSBwYyB0byBzZW5kIHRoZSBwYXRjaC4KCkdpdWxpbyBCZW5ldHRpCgo+IElsIGdpb3JubyAy
IGFwciAyMDI2LCBhbGxlIG9yZSAyMDowNCwgQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4g
aGEgc2NyaXR0bzoKPiAKPiDvu79odHRwczovL2dpdGh1Yi5jb20vaGFyZmJ1enovaGFyZmJ1enov
YmxvYi8xNC4wLjAvTkVXUwo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBr
dWhscy5uZXQ+Cj4gLS0tCj4gcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoIHwgNCArKy0t
Cj4gcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tayAgIHwgMiArLQo+IDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2ggYi9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lmhh
c2gKPiBpbmRleCA4NjQyMzg3MzkyLi42MjZlZDdiN2Q0IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
aGFyZmJ1enovaGFyZmJ1enouaGFzaAo+ICsrKyBiL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enou
aGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL2hhcmZi
dXp6L2hhcmZidXp6L3JlbGVhc2VzL3RhZy8xMy4yLjEKPiAtc2hhMjU2ICA2Njk1ZGEzZWI3ZTFi
ZTBhYTMwOTJmZTRkODE0MzNhMzNiNDdmNDUxOTI1OWM3NTlkNzI5ZTNhOWE1NWMxNDI5ICBoYXJm
YnV6ei0xMy4yLjEudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vaGFyZmJ1enov
aGFyZmJ1enovcmVsZWFzZXMvdGFnLzE0LjAuMAo+ICtzaGEyNTYgIGQ0YWEzMTI3MjgxMzZlM2Rj
N2MzY2RhNDdiODcxNjE0Y2UwZDEyYmJiMTlmOWRjYWMyZWE3MGRlODM2ZGMzMDcgIGhhcmZidXp6
LTE0LjAuMC50YXIueHoKPiAjIExvY2FsbHkgY29tcHV0ZWQKPiBzaGEyNTYgIGJhOGY4MTBmMjQ1
NWMyZjA4ZTJkNTZiYjQ5YjcyZjM3ZmNmNjhmMWY0ZmFkZTM4OTc3Y2ZkNzM3MjA1MGFkNjQgIENP
UFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tayBiL3BhY2th
Z2UvaGFyZmJ1enovaGFyZmJ1enoubWsKPiBpbmRleCBkZjA1NTk2YjFkLi5hZWY4NjgxYTEzIDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsKPiArKysgYi9wYWNrYWdl
L2hhcmZidXp6L2hhcmZidXp6Lm1rCj4gQEAgLTQsNyArNCw3IEBACj4gIwo+ICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4gCj4gLUhBUkZCVVpaX1ZFUlNJT04gPSAxMy4yLjEKPiArSEFSRkJVWlpf
VkVSU0lPTiA9IDE0LjAuMAo+IEhBUkZCVVpaX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vaGFy
ZmJ1enovaGFyZmJ1enovcmVsZWFzZXMvZG93bmxvYWQvJChIQVJGQlVaWl9WRVJTSU9OKQo+IEhB
UkZCVVpaX1NPVVJDRSA9IGhhcmZidXp6LSQoSEFSRkJVWlpfVkVSU0lPTikudGFyLnh6Cj4gSEFS
RkJVWlpfTElDRU5TRSA9IE1JVCwgSVNDICh1Y2RuIGxpYnJhcnkpCj4gLS0KPiAyLjQ3LjMKPiAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
