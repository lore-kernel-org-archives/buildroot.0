Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C80C77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 15:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CC7341920;
	Sun,  7 May 2023 15:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CC7341920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMu-3Qzc5GoR; Sun,  7 May 2023 15:51:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB7434190F;
	Sun,  7 May 2023 15:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB7434190F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BAA31BF2F7
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 15:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5113B83B25
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 15:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5113B83B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-4HWbvsXjKG for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 15:51:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B864583B13
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B864583B13
 for <buildroot@uclibc.org>; Sun,  7 May 2023 15:51:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 92D6D19F731;
 Sun,  7 May 2023 17:51:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 17:51:03 +0200
Date: Sun, 7 May 2023 17:51:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507155103.GY252090@scaer>
References: <20230506160524.2231307-1-bernd.kuhls@t-online.de>
 <20230506160524.2231307-2-bernd.kuhls@t-online.de>
 <20230507105218.GH252090__6425.69195931486$1683456775$gmane$org@scaer>
 <pan$8f26f$e0484769$516297af$9e67e51c@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$8f26f$e0484769$516297af$9e67e51c@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683474665;
 bh=B8hrk/yo31AYXUN/+cwlrS047c1ltxB8wdBXgvQnk04=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dXGv+Y/xfMJXxuxy6LOaQ/lmipWBkbZhvsIabeeioCEWr4HCYxoN3pWS9eDCthbNZ
 VH+S3E9aOewZo0R0WiUiEEUI03yuNuVp5jOvAMoPeK7xCqeDaUcAcVngmflY5CPBKn
 gAsP2ZjihxH4wqD2PLveTIoUDrHEV4WgL7qmTOfKZiNG9PxdvzmXWIFincKmOlqNJJ
 ujEtpcboodaZDYxljx8se8ueoGe7HOOgURzh93N2uWF+u5QgzmUUVvGbtih42k3qJP
 ALpxPBG2RQZQXSh4ErtDeUYVqE2Qpog6MMgHZLaeOmVJraMgM3HUlyu15k1TXKyK9D
 2GlF3DsEX6uhQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dXGv+Y/x
Subject: Re: [Buildroot] [PATCH v2 2/2] package/transmission: bump version
 to 4.0.3
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQsIEFsbCwKCk9uIDIwMjMtMDUtMDcgMTc6MDYgKzAyMDAsIEJlcm5kIEt1aGxzIHNwYWtl
IHRodXNseToKPiBBbSBTdW4sIDcgTWF5IDIwMjMgMTI6NTI6MTggKzAyMDAgc2NocmllYiBZYW5u
IEUuIE1PUklOOgo+ID4+IFJlbW92ZWQgdGhlIG9wdGlvbiB0byBkaXNhYmxlIHVUUCBzdXBwb3J0
LCBmb3IgZGV0YWlscyBzZWUgdXBzdHJlYW0gCj4gaXNzdWU6Cj4gPj4gaHR0cHM6Ly9naXRodWIu
Y29tL3RyYW5zbWlzc2lvbi90cmFuc21pc3Npb24vaXNzdWVzLzQ3NTEKPiA+IFRoZSBvcHRpb24g
aXMgc3RpbGwgcHJlc2VudCwgc28gd2h5IHdvdWxkIHdlIHdhbnQgdG8gcmVtb3ZlIGl0Pwo+ID4g
ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS90cmFuc21pc3Npb24vdHJhbnNtaXNzaW9uL2Jsb2IvbWFp
bi9DTWFrZUxpc3RzLnR4dAo+ID4gICAgIDU3ICBvcHRpb24oRU5BQkxFX1VUUCAiQnVpbGQgwrVU
UCBzdXBwb3J0IiBPTikKPiBiZWNhdXNlIGJ1aWxkaW5nIHdpdGhvdXQgdXRwIHN1cHBvcnQgaXMg
YnJva2VuOgo+IC0tIENvbmZpZ3VyaW5nIGRvbmUKPiBDTWFrZSBFcnJvciBhdCBsaWJ0cmFuc21p
c3Npb24vQ01ha2VMaXN0cy50eHQ6MjczICh0YXJnZXRfbGlua19saWJyYXJpZXMpOgo+ICAgVGFy
Z2V0ICJ0cmFuc21pc3Npb24iIGxpbmtzIHRvOgo+IAo+ICAgICBsaWJ1dHA6OmxpYnV0cAo+IAo+
ICAgYnV0IHRoZSB0YXJnZXQgd2FzIG5vdCBmb3VuZC4gIFBvc3NpYmxlIHJlYXNvbnMgaW5jbHVk
ZToKPiAKPiBsaWJ1dHAgaXMgcmVxdWlyZWQgYnkgaHR0cHM6Ly9naXRodWIuY29tL3RyYW5zbWlz
c2lvbi90cmFuc21pc3Npb24vYmxvYi8KPiAwZDNiMzIxYmFjYTJjZDAyY2M0YjIwMTgyNmFlZDJi
NDg1ZTM3YzNmL2xpYnRyYW5zbWlzc2lvbi8KPiBDTWFrZUxpc3RzLnR4dCNMMjg1Cj4gCj4gVGhp
cyB3YXMgZGlzY3Vzc2VkIHVwc3RyZWFtIGluIHRoZSBmb3JlbWVudGlvbmVkIGlzc3VlIDQ3NTEK
PiBodHRwczovL2dpdGh1Yi5jb20vdHJhbnNtaXNzaW9uL3RyYW5zbWlzc2lvbi9pc3N1ZXMvCj4g
NDc1MSNpc3N1ZWNvbW1lbnQtMTQ2NDI4NDU4NQo+ICIuLi4gYnV0IGFzIGEgcHJhY3RpY2FsIG1h
dHRlciwgbm8gZGlzdHJvcyBhcmUgZ29pbmcgdG8gZGlzYWJsZSBVVFAgCj4gc3VwcG9ydC4gU28g
SSBkb24ndCBzZWUgYW4gYXVkaWVuY2UgZm9yIHRoaXMgYnVpbGQgb3B0aW9uLiIKCkkgZGlkIHJl
YWQgdGhlIHRocmVhZCB5b3UgbWVudGlvbmVkLCBiIGVmb3JlIEkgcmVwbGllZC4gQnV0IG5vd2hl
cmUgaW4KdGhhdCB0aHJlYWQgaXMgaXQgbWVudGlvbm5lZCB0aGF0IHRoZSBvcHRpb24gdG8gYnVp
bGQgd2l0aG91dCB3YXMKYWN0dWFsbHkgcmVtb3ZlZCwgcXVpdGUgdGhlIG9wcG9zaXRlIGluIGZh
Y3QuCgpGaXJzdCwgQHJlYXJkb25pYSBhcmd1ZWQgZm9yIGtlZXBpbmcgdGhlIG9wdGlvbiB0byBi
dWlsZCB3aXRob3V0IGxpYnV0cDoKCiAgICBodHRwczovL2dpdGh1Yi5jb20vdHJhbnNtaXNzaW9u
L3RyYW5zbWlzc2lvbi9pc3N1ZXMvNDc1MSNpc3N1ZWNvbW1lbnQtMTQyNjU0ODU3MgoKICAgIFN0
cm9uZ2x5IHByZWZlciB0aGUgV0lUSF9VVFAgLyBFTkFCTEVfVVRQIG9wdGlvbi4gRm9yIGEgdmFy
aWV0eSBvZgogICAgc2FmZXR5IGlzc3VlcywgcGFydGljdWxhcmx5IHdpdGggcmVzcGVjdCB0byBw
cml2YXRlIHRyYWNrZXJzLCBpdCdzCiAgICBnb29kIHRvIGtlZXAgdGhpcyBkaXNhYmxlZCBhbmQg
cmVkdWNlIGF0dGFjayBzdXJmYWNlLWFyZWEuCgpBbmQgZXZlbnR1YWxseSwgQGNrZXJyIChhIG1h
aW50YWluZXIsIEknZCB3YWdlciksIHNlZW1lZCB0byBjaGFuZ2UgdGhlaXIKbWluZCBhbmQgYWNj
ZXB0IEByZWFyZG9uaWEncyByZXF1ZXN0OgoKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS90cmFuc21p
c3Npb24vdHJhbnNtaXNzaW9uL2lzc3Vlcy80NzUxI2lzc3VlY29tbWVudC0xNDY0Mjg0NTg1Cgog
ICAgQHJlYXJkb25pYSBoYXMgZG9uZSBhIGxvdCBvZiBnb29kIHBhdGNoZXMgYW5kIHRoYXQgc3dl
YXQgZXF1aXR5CiAgICBtYWtlcyBtZSBsb29rIG9uIHRoaXMgaWRlYSBtb3JlIGZhdm9yYWJseS4K
CkFuZCBmaW5hbGx5LCBvciBjb21wbGV0ZW5lc3MsIGhlcmUncyB0aGUgcmVzdCBvZiB0aGUgZnVs
bCBjb21tZW50IHlvdQpwYXJ0aWFsbHkgcXVvdGVkOgoKICAgIGJ1dCBhcyBhIHByYWN0aWNhbCBt
YXR0ZXIsIG5vIGRpc3Ryb3MgYXJlIGdvaW5nIHRvIGRpc2FibGUgVVRQCiAgICBzdXBwb3J0LiBT
byBJIGRvbid0IHNlZSBhbiBhdWRpZW5jZSBmb3IgdGhpcyBidWlsZCBvcHRpb24uIEFuZCBpZgog
ICAgdGhhdCdzIHRoZSBjYXNlLCBJREsgaWYgaXQgbWFrZXMgc2Vuc2UgdG8gaGF2ZSBpdCBpbiB0
cmFuc21pc3Npb24KICAgIC90cmFuc21pc3Npb24uCgpJLmUuIHRoZXJlIGlzIG5vIGV4cGxpY2l0
IGVuZG9yc2VtZW50IGluIHRoYXQgdGhyZWFkLCB0aGF0IHRoZSBvcHRpb24KaGFzIHRvIGJlIHJl
bW92ZWQgb3Igbm90LCBhbmQgd2hldGhlciBpdCB3YXMgcmVtb3ZlZCBvciBub3QuCgpBbmQgaW4g
dGhhdCBDTWFrZUxpc3RzLnR4dCwgb25lIGNhbiBhbHNvIHNlZToKCiAgICB0cl9hbGxvd19jb21w
aWxlX2lmKAogICAgICAgIC4uLgogICAgICAgIFs9W1tFTkFCTEVfVVRQXV09XQogICAgICAgICAg
ICB0ci11dHAuY2MKICAgICAgICAuLi4KCiAgICB0YXJnZXRfY29tcGlsZV9kZWZpbml0aW9ucygk
e1RSX05BTUV9CiAgICAgICAgUFJJVkFURQogICAgICAgICAgICAuLi4KICAgICAgICAgICAgJDwk
PEJPT0w6JHtFTkFCTEVfVVRQfT46V0lUSF9VVFA+CiAgICAgICAgICAgIC4uLgoKQW5kIGFsbCB0
aGF0IHNlZW0gdG8gaW5kaWNhdGUgdGhhdCBVVFAgc3VwcG9ydCBpcyBzdGlsbCBvcHRpb25hbC4u
LgoKQW5kIGluZGVlZCwgdGhlIGNtYWtlIG9wdGlvbiBpcyBzdGlsbCB0aGVyZSAoYXMgSSBwb2lu
dGVkIG91dCksIGJ1dCB0aGUKYnVpbGQgaXMgYnJva2VuIChhcyB5b3UgcG9pbnRlZCBvdXQpLgoK
U28sIG1heWJlIHRoZSBidWlsZCBpc3N1ZSBpcyByZWFsbHkgYSBidWc/CgpJbiBhbnkgY2FzZSwg
anVzdCBzdGF0ZSBzb21ldGhpbmcgbGlrZSB0aGF0IGluIHRoZSBjb21taXQgbG9nOgoKICAgIEV2
ZW4gaWYgdGhlIGNvZGUgc2VlbSB0byBpbmRpY2F0ZSB0aGF0IGJ1aWxkaW5nIHdpdGhvdXQgbGli
dXRwIG9yCiAgICBkaXNhYmxpbmcgVVRQIGlzIHBvc3NpYmxlLCB0aGlzIGNhdXNlIGJ1aWxkIGZh
aWx1cmVzLCBzbyBqc3V0IG1ha2UKICAgIFVUUCBtYW5kYXRvcnkuCgpPdGhlcndpc2UsIGFsbCB0
aGlzIGlzIGNvbmZ1c2luZy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IEdldHRpbmcgcmlk
IG9mIHRoZSBsaWJ1dHAgZGVwZW5kZW5jeSBpbiBsaWJ0cmFuc21pc3Npb24gd2FzIHJlamVjdGVk
IGJ0dzoKPiBodHRwczovL2dpdGh1Yi5jb20vdHJhbnNtaXNzaW9uL3RyYW5zbWlzc2lvbi9wdWxs
LzQ4ODIvCj4gCj4gUmVnYXJkcywgQmVybmQKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4g
TU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBj
b25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAv
IENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAt
LS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5v
ICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJ
TCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
