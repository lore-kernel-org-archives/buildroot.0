Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35522C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 16:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92B9B409ED;
	Tue, 23 Aug 2022 16:40:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92B9B409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIRpsP54Kn4S; Tue, 23 Aug 2022 16:40:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D1AF40992;
	Tue, 23 Aug 2022 16:40:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D1AF40992
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6A11BF300
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 16:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62BFB819B8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 16:40:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62BFB819B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFEAqwr42nBr for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 16:40:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECA3081971
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECA3081971
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 16:40:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a5cb:81c2:970c:cd58])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3E6422003CA;
 Tue, 23 Aug 2022 18:40:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Aug 2022 18:40:40 +0200
Date: Tue, 23 Aug 2022 18:40:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thierry GUIBERT <thierry.guibert@free.fr>
Message-ID: <20220823164040.GH2167049@scaer>
References: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38884503-637d-7c23-5a02-be8f8c3a522a@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661272843;
 bh=m0mjHeqTyBz/i1vz+HVbXFjPOEmWXnqjnA4ifGubaxQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZjepwfiQS9Q7WfGg5qQCVqTbZKISSzCZBwlwFUasql89RYqNRU+T3W3P4tBsNm1qN
 Euz29kQBe6k+fho8KelBFdLKF6wFf1WgxVAE3R3BXy7ZXTLzP6v3quDy9haO0g+Ri6
 URH/AtrzV8YXv4ArEmpMhmMh1qvnH8T6Z7iJkk1k/waccHB8lkoZF0LCwaZf4GQ8EC
 VVWmf/V2QTajiRzdvD1Opj+OmccHbIdsrq9E79bdrztaH9BAeAWXzHwlwnbHsrQCrP
 rIGm+SYr3hfSXNEs/P92974vmfCXyrdIikpuMhdhakpmNw5TP/p4lCEPPxnZTI+5Xj
 HYd6W4g08Hk8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZjepwfiQ
Subject: Re: [Buildroot] Docker container for 2022.02.x release
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

VGhpZXJyeSwgQWxsLAoKT24gMjAyMi0wOC0yMyAxNToxMyArMDIwMCwgVGhpZXJyeSBHVUlCRVJU
IHNwYWtlIHRodXNseToKPiBJJ20gdXNpbmcgYnVpbGRyb290IHRvIGJ1aWxkIHJhc3BiZXJyeSBw
aSByb290ZnMgZm9yIHRoZSBmcmVuY2ggcmVkIGNyb3NzLgoKQSBub2JsZSBlbmRlYXZvdXIsIHRo
YW5rIHlvdSEKCj4gSXMgdGhlcmUgYW55IHJlYXNvbiBmb3IgYnVpbGRyb290L2Jhc2U6MjAyMjAy
MDYuMTc1NiBub3QgdG8gYmUgcHVibGlzaGVkIGluCj4gdGhlIGRvY2tlciBodWIgPwoKVGhlIHJh
dGlvbmFsZSBiZWhpbmQgb3VyIGRvY2tlciBpbWFnZSwgaXMgdG8gYmUgYWJsZSB0byBydW4gb3Vy
IG93biBDSQpqb2JzLCB0aGF0IHJ1bnMgaW4gZ2l0bGFiLUNJLiBTaW5jZSBEb2NrZXIgaHViIG5v
dyBsaW1pdHMgdGhlIG51bWJlciBvZgpkb3dubG9hZHMgcGVybW9udGggcGVyIGltYWdlIChvbiBm
cmUgZXRpZXIpLCB0aGUgQ0kgd2FzIHZlcnkgb2Z0ZW4KYmxvY2tlZCBmcm9tIHJ1bm5pbmcgYXQg
YWxsLCB3aGljaCB3YXMgbm90IHN1cGVyIG5pY2UuLi4KClNvLCB3ZSBwdXNoZWQgdGhlIGltYWdl
IHRvIHRoZSBnaXRsYWIgcmVnaXN0cnkgaW5zdGVhZCwgc2luY2UgdGhlIGltYWdlCnJhaXNvbi1k
J8OqdHJlIHdhcyBqc3V0IHRvIHJ1biBpbiBnaXRsYWItQ08gdG8gYmVnaW4gd2l0aC4KClNvLCB5
b3UgY2FuIGdldCBhIGhpbnQgYXQgdGhlIGFjdHVhbCBsb2NhdGlvbiBvZiB0aGUgaW1hZ2UsIGJ5
IGxvb2tpbmcKYXQgb3V0IC5naXRsYWItY2kueW1sIGZpbGU6CiAgICBpbWFnZTogJENJX1JFR0lT
VFJZL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L2Jhc2U6MjAyMjAyMDYuMTc1NgoKJENJX1JFR0lT
VFJZIGlzIGEgZ2l0bGFiLUNJIHZhcmlhYmxlLCB0aGF0IHBvaW50cyB0byB0aGVpciByZWdpc3Ry
eS4gSXRzCnZhbHVlIGRlcGVuZHMgb24gcHJvamVjdCBydW5uaW5nIHRoZSBwaXBlbGluZSwgYW5k
IHRoZSBnaXRsYWItQ0kgaG9zdGluZwpzb2x1dGlvbi4gU2luY2Ugd2UgYXJlIHVzaW5nIGdpdGxh
Yi5jb20sIHRoZSByZWdpc3RyeSBpcwpyZWdpc3RyeS5naXRsYWIuY29tLiBTbyB5b3Ugc2hvdWxk
IGJlIGFibGUgdG8gcHVsbDoKICAgIHJlZ2lzdHJ5LmdpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9i
dWlsZHJvb3QvYmFzZToyMDIyMDIwNi4xNzU2Cgo+IE9uIHRoZSBodWIsIHRoZSBsYXRlc3QgY29u
dGFpbmVyIHB1Ymxpc2hlZCBpcyAyMDIxMTEyMC4xOTI1IHdoaWNoIGRvZXMgbm90Cj4gc2VlbXMg
dG8gY29udGFpbiBweXRob24tcHl0ZXN0LCBzbyBteSBnaXRsYWIgcGlwZWxpbmVzIGFyZSBvdXQg
b2Ygb3JkZXIuCj4gCj4gSGF2ZSB5b3UgbW92ZWQgdG8gYW4gb3RoZXIgZG9ja2VyIHJlZ2lzdHJ5
ID8KClllcC4gQW5kIHNpbmNlIHRoZSBpbWFnZXMgYXJlIG5vdCByZWFsbHkgbWVhbnQgZm9yIGRp
cmVjdCBjb25zdW1wdGlvbiwKd2Ugbm90IGxvbmdlciBwdXNoIHRoZW0gdG8gdGhlIGRvY2tlcmh1
Yi4KClRoZXJlIGhhZCBiZWVuIGFuIGF0dGVtcHQgYXQgcHJvdmlkaW5nIGdlbmVyaWMgaW1hZ2Vz
IG9mIHZhcmlvdXMKZGlzdHJpYnV0aW9ucywgdGFodCB3ZSB3b2p1bGQgaGF2ZSBraW5kYSBhZHZl
cnRpc2VkLCBidXQgdGhlIGVmZm9ydApoYXMgc3RhbGxlZC4uLgoKUmVnYXJkcywKWWFubiBFLiBN
T1JJTi4KCj4gTXkgZmF2b3JpdGUgc2VhcmNoIGVuZ2luZSBkaWQgbm90IGhlbHAgbWUgdGhpcyB0
aW1lLi4uCj4gCj4gUmVnYXJkcywKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9S
SU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25z
cGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENB
TVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0t
LS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8
CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAg
ICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1e
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
