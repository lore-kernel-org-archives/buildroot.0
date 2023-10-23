Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A86C25B41
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 16:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 781D7417B6;
	Mon, 23 Oct 2023 16:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 781D7417B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETIbhiBkLxDD; Mon, 23 Oct 2023 16:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11E0C417D2;
	Mon, 23 Oct 2023 16:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11E0C417D2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165501BF36C
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 16:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEA2B417D0
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 16:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEA2B417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5Uq8mjoWQ0m for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 16:25:15 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C543417B6
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 16:25:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C543417B6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:8ed0:8cf1:4440:5c7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0A34F200667;
 Mon, 23 Oct 2023 18:25:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Oct 2023 18:25:06 +0200
Date: Mon, 23 Oct 2023 18:25:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20231023162506.GV2607@scaer>
References: <20231020142041.25503-1-clopez@igalia.com>
 <20231021213800.GG2607@scaer>
 <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1ef03a2-8f5f-4cd3-a433-e180eb3203d5@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698078312;
 bh=j7ReKftengjBGWlTNWrwI7yVldCaEI35TytPh46BWU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FNT/Y8qJWvNt57Hu91+B+37AnAKK6FueWAA+vq+UzpB/HM8yFpsp/T/dpD1hBquHP
 3d8t7GmfL9PMJJ+wBKCVp6/RCwAM9CcdmMgGRI5jfr0JhgiGG71ILaT1es5E6jea1V
 X3e47MjDr9NRfrStqdkr+AvJ2NtrCJGcdl8e3uCrzGoIxmV8RDIvjVwGzHDqlWkJuv
 izsNgRVduNaTs0O65/7G68130XTnjT98wvIE2Jty8t/uFCPIMKzlTxoq1aAdUCr42C
 H4ot+c9TZx5W3RYSX1ZKz5MhFDlhMOlhJYXtTLbNt5o+DLUCBpdsKS7Xbrk7BrmBH7
 jOINdrQZQ1Mpg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FNT/Y8qJ
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*: stop setting
 powersave as the default CPU governor
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
Cc: Carlos Alberto Lopez Perez <clopez@igalia.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFyY3VzLCBBbGwsCgpPbiAyMDIzLTEwLTIzIDE0OjQwICswMjAwLCBNYXJjdXMgSG9mZm1hbm4g
dmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gT24gMjEuMTAuMjMgMjM6MzgsIFlhbm4gRS4g
TU9SSU4gd3JvdGU6Cj4gPkNhcmxvcywgQWxsLAo+ID4KPiA+T24gMjAyMy0xMC0yMCAxNToyMCAr
MDEwMCwgQ2FybG9zIEFsYmVydG8gTG9wZXogUGVyZXogc3Bha2UgdGh1c2x5Ogo+ID4+KiBUaGUg
ZGVmY29uZmlncyBmcm9tIHRoZSBSUGkgS2VybmVsIHNldCBgcG93ZXJzYXZlYCBhcyB0aGUgZGVm
YXVsdAo+ID4+ICAgQ1BVIGdvdmVybm9yLCB3aGljaCBpcyBhIGJhZCBpZGVhIGFzIHRoYXQgcmVk
dWNlcyBwZXJmb3JtYW5jZSBieQo+ID4+ICAgc2V0dGluZyB0aGUgQ1BVIGZyZXF1ZW5jeSB0byB0
aGUgbWluaW11bSBvbmUuCj4gPj4KPiA+PiogSW4gY2FzZSBvZiBhIGJ1aWxkcm9vdCBidWlsZCB1
c2VyLXNwYWNlIGlzIG5vdCBjb25maWd1cmVkIGJ5IGRlZmF1bHQKPiA+PiAgIHRvIGNoYW5nZSB0
aGUgQ1BVIGdvdmVybm9yLCBzbyBgcG93ZXJzYXZlYCB3aWxsIHJlbWFpbiB0aGUgQ1BVCj4gPj4g
ICBnb3Zlcm5vciBhbmQgaXQgd2lsbCBzbG93IGRvd24gZXZlcnl0aGluZy4KPiA+Pgo+ID4+KiBJ
IHN1Ym1pdHRlZCBhIGZpeCBmb3IgdGhvc2UgZGVmY29uZmlncyB0byB1cHN0cmVhbSBoZXJlOgo+
ID4+ICAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L3B1bGwvNTY2Ngo+ID4+
ICAgSG93ZXZlciwgd2Ugc2hvdWxkbid0IHdhaXQgdW50aWwgdGhhdCBpcyBhY2NlcHRlZCBhbmQg
YmFja3BvcnRlZAo+ID4+ICAgdG8gYWxsIHRoZSBzdGFibGUgYnJhbmNoZXMgKGlmIGV2ZXIgaXMp
Lgo+ID5VbmZvcnR1bmF0ZWx5LCB0aGUgcnBpIGZvbGtzIGhhdmUgcmVqZWN0ZWQgdGhpcyBjaGFu
Z2U6Cj4gPiAgICAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L3B1bGwvNTY2
NiNpc3N1ZWNvbW1lbnQtMTc3MjUzMTA5Nwo+ID4gICAgIFdlJ3JlIG5vdCBjaGFuZ2luZyBpdC4K
PiBUaGUgdXBzdHJlYW0gc2l0dWF0aW9uIGlzIHRoYXQgdGhlIGdvdmVybm9yIGlzIGNoYW5nZWQg
YnkgZGVmYXVsdCB0bwo+ICdvbmRlbWFuZCcgZHVyaW5nIGJvb3QgdGhvdWdoLCB3aGljaCBJIGRv
bid0IHRoaW5rIHRoZSBycGkgYnVpbGRyb290Cj4gZGVmY29uZmlncyBkbz8KClRoZSBkZWZjb25m
aWdzIGFyZSBiYXNpYyBjb25maWd1cmF0aW9ucyB0aGF0IGp1c3QgZGVtb25zdHJhdGUgdGhlIGJh
c2ljCmJlaGF2aW91ciBvZiBhIGJvYXJkLCB3aXRoIG1pbmltYWwgdG8gbm8gdHdlYWtpbmcgdG8g
ZGV2aWF0ZSBmcm9tCnVwc3RyZWFtcy4KClVzZXJzIGFyZSBzdXBvc2VkIHRvIHRha2UgdGhvc2Ug
ZGVmY29uZmlncywgYW5kIGFkYXB0IHRvIHRoZWlyIG5lZWRzLiBJZgp0aGV5IHdhbnQgdG8gY2hh
bmdlIHRoZSBnb3Zlcm5vciwgdGhlbiB0aGV5IGNhbiBwcm92aWRlIGEgc3RhcnR1cCBzY3JpcHQK
dGhhdCBlbmFibGVzIHRoZSByZXF1aXJlZCBnb3Zlcm5vci4gTWF5YmUgd2UgY291bGQgY2FyeSBz
dWNoIGEgc2NyaXB0IGluCmFuIG92ZXJsYXkgaW4gYm9hcmQvcmFzcGJlcnJ5cGkvLCB0aG91Z2gu
IEp1c3QgbWF5YmUuLi4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IFNvIHdoaWxlIHJwaS1P
UyB3aWxsIGJlIHJ1bm5pbmcgd2l0aCAncG93ZXJzYXZlJyBnb3Zlcm5vciBkdXJpbmcgZWFybHkK
PiBib290ICh3aGljaCB0aGV5IGhhdmUgc29tZXdoYXQgZ29vZCByZWFzb25zIGZvciwgdGhhdCBJ
J20gbm90IHN1cmUgYXBwbHkKPiB0byB0aGUgYnVpbGRyb290IHByb2plY3QsIGJ1dCB3ZWxsLCBJ
J20gbm90IGdvaW5nIHRvIGFyZ3VlIHRoYXQgd2UKPiBzaG91bGQgbmVjZXNzYXJpbHkgZGV2aWF0
ZSBoZXJlKSBmb3IgYnVpbGRyb290IGFzIGl0IGN1cnJlbnRseSBzdGFuZHMKPiB3ZSdsbCBqdXN0
IGJlIHJ1bm5pbmcgd2l0aCAncG93ZXJzYXZlJyBnb3Zlcm5vciBhbGwgdGhlIHdheSB0aHJvdWdo
LAo+IHdoaWNoIGlzIG1vc3QgbGlrZWx5IG5vdCB3aGF0IGFueW9uZSB3YW50cy4KPiAKPiA+Cj4g
PkJlc2lkZXMsIGl0IGlzIG5vdCBwcm9wZXIga2NvbmZpZyBzeW50YXgsIHNlZSBiZWxvdy4KPiA+
Cj4gPlstLVNOSVAtLV0KPiA+PmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9kZWZhdWx0
LWNwdS1nb3Zlcm5vci5mcmFnbWVudCBiL2JvYXJkL3Jhc3BiZXJyeXBpL2RlZmF1bHQtY3B1LWdv
dmVybm9yLmZyYWdtZW50Cj4gPj5uZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+aW5kZXggMDAwMDAw
MDAwMC4uZTJlMjAxZDcxZAo+ID4+LS0tIC9kZXYvbnVsbAo+ID4+KysrIGIvYm9hcmQvcmFzcGJl
cnJ5cGkvZGVmYXVsdC1jcHUtZ292ZXJub3IuZnJhZ21lbnQKPiA+PkBAIC0wLDAgKzEsOSBAQAo+
ID4+KyMgVGhlIGRlZmNvbmZpZ3MgZnJvbSB0aGUgUlBpIEtlcm5lbCBzZXQgInBvd2Vyc2F2ZSIg
YXMgdGhlIGRlZmF1bHQgQ1BVIGdvdmVybm9yLgo+ID4+KyMgVGhhdCBpcyBhIGJhZCBpZGVhIGFz
IGl0IHJlZHVjZXMgcGVyZm9ybWFuY2UsIHNvIHdlIHVuc2V0IHRoYXQgZGVmYXVsdCBvcHRpb24g
aGVyZS4KPiA+PisjIFRoZSBvcHRpb24gdG8gYnVpbGQgdGhlIHBvd2Vyc2F2ZSBnb3Zlcm5vciAo
YnV0IG5vdCBhcyB0aGUgZGVmYXVsdCkgaXMgYWxzbyBlbmFibGVkLgo+ID4+KyMgQSBmaXggZm9y
IHRoaXMgd2FzIHNlbnQgdG8gdXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlw
aS9saW51eC9wdWxsLzU2NjYKPiA+PisjIEhvd2V2ZXIsIHdlIG5lZWQgdG8gY2FycnkgdGhpcyBv
cHRpb24gb3ZlcnJpZGUgdW50aWwgdGhvc2UgZGVmY29uZmlncyBhcmUgZml4ZWQgb24KPiA+Pisj
ICphbGwqIHRoZSBrZXJuZWwgYnJhbmNoZXMgdGhhdCB3ZSBzdXBwb3J0LiBTbyB0aGF0IGNhbiBi
ZSBhIGxvbmcgdGltZSBkZXBlbmRpbmcKPiA+PisjIG9uIHdoZXRlciB0aGUgYWJvdmUgUFIgZ2V0
cyBhY2NlcHRlZCBhbmQvb3IgYmFja3BvcnRlZCB0byB0aGUgc3RhYmxlIGJyYW5jaGVzLgo+ID4+
K0NPTkZJR19DUFVfRlJFUV9ERUZBVUxUX0dPVl9QT1dFUlNBVkU9bgo+ID4KPiA+SW4ga2NvbmZp
ZywgYSBzeW1ib2wgaXMgbmV2ZXIgc2V0IHRvICduJzsgcmF0aGVyIGl0IGlzIG5vdCBzZXQgYXMg
YQo+ID5jb21tZW50LCBlLmcuIgo+ID4KPiA+ICAgICAjIENPTkZJR19DUFVfRlJFUV9ERUZBVUxU
X0dPVl9QT1dFUlNBVkUgaXMgbm90IHNldAo+ID4KPiA+UmVnYXJkcywKPiA+WWFubiBFLiBNT1JJ
Ti4KPiA+Cj4gCj4gQmVzdCwKPiBNYXJjdXMKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IAo+IG90aGVybW8gR21iSCB8IFNpdHogZGVyIEdlc2VsbHNjaGFmdDogQWx6ZW5hdSB8
IEFtdHNnZXJpY2h0IEFzY2hhZmZlbmJ1cmc6IEhSQiAxNDc4MyB8IFVTdC1JZE5yLjogREUzMTk5
Nzc5NzggfCBHZXNjaMOkZnRzZsO8aHJ1bmc6IERyLiBEZW5uaXMgTWV0ei4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0t
LS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJ
QkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUg
IERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMz
IDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBc
ZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxf
IHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0t
LS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
