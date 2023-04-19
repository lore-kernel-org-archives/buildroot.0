Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD96C77B73
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 19:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAB0D42AB8;
	Wed, 19 Apr 2023 19:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB0D42AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7kXGUxdFwhZ; Wed, 19 Apr 2023 19:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5C93404BF;
	Wed, 19 Apr 2023 19:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5C93404BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 887401BF86D
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 19:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5ABD240911
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 19:50:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ABD240911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nTGk6e9yE_zh for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 19:50:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBA2408FF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7DBA2408FF
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 19:50:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 935966012F;
 Wed, 19 Apr 2023 21:50:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Apr 2023 21:50:23 +0200
Date: Wed, 19 Apr 2023 21:50:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230419195023.GA2748651@scaer>
References: <20220812101718.47491-1-fontaine.fabrice@gmail.com>
 <20230415212933.GU2819@scaer>
 <CADvTj4o4dPhWnKiQ0dvm6cJSqwY+ZtbyE0Gwhh8A5Nc5dKPYOQ@mail.gmail.com>
 <20230416082556.GW2819@scaer> <20230416111659.GY2819@scaer>
 <CADvTj4q-qJ6EiYxOcNfgQRL1q7UPNp9SC7s_CwBVeCk=6PrMqw@mail.gmail.com>
 <20230418174452.GP2819@scaer>
 <CADvTj4o9KPC3_knDp4KjKwyyFQZ4HPsbSj4n21dqT6bhtWM9pw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4o9KPC3_knDp4KjKwyyFQZ4HPsbSj4n21dqT6bhtWM9pw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681933828;
 bh=SmZMUcm018/Uu2vZvRBuBZSUTS0pYZtzsq5ELYaIvPs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OLj211GilK9dDThmDiUBGOIw166mKDBC4+bkwDroEicX1J0TS9yITFJMmrmmLftgj
 pFwPxWu0Jl1t7EWcnw/0YkRa/69/rtJQqP7X1xd5sx+ASehoiS3VInFCUhC/Pft/o5
 McDUOvJeCKVUHlJ3avppgfa1gHBQ2EOydLO8HxZ5yWSdJDGJJ71ut7avpAyQ94zxKZ
 HGybEAJSpw23q2cOoQvGUdbZCZqCktmmSYCIOwEBmhrCpGxajj93j+cQq8h+nEWHpe
 oQBUVnKBMmeAwX8HqgjEFVPEMQFQQJocBy60W8x/YC8ScZCwBOejZtzvEnlP+D8/PN
 xouQbYtkgxMFA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OLj211Gi
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsIEFsbCwKCk9uIDIwMjMtMDQtMTggMTU6NTggLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNw
YWtlIHRodXNseToKPiBPbiBUdWUsIEFwciAxOCwgMjAyMyBhdCAxMTo0NOKAr0FNIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+IE9uIDIwMjMtMDQtMTgg
MDI6MDMgLTA2MDAsIEphbWVzIEhpbGxpYXJkIHNwYWtlIHRodXNseToKPiA+ID4gT24gU3VuLCBB
cHIgMTYsIDIwMjMgYXQgNToxN+KAr0FNIFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBm
cmVlLmZyPiB3cm90ZToKPiA+ID4gPiBPbiAyMDIzLTA0LTE2IDEwOjI1ICswMjAwLCBZYW5uIEUu
IE1PUklOIHNwYWtlIHRodXNseToKPiA+IFN1cmUsIGJ1dCB0aGVuIG1heWJlIGl0IGJlZ3MgZm9y
IGEgZ2VuZXJpYyBzb2x1dGlvbiwgdGhhdCB3b3JrcyBmb3IgYWxsCj4gPiBwYWNrYWdlcz8KPiBJ
IHJlcG9ydGVkIHRoaXMgaXNzdWUgdXBzdHJlYW0gdG8gZ3Jhbml0ZToKPiBodHRwczovL2dpdGh1
Yi5jb20vZWxlbWVudGFyeS9ncmFuaXRlL2lzc3Vlcy82NDUKClRoYW5rcyBmb3IgYmVpbmdpbmcg
dGhpcyB1cHN0cmVhbTsgVGhleSBoYXZlIGV4cGxhaW5lZCB3aHkgdGhleSBjYW4ndAp1c2UgdGhl
ICJzdGFuZGFyZCBtZXNvbiB3YXkiLCBhbmQgdGhlIHNvbHV0aW9uIGRvZXMgbm90IHNlZW0gdG8g
YmUKc3RyYWlnaHRmb3J3YXJkLCBzbyB3ZSdsbCBkZWZpbml0ZWx5IHdpbGwgaGF2ZSB0byBoYXZl
IGEgd2F5IHRvCndvcmthcm91bmQgdGhhdC4KCkFsc28sIG5vdGhpbmcgd291bGQgcHJldmVudCBh
bnkgb3RoZXIgY21ha2UtYmFzZWQgcGFja2FnZSB0byB1c2UKaW50cm9zcGVjdGlvbiwgYW5kIHRo
YXQgd291bGQgYmUgc2ltaWxhcmx5IGJyb2tlbi4uLgoKPiA+IE1heWJlIHNvbWV0aGluZyBsaWtl
IHdlIHVzZWQgR0lSX0VYVFJBX0xJQlNfUEFUSCBmcm9tIHRoZSBlbnZpcm9ubWVudCwKPiA+IHdl
IGNvdWxkIGFsbG93IHBhY2xhZ2VzIHRvIHNwZWNpZnkgYWRkaXRpb25hbCBpbmNsdWRlIGRpcmVj
dG9yaWVzIHdpdGgKPiA+IEdJUl9FWFRSQV9JTkNMVURFX1BBVEggPwo+IEknbSBub3QgcmVhbGx5
IHN1cmUgaWYgdGhpcyBtYWtlcyBzZW5zZSB0byBkbyBmb3IgYWxsIHBhY2thZ2VzIGFzIGl0Cj4g
Y291bGQgaGF2ZSBzaWRlCj4gZWZmZWN0cyB3aGljaCBtYXkgaW50ZXJmZXJlIHdpdGggbWVzb24n
cyBuYXRpdmUgZ29iamVjdC1pbnRyb3NwZWN0aW9uCj4gaW50ZWdyYXRpb24uCgpBcyBJIHNhaWQs
IGl0IHdvdWxkIG5vdCBiZSBmb3IgKmFsbCogcGFja2FnZXMsIGJ1dCBvbmx5IGZvciB0aG9zZSB0
aGF0CmFjdHVhbGx5IHNldCBHSVJfRVhUUkFfSU5DTFVERV9QQVRIOyBpdCB3b3VsZCBiZSBoYW5k
bGVkIHRoZSBzYW1lIHdheQp3ZSBjdXJyZW50bHkgaGFuZGxlIEdJUl9FWFRSQV9MSUJTX1BBVEg6
IGlmIGEgcGFja2FnZSBuZWVkcyBhIHNwZWNpYWwKcGF0aCB0byBmaW5kIGxpYnJhcmllcywgaXQg
Y2FuIHNldCBHSVJfRVhUUkFfTElCU19QQVRIIFswXSBpbiBpdHMKZW52aXJvbm1lbnQsIGUuZy46
CgogICAgRk9PX0VOViArPSBHSVJfRVhUUkFfTElCU19QQVRIPSQoQEQpL3NyYy8ubGlicwoKQW5k
IHRoYXQgd2lsbCBiZSBhdXRvbWF0aWNhbGx5IGFkZGVkIHRvIHRoZSBsaWJyYXJ5IHNlYXJjaCBw
YXRoIGluIG91cgpnLWlyLXNjYW5uZXIgd3JhcHBlcnM6CgogICAgcGFja2FnZS9nb2JqZWN0LWlu
dHJvc3BlY3Rpb24vZy1pci1zY2FubmVyLXFlbXV3cmFwcGVyLmluCiAgICBwYWNrYWdlL2dvYmpl
Y3QtaW50cm9zcGVjdGlvbi9nLWlyLXNjYW5uZXIuaW4KClNvLCB3ZSBjb3VsZCB2ZXJ5IHdlbGwg
ZG8gc29tZXRoaW5nIHNpbWlsYXIgZm9yIEdJUl9FWFRSQV9JTkNMVURFX1BBVEg6CgogICAgZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ29iamVjdC1pbnRyb3NwZWN0aW9uL2ctaXItY29tcGlsZXIuaW4g
Yi9wYWNrYWdlL2dvYmplY3QtaW50cm9zcGVjdGlvbi9nLWlyLWNvbXBpbGVyLmluCiAgICBpbmRl
eCA3MTI3NTMwMjNhLi45N2E2ZDczMzNlIDEwMDY0NAogICAgLS0tIGEvcGFja2FnZS9nb2JqZWN0
LWludHJvc3BlY3Rpb24vZy1pci1jb21waWxlci5pbgogICAgKysrIGIvcGFja2FnZS9nb2JqZWN0
LWludHJvc3BlY3Rpb24vZy1pci1jb21waWxlci5pbgogICAgQEAgLTEsMyArMSw1IEBACiAgICAt
IyEvdXNyL2Jpbi9lbnYgc2gKICAgICsjIS91c3IvYmluL2VudiBiYXNoCiAgICArCiAgICArc2V0
ICQocHJpbnRmICcgLS1pbmNsdWRlZGlyPSVzJyAke0dJUl9FWFRSQV9JTkNMVURFX1BBVEgvLzov
IH0pICIke0B9IgogICAgIAogICAgICIkKGRpcm5hbWUgIiQwIikiL2ctaXItc2Nhbm5lci1xZW11
d3JhcHBlciAiJChkaXJuYW1lICIkMCIpIi9nLWlyLWNvbXBpbGVyLnJlYWwgIiRAIgogICAgZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ3Jhbml0ZS9ncmFuaXRlLm1rIGIvcGFja2FnZS9ncmFuaXRlL2dy
YW5pdGUubWsKICAgIGluZGV4IDcxZGZiZjRjMDMuLjgzMDlkMjE0MTQgMTAwNjQ0CiAgICAtLS0g
YS9wYWNrYWdlL2dyYW5pdGUvZ3Jhbml0ZS5tawogICAgKysrIGIvcGFja2FnZS9ncmFuaXRlL2dy
YW5pdGUubWsKICAgIEBAIC0yMCw2ICsyMCw4IEBAIEdSQU5JVEVfTERGTEFHUyA9ICQoVEFSR0VU
X0xERkxBR1MpICQoVEFSR0VUX05MU19MSUJTKQogICAgCiAgICAgaWZlcSAoJChCUjJfUEFDS0FH
RV9HT0JKRUNUX0lOVFJPU1BFQ1RJT04pLHkpCiAgICAgR1JBTklURV9DT05GX09QVFMgKz0gLURp
bnRyb3NwZWN0aW9uPXRydWUKICAgICtHUkFOSVRFX0NPTkZfRU5WICs9IEdJUl9FWFRSQV9JTkNM
VURFX1BBVEg9JChTVEFHSU5HX0RJUikvdXNyL3NoYXJlL2dpci0xLjAKICAgICtHUkFOSVRFX05J
TkpBX0VOViArPSBHSVJfRVhUUkFfSU5DTFVERV9QQVRIPSQoU1RBR0lOR19ESVIpL3Vzci9zaGFy
ZS9naXItMS4wCiAgICAgR1JBTklURV9ERVBFTkRFTkNJRVMgKz0gZ29iamVjdC1pbnRyb3NwZWN0
aW9uCiAgICAgZWxzZQogICAgIEdSQU5JVEVfQ09ORl9PUFRTICs9IC1EaW50cm9zcGVjdGlvbj1m
YWxzZQoKV2UgY291bGQgZG8gdGhlIHNhbWUgZm9yIHBvcHBsZXIsIGJ1dCBpdCdzIGJldHRlciB0
byB1c2UgdXBzdHJlYW0ncwptZWNoYW5pc20sIGFzIHRoZXkgbm93IGhhdmUgb25lLiBCdXQgZm9y
IGdyYW5pdGUsIGlmIHVwc3RyZWFtIGNhbid0IGZpbmQKYSBzb2x1dGlvbiwgYW5kIGRvZXMgbm90
IHdhbnQgdG8gYWRkIGEgY29uZmlnIG9wdGlvbiwgd2UnbGwgaGF2ZSB0bwpyZXNvcnQgdG8gdGhh
dC4uLgoKWzBdIFdlIGN1cnJlbnRseSBoYXZlIG5vIHBhY2thZ2UgdGhhdCBzZXRzIEdJUl9FWFRS
QV9MSUJTX1BBVEgsIGFuZApuZXZlciBoYWQsIGJ1dCBzdXBwb3J0IGlzIHRoZXJlLi4uCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4g
RS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNz
JyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwg
XCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3
IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlz
IG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwg
TUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
