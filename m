Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8968CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 10:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3729E40354;
	Mon, 27 Dec 2021 10:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHjyi5QXK5td; Mon, 27 Dec 2021 10:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5693D403B7;
	Mon, 27 Dec 2021 10:26:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CE901BF4DB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CB4580E46
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 10:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7fA-rlyItTV for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 10:26:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21D4A80D50
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:26:22 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 7243DE0006;
 Mon, 27 Dec 2021 10:26:21 +0000 (UTC)
Date: Mon, 27 Dec 2021 11:26:20 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211227112620.2159279a@windsurf>
In-Reply-To: <20211210142531.14746-1-ps.report@gmx.net>
References: <20211210142531.14746-1-ps.report@gmx.net>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1] package/assimp: disable -Werror compile
 flag
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

T24gRnJpLCAxMCBEZWMgMjAyMSAxNToyNTozMSArMDEwMApQZXRlciBTZWlkZXJlciA8cHMucmVw
b3J0QGdteC5uZXQ+IHdyb3RlOgoKPiBBZGQgcGF0Y2ggdG8gZGlzYWJsZSAtV2Vycm9yIGNvbXBp
bGUgZmxhZy4KPiAKPiBGaXhlczoKPiAKPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvNDliZWIyNjRiODQ1NGI5YWYwOTIyNzgwNzRjNDA4NzAxMzY5MjA1Mi8KPiAK
PiAgIC4uLi9idWlsZC9hc3NpbXAtNS4xLjMvY29kZS9Qb3N0UHJvY2Vzc2luZy9Ucmlhbmd1bGF0
ZVByb2Nlc3MuY3BwOjI4NTo1MDogZXJyb3I6IGFyZ3VtZW50IDEgdmFsdWUg4oCYNDI5NDk2NzI5
NOKAmSBleGNlZWRzIG1heGltdW0gb2JqZWN0IHNpemUgMjE0NzQ4MzY0NyBbLVdlcnJvcj1hbGxv
Yy1zaXplLWxhcmdlci10aGFuPV0KPiAgICAgMjg1IHwgICAgIHN0ZDo6dW5pcXVlX3B0cjxib29s
W10+IGRvbmUobmV3IGJvb2xbbWF4X291dF0pOwo+ICAgICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ICAgWy4uLl0KPiAgIC4uLi9ob3N0
L29wdC9leHQtdG9vbGNoYWluL3Bvd2VycGMtYnVpbGRyb290LWxpbnV4LXVjbGliYy9pbmNsdWRl
L2MrKy85LjMuMC9uZXc6MTI3OjI2OiBub3RlOiBpbiBhIGNhbGwgdG8gYWxsb2NhdGlvbiBmdW5j
dGlvbiDigJh2b2lkKiBvcGVyYXRvciBuZXcgW10oc3RkOjpzaXplX3Qp4oCZIGRlY2xhcmVkIGhl
cmUKPiAgICAgMTI3IHwgX0dMSUJDWFhfTk9ESVNDQVJEIHZvaWQqIG9wZXJhdG9yIG5ld1tdKHN0
ZDo6c2l6ZV90KSBfR0xJQkNYWF9USFJPVyAoc3RkOjpiYWRfYWxsb2MpCj4gICAgICAgICB8ICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAtLS0KPiAgcGFja2FnZS9hc3NpbXAvMDAw
MS1jb2RlLWRpc2FibGUtV2Vycm9yLnBhdGNoIHwgMzkgKysrKysrKysrKysrKysrKysrKwo+ICAx
IGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9hc3NpbXAvMDAwMS1jb2RlLWRpc2FibGUtV2Vycm9yLnBhdGNoCgpFdmVuIHRob3VnaCBB
cm5vdXQgaGFkIG9iamVjdGlvbnMsIHRoaXMgcGF0Y2ggaXMgcmVhc29uYWJsZSwgaXQncwpvYnZp
b3VzbHkganVzdCBkcm9wcGluZyAtV2Vycm9yLCBhbmQgd2UgaW5kZWVkIHRyeSB0byBub3QgYnVp
bGQgcGFja2FnZXMKd2l0aCAtV2Vycm9yIGluIGdlbmVyYWwuIFNvIEkndmUgYXBwbGllZC4KClRo
YW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
