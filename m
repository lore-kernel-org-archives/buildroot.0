Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8962DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 18:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C557B409E0;
	Sat, 20 Nov 2021 18:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFVD7-UjPtKa; Sat, 20 Nov 2021 18:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30401408D0;
	Sat, 20 Nov 2021 18:16:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC0C71BF3ED
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 18:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A795580D97
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 18:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEW1M40anxJm for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 18:16:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 701A280D94
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 18:16:41 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a1df:22c7:4448:7943])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 149FE13F89C;
 Sat, 20 Nov 2021 19:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637432198;
 bh=gWwyzbiKCqu9IgkBwjVYzI7G410a7m+Bt6zs9N2Gy9s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTEArEAnjIP0pknaAyKDTB7fV4gnhwKxOWUBOaFgumOVpoLr5nrTdGj6QUmcK1BIZ
 XAeCQacA2v4yoHXFIBRirkVvwcqpqfwaMAc3h4ysgl3da8PaOBUd68d/ifSLxjcqHr
 Wso4Z9se34pGBscKNnIAcbJAic3byScrDfVbgINz3KkukxJbn2BkYG3wpVV7p/oIAo
 17mn2gMrBok9yudaiF4Z6yVyogmjMCXht6Rr6aM/1hhWBI5Tbl7WOtgSncxulG9LVc
 4fdoXi7B50kQ3ubDjNssEUJgpcigpuHtmkq2j6EeDl3Tou/w5S7mtwH1mGZvp3sUhZ
 RTzMa1cQY42YQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Nov 2021 19:16:31 +0100
Date: Sat, 20 Nov 2021 19:16:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20211120181631.GT247986@scaer>
References: <20211117213348.231529-1-romain.naour@gmail.com>
 <87ee7drf65.fsf@dell.be.48ers.dk>
 <9880ded2-bde8-8321-9a61-d281be2db2ff@gmail.com>
 <87a6i1r6va.fsf@dell.be.48ers.dk> <20211120085004.GS247986@scaer>
 <ddafc6ef-d8e5-3750-6d3b-2a8267028f0a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ddafc6ef-d8e5-3750-6d3b-2a8267028f0a@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH for-2021.08.x] support/docker: remove
 expired mozilla/DST_Root_CA_X3.crt
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

Um9tYWluLCBwZXRlciwgQWxsLAoKT24gMjAyMS0xMS0yMCAxNDo0NCArMDEwMCwgUm9tYWluIE5h
b3VyIHNwYWtlIHRodXNseToKPiBMZSAyMC8xMS8yMDIxIMOgIDA5OjUwLCBZYW5uIEUuIE1PUklO
IGEgw6ljcml0wqA6ClstLVNOSVAtLV0KPiA+IFNvIEkgYWdyZWUgdGhhdCB1cGRhdGluZyB0byB0
aGUgbGF0ZXN0IHN0cmV0Y2ggaW1hZ2UgaXMgYmV0dGVyIHRoYW4KPiA+IGhhY2tpbmcgb3VyIHdh
eXMgYnkgcmVtb3Zpbmcgc29tZSBjZXJ0aWZpY2F0ZS4KPiBPSywgY2FuIHlvdSB1cGRhdGUgdGhl
IGRvY2tlciBpbWFnZSA/CgpJIHdpbGwgc2VuZCBhIHBhdGNoIGluIGEgbW9tZW50LCB5ZXMuCgpS
ZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0t
LS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlh
bm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVy
aWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVy
IHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkg
NDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJl
IGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhU
TUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
