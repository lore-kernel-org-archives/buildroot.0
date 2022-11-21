Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1170C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D012405AA;
	Mon, 21 Nov 2022 21:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D012405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SuFglFC1OuOx; Mon, 21 Nov 2022 21:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9689405BE;
	Mon, 21 Nov 2022 21:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9689405BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D70AF1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFEAF81656
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFEAF81656
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gWTTaEnzLRH for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:39:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE3E78146C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE3E78146C
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 21:39:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EB05F13F86A;
 Mon, 21 Nov 2022 22:39:44 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 22:39:44 +0100
Date: Mon, 21 Nov 2022 22:39:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20221121213944.GP2516@scaer>
References: <20221118190031.1401109-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118190031.1401109-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669066787;
 bh=6LDveesqJuY8fd4R8dEpN5Kcfp9C469eDP7m03N2yik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pq5oDnLh3aAz6nE5q3BEAuvAFyyUjxksHFl7GDSrGBZ6B7gsTKYPrqYFqoUzAdSGE
 BfiU+1vJCmpObwDBPpM6stJxtNxYb4r6iVmd11Nl663/jj1syi81xH7ir3M2y1+vvb
 hYz1Xv4HmSGpRreGhLllmQbHsY6IV92MMViBngpdva0CkdLjx4nqoyB+HsLiI9XVSM
 BxEDAYw3XQKNnEmh0vELwuU3HfO+EWuDEyr72lzGTfUgKZZ7Nj73h5HQZbcwmuEYrC
 0mb/3pRJh+3IAmqycHdwF9Y1FmPlCADFZZqGKZsKVSLphvhTAbabSB3VpE58/p3MOw
 f8T8V5b8PuCKg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pq5oDnLh
Subject: Re: [Buildroot] [PATCH] package/nano: bump to version 7.0
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTExLTE4IDIwOjAwICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKQXBwbGllZCB0byBuZXh0LCB0aGFua3MuCgpSZWdhcmRzLApZ
YW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9uYW5vL25hbm8uaGFzaCB8IDYgKysrLS0t
Cj4gIHBhY2thZ2UvbmFuby9uYW5vLm1rICAgfCA0ICsrLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmFuby9uYW5vLmhhc2ggYi9wYWNrYWdlL25hbm8vbmFuby5oYXNoCj4gaW5kZXggODNkZTg1YjQx
Li44NmY0MTRhY2EgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uYW5vL25hbm8uaGFzaAo+ICsrKyBi
L3BhY2thZ2UvbmFuby9uYW5vLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBMb2NhbGx5IGNh
bGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZQo+IC0jIGh0dHBzOi8vd3d3Lm5h
bm8tZWRpdG9yLm9yZy9kaXN0L3Y2L25hbm8tNi40LnRhci54ei5hc2MKPiAtIyB1c2luZyBrZXkg
QkZEMDA5MDYxRTUzNTA1MkFEMERGMjE1MEQyOEQ0RDJBMEFDRTg4NAo+IC1zaGEyNTYgIDQxOTlh
ZThjYTc4YTc3OTZkZTU2ZGUxYTQxYjgyMWRjNDc5MTJjMDMwN2U5ODE2YjU2Y2MzMTdkZjM0NjYx
YzAgIG5hbm8tNi40LnRhci54ego+ICsjIGh0dHBzOi8vd3d3Lm5hbm8tZWRpdG9yLm9yZy9kaXN0
L3Y3L25hbm8tNy4wLnRhci54ei5hc2MKPiArIyB1c2luZyBrZXkgMTY4RTZGNDI5N0JGRDdBNzlB
RkQ0NDk2NTE0QkJFMkVCOEUxOTYxRgo+ICtzaGEyNTYgIDhkZDZlYWMzOGIyYjg3ODZkODI2ODFm
MGUxYWZkODRmNmI3NTIxMGQxNzM5MWI2NDQzYzQzN2U0NTE1NTIxNDkgIG5hbm8tNy4wLnRhci54
ego+ICBzaGEyNTYgIGZjODJjYThiNmZkYjE4ZDRlM2U4NWNmZDhhYjU4ZDFiY2QzZjFiMjlhYmU3
ODI4OTVhYmQ5MWQ2NDc2M2Y4ZTcgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uYW5v
L25hbm8ubWsgYi9wYWNrYWdlL25hbm8vbmFuby5tawo+IGluZGV4IGVjZmMzNzQxMi4uZjkzMzg1
NTBkIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbmFuby9uYW5vLm1rCj4gKysrIGIvcGFja2FnZS9u
YW5vL25hbm8ubWsKPiBAQCAtNCw4ICs0LDggQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKPiAtTkFOT19WRVJTSU9OX01BSk9SID0gNgo+IC1OQU5PX1ZFUlNJT04gPSAkKE5B
Tk9fVkVSU0lPTl9NQUpPUikuNAo+ICtOQU5PX1ZFUlNJT05fTUFKT1IgPSA3Cj4gK05BTk9fVkVS
U0lPTiA9ICQoTkFOT19WRVJTSU9OX01BSk9SKS4wCj4gIE5BTk9fU0lURSA9IGh0dHBzOi8vd3d3
Lm5hbm8tZWRpdG9yLm9yZy9kaXN0L3YkKE5BTk9fVkVSU0lPTl9NQUpPUikKPiAgTkFOT19TT1VS
Q0UgPSBuYW5vLSQoTkFOT19WRVJTSU9OKS50YXIueHoKPiAgTkFOT19MSUNFTlNFID0gR1BMLTMu
MCsKPiAtLSAKPiAyLjM3LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0t
LS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5
OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdO
ICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0t
LS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0
cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAg
diAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
