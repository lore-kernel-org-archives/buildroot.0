Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9009FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 07:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01D3260E90;
	Sun, 24 Jul 2022 07:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01D3260E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lx6o4EtlsPhR; Sun, 24 Jul 2022 07:59:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C40DC60B93;
	Sun, 24 Jul 2022 07:59:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40DC60B93
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 111071BF314
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:59:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D87A560B93
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 07:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87A560B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4gG-pKT1kUx9 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 07:59:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D97F60AD1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D97F60AD1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 07:59:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D20F578051D;
 Sun, 24 Jul 2022 09:59:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 09:59:06 +0200
Date: Sun, 24 Jul 2022 09:59:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220724075906.GO2641@scaer>
References: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
 <20220705134402.5914-2-david.gouarin@thalesgroup.com>
 <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c4dd777-7209-90e3-ea5d-b0ae57c745a9@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658649552;
 bh=1sNOX9BsVCQizeOl601uU8MnDixdQBpYKA+bquWDo1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=q1Mb4Edzs7VPRRaCu10EMl+I9beS25lcYPw0K3RN87DToL3YJg3bqa1ZAqRUD0XVt
 KFFLHrqPYVVMB+FZP9tqcX0CIan0hgbHZxJb8nQeXmp98jER/ZKA+QP1meaOZFkTto
 3O+G+1oIBmFHYaeKh+g7Y1KWSZmox1m1BZgBxIBvsyclZROihNIE+ukg7Gjur1spfN
 /QbAShPCyOAziD+3O8G0GxuRK0z9o39QaXwXAN9cVHHzo6BrF2kKVsxg2E774xfaYT
 qK+Mpr4vE1VljdjLzittSHZlEsTPK/PMnazeWECI2ZePXIUgKbXm+KtpcExBeIrCi6
 Jv/skw+DPI8Tw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q1Mb4Edz
Subject: Re: [Buildroot] [PATCH 2/2] package/libtalloc: bump version to 2.3.4
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBEYXZpZCwgQWxsLAoKT24gMjAyMi0wNy0yMyAxOToxNSArMDIwMCwgUm9tYWluIE5h
b3VyIHNwYWtlIHRodXNseToKPiBMZSAwNS8wNy8yMDIyIMOgIDE1OjQ0LCBEYXZpZCBHT1VBUklO
IGEgw6ljcml0wqA6Cj4gPiBUaGlzIHZlcnNpb24gbmVlZHMgdG8gZGVmaW5lIGFuIGVudmlyb25t
ZW50IHZhcmlhYmxlIGluIGJ1aWxkIGFuZCBpbnN0YWxsIHN0ZXBzLgo+ID4gVGhpcyByZXF1aXJl
cyBhbiB1cGdyYWRlIHRvIHBrZ193YWYubWsuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERhdmlk
IEdPVUFSSU4gPGRhdmlkLmdvdWFyaW5AdGhhbGVzZ3JvdXAuY29tPgo+ID4gLS0tCj4gPiAgcGFj
a2FnZS9saWJ0YWxsb2MvbGlidGFsbG9jLmhhc2ggfCAyICstCj4gPiAgcGFja2FnZS9saWJ0YWxs
b2MvbGlidGFsbG9jLm1rICAgfCA1ICsrKystCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xp
YnRhbGxvYy9saWJ0YWxsb2MuaGFzaCBiL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5oYXNo
Cj4gPiBpbmRleCBjYmZkMTFlNjNiLi4wYmM4ZWRiNjk1IDEwMDY0NAo+ID4gLS0tIGEvcGFja2Fn
ZS9saWJ0YWxsb2MvbGlidGFsbG9jLmhhc2gKPiA+ICsrKyBiL3BhY2thZ2UvbGlidGFsbG9jL2xp
YnRhbGxvYy5oYXNoCj4gPiBAQCAtMSwzICsxLDMgQEAKPiA+ICAjIExvY2FsbHkgY2FsY3VsYXRl
ZAo+ID4gLXNoYTI1NiAgNmJlOTViMjM2OGJkMGFmMWM0Y2Q3YTg4MTQ2ZWI2Y2VlYTE4ZTQ2YzNm
ZmM5MzMwYmY2MjYyYjQwZDFkOGFhYSAgdGFsbG9jLTIuMy4zLnRhci5nego+ID4gK3NoYTI1NiAg
MTc5ZjllYmUyNjVlNjdlNGFiMmMyNmNhZDJiN2RlNGI2YTc3YzZjMjEyZjk2NjkwMzM4Mjg2OWYw
NmJlNjUwNSAgdGFsbG9jLTIuMy40LnRhci5nego+ID4gIHNoYTI1NiAgZjgzNDBjNDQ5ZGQ2NGE1
NWM2NjA1YjAyZmNhZDJhZWM2ZjQ3MzYxMmFjNjAyNjczOWEyMjk5NTM4MGE4MDQzYyAgdGFsbG9j
LmgKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MubWsgYi9wYWNr
YWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MubWsKPiA+IGluZGV4IDhjYmE2OTllYTEuLjZhNWUxZWY0
YjYgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL2xpYnRhbGxvYy9saWJ0YWxsb2MubWsKPiA+ICsr
KyBiL3BhY2thZ2UvbGlidGFsbG9jL2xpYnRhbGxvYy5tawo+ID4gQEAgLTQsNyArNCw3IEBACj4g
PiAgIwo+ID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gPiAgCj4gPiAtTElCVEFMTE9DX1ZF
UlNJT04gPSAyLjMuMwo+ID4gK0xJQlRBTExPQ19WRVJTSU9OID0gMi4zLjQKPiA+ICBMSUJUQUxM
T0NfU09VUkNFID0gdGFsbG9jLSQoTElCVEFMTE9DX1ZFUlNJT04pLnRhci5nego+ID4gIExJQlRB
TExPQ19TSVRFID0gaHR0cHM6Ly93d3cuc2FtYmEub3JnL2Z0cC90YWxsb2MKPiA+ICBMSUJUQUxM
T0NfTElDRU5TRSA9IExHUEwtMy4wKwo+ID4gQEAgLTQwLDYgKzQwLDkgQEAgZWxzZQo+ID4gIExJ
QlRBTExPQ19DT05GX09QVFMgKz0gLS1kaXNhYmxlLXB5dGhvbgo+ID4gIGVuZGlmCj4gPiAgCj4g
PiArTElCVEFMTE9DX0NPTkZfRU5WICs9IFBZVEhPTkhBU0hTRUVEPTEKPiA+ICtMSUJUQUxMT0Nf
TUFLRV9FTlYgKz0gUFlUSE9OSEFTSFNFRUQ9MQo+IAo+IFRoaXMgbG9va3Mgc3VzcGljaW91cy4u
LiBQWVRIT05IQVNIU0VFRD0xIHdhcyBhZGRlZCB1cHN0cmVhbSB3aXRob3V0IGV4cGxhbmF0aW9u
Cj4gYnkgdGhpcyBjb21taXQgWzFdIGJlZm9yZSBsaWJ0YWxsb2MgMi4zLjAuCgpJIGFncmVlIHRo
YXQgdGhpcyBuZWVkcyBtb3JlIGV4cGxhbmF0aW9ucyB0aGFuIGp1c3QgInRoaXMgaXMgbmVlZGVk
IHRvCmJ1aWxkIiAob2J2aW91c2x5IGl0IGlzIG5lZWRlZCB0byBidWlsZCwgb3RoZXJ3aXNlIHQg
d291bGQgbm90IGJlCnRoZXJlKS4KCj4gQWJvdXQgUFlUSE9OSEFTSFNFRUQgWzJdLgo+IFdoeSBp
dCdzIG5vdyBuZWVkZWQ/IEhhdmUgeW91IHRyaWVkIHdpdGhvdXQgaXQ/Cj4gWzFdIGh0dHBzOi8v
c2Fsc2EuZGViaWFuLm9yZy9zYW1iYS10ZWFtL3RhbGxvYy8tL2NvbW1pdC9hZmI0ZTIyYzRjYmMx
NWI2YjZjZjgyNDI3NGI2NTNlYWFhZmU0Y2M1Cj4gWzJdIGh0dHBzOi8vZG9jcy5weXRob24ub3Jn
LzMvdXNpbmcvY21kbGluZS5odG1sI2VudnZhci1QWVRIT05IQVNIU0VFRAoKVGhlIHRoaW5nIGlz
IHRoYXQgdGFsbG9jIGlzIGV4dHJhY3RlZCBvdXQgb2YgdGhlIHNhbWJhIGNvZGUsIHNvIGxvb2tp
bmcKYXQgdGhlIHRhbGxvYyByZXBvc2l0b3J5IGRvZXMgbm90IHlpZWxkIGludGVyZXN0aW5nIGNv
bW1pdCBsb2dzLCBqdXN0CiJOZXcgdXBzdHJlYW0gdmVyc2lvbiAyLjEuMTYiIGZvciB0aGUgY29t
bWl0IHRoYXQgaW50cm9kdWNlZApQWVRIT05IQVNIU0VFRC4KCkJ1dCBsb29raW5nIHQgdGhlIHNh
bWJhIGNvZGUgeWllbGRzIGJldHRlciByZXN1bHRzOgoKICAgIDE5YTRkM2NhNjkyZSBidWlsZDog
V29ya2Fyb3VuZCBweXRob24zIGhhc2ggb3JkZXIgaXNzdWVzIChmb3Igbm93KQoKICAgIFRoaXMg
d29ya3MgYXJvdW5kIHB5dGhvbjMgaGF2aW5nIGEgbmV3IGhhc2ggc2VlZCBlYWNoIHRpbWUgaXQg
c3RhcnRzIHRvIGFsbG93CiAgICBhIHNlY29uZCAibWFrZSIgbm90IHRvIHJlYnVpbGQgdGhlIHdv
cmxkLgoKICAgIFRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIHJldmVydGVkIG9uY2Ugd2UgZmluZCB0
aGUgaGFzaCB0aGF0IGlzIGNhdXNpbmcKICAgIHRoZSBpc3N1ZSwgYnV0IHNob3VsZCByZWR1Y2Ug
ZnJ1c3RyYXRpb24gZm9yIG5vdy4KClNvIGl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgYW4gaXNzdWUg
aW4gd2FmICh3aGljaCBpcyB3cml0dGVuIGluIHB5dGhvbikKd2hlcmUgaXQgdXNlcyB0aGUgLmhh
c2goKSBvZiBvYmplY3RzIHRvIGRlY2lkZSB3aGV0aGVyIHRvIHJlYnVpbGQgZmlsZXMKb3IgbnQs
IGFuZCBvZiBjb3Vyc2UsIHRoYXQgY2hhbmdlcyBldmVyeSBydW4gYmVjYXVzZSBweXRob24gdXNl
cyBhCmRpZmZlcmVudCBzZWVkIGF0IGV2ZXJ5IHJ1biAoYW5kIHJpZ2h0bHkgc28pLiBBbmQgc28s
IHBlb3BsZSB0aGF0CmFjdGl2ZWx5IGRldmVsb3Agb24gc2FtYmEgZG8gbm90IHdhbnQgdG8gcmVi
dWlsZCBldmVyeXRoaW5nIHdoZW4gdGhlCmNoYW5nZSBhIHNpbmdsZSBmaWxlLCBvYnZpb3VzbHku
CgpCdXQgaW4gb3VyIGNhc2UsIGluIEJ1aWxkcm9vdCwgd2UgZG8gbm90IG5lZWQgdG8gZG8gc28u
IEluZGVlZCwgd2UgYXJlCmJ1aWxkaW5nIHRoZSBwYWNrYWdlIGp1c3Qgb25jZSwgc28gd2UgYXJl
IG5vdCBnb2luZyB0byBoaXQgdGhhdApzaXR1YXRpb24uCgpTbywgSSBkbyBub3QgdGhpbmsgd2Ug
bmVlZCB0aGlzLgoKRGF2aWQsIGNhbiB5b3UgdHJ5IHRvIHNlZSBpZiB0aGUgYnVpbGQgc3VjY2Vl
ZHMgd2l0aG91dCBQWVRIT05IQVNIU0VFRD8KSWYgaXQgcmVhbGx5IG5lZWRzIGl0IChlLmcuIGJ1
aWxkIGZhaWx1cmUsIG9yIHJ1bnRpbWUgZmFpbHVyZSksIHRoZW4KcGxlYXNlIGV4dGVuZCB0aGUg
Y29tbWl0IGxvZyB3aXRoIHRoZSBhYm92ZSBpbmZvcm1hdGlvbiBhbmQgdGhlIGZhaWx1cmUKcmVh
c29uLiBJZiBpdCBkb2VzIG5vdCBuZWVkIGl0LCB0aGVuIGp1c3QgcmVzcGluIHRoZSBidW1wIHdp
dGhvdXQuCgpUaGFua3MhCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCi4tLS0tLS0tLS0t
LS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0t
LS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJc
IEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1Qg
ICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3Jn
LyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
