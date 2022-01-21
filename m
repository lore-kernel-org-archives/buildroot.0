Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A13DC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 21:29:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D07940339;
	Fri, 21 Jan 2022 21:29:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoRxnlaL86lL; Fri, 21 Jan 2022 21:29:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4ED704019D;
	Fri, 21 Jan 2022 21:29:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E625C1BF30C
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4612831D6
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 21:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBiTGgIG2TMM for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 21:29:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0729E831B0
 for <buildroot@busybox.net>; Fri, 21 Jan 2022 21:28:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90bb:6e44:a706:407c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C931F780331;
 Fri, 21 Jan 2022 22:28:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642800537;
 bh=OfSQ917pgk00uJ8vHj7wD4W218Yj6gjvcxGnpNqzLa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l2hSQrubpRHR2wot2aW9axXAi+nqHy554Kc885pacvTLQLfymZLL4j89QpYk3Q/1d
 yla+Y53VI287YOPZzkI27KYdSZ7fX4XCwM07MYLkNA5BsunKNobGnZHPGh6WuQoUa3
 M30zQMNbf89gKHM6Azr8PSjImpZyb69MsNgNl6L+X0VdImcdxeloivuqRjVqUeiLu8
 QqUov2iaB0NX/ajfOfUuyGdiqiEf8hn6I51CdxbIj9qmqfUXxOMYcWDgJ8vmBe2fi7
 CDDNVSX3TldSuw+sbC6XJSG0R4u2gzkGXZyW6mJ09UFQPE8sPALHSZLfAfaatSnBHU
 VPnt2YjrPUn9Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jan 2022 22:28:54 +0100
Date: Fri, 21 Jan 2022 22:28:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20220121212854.GL3252931@scaer>
References: <20220121123859.754653-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121123859.754653-1-francois.perrad@gadz.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/8] package/perl-date-manip: bump to
 version 6.86
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

RnJhbsOnb2lzLCBBbGwsCgpPbiAyMDIyLTAxLTIxIDEzOjM4ICswMTAwLCBGcmFuY29pcyBQZXJy
YWQgc3Bha2UgdGh1c2x5Ogo+IFNpZ25lZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNv
aXMucGVycmFkQGdhZHoub3JnPgoKU2VyaWVzIG9mIDggcGF0Y2hlcyBhcHBsaWVkIHRvIG1hc3Rl
ciwgdGhhbmtzLgoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvcGVy
bC1kYXRlLW1hbmlwL3BlcmwtZGF0ZS1tYW5pcC5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvcGVy
bC1kYXRlLW1hbmlwL3BlcmwtZGF0ZS1tYW5pcC5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9wZXJsLWRhdGUtbWFuaXAvcGVybC1kYXRlLW1hbmlwLmhhc2ggYi9wYWNrYWdlL3Blcmwt
ZGF0ZS1tYW5pcC9wZXJsLWRhdGUtbWFuaXAuaGFzaAo+IGluZGV4IGQ0MGFhMDg3Yi4uZGMyNjdm
NTI1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcGVybC1kYXRlLW1hbmlwL3BlcmwtZGF0ZS1tYW5p
cC5oYXNoCj4gKysrIGIvcGFja2FnZS9wZXJsLWRhdGUtbWFuaXAvcGVybC1kYXRlLW1hbmlwLmhh
c2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgIyByZXRyaWV2ZWQgYnkgc2NhbmNwYW4gZnJvbSBodHRw
Oi8vY3Bhbi5tZXRhY3Bhbi5vcmcvCj4gLW1kNSAgY2UzNDQ3NDA5ZDgzZDE2ZTZkZDdiZWEwYTE4
ZjI0YjQgIERhdGUtTWFuaXAtNi44NS50YXIuZ3oKPiAtc2hhMjU2ICAxNjYyMzkzOTQzYjdjNTg4
NDc4ZWE5ZDk3NTIwMGQ4MjVmNTAwZDI2ZmU5OTk2ZjJiZjdmODI5Y2ZhYTVjY2RjICBEYXRlLU1h
bmlwLTYuODUudGFyLmd6Cj4gK21kNSAgNzcxMjNhNGNjODc0ZjcyZDcxODhmODU5NjI2YmRkODQg
IERhdGUtTWFuaXAtNi44Ni50YXIuZ3oKPiArc2hhMjU2ICBiNTIwMzc4MmQwM2M3OWFhNTgyMmNm
MzNkMTgyOGFhYTNiNGRiOTNhMjc1ZDRhNDI4Yzg5ZjU2ZjQ3MTMzNjFmICBEYXRlLU1hbmlwLTYu
ODYudGFyLmd6Cj4gIAo+ICAjIGNvbXB1dGVkIGJ5IHNjYW5jcGFuCj4gIHNoYTI1NiAgOGJhMmEx
Mzg2NTRmOGI1OWI3ZTFlM2FkMGQ0YzgxOTE4YjkxNDhmZjk1MDc4YjE3MmNjYmI0NWZhMjQxNDMx
ZCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BlcmwtZGF0ZS1tYW5pcC9wZXJsLWRh
dGUtbWFuaXAubWsgYi9wYWNrYWdlL3BlcmwtZGF0ZS1tYW5pcC9wZXJsLWRhdGUtbWFuaXAubWsK
PiBpbmRleCA0ZWU4MWQzNDAuLjM1YmNlNDU2ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Blcmwt
ZGF0ZS1tYW5pcC9wZXJsLWRhdGUtbWFuaXAubWsKPiArKysgYi9wYWNrYWdlL3BlcmwtZGF0ZS1t
YW5pcC9wZXJsLWRhdGUtbWFuaXAubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtUEVSTF9EQVRFX01BTklQX1ZFUlNJT04gPSA2Ljg1Cj4g
K1BFUkxfREFURV9NQU5JUF9WRVJTSU9OID0gNi44Ngo+ICBQRVJMX0RBVEVfTUFOSVBfU09VUkNF
ID0gRGF0ZS1NYW5pcC0kKFBFUkxfREFURV9NQU5JUF9WRVJTSU9OKS50YXIuZ3oKPiAgUEVSTF9E
QVRFX01BTklQX1NJVEUgPSAkKEJSMl9DUEFOX01JUlJPUikvYXV0aG9ycy9pZC9TL1NCL1NCRUNL
Cj4gIFBFUkxfREFURV9NQU5JUF9MSUNFTlNFID0gQXJ0aXN0aWMgb3IgR1BMLTEuMCsKPiAtLSAK
PiAyLjMyLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoK
LS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1l
IEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMz
IDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBf
X18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0t
LTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jp
bi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNw
aXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0t
LS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
