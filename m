Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A1AC433F5
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 10:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 502FE61A56
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 10:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 502FE61A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2823405F7;
	Fri, 19 Nov 2021 10:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCEpNvL1p4E7; Fri, 19 Nov 2021 10:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16876405DD;
	Fri, 19 Nov 2021 10:11:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE311BF57C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 10:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BA1660656
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 10:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjkRBFNQdMTr for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 10:11:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 201586061D
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 10:11:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3d2a:c72d:f7cc:1319])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D99D95FFA8;
 Fri, 19 Nov 2021 11:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637316705;
 bh=wN+l22HUqFA0UnFexnthHhtfntknR7KKeTqLnPWGOdo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nR5ECEcO7QHzbzXngkgWYyYx/p8cIOkicVSlbN8zC/ApbK+ocFSCqTvJN7U15AKJ7
 6o2C5VAFbW57H5K8RKztAOcz6SSGPhcRiW3giNMSUmq87Fzm4fZ+uRZYH9dlet1N55
 uNeM9cvhf84/AaYp/lWOk7UtV9ilB8ijSVuscHfPKyQkfEU3mF7OV02vrL20Qzo3xn
 LZwqjTeuAGVyfikUeuIhAoAxjNVgpdE812DBuNHXHZOMZKjUymnExJjQifMBvpIWaz
 TDd5GdidXwwFgQeVINc7qSlJo4329NFoINx7p+iWY/Yu2CNEUUsC76j8oAEW64w4dS
 iJAHYp0+GbLcg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Nov 2021 11:11:40 +0100
Date: Fri, 19 Nov 2021 11:11:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20211119101140.GN247986@scaer>
References: <20211119085902.14877-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119085902.14877-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre: fix broken URL
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

U8OpYmFzdGllbiwgQWxsLAoKT24gMjAyMS0xMS0xOSAwOTo1OSArMDEwMCwgU8OpYmFzdGllbiBT
enltYW5za2kgc3Bha2UgdGh1c2x5Ogo+IEFzIHN0YXRlZCBvbiB3d3cucGNyZS5vcmc6Cj4gIk5v
dGUgdGhhdCB0aGUgZm9ybWVyIGZ0cC5wY3JlLm9yZyBGVFAgc2l0ZSBpcyBubyBsb25nZXIgYXZh
aWxhYmxlLiIKPiAKPiBVcGRhdGUgX1NJVEUgVVJMIHRvIFNvdXJjZWZvcmdlLgoKVGhlIGhvbWVw
YWdlIHN0YXRlcyB0aGF0IHRoZSBvZmZpY2lhbCByZWxlYXNlIGNoYW5uZWwgaXMgZ2l0aHViLCBh
bmQKdGhhdCBzb3VyY2Vmb3JnZSBpcyB1bm9maWNpYWw6CgogICAgaHR0cDovL3d3dy5wY3JlLm9y
Zy8KCiAgICBZb3UgY2FuIGRvd25sb2FkIHRoZSBjdXJyZW50IHJlbGVhc2Ugb2YgdGhlIFBDUkUy
IGxpYnJhcnkgZnJvbSBpdHMKICAgIG9mZmljaWFsIGhvbWUgb24gR2l0SHViOgoKICAgIGh0dHBz
Oi8vZ2l0aHViLmNvbS9QaGlsaXBIYXplbC9wY3JlMi9yZWxlYXNlcwoKICAgIFlvdSBjYW4gYWxz
byBkb3dubG9hZCBQQ1JFMiBvciB0aGUgb2xkZXIsIHVubWFpbnRhaW5lZCBQQ1JFIGxpYnJhcnkK
ICAgIGZyb20gYW4gdW5vZmZpY2lhbCBtaXJyb3IgYXQgU291cmNlRm9yZ2U6CgogICAgaHR0cHM6
Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMvcGNyZS9maWxlcy8KClNvIGNvdWxkIHlvdSByZXNw
aW4gdXNpbmcgdGhlIHJlbGVhc2UgZnJvbSBnaXRodWIsIHBsZWFzRT8KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3Rp
ZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9wY3JlL3BjcmUubWsg
fCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+
IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BjcmUvcGNyZS5tayBiL3BhY2thZ2UvcGNyZS9wY3Jl
Lm1rCj4gaW5kZXggMjY0ZWFhMTBjNy4uYzg1ZjY3MTdkYiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3BjcmUvcGNyZS5tawo+ICsrKyBiL3BhY2thZ2UvcGNyZS9wY3JlLm1rCj4gQEAgLTUsNyArNSw3
IEBACj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+ICBQQ1JFX1ZFUlNJT04gPSA4LjQ1
Cj4gLVBDUkVfU0lURSA9IGh0dHBzOi8vZnRwLnBjcmUub3JnL3B1Yi9wY3JlCj4gK1BDUkVfU0lU
RSA9IGh0dHA6Ly9kb3dubG9hZHMuc291cmNlZm9yZ2UubmV0L3Byb2plY3QvcGNyZS9wY3JlLyQo
UENSRV9WRVJTSU9OKQo+ICBQQ1JFX1NPVVJDRSA9IHBjcmUtJChQQ1JFX1ZFUlNJT04pLnRhci5i
ejIKPiAgUENSRV9MSUNFTlNFID0gQlNELTMtQ2xhdXNlCj4gIFBDUkVfTElDRU5TRV9GSUxFUyA9
IExJQ0VOQ0UKPiAtLSAKPiAyLjMyLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
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
