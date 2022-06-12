Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20048C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 18:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AA564055E;
	Sun, 12 Jun 2022 18:47:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myRMu_fUivrB; Sun, 12 Jun 2022 18:47:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93DC140364;
	Sun, 12 Jun 2022 18:47:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 890271BF2B6
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 18:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 714E240364
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 18:47:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ujj2Pr_srOix for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 18:47:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1388040012
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 18:47:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e0a2:2157:6a43:27a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0A34378032A;
 Sun, 12 Jun 2022 20:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1655059666;
 bh=WQ3GPIvUYvkXRV8bxezToBbvcFLJhmDs7yyXCMhN7VU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k0t9xX78bRy5RlFwpwUL/zlkRau+zyRDspBCXZHqLuy0Wt4rOIwjX4TdMdNioZUb2
 d24m5QB/gXOPPNYC6jgqDYwwBQAeLshgGj+3Crefaa6YiDN6b391Hal73CaIipJcLl
 DCB5Ug7AxFMCj8EB62A+HnuhNBfrQOkpGEwDN/uuvSkmtFgGM68bueS0zHUg5ev0ds
 f17QmLPEGFrhlj6llHrHFe/at0CnUCyzn3KH536l09Fydq4dy8hRlMW+2eN0/Dis3o
 VbYYO1vFSCCt3w9bYxJzH48Mg5kA/KcICMk8kYymCEi4/84/gBLODlboyRyqKkxpko
 wMH1xlYgAVJQg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 12 Jun 2022 20:47:42 +0200
Date: Sun, 12 Jun 2022 20:47:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220612184742.GJ427639@scaer>
References: <20220612160217.2210177-1-fontaine.fabrice@gmail.com>
 <20220612171318.GH427639@scaer>
 <CAPi7W82dd-8u-c45xe8yBJRkw9nLY68yB9HTSANXPhxWMF=vvA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPi7W82dd-8u-c45xe8yBJRkw9nLY68yB9HTSANXPhxWMF=vvA@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/zstd: fix build without threads
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKT24gMjAyMi0wNi0xMiAyMDoxMyArMDIwMCwgRmFicmljZSBGb250YWlu
ZSBzcGFrZSB0aHVzbHk6Cj4gTGUgZGltLiAxMiBqdWluIDIwMjIgw6AgMTk6MTMsIFlhbm4gRS4g
TU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiBhIMOpY3JpdCA6Cj4gPiBPbiAyMDIyLTA2
LTEyIDE4OjAyICswMjAwLCBGYWJyaWNlIEZvbnRhaW5lIHNwYWtlIHRodXNseToKPiA+ID4gTW92
ZSBsaWJ6c3RkLnBjIGluIFpTVERfQlVJTERfTElCUyBzbyBpdCB3aWxsIGJlIHN1ZmZpeGVkIGJ5
IC1ub210Cj4gPiA+IHdpdGhvdXQgdGhyZWFkcy4gQXMgYSByZXN1bHQsIGxpYnpzdGQucGMgd2ls
bCBub3QgY29udGFpbiAtcHRocmVhZCBpbgo+ID4gPiBMaWJzLlByaXZhdGUgd2hpY2ggd2lsbCBh
dm9pZCB0aGUgZm9sbG93aW5nIHN0YXRpYyBidWlsZCBmYWlsdXJlIHdpdGgKPiA+ID4gemNodW5r
KSByYWlzZWQgc2luY2UgY29tbWl0IDBmMGU5MTNmMTBjYWYyMWYyM2MyZTQ2ZjIxMDUxOWE3YTNi
YzBiMzI6Cj4gPiA+Cj4gPiA+IC9ob21lL2J1aWxkcm9vdC9hdXRvYnVpbGQvaW5zdGFuY2UtMi9v
dXRwdXQtMS9ob3N0L2Jpbi9hYXJjaDY0X2JlLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMtZ2NjICAt
byBzcmMvdW56Y2sgc3JjL3VuemNrLnAvdW56Y2suYy5vIHNyYy91bnpjay5wL3V0aWxfY29tbW9u
LmMubyAtV2wsLS1hcy1uZWVkZWQgLVdsLC0tbm8tdW5kZWZpbmVkIC1zdGF0aWMgLVdsLC0tc3Rh
cnQtZ3JvdXAgc3JjL2xpYi9saWJ6Y2suYSAtbGFyZ3AgL2hvbWUvYnVpbGRyb290L2F1dG9idWls
ZC9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3QvYWFyY2g2NF9iZS1idWlsZHJvb3QtbGludXgtdWNs
aWJjL3N5c3Jvb3QvdXNyL2xpYi9saWJ6c3RkLmEgLXB0aHJlYWQgL2hvbWUvYnVpbGRyb290L2F1
dG9idWlsZC9pbnN0YW5jZS0yL291dHB1dC0xL2hvc3QvYWFyY2g2NF9iZS1idWlsZHJvb3QtbGlu
dXgtdWNsaWJjL3N5c3Jvb3QvdXNyL2xpYi9saWJzc2wuYSAvaG9tZS9idWlsZHJvb3QvYXV0b2J1
aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9hYXJjaDY0X2JlLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMvc3lzcm9vdC91c3IvbGliL2xpYmNyeXB0by5hIC1XbCwtLWVuZC1ncm91cAo+ID4gPiAv
aG9tZS9idWlsZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9saWIvZ2Nj
L2FhcmNoNjRfYmUtYnVpbGRyb290LWxpbnV4LXVjbGliYy8xMC4zLjAvLi4vLi4vLi4vLi4vYWFy
Y2g2NF9iZS1idWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogY2Fubm90IGZpbmQgLWxwdGhy
ZWFkCj4gPiA+Cj4gPiA+IEZpeGVzOgo+ID4gPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy80ODFkMTk3OTkyMGRhYWVjYWM0OGRlYzc2MzE1MWUxMjQ2NTE3NDBmCj4g
PiBTbywgSSB3YXMgdmVyeSBjdXJpb3VzIGhvdyB0aGUgd2VpcmQgYnVpbGRzeXN0ZW0gZm9yIHpz
dGQgd291bGQgY29wZSwKPiA+IGFuZCBJIGFtIGFmcmFpZCBpdCBkb2VzIG5vdCBjb3BlIHdlbGw6
Cj4gPgo+ID4gICAgICQgd2dldCAtTyAuY29uZmlnICdodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9v
dC5vcmcvcmVzdWx0cy80ODFkMTk3OTkyMGRhYWVjYWM0OGRlYzc2MzE1MWUxMjQ2NTE3NDBmL2Nv
bmZpZycKPiA+ICAgICAkIG1ha2UgbWVudWNvbmZpZwo+ID4gICAgICAgICAtPiBzd2l0Y2ggdG8g
YSBib290bGluIHRvb2xjaGFpbiAodUNsaWJjIG9ubHksIHNpbWlsYXIgdG8gdGhlCj4gPiAgICAg
ICAgICAgIGZhaWxpbmcgYnVpbGQpCj4gV2h5IGFyZSB5b3Ugc3dpdGNoaW5nIHRvIGEgZGlmZmVy
ZW50IHRvb2xjaGFpbiBpbnN0ZWFkIG9mIHVzaW5nIHRoZQo+IHNhbWUgZGVmY29uZmlnPwoKVG8g
c3BlZWQgdXAgdGhlIGJ1aWxkLi4uCgo+IEluZGVlZCwgdG8gbXkgdW5kZXJzdGFuZGluZyBvZgo+
IHRvb2xjaGFpbi90b29sY2hhaW4tZXh0ZXJuYWwvdG9vbGNoYWluLWV4dGVybmFsLWJvb3RsaW4v
Q29uZmlnLmluLm9wdGlvbnMsCj4gYWxsIHVjbGliYyBib290bGluIHRvb2xjaGFpbnMgaGF2ZSB0
aHJlYWQgc3VwcG9ydCAuLi4KCkdvb2QgcG9pbnQuIExlbW1lIHJldHJ5IHRoYXQsIHRoZW4uCgo+
IElmIG5lZWRlZCwgSSBjYW4gc2VuZCBhIHY0IHRoYXQgYXBwbGllcyBjbGVhbmx5IG9uIG1hc3Rl
ci4KClRoYXQgd2lsbCBubyBiZSBuZWNlc3NhcnksIEkgY2FuIGZpeCBpdCB1cCB3aGVuIGFwcGx5
aW5nLgoKSG93ZXZlciwgZG8geW91IGhhdmUgbG9jYWwgY2hhbmdlcyBvbiB6c3RkLCB0aGF0IHlv
dSB3aWxsIGJlIHNlbmRpbmcKbmV4dD8KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
