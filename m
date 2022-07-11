Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470ADC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Jul 2022 16:56:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D42018305A;
	Mon, 11 Jul 2022 16:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D42018305A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5xAxbdGzm37; Mon, 11 Jul 2022 16:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5CC382F31;
	Mon, 11 Jul 2022 16:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5CC382F31
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 234991BF21A
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 16:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7D6B405BC
 for <buildroot@lists.busybox.net>; Mon, 11 Jul 2022 16:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7D6B405BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BMP3YWI-0GDn for <buildroot@lists.busybox.net>;
 Mon, 11 Jul 2022 16:56:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5DDE40917
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5DDE40917
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 16:56:33 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 03FAE1BF209
 for <buildroot@buildroot.org>; Mon, 11 Jul 2022 16:56:31 +0000 (UTC)
Message-ID: <5fe83aba-5df9-3f63-9e84-59ef5ea6d0fb@korsgaard.com>
Date: Mon, 11 Jul 2022 18:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <48ac54a1-f946-8f98-42e4-e39d2ab7130d@synopsys.com>
 <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <6592891c-1b2d-d1cb-f34b-3e96f23e74cb@mind.be>
Subject: Re: [Buildroot] [PATCH] package/bpftool: add a patch to fix cross
 compilation
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTMvMDYvMjAyMiAyMi4yMSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4gCj4gCj4g
T24gMTAvMDYvMjAyMiAxNTozMywgU2hhaGFiIFZhaGVkaSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
PiBJZiBvbiB0aGUgaG9zdCBtYWNoaW5lIHRoZSAiY28tcmUiIGlzIHN1cHBvcnRlZCwgYnBmdG9v
bCB3aWxsCj4+IGJ1aWxkIGEgYm9vdHN0cmFwIHZlcnNpb24gb2YgaXRzZWxmIGFzIHdlbGwuIElu
IHRoYXQgY2FzZSwgdGhlCj4+IGNyb3NzIGNvbXBpbGF0aW9uIGNhbiBmYWlsLiBUaGlzIGNvbW1p
dCBhZGRzIGEgcGF0Y2ggdG8gcmVtZWR5Cj4+IHRoYXQuIFRoZSBmaXggdGhhdCB5b3Ugc2VlIGhl
cmUgaXMgYWxyZWFkeSB1cHN0ZWFtZWQgWzFdLgo+Pgo+PiBbMV0KPj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnBmLzE2NTQ3NzY2MTI3Mi4xMTM0Mi4xMzAxNTc3NzQxMDQxNzYxMjQ3Ny5naXQt
cGF0Y2h3b3JrLW5vdGlmeUBrZXJuZWwub3JnL1QvI3QgCj4+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IFNoYWhhYiBWYWhlZGkgPHNoYWhhYkBzeW5vcHN5cy5jb20+Cj4+IC0tLQo+PiDCoCBwYWNrYWdl
L2JwZnRvb2wvMDAwMS1maXgtYm9vdHNyYXAucGF0Y2ggfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4+IMKgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2JwZnRvb2wvMDAwMS1maXgtYm9vdHNyYXAucGF0Y2gKPj4K
Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvYnBmdG9vbC8wMDAxLWZpeC1ib290c3JhcC5wYXRjaCAK
Pj4gYi9wYWNrYWdlL2JwZnRvb2wvMDAwMS1maXgtYm9vdHNyYXAucGF0Y2gKPj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uMDNmNDIzMWNjYQo+PiAtLS0gL2Rldi9u
dWxsCj4+ICsrKyBiL3BhY2thZ2UvYnBmdG9vbC8wMDAxLWZpeC1ib290c3JhcC5wYXRjaAo+PiBA
QCAtMCwwICsxLDMyIEBACj4+ICtUaGlzIGlzIGFuIGFkYXB0ZWQgdmVyc2lvbiBvZiBhbiB1cHN0
cmVhbWVkIHBhdGNoIFsxXSwgZWxzZSBpdCB3b24ndCBiZQo+PiArcG9zc2libGUgdG8gY3Jvc3Mg
Y29tcGlsZSBicGZ0b29sIGlmICJjbGFuZy1icGYtY28tcmUiIGZlYXR1cmUgaXMgCj4+IGVuYWJs
ZWQuCj4+ICsKPj4gK1sxXSBicGZ0b29sOiBGaXggYm9vdHN0cmFwcGluZyBkdXJpbmcgYSBjcm9z
cyBjb21waWxhdGlvbgo+PiAraHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzhkMjk3ZjBjLWNm
ZDAtZWY2Zi0zOTcwLTZkZGRiM2Q5YTg3YUBzeW5vcHN5cy5jb20vdC8jdSAKPj4KPiAKPiAgwqBU
aGUgcGF0Y2ggZmlsZSBzaG91bGQgYmUgZ2l0LWZvcm1hdHRlZCBhbmQgaGF2ZSB5b3VyIFNpZ25l
ZC1vZmYtYnkuIEkgCj4gc2ltcGx5IHRvb2sgdGhlIHBhdGNoIGZyb20gWzFdICh3aGljaCBoYXMg
eW91ciBzaWdub2ZmKSBhbmQgYWRkZWQgdGhlIAo+IGFkZGl0aW9uYWwgTWFrZWZpbGUuaW5jbHVk
ZSBjaGFuZ2VzIChvZiB3aGljaCBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIAo+IEJUVyB3aHkg
dGhleSdyZSByZWxldmFudCBmb3IgQnVpbGRyb290KS4KCkNvbW1pdHRlZCB0byAyMDIyLjAyLngg
YW5kIDIwMjIuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
