Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051EDC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 20:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 681774024E;
	Tue,  8 Feb 2022 20:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z4hzgDWTNfps; Tue,  8 Feb 2022 20:00:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77760402FA;
	Tue,  8 Feb 2022 20:00:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44B271BF8C7
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3203E4062A
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 20:00:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6ZduGV-G8Lh for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 20:00:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41B5740641
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 20:00:38 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HWfEnbUtBkz4hHWfFny1xH; Tue, 08 Feb 2022 21:00:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644350437; bh=aWyrdxK4+4/z11YmyJbi4REBdrcTJ3mu1iF57rO50Mk=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=FQCRAf12OG7WsEwxnAzk5ptx9nrzPX2vtJWWg7Dp1ELbYnHquCpYcDvhoOcdCRDER
 8d1DlvJCEQQxaeEU35gcqBLZLsW/vJY9jWdeR5pAe6dizsh43Zf/QC2/yKgbe+MdOT
 mQH8LdPGsF4jVv8NxcjC6l9cLXtCl91PWzRHYC/hDtgT99W20MmLwTRL36+k1mHV0f
 NXJ1HlZH+D4ZsiWfgeMOc+qyQu8egewXQgvhY8nqELb1bNwfxSnPf+swDq6Ro/KoZ3
 iJ/fHN2iZY0FZNPLpvlrfqD+HPPuHZMR8icJzdzA71GiV5talWBt/Z9JhhS/GrTQ5l
 tucHx6BlY3Mbg==
Message-ID: <41eaa6a2-6053-7671-1ff7-b8dd191263ba@benettiengineering.com>
Date: Tue, 8 Feb 2022 21:00:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <98670320-83fa-c6e9-9bc4-aa30d9deb6ff@mind.be>
 <34C01EB2-BB12-4DE4-BC53-0141B5DF491D@benettiengineering.com>
 <f1d2404e-a93d-c0e9-6c1d-a33a011fa1d4@benettiengineering.com>
In-Reply-To: <f1d2404e-a93d-c0e9-6c1d-a33a011fa1d4@benettiengineering.com>
X-CMAE-Envelope: MS4wfFZUR6mlYv4PLQ/8BTStvPx13k+ydNTU+d+UaLF1rSmCy3RsnPY2ss/GJrZQPWrDdtEPe7yLOT/vD8IIk8cr7cQ/uobAuJyeCBL9781F392mKzp9la1T
 uChbQh3LDjbXvE9QwadIIiFkFVT8h/bF6IeRcGf4NKKcGoRUBtxDMibbuYTaWNsoMVxuaLRirlWijQsi3tjwHnkJoZa//Ecw+Br5UEAbNdMScR4vXNxQUye3
Subject: Re: [Buildroot] [PATCH] board/pc: fix build failure due to new
 genimage 15
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMDUvMDIvMjIgMTg6NDAsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhp
IGFnYWluIEFybm91dCwKPiAKPiBPbiAwNS8wMi8yMiAxNjozNiwgR2l1bGlvIEJlbmV0dGkgd3Jv
dGU6Cj4+IEhpIEFybm91dCwKPj4KPj4+IElsIGdpb3JubyA1IGZlYiAyMDIyLCBhbGxlIG9yZSAx
NToxMSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiBoYSBzY3JpdHRvOgo+
Pj4KPj4+IO+7vyBIaSBHaXVsaW8sCj4+Pgo+Pj4+IE9uIDA0LzAyLzIwMjIgMDE6NTYsIEdpdWxp
byBCZW5ldHRpIHdyb3RlOgo+Pj4+IEFjdHVhbGx5IGdlbmltYWdlIGZhaWxzIHRvIGNyZWF0ZSBm
aW5hbCBpbWFnZSB3aXRoOgo+Pj4+IGBgYAo+Pj4+IEVSUk9SOiBoZGltYWdlKGRpc2suaW1nKTog
cGFydGl0aW9uIFtNQlJdIChvZmZzZXQgMHgxYjgsIHNpemUgMHg0OCkgb3ZlcmxhcHMgcHJldmlv
dXMgcGFydGl0aW9uIGJvb3QgKG9mZnNldCAweDAsIHNpemUgMHgyMDApCj4+Pj4gRVJST1I6IGhk
aW1hZ2UoZGlzay5pbWcpOiBib290bG9hZGVycywgZXRjLiB0aGF0IG92ZXJsYXAgd2l0aCB0aGUg
cGFydGl0aW9uIHRhYmxlIG11c3QgZGVjbGFyZSB0aGUgb3ZlcmxhcHBpbmcgYXJlYSBhcyBhIGhv
bGUuCj4+Pj4gYGBgCj4+Pj4gVGhpcyBpcyBiZWNhdXNlIGdlbmltYWdlIDE1IGlzIGxlc3MgcGVy
bWlzc2l2ZSB0aGFuIGJlZm9yZSwgc28gbGV0J3MgYWRkCj4+Pj4gaG9sZXMgPSB7Iig0NDA7IDUx
MikifSB0byBsZWF2ZSByb29tIHRvIE1CUi4KPj4+PiBGaXhlczoKPj4+PiBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzE4NjU5MzUyNDkKPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBib2FyZC9wYy9nZW5pbWFnZS1iaW9zLmNmZyB8IDEg
Kwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pj4+IGRpZmYgLS1naXQg
YS9ib2FyZC9wYy9nZW5pbWFnZS1iaW9zLmNmZyBiL2JvYXJkL3BjL2dlbmltYWdlLWJpb3MuY2Zn
Cj4+Pj4gaW5kZXggMjZkMTJkOWFiMy4uNTQwMjZmNjUyNyAxMDA2NDQKPj4+PiAtLS0gYS9ib2Fy
ZC9wYy9nZW5pbWFnZS1iaW9zLmNmZwo+Pj4+ICsrKyBiL2JvYXJkL3BjL2dlbmltYWdlLWJpb3Mu
Y2ZnCj4+Pj4gQEAgLTcsNiArNyw3IEBAIGltYWdlIGRpc2suaW1nIHsKPj4+PiAgICAgICAgICAg
IGltYWdlID0gImJvb3QuaW1nIgo+Pj4+ICAgICAgICAgICAgb2Zmc2V0ID0gMAo+Pj4+ICAgICAg
ICAgICAgc2l6ZSA9IDUxMgo+Pj4+ICsgICAgICAgIGhvbGVzID0geyIoNDQwOyA1MTIpIn0KPj4+
Cj4+PiBIYXZlIHlvdSB0ZXN0ZWQgdGhpcyBjaGFuZ2Ugb24gYW4gYWN0dWFsIGJvYXJkIChpLmUu
IGEgUEMgOi0pPwo+Pgo+PiBJ4oCZdmUgdGVzdGVkIGl0IHdpdGggcWVtdSBhbmQgaXQgYm9vdHMg
dGhlIGtlcm5lbCBjb3JyZWN0bHkodGhhdCBpcyBpbiByb290ZnMpLCBvbmx5IHRoaW5nIGlzIHRo
YXQgaXQgY2Fu4oCZdCBtb3VudCB0aGUgcm9vdGZzIGFuZCBJIGRvbuKAmXQgdW5kZXJzdGFuZCB3
aHkuCj4+IEkgd2FudGVkIHRvIGFzayBhYm91dCB0aGlzIGJ1dCBJ4oCZdmUgZ290IGxvc3QgYW1v
bmcgYWxsIHRoZSBvdGhlciBwYXRjaGVzIDotKQo+IAo+IEkndmUgY29tcGFyZWQgdGhlIDIgZGlz
ay5pbWcgZmlsZXMsIG9uZSBnZW5lcmF0ZWQgd2l0aCBnZW5pbWFnZSAxNAo+IHdpdGhvdXQgImhv
bGVzLi4uIiBhbmQgdGhlIG90aGVyIGdlbmVyYXRlZCB3aXRoIGdlbmltYWdlIDE1IGFuZCB0aGV5
IGFyZQo+IHRoZSBzYW1lLgo+IAo+IFRoZSBwcm9ibGVtIGhlcmUgaXMgbm90IHRoYXQgaXQgY2Fu
J3QgbW91bnQgdXNpbmcgcWVtdSwgYnV0IGl0IGRvZXNuJ3QKPiBzaG93IHRoZSBzaGVsbC4KPiAK
PiBIZXJlIGlzIHRoZSBxZW11IGNvbW1hbmQ6Cj4gcWVtdS1zeXN0ZW0teDg2XzY0IC1NIHBjIC1k
cml2ZQo+IGZpbGU9aW1hZ2VzL2Rpc2suaW1nLGlmPXZpcnRpbyxmb3JtYXQ9cmF3IC1uZXQgbmlj
LG1vZGVsPXZpcnRpbyAtbmV0IHVzZXIKPiAKPiBhbmQgdGhpcyBpcyB0aGUgb3V0cHV0Ogo+IGh0
dHBzOi8vaW1ndXIuY29tL2EvZmZaQmxKUgo+IAo+IFNvIGl0IHNlZW1zIGxpa2UgYSBidXN5Ym94
L2luaXQgc3lzdGVtIGlzc3VlIHdpdGggdHR5MS4gSSdtIGRpZ2dpbmcuCgpJJ3ZlIGZvdW5kIHRo
ZSBwcm9ibGVtLiBVc2luZyB0aGUgZ3J1Yi5jZmcgYXMgaXQgaXMocm9vdD0vZGV2L3NkYTEpIAp3
b3JrcyBvbmx5IHdpdGggVmlydHVhbGJveCBidXQgbm90IHdpdGggUWVtdSB0aGF0IG5lZWRzIHMv
c2RhMS92ZGExLgoKQnV0IGl0J3Mgbm90IHNvIHdlbGwgZXhwbGFpbmVkIGluIHJlYWRtZS50eHQs
IHNvIEknbSBnb2luZyB0byBzZW5kIGEgCnBhdGNoIGZvciB0aGF0LgoKU28gSSBjYW4gZ2l2ZSBh
OgpUZXN0ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgpbR2l1bGlvOiB0ZXN0ZWQgc3VjY2Vzc2Z1bGx5IHdpdGggUWVtdSBhbmQgVmly
dHVhbGJveF0KCkJlc3QgcmVnYXJkcwotLSAKR2l1bGlvIEJlbmV0dGkKQmVuZXR0aSBFbmdpbmVl
cmluZyBzYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
