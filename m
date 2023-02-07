Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1204AC636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 465AA40B48;
	Tue,  7 Feb 2023 22:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 465AA40B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OfvrmLKKLewQ; Tue,  7 Feb 2023 22:16:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31A9940B26;
	Tue,  7 Feb 2023 22:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A9940B26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 654131BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:15:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F13781D65
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F13781D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJa-ZCw3-AZa for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:15:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 272EC81D47
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 272EC81D47
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:15:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3DF63B0053B;
 Tue,  7 Feb 2023 23:15:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 23:15:17 +0100
Date: Tue, 7 Feb 2023 23:15:17 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230207221517.GC2817@scaer>
References: <cover.1675805584.git.yann.morin.1998@free.fr>
 <393e263cc9e0f72b237b6bf5cda86101ded50101.1675805584.git.yann.morin.1998@free.fr>
 <d171cfa3-b5ad-35d2-7a7e-016dc5f8513a@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d171cfa3-b5ad-35d2-7a7e-016dc5f8513a@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675808123;
 bh=GjzOa/0ZQ0GikqY+gWCByZgA2FrqYZzrcNngmZX8scY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=daBMqdS/v+07U64r7q4eRzF/smjPbjxzSCHyY1vQHi50JdSra/T/SPYVmCDLCAjPg
 hNFlHgUyKEZQ5ou50zwQ6zLt0/zFZW1PehVvLysFADuqwuxf32evbr2BILymI4BpIk
 XeeDJ4pHO7aq+cZwEbc1w4VU53zIP949kyCpgxb1CBARRFPbisGpy78Sg24dc8vdQd
 jNIzMgsuzn95UKg4nQ3l5Xo1UIIY1J0weHxtGnPjbyfgF9ejnygBzX+rz4sO7bPhOn
 HWlswFz9eRqe/RNlaYetafCIbGiW5ncf1zKte0cS/8mFwnD/2A9HwUqJsWqUEU4/6y
 5uvNW6EvMRMHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=daBMqdS/
Subject: Re: [Buildroot] [PATCH 2/2] gitlab-ci: fix pipelines
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluLCBBbGwsCgpPbiAyMDIzLTAyLTA3IDIyOjU3ICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IElzICJmaXggcGlwZWxpbmVzIiB5b3VyIFdJUCBwYXRjaCBzdWJqZWN0ID8K
PiAiZ2l0bGFiLWNpOiBpZ25vcmUgb3duZXJzaGlwIG9mIHRoZSBnaXQgdHJlZSIgc2VlbXMgYmV0
dGVyPwoKTm8sIEkgcmVhbGx5IGludGVuZGVkIHRvIHdyaXRlICJmaXggcGlwZWxpbmUiLgoKSW5k
ZWVkLCB0aGUgc3ViamVjdCBvZiBhIGNvbW1pdCBsb2cgc2hvdWxkIGJlIGEgc3VtbWFyeSBvZiB0
aGUgc2VtYW50aWMKY2hhbmdlLCBub3Qgb2YgaG93IGl0IGlzIGRvbmUuCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXchIDotKQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gTGUgMDcvMDIvMjAyMyDD
oCAyMjozMywgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+ID4gV2hlbiBnaXRsYWIgcHJlcGFy
ZXMgYSBqb2IgdG8gcnVuLCBpdCBjaGVja3Mgb3V0IHRoZSByZXBvc2l0b3J5IHdpdGggYQo+ID4g
bm9uLXJvb3QgdXNlciwgYW5kIHNwYXducyBhIGNvbnRhaW5lciB0aGF0IHJ1bnMgYXMgcm9vdCwg
d2l0aCBzb21lIFVJRAo+ID4gbWFwcGluZyB0aGF0IG1ha2VzIHRoZSBmaWxlcyBiZSBvd25lZCBi
eSByb290IGluIHRoZSBjb250YWluZXIuIEhvd2V2ZXIsCj4gPiBvdXIgcGlwZWxpbmVzIHJ1biBh
cyBhIG5vbnQtcm9vdCB1c2VyLgo+ID4gCj4gPiBDb21taXQgYmRlMTY1ZjdhZCAoLmdpdGxhYi1j
aS55bWw6IHVwZGF0ZSBEb2NrZXIgaW1hZ2UgdG8gdXNlKSB1cGRhdGVkCj4gPiB0aGUgZG9ja2Vy
IGltYWdlIHRoYXQgaXMgdXNlZCB0byBydW4gaW4gb3VyIHBpcGVsaW5lcy4KPiA+IAo+ID4gVGhh
dCBuZXcgaW1hZ2UgaW5jbHVkZXMgYSBnaXQgdmVyc2lvbiB0aGF0IGlzIHN0cmljdGVyIGFib3V0
IHRoZQo+ID4gb3duZXJzaGlwIG9mIHRoZSBnaXQgdHJlZSBpdCBpcyBhY3RpbmcgaW46IGdpdCBh
Ym9ydHMgaW4gZXJyb3Igd2hlbiB0aGUKPiA+IHVzZXIgcnVubmluZyBpdCBkb2VzIG5vdCBvd24g
dGhlIHJlcG9zaXRvcnkuCj4gPiAKPiA+IFdlIHVzZSBgZ2l0IGxzLXRyZWVgIHF1aXRlIGEgbG90
IGluIG91ciBjaGVjay17Zmxha2U4LHBhY2thZ2Usc3ltYm9sc30KPiA+IHJ1bGVzLCBzbyB0aGV5
IGFsbCBmYWlsIChpbiB2YXJpb3VzIHdheXMpLgo+ID4gCj4gPiBUbyBmaXggdGhpcywgd2UgZWl0
aGVyIG5lZWQgdG8gZml4IHRoZSBvd25lcnNoaXAgb3IgdGVsbCBnaXQgdG8gaWdub3JlCj4gPiB0
aGUgc2l0dWF0aW9uLgo+ID4gCj4gPiBJdCBpcyBtb3N0IHByb2JhYmx5IGltcG9zc2libGUgdG8g
Y2hhbmdlIHRoZSBvd25lcnNoaXAgb2YgdGhlIGZpbGVzOiB3ZQo+ID4gcnVuIGFzIG5vbi1yb290
LGFuZCB0aGUgZmlsZXMgYmVsb25nIHRvIHJvb3QgKGluIHRoZSBjb250YWluZXIpLiBTbwo+ID4g
d2UncmUgc3R1Y2suCj4gPiAKPiA+IFRoZSBhbHRlcm5hdGl2ZSwgaXMgdG8gZG8gYXMgZ2l0IHN1
Z2dlc3QsIGFuZCB0ZWxsIGl0IHRvIGlnbm9yZSB0aGUKPiA+IHNpdHVhdGlvbi4gSW4gYSBsb2Nh
bCBzZXR1cCwgdGhpcyB3b3VqbGQgYmUgdmVyeSBpbnNlY3VyZSwgYnV0IGluIHRoZQo+ID4gcGlw
ZWxpbmVzLCB0aGlzIGlzIGluIGEgdGhyb3ctYXdheSBjb250YWluZXIsIHdlaHJlIGEgc2luZ2xl
IHVzZXIgZXhpc3RzCj4gPiBhbmQgaXMgcnVubmluZywgc28gd2UgZG9uJ3QgY2FyZSBtdWNoIChp
ZiBhdCBhbGwpLgo+ID4gCj4gPiBBZGQgYSBnbG9iYWwgYmVmb3JlX3NjcmlwdCB0aGF0IHJlZ2lz
dGVycyB0aGUgZ2l0IGNvbmZpZyB0byBpZ25vcmUKPiA+IG93bmVyc2hpcCBpc3N1ZXMgaW4gdGhl
IGJ1aWxkcm9vdCByZXBvc2l0b3J5OyBzZWUgWzBdIGZvciB0aGUgZGVmaW5pdGlvbgo+ID4gb2Yg
dGhlIENJX1BST0pFQ1RfRElSIHZhcmlhYmxlLiBOb3RlOiB1bmxpa2Ugd2hhdCBpcyBzYWlkIGlu
IHRoZXJlLCBhbmQKPiA+IGluIFsxXSwgdGhlIHZhbHVlIGFjdHVhbGx5IHNlZW4gaW4gQ0lfUFJP
SkVDVF9ESVIgaXMgYWxyZWFkeSBwcmVmaXhlZAo+ID4gd2l0aCBDSV9CVUlMRFNfRElSICh0aGUg
ZG9jdW1lbnRhdGlvbiBpcyB1bmNsZWFyIGFib3V0IHRoYXQgcG9pbnQpLgo+ID4gCj4gPiBbMF0g
aHR0cHM6Ly9kb2NzLmdpdGxhYi5jb20vZWUvY2kvdmFyaWFibGVzL3ByZWRlZmluZWRfdmFyaWFi
bGVzLmh0bWwKPiA+IFsxXSBodHRwczovL2RvY3MuZ2l0bGFiLmNvbS9ydW5uZXIvY29uZmlndXJh
dGlvbi9hZHZhbmNlZC1jb25maWd1cmF0aW9uLmh0bWwjdGhlLXJ1bm5lcnMtc2VjdGlvbgo+IAo+
IFJldmlld2VkLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAKPiAK
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZy
ZWUuZnI+Cj4gPiBDYzogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJu
b3V0QG1pbmQuYmU+Cj4gPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29t
Pgo+ID4gQ2M6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
Cj4gPiAtLS0KPiA+ICBzdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbiB8IDMgKysrCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvc3Vw
cG9ydC9taXNjL2dpdGxhYi1jaS55bWwuaW4gYi9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5p
bgo+ID4gaW5kZXggOWMxZmFmMGQ1Zi4uMzhhY2EzMWZiNSAxMDA2NDQKPiA+IC0tLSBhL3N1cHBv
cnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4gPiArKysgYi9zdXBwb3J0L21pc2MvZ2l0bGFiLWNp
LnltbC5pbgo+ID4gQEAgLTEsMyArMSw2IEBACj4gPiArYmVmb3JlX3NjcmlwdDoKPiA+ICsgIC0g
Z2l0IGNvbmZpZyAtLWdsb2JhbCAtLWFkZCBzYWZlLmRpcmVjdG9yeSAke0NJX1BST0pFQ1RfRElS
fQo+IAo+IE5vdGU6IEkgY2hlY2tlZCBpZiB3ZSBoYXZlIHRoZSBpc3N1ZSB1c2luZyB0aGUgdXRp
bHMvZG9ja2VyLXJ1biBkaXJlY3RseSwKPiBlbmFibGluZyBzYWZlLmRpcmVjdG9yeSBpcyBub3Qg
bmVjZXNzYXJ5Lgo+IAo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAKPiAKPiA+ICsKPiA+ICAu
Y2hlY2stY2hlY2stcGFja2FnZV9iYXNlOgo+ID4gICAgICBzY3JpcHQ6Cj4gPiAgICAgICAgICAt
IHB5dGhvbjMgLW0gcHl0ZXN0IC12IHV0aWxzL2NoZWNrcGFja2FnZWxpYi8KPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0t
LS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJ
IFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdh
cmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8Cnwg
KzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8
ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8v
KlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0t
LS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
