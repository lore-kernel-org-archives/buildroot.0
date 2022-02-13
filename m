Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8040C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 16:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43960403A4;
	Sun, 13 Feb 2022 16:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iePaCPprAaex; Sun, 13 Feb 2022 16:36:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DBF040116;
	Sun, 13 Feb 2022 16:36:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFCAD1BF421
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA9848183D
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 16:36:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdCJ1V9UhZyD for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 16:36:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9BB881836
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 16:36:27 +0000 (UTC)
Received: from smtpclient.apple ([151.46.64.65])
 by Aruba Outgoing Smtp  with ESMTPA
 id JHrNnyvm1ks1JJHrNn0Wwq; Sun, 13 Feb 2022 17:36:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644770186; bh=VBem1Vuk16zphQLSzqgwGebZijYCPZ/Zx6PpCB7U8AU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=NdbyVwSMLUY37W6gaEfKAQkQtJ6eM6H7/TX3PGfV8B5W9JBYoNmaSVmy5khgvSZ8z
 ULtNBmElgh0quvuXw+mYCD5tMphYz3VYpD068to9QqBQLZVo+ChlMMAGACIVnZOKea
 uBMUD/UxeWTt+aqmqvvktoXb05JjbkcAab37+o6x63jMYIVXCFqw24hnPtkhn5NiNd
 gabbFOdiCnGgrinbvNOOiHMsvQboVqoMbPx9nOERszw6pgC3KHOsTi+YvJU4pww+sY
 oUaJ5quZDpZHf596Y1WBHgHAulxqxdXDQeIQwXLMExcFTd491ufD82MdZSQgv9K9Kv
 ErPTrduecLbOg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 13 Feb 2022 17:36:25 +0100
Message-Id: <3FAB3345-1BDE-4A7C-9B17-7F3C986D5D40@benettiengineering.com>
References: <a6b88abf-16bf-3d23-62a9-58ffa41a89d7@mind.be>
In-Reply-To: <a6b88abf-16bf-3d23-62a9-58ffa41a89d7@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19C63)
X-CMAE-Envelope: MS4wfPQmVCX/uiYcQbyCMp6FrvfQ+zKvC2QUCbru+en2rI/Z+b8QEciRfvKJCC5hd+R8Qs0v1FrHCZOLDAXzAqaUL8Hz+1JPpyfVTYpDWT4Q2fBeYvkv2r6z
 kk8vtmQISizHaVZw9oNgAtk+lManbUj8u/WKlOzZN+QqetST5+HgWZ2I3ZtsBl72SLanvG4Q3bJTodmtSjc6XYqtRwBiDP0j/VY542C6YVjHqqbVoH066GOL
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.3.2
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

Cj4gSWwgZ2lvcm5vIDEzIGZlYiAyMDIyLCBhbGxlIG9yZSAxNjozMywgQXJub3V0IFZhbmRlY2Fw
cGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+IAo+IO+7vwo+IAo+PiBPbiAwNi8w
Mi8yMDIyIDIzOjU5LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogR2l1
bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4gCj4g
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KPiAKPj4gLS0tCj4+IFRoaXMgcGF0Y2ggc3VwZXJz
ZWVkcyB0aGlzOgo+PiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRy
b290L3BhdGNoLzIwMjIwMTMxMTc1MzQxLjQwOTE2ODgtMS1naXVsaW8uYmVuZXR0aUBiZW5ldHRp
ZW5naW5lZXJpbmcuY29tLwo+IAo+IElmIHlvdSBtYXJrIGl0IGFzIHN1cGVyc2VkZWQgeW91cnNl
bGYsIHRoZXJlJ3Mgbm8gcmVhbCBuZWVkIHRvIHNheSBpdCBoZXJlLiBCdXQgeW91IHNob3VsZCBw
cm9iYWJseSBoYXZlIGdpdmVuIGl0IGEgdjIuCgpBaCBvaywgSSBkaWRu4oCZdCB0aGluayBhYm91
dCBpdCwgdGhhbmsgeW91IQoKR2l1bGlvCgo+IAo+IFJlZ2FyZHMsCj4gQXJub3V0Cj4gCj4+IC0t
LQo+PiAgcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoIHwgMiArLQo+PiAgcGFja2FnZS9o
YXJmYnV6ei9oYXJmYnV6ei5tayAgIHwgMiArLQo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2hhcmZidXp6
L2hhcmZidXp6Lmhhc2ggYi9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2gKPj4gaW5kZXgg
MTYxNTkzM2E2ZS4uNjFmMjg2NTU2MyAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9oYXJmYnV6ei9o
YXJmYnV6ei5oYXNoCj4+ICsrKyBiL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enouaGFzaAo+PiBA
QCAtMSwzICsxLDMgQEAKPj4gICMgTG9jYWxseSBjb21wdXRlZAo+PiAtc2hhMjU2ICAwYWRhNTBh
MWMxOTliYjZmNzA4NDNhYjg5M2M1NTg2Nzc0M2E0NDNiODRkMDg3ZDU0ZGYwOGFkODgzZWJjMmNk
ICBoYXJmYnV6ei0zLjIuMC50YXIueHoKPj4gK3NoYTI1NiAgMWMxM2JjYTEzNmM0ZjY2NjU4MDU5
ODUzZTJjMTI1M2YzNGM4OGY0YjVjNWFiYTYwNTBhYmE3YjVlMGNlMjUwMyAgaGFyZmJ1enotMy4z
LjIudGFyLnh6Cj4+ICBzaGEyNTYgIDQzNDVlMTczNWY4YmM2ZDgxMmZlZDUxODBjYWJiNWE1ZTg4
YTQxMDlkMzMyNjUyZjJhNDVjMTNjZmE1ZWU2OTIgIENPUFlJTkcKPj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsgYi9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lm1r
Cj4+IGluZGV4IDY3ZWFiMzU5YzYuLjFmNWRmYTg4MjIgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uv
aGFyZmJ1enovaGFyZmJ1enoubWsKPj4gKysrIGIvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5t
awo+PiBAQCAtNCw3ICs0LDcgQEAKPj4gICMKPj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+
ICAtSEFSRkJVWlpfVkVSU0lPTiA9IDMuMi4wCj4+ICtIQVJGQlVaWl9WRVJTSU9OID0gMy4zLjIK
Pj4gIEhBUkZCVVpaX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vaGFyZmJ1enovaGFyZmJ1enov
cmVsZWFzZXMvZG93bmxvYWQvJChIQVJGQlVaWl9WRVJTSU9OKQo+PiAgSEFSRkJVWlpfU09VUkNF
ID0gaGFyZmJ1enotJChIQVJGQlVaWl9WRVJTSU9OKS50YXIueHoKPj4gIEhBUkZCVVpaX0xJQ0VO
U0UgPSBNSVQsIElTQyAodWNkbiBsaWJyYXJ5KQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
