Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0FCC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663E660AEA;
	Sun, 30 Oct 2022 16:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663E660AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGrLp95FOQns; Sun, 30 Oct 2022 16:15:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 588BC60AE4;
	Sun, 30 Oct 2022 16:15:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 588BC60AE4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D83F51BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1BF640281
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1BF640281
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5CtDT2Di4FT5 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34B28401BA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34B28401BA
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:15:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7D55B13F8AF;
 Sun, 30 Oct 2022 17:15:38 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:15:38 +0100
Date: Sun, 30 Oct 2022 17:15:38 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030161538.GI1058960@scaer>
References: <20221028213127.243377-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028213127.243377-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667146540;
 bh=J6LZD93ew756gqLFreXcyvY1xV135BuMo7/rmOFK4Yw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=peCS3V6CAW2BJ3UiHaHWDDtvmirHPmX4W29RQqOXndmNM+4t++a139fvP1MM0R04j
 AhbF2P/i3WdEuzPSnA6JhD1qtfwVYsBgBJJnZtL5Jz9cTkm/mZ6HdqRBCRLwasuywS
 zJUhZNokjd+rtDprAiDQajt+ZyY1zkM5QtCmQ9K/GMop4uISlHiMKrep222qFBLAIY
 RDy/J7JO7LiZfKven1aop/iEOge5iYOZ3jaMH99jXDQ8ajoPTIvQOKqeMjVftYySHY
 f2tjg4sNwMi8jjJYPPX9+47gcotXcxxeTiPIlBxtN+qt6FEveDVPLvfGKQukkP6s8s
 yP6P10revmBOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=peCS3V6C
Subject: Re: [Buildroot] [PATCH 1/1] package/slang: bump to version 2.3.3
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

RmFicmljZSwgQWxsLAoKT24gMjAyMi0xMC0yOCAyMzozMSArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gUmVmcmVzaCBwYXRjaAo+IAo+IGh0dHA6Ly9saXN0cy5qZWRzb2Z0
Lm9yZy9saXN0cy9zbGFuZy11c2Vycy8yMDIyLzAwMDAwMDUuaHRtbAo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgoKQXBwbGll
ZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+ICBw
YWNrYWdlL3NsYW5nLzAwMDEtc2xzaC1saWJzLnBhdGNoIHwgNiArKysrLS0KPiAgcGFja2FnZS9z
bGFuZy9zbGFuZy5oYXNoICAgICAgICAgICB8IDQgKystLQo+ICBwYWNrYWdlL3NsYW5nL3NsYW5n
Lm1rICAgICAgICAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zbGFuZy8wMDAxLXNs
c2gtbGlicy5wYXRjaCBiL3BhY2thZ2Uvc2xhbmcvMDAwMS1zbHNoLWxpYnMucGF0Y2gKPiBpbmRl
eCAyMTFjYjRhMGUwLi5mYWQxNmQxYjJmIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc2xhbmcvMDAw
MS1zbHNoLWxpYnMucGF0Y2gKPiArKysgYi9wYWNrYWdlL3NsYW5nLzAwMDEtc2xzaC1saWJzLnBh
dGNoCj4gQEAgLTUsNiArNSw4IEBAIHByb2JhYmx5IERpZWdvIFBldHRlbsOyLgo+ICBTaWduZWQt
b2ZmLWJ5OiBHdXN0YXZvIFphY2FyaWFzIDxndXN0YXZvQHphY2FyaWFzLmNvbS5hcj4KPiAgW0Jl
cm5kOiByZWJhc2VkIGFnYWluc3QgMi4zLjFhXQo+ICBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhs
cyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+Cj4gK1tGYWJyaWNlOiByZWJhc2VkIGFnYWluc3Qg
Mi4zLjNdCj4gK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJp
Y2VAZ21haWwuY29tPgo+ICAKPiAgLS0tIGEvc2xzaC9NYWtlZmlsZS5pbgo+ICArKysgYi9zbHNo
L01ha2VmaWxlLmluCj4gQEAgLTEyLDggKzE0LDggQEAgU2lnbmVkLW9mZi1ieTogQmVybmQgS3Vo
bHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRlPgo+ICAgJChPQkpESVIpL3Nsc2hfZXhlOiAkKE9C
SkRJUikvc2xzaC5vICQoT0JKRElSKS9yZWFkbGluZS5vCj4gICAgICAkKENDKSAkKENGTEFHUykg
JChPQkpESVIpL3Nsc2gubyAkKE9CSkRJUikvcmVhZGxpbmUubyAtbyAkKE9CSkRJUikvc2xzaF9l
eGUgJChMREZMQUdTKSAkKERMSU5LX0ZMQUdTKSAkKFNSQ19MSUJTKQo+ICAgJChPQkpESVIpL3Ns
c2g6ICQoT0JKRElSKS9zbHNoLm8gJChPQkpESVIpL3JlYWRsaW5lLm8KPiAtLQkkKENDKSAkKENG
TEFHUykgJChPQkpESVIpL3Nsc2gubyAkKE9CSkRJUikvcmVhZGxpbmUubyAtbyAkKE9CSkRJUikv
c2xzaCAkKExERkxBR1MpICQoRExJTktfRkxBR1MpICQoSU5TVF9MSUJTKQo+IC0rCSQoQ0MpICQo
Q0ZMQUdTKSAkKE9CSkRJUikvc2xzaC5vICQoT0JKRElSKS9yZWFkbGluZS5vIC1vICQoT0JKRElS
KS9zbHNoICQoTERGTEFHUykgJChETElOS19GTEFHUykgJChTUkNfTElCUykKPiArLQkkKENDKSAk
KE9CSkRJUikvc2xzaC5vICQoT0JKRElSKS9yZWFkbGluZS5vIC1vICQoT0JKRElSKS9zbHNoICQo
TERGTEFHUykgJChETElOS19GTEFHUykgJChJTlNUX0xJQlMpCj4gKysJJChDQykgJChPQkpESVIp
L3Nsc2gubyAkKE9CSkRJUikvcmVhZGxpbmUubyAtbyAkKE9CSkRJUikvc2xzaCAkKExERkxBR1Mp
ICQoRExJTktfRkxBR1MpICQoU1JDX0xJQlMpCj4gICAkKE9CSkRJUikvc2xzaC5vOiAkKE9CSkRJ
Ul9UU1RBTVApIHNsc2guYyBzbHNoLmggY29uZmlnLmggTWFrZWZpbGUKPiAgICAgIGNkICQoT0JK
RElSKSAmJiAkKENDKSAkKFNMQU5HX1NSQ0lOQykgJChDRkxBR1MpIC1jICQoREVGUykgJChTUkNE
SVIpL3Nsc2guYwo+ICAgJChPQkpESVIpL3JlYWRsaW5lLm86ICQoT0JKRElSX1RTVEFNUCkgcmVh
ZGxpbmUuYyBzbHNoLmggY29uZmlnLmggTWFrZWZpbGUKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9z
bGFuZy9zbGFuZy5oYXNoIGIvcGFja2FnZS9zbGFuZy9zbGFuZy5oYXNoCj4gaW5kZXggM2UyMTFh
YjU0OC4uNTYzMTE3YjQ4YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3NsYW5nL3NsYW5nLmhhc2gK
PiArKysgYi9wYWNrYWdlL3NsYW5nL3NsYW5nLmhhc2gKPiBAQCAtMSw2ICsxLDYgQEAKPiAgIyBz
aGExIGZyb20gaHR0cDovL3d3dy5qZWRzb2Z0Lm9yZy9yZWxlYXNlcy9zbGFuZy8sIHNoYTI1NiBs
b2NhbGx5IGNvbXB1dGVkCj4gLXNoYTEgIGJiZjdmMmRjYzE0ZTdjN2ZjYTQwODY4ZmQ0YjQxMWEy
YmQ5ZTI2NTUgIHNsYW5nLTIuMy4yLnRhci5iejIKPiAtc2hhMjU2ICBmYzllM2IwZmM0ZjY3YzNj
MWY2ZDQzYzkwYzE2YTVjNDJkMTE3YjhlMjg0NTdjNWI0NjgzMWI4YjVkM2FlMzFhICBzbGFuZy0y
LjMuMi50YXIuYnoyCj4gK3NoYTEgIDM4ZDliOGU4MGU0MzM2Zjc2ZGZmM2UxZDg1NzYxZDJkMGY3
MTM1OTUgIHNsYW5nLTIuMy4zLnRhci5iejIKPiArc2hhMjU2ICBmOTE0NTA1NGFlMTMxOTczYzYx
MjA4ZWE4MjQ4NmQ1ZGQxMGUzYzVjZGFkMjNiN2M0YTA2MTc3NDNjOGY1YTE4ICBzbGFuZy0yLjMu
My50YXIuYnoyCj4gIAo+ICAjIExpY2Vuc2UgZmlsZSwgbG9jYWxseSBjb21wdXRlZAo+ICBzaGEy
NTYgIGZmMDVhOTA5NjJlNzc3M2Y4YmRjNDdiMmE5NTg1MTMwNTI2MDM5MTAyNzU5YjUyNGMxZGZm
YmQ1N2NmZTQ2OWIgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zbGFuZy9zbGFuZy5t
ayBiL3BhY2thZ2Uvc2xhbmcvc2xhbmcubWsKPiBpbmRleCA0NGEwMTQ4MDg4Li5lMGY1OTY4YjQ2
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc2xhbmcvc2xhbmcubWsKPiArKysgYi9wYWNrYWdlL3Ns
YW5nL3NsYW5nLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAgCj4gLVNMQU5HX1ZFUlNJT04gPSAyLjMuMgo+ICtTTEFOR19WRVJTSU9OID0gMi4z
LjMKPiAgU0xBTkdfU09VUkNFID0gc2xhbmctJChTTEFOR19WRVJTSU9OKS50YXIuYnoyCj4gIFNM
QU5HX1NJVEUgPSBodHRwOi8vd3d3LmplZHNvZnQub3JnL3JlbGVhc2VzL3NsYW5nCj4gIFNMQU5H
X0xJQ0VOU0UgPSBHUEwtMi4wKwo+IC0tIAo+IDIuMzUuMQo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
