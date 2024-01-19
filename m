Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77918C4725D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jan 2024 20:14:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E89EB42CC6;
	Fri, 19 Jan 2024 20:14:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E89EB42CC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpyJBDodKG9R; Fri, 19 Jan 2024 20:14:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D58A42CCC;
	Fri, 19 Jan 2024 20:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D58A42CCC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66F191BF5AD
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:13:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46346838DE
 for <buildroot@lists.busybox.net>; Fri, 19 Jan 2024 20:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46346838DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Cl-Rtyea7ON for <buildroot@lists.busybox.net>;
 Fri, 19 Jan 2024 20:13:56 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DAC25837B9
 for <buildroot@buildroot.org>; Fri, 19 Jan 2024 20:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAC25837B9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E1AFE13F89C;
 Fri, 19 Jan 2024 21:13:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Jan 2024 21:13:46 +0100
Date: Fri, 19 Jan 2024 21:13:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>
Message-ID: <ZarX-o1aELjzYnys@landeda>
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231211155951.4079886-1-gael.portay@rtone.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705695232;
 bh=BDjLa4m8QhaYtAke+ydCNFAgEFjU3NTTc2NKiloBpFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A/pYkq3doOedCLG0f+pjRc/pf5d7tZyODPyXZFe5IGiktu6pO5K81L2YLzuL7oIRU
 dk3tfEVVJ6Hxg0IQG+Ywe182asu0DSOqKPLTOTX/Z+HCqkD/gwxyq54bP5c80LGIPO
 iOQITTEAlKXAOrpiMiejsAaDxao4q8OtgecQRv4SrQyp7lxdX5uzpmTdAQcj/M2/OT
 LhSDSA7E2hyYY5B9+PdEpzZXnky5vCNr5gYq1/+R0EwJdu0tpTCeBi0ataC9bQ90p8
 rDkbx8X7fhzDB3HmGFOR0kOJuPaJ14CeJCpdZorHTRPW0JxfeztdvzCOHg3+7WvWQO
 dmgvO7dwGyQZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=A/pYkq3d
Subject: Re: [Buildroot] [PATCH v2 0/2] Add support for Pi5
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2HDq2wsIEFsbCwKCk9uIDIwMjMtMTItMTEgMTY6NTkgKzAxMDAsIEdhw6tsIFBPUlRBWSBzcGFr
ZSB0aHVzbHk6Cj4gRGVhciBtYWludGFpbmVycywKPiAKPiBUaGlzIHR3byBwYXRjaGVzIGFkZHMg
dGhlIHN1cHBvcnQgZm9yIHRoZSBSYXNwYmVycnkgUGkgNVswXS4KPiAKPiBUaGUgZmlyc3QgcGF0
Y2ggZW5hYmxlcyBNTVUgMTZLIHBhZ2Utc2l6ZSBvbiBBUk02NCBhcyB0aGUgUmFzcGJlcnJ5IFBp
IDUKPiBzdXBwb3J0cyAxNksgcGFnZS1zaXplWzFdLgoKSSBoYXZlIHR3byBjb21tZW50cyBhYm91
dCB0aGF0OgogMS4gdGhlIHJlZmVyZW5jZWQgbGlua2VkIGRvZXMgbm90IG1lbnRpb24gdGhlIHBh
Z2Ugc2l6ZQogMi4gYXJlIDE2SyBwYWdlcyByZXF1aXJlZCBhdCBhbGw/CgpUaGUgaXNzdWUgd2l0
aCB1c2luZyAxNksgcGFnZXMsIGlzIHRoYXQgaXQgd291bGQgcHJlYzt1ZGUgdXNpbmcgZXhpc3Rp
bmcKZXh0ZXJuYWwgcHJlYnVpbHQgdG9vbGNoYWlucywgd2hpY2ggbW9zdCBwcm9iYWJseSBoYXZl
IGJlZW4gYnVpbHQgd2l0aAo0SyBwYWdlcywgYW5kIGFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIG1p
eGluZyBvYmplY3RzIGJ1aWx0IGZvciA0SyBwYWdlcwphbmQgb2JqZWN0cyBidWlsdCBmb3IgMTZL
IHBhZ2VzLCBpcyBub3Qgc3VwcG9ydGVkLgoKU28sIHVubGVzcyAxNksgaXMgYSByZXF1aXJlbWVu
dCwgSSB0aGluayB1c2luZyA0SyBwYWdlcyB3b3VsZCBiZSBiZXR0ZXIuCgpBbmQgb2YgY291cnNl
LCB3ZSBjdXJyZW50bHkgaGF2ZSBubyBpbmRpY2F0aW9uIHdoZXRoZXIgYW4gZXh0ZXJuYWwKbGli
cmFyeSB3YXMgYnVpbHQgZm9yICRrLCAxNUssIG9yIGV2ZW4gNjRLIHBhZ2VzLCBzbyB0aGlzIGlz
IHNvbWV0aGluZ3dlCm5lZWQgdG8gaW1wbGVtZW50IHNvbWVob3cuLi4KClJlZ2FyZHMsCllhbm4g
RS4gTU9SSU4uCgo+IFRoZSBsYXN0IHBhdGNoIGFkZHMgdGhlIHJhc3BiZXJyeXBpNV9kZWZjb25m
aWcgZm9yIHRoZSBSYXNwYmVycnkgUGkgNQo+IDY0LWJpdC4gSXQgdXNlcyB0aGUgZGVmY29uZmln
IGJjbTI3MTJfZGVmY29uZmlnWzJdIGFuZCB0aGUgZGV2aWNlLXRyZWUKPiBzb3VyY2UgYmNtMjcx
Mi1ycGktNS1iLmR0c1szXS4gVGhlIFJhc3BiZXJyeSBQaSA1IGhhcyBub3cgYSBkZWRpY2F0ZWQK
PiBkZWJ1ZyBVQVJUIGNvbm5lY3Rvcls0XSAoaXQgaXMgYWx3YXlzIGFjdGl2ZSBhbmQgZW5hYmxl
ZDsgdGhlcmUgaXMgbm8KPiBtb3JlIG5lZWQgdG8gZW5hYmxlX3VhcnQ9MSBpbiB0aGUgZmlsZSBj
b25maWcudHh0KS4gVGhlIFVBUlQgZGV2aWNlIG5hbWUKPiBjaGFuZ2VzIHRvIHR0eUFNQTEwIGFu
ZCB0aGUgY29tbWFuZCBsaW5lIGhhcyB0byBiZSB1cGRhdGVkIGluIHRoZSBmaWxlCj4gY21kbGlu
ZS50eHQuIFRoZSBSYXNwYmVycnkgUGkgNSBvbmx5IHN1cHBvcnRzIDY0LWJpdCBrZXJuZWxbNV0u
Cj4gCj4gQ2hhbmdlcyBzaW5jZSBSRkM6Cj4gIC0gVXBkYXRlIFJFQURNRSB0byBhZGQgbW9kZWwg
UGkgNSBCCj4gIC0gQWRkIHN1cHBvcnQgZm9yIDY0SyBNTVUgcGFnZS1zaXplIGZvciBBUk02NCBh
bmQgUmFzcGJlcnJ5IFBpIDUKPiAgLSBBZGQgUmFzcGJlcnJ5IFBpIDUgc3BlY2lmaWMgY21kbGlu
ZV81LnR4dCB0byBzZXQgaXRzIGNvbnNvbGUgb24gaXRzCj4gICAgZGVidWcgdWFydCAodHR5QU1B
MTAgaW5zdGVhZCBvZiB0dHlBTUEwKQo+ICAtIFJlbW92ZSAzMi1iaXQgdmFyaWFudCBzaW5jZSBS
YXNwYmVycnkgUGkgNSBzdXBwb3J0cyBib290aW5nIGEgNjQtYml0Cj4gICAga2VybmVsIG9ubHkK
PiAgLSBSZW1vdmUgdGhlIHByb3BlcnR5IGFybV82NGJpdD0xIGZyb20gY29uZmlnXzVfNjRiaXQu
dHh0Cj4gIC0gUmVtb3ZlIHRoZSBfNjRiaXQgc3VmZml4Cj4gIC0gUmVtb3ZlIHVuZWNlc3Nhcnkg
UGkgNSB2YXJpYW50IGZyb20gcGFja2FnZSBycGktZmlybXdhcmUKPiAKPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+ICAtIFJlYmFzZSBvbiB0b3Agb2YgbWFzdGVyCj4gIC0gUmVtb3ZlIHRoZSBidW1wcyBm
b3IgdGhlIHJwaS1maXJtd2FyZSBhbmQgbGludXggcGFja2FnZXMKPiAgLSBCdW1wIHRoZSBrZXJu
ZWwgdG8gbGludXgtMTdmMTM1Yjc0MmM0ZWRiMzQwYWZiMzY1ODczYzNhNTc0ZjdlMTZjYgo+ICAg
ICg2LjEuNjEsIGkuZS4gdGhlIHNhbWUgdmVyc2lvbiBhcyB0aGUgb3RoZXIgcmFzcGJlcnJ5cGkg
ZGVmY29uZmlncykKPiAKPiBbMF06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVu
dGF0aW9uL2NvbXB1dGVycy9yYXNwYmVycnktcGktNS5odG1sI2ludHJvZHVjdGlvbgo+IFsxXTog
aHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL2NvbmZp
Z190eHQuaHRtbCNrZXJuZWwKPiBbMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9s
aW51eC9jb21taXQvOWNmYjM3OTE0N2Y4MDNiMDM2MmIwZmUyNDllNWIxNDVkMjMyYmVhMwo+IFsz
XTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2xpbnV4L2NvbW1pdC8xMTk2YmYxYTc3
MzZmZjBhYjc5ZjUwMTJmYTg0MDgyZTI5ODAzMWE3Cj4gWzRdOiBodHRwczovL3d3dy5yYXNwYmVy
cnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvcmFzcGJlcnJ5LXBpLTUuaHRtbCN1YXJ0
LWNvbm5lY3Rvcgo+IFs1XTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRp
b24vY29tcHV0ZXJzL2NvbmZpZ190eHQuaHRtbCNhcm1fNjRiaXQKPiAKPiBLaW5kIFJlZ2FyZHMs
Cj4gR2HDq2wgUE9SVEFZICg0KToKPiAgIGFyY2g6IGFkZCBzdXBwb3J0IDE2ayBwYWdlIHNpemUg
b24gQVJNNjQKPiAgIGNvbmZpZ3M6IGFkZCByYXNwYmVycnlwaSA1IGRlZmNvbmZpZwo+IAo+ICBh
cmNoL0NvbmZpZy5pbi5hcm0gICAgICAgICAgICAgIHwgIDQgKysrKwo+ICBhcmNoL2FyY2gubWsg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY21kbGluZV81
LnR4dCB8ICAxICsKPiAgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzUudHh0ICB8IDE0ICsrKysr
KysrKysrKwo+ICBib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0ICAgIHwgIDYgKysrKysKPiAg
Ym9hcmQvcmFzcGJlcnJ5cGk1ICAgICAgICAgICAgICB8ICAxICsKPiAgY29uZmlncy9yYXNwYmVy
cnlwaTVfZGVmY29uZmlnICB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+
ICBsaW51eC9saW51eC5tayAgICAgICAgICAgICAgICAgIHwgIDQgKysrKwo+ICA4IGZpbGVzIGNo
YW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGJvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ181LnR4dAo+ICBjcmVhdGUgbW9kZSAxMjAwMDAgYm9h
cmQvcmFzcGJlcnJ5cGk1Cj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3Jhc3BiZXJyeXBp
NV9kZWZjb25maWcKPiAKPiAtLQo+IDIuNDMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBF
LiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3Mn
IGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBc
IC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0Mjcg
YC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMg
bm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBN
QUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
