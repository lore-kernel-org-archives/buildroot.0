Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265ABC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 19:54:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B78F61052
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 19:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B78F61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB68180E82;
	Sun, 24 Oct 2021 19:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27gryOpi9Qim; Sun, 24 Oct 2021 19:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FFE380E83;
	Sun, 24 Oct 2021 19:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC53B1BF2C6
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 19:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C694606D3
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 19:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJU9hAh4hN74 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 19:54:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D4876069B
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 19:54:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:30c0:1f0f:6be:9e67])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 350E178036C;
 Sun, 24 Oct 2021 21:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1635105282;
 bh=cF6DhiD7kXzWbbu0KbP45gxufgo2E26alxFp4v6FgWQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1HJSAKH0SjUx/F1DTvkvGfF0pIlKWrsChA1CY7lRQ8+0C1bmTPrKhOsJynqRhghO
 cFSF0vDUcO4QtUYZ8NQXhkv4V5EzCz3ofZgqTjue1EthSy9+UYTz2fWWnXdpBjEeOZ
 UfTBQy811Gp2vBvECkgHZa7Odw7LacyWa38IyMU15saguS4KTFszwY7tL0wLCvV/QT
 CTBTr5n7bPLu5YPbfWlOh5+DsXejcHG8Sox1wCHU3PdQvnkzjM2fbCgL3bJQb5BxN8
 ir3jK3RwBbcH3v5U140C1fQRShcM6OmaIPTMHkCnmZzMLjEVaiCU3ilkhFRLKiJ8zJ
 6oRoST3fqfM5Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Oct 2021 21:54:37 +0200
Date: Sun, 24 Oct 2021 21:54:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alassane <alassaneg@gmail.com>
Message-ID: <20211024195437.GQ2400@scaer>
References: <CAJ2YAHurtC2D047qVGQ89q2q0+WG0DOOx48V2mDA0S8swfMRKg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ2YAHurtC2D047qVGQ89q2q0+WG0DOOx48V2mDA0S8swfMRKg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Issue compiling the library linux_libnfc-nci (from
 NXP)
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

QWxhc3NhbmUsIEFsbCwKCk9uIDIwMjEtMTAtMjQgMjA6MjggKzAyMDAsIEFsYXNzYW5lIHNwYWtl
IHRodXNseToKPiBJJ20gdHJ5aW5nIHRvIGFkZCB0aGUgZm9sbG93aW5nIHBhY2thZ2UgdG8gYnVp
bGRyb290IGFuZCB0cnlpbmcgdG8gY29tcGlsZSBpdCA6wqAgbGludXhfbGlibmZjLW5jaSAoCj4g
WzFdaHR0cHM6Ly9naXRodWIuY29tL05YUE5GQ0xpbnV4L2xpbnV4X2xpYm5mYy1uY2kgKS4KPiBJ
dCB3YXMgc3VwcG9zZWQgbm90IHRvbyBiZSBjb21wbGljYXRlZCBidXQgaSdtIGFjdHVhbGx5IHN0
cnVnZ2xpbmcgd2l0aCB0aGF0LiB0aGUgImNvbmZpZ3VyZSIgZmlsZSBpcyBtaXNzaW5nIGZyb20g
dGhlIGxpbnV4Cj4gcmVwb3NpdG9yeS4gVG8gZ2V0IHRoZSAiY29uZmlndXJlIiBmaWxlLCB3ZSBt
dXN0IHJ1biB0aGUgImJvb3RzdHJhcC5zaCIgc2NyaXB0LCB3aGljaCBpcyBpbiB0aGUgZ2l0IHJl
cG9zaXRvcnksIGFuZAo+IGNvbnRhaW5zwqB0aGUgZm9sbG93aW5nIGNvbW1hbmRzOgo+IAo+ICBt
a2RpciAtcCBtNAo+ICBhY2xvY2FsCj4gIGF1dG9oZWFkZXIKPiAgbGlidG9vbGl6ZQo+ICBhdXRv
bWFrZSAtLWFkZC1taXNzaW5nCj4gIGF1dG9yZWNvbmYgLWZpCj4gIHJtIC1SZiBhdXRvbTR0ZS5j
YWNoZQoKVXN1YWxseSwgdGhlIHByb3BlciBzb2x1dGlvbiB0byB0byBqdXN0IHJ1biBhdXRvcmVj
b25mIGluIHlvdXIgcGFja2FnZSwKYnkgaW5zdHJ1Y3RpbmcgQnVpbGRyb290IHRvIGRvIHNvLiBB
c3N1bWluZyB5b3UgbmFtZSB0aGUgcGFja2FnZQpsaW51eF9saWJuZmMtbmNpLCBpdCBzaG91bGQg
YmUgZW5vdWdoIHRvIGp1c3Qgd3JpdGU6CgogICAgTElOVVhfTElCTkZDX05DSV9BVVRPUkVDT05G
ID0gWUVTCgppbiB5b3VyIC5tayBmaWxlLCBhbmQgbm90IGNhbGwgYm9vdHN0cmFwIGF0IGFsbC4K
CllvdSAqbWF5KiBuZWVkIHRvIGNyZWF0ZSB0aGUgbTQgZGlyZWN0b3J5IGZpcnN0IHdpdGggYSBw
cmUtY25vZmlndXJlCmhvb2ssIGJ1dCB1c3VhbGx5IHRoYXQgaGFzIG5vdCBiZWVuIG5lZWRlZCBm
b3IgYSB3aGlsZSBub3cuIElmIHJ1bm5pbmcKYXV0b3JlY29uZiBmYWlscyBiZWNhdXNlIG9mIGEg
bWlzc2lnbiBtNCBkaXJlY3RvcnksIHRoZW4geW91IGNvdWxkIHRyeQphZGRpbmcgc29tZXRoaW5n
IGxpa2U6CgogICAgZGVmaW5lIExJTlVYX0xJQk5GQ19OQ0lfTTQKICAgICAgICBta2RpciAtcCAk
KEBEKS9tNAogICAgZW5kZWYKICAgIExJTlVYX0xJQk5GQ19OQ0lfUFJFX0NPTkZJR1VSRV9IT09L
UyArPSBMSU5VWF9MSUJORkNfTkNJX000CgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiBJJ20g
YWJsZSB0byBpbnN0YWxsIHRoaXMgbGlicmFyeSBvbiBteSBob3N0IGJ1dCBpJ20gbm90IGFibGUg
YW5kIGV2ZW4gYWJsZSB0byBtYW51YWxseSBjcm9zcyBjb21waWxlIGl0IGJ1dCBpdCBkb2Vzbid0
IHdvcmsgd2hlbgo+IHRyeWluZyB0byBjcm9zcy1jb21waWxlIGl0IHRocm91Z2ggYnVpbGRyb290
IChhcyBhIHBhY2thZ2UpLCBiZWNhdXNlIG9mIHRoaXMgImNvbmZpZ3VyZSIgZmlsZSBtaXNzaW5n
ICh0aGUgZXJyb3IgaSBoYXZlIGlzIDoKPiAiL2Jpbi9iYXNoOiAuL2NvbmZpZ3VyZTogTm8gc3Vj
aCBmaWxlIG9yIGRpcmVjdG9yeSIpLgo+IERvZXMgYW55b25lIGtub3cgaG93IGNhbiBpIGdlbmVy
YXRlIHRoaXMgImNvbmZpZ3VyZSIgZmlsZSB1c2luZyBidWlsZHJvb3Q/IGlzIGl0IHBvc3NpYmxl
IHRvIHJ1biB0aGUgImJvb3N0cmFwIiB3aXRoIGEgc3BlY2lmaWMgbGluZQo+IGluIHRoZSAiLm1r
IiBmaWxlPwo+IENhbiBpIG1hbnVhbGx5IHJ1biB0aGUgImJvb3RzdHJhcC5zaCIgc2NyaXB0IGFu
ZCBjb3B5IHRoZSAiY29uZmlndXJlIiBmaWxlIGluIHRoZSBwYWNrYWdlIGJ1aWxkIGZvbGRlcj8g
aXMgdGhpcyBhIGdvb2QgbWV0aG9kPwo+IEkgaG9wZSB0aGlzIGlzIGNsZWFyIGFuZCB0aGF0IHNv
bWVvbmUgd2lsbCBiZSBhYmxlIHRvIGhlbHAgd2l0aCB0aGF0Lgo+IEtpbmQgcmVnYXJkcwo+IFRo
YW5rIHlvdQo+IAo+IExpbmtzOgo+IDEuIGh0dHBzOi8vZ2l0aHViLmNvbS9OWFBORkNMaW51eC9s
aW51eF9saWJuZmMtbmNpCgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290CgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0t
LS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVh
bC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8
CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAg
ICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0u
LS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDov
L3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAg
IGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
