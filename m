Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD255C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 10:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DCA42222;
	Fri, 10 Dec 2021 10:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UNFFSEflo0Tp; Fri, 10 Dec 2021 10:11:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6065A41EF9;
	Fri, 10 Dec 2021 10:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 365F01BF2B1
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 10:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2535F851A9
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 10:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B94LPD_wzB5r for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 10:11:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ACA785144
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 10:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639131092;
 bh=ye4oqMgKXsy3zp1fDRzbMEgFx68r/NDcgn6o8b2BsOI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=O6Di/Sgt6neMCfaQlBZGcD6GviEh4t5eNz5cOTRX5Sn8w5yKAQEcXjtQ2Vf5sExXq
 qXij6A2jXkxk4A3XTqqX29QSpun3SeUWwtxG9YxbJ0nSTXWWlq4ZPvEYJrkB3CzlYa
 VFq/Nl9WhYoXEAIQFEV2Vzr/SvwHDJhk4Pml4i3U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.29]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1mksyS3A91-00HKI7; Fri, 10
 Dec 2021 11:11:31 +0100
Date: Fri, 10 Dec 2021 11:11:30 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20211210111130.53db4686@gmx.net>
In-Reply-To: <20211209221529.498292-1-angelo@amarulasolutions.com>
References: <20211209221529.498292-1-angelo@amarulasolutions.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:9m/K0QyRCm+MOGyYy52PbS+UDKpLnvUZKpY33GWzgYLfY4A915s
 CCesnVyjTa/R8FKFAt/rEs1nMaD5N1+D7Xf0hubWoWgA4+hJMLR1y9n2IHvAbQnNPbl7s2Z
 rLYGgh60Wn+BBHbf0pGc/ngmApLukhcnM+8vk1dXXQPv632zz/PiXgTcrXZRq+UnmEaY0Fc
 O2IFYba6wfQhC1vKCl58Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:sYHZTj800Xw=:sYjPF7QvLqJ+gZ7WE+Axje
 YJytMOqNt08tOQ2YcIvStYuvBd7lo1avMdAydQU7a8tSlOcLRb0voYqCKdGwCvHHvx2jv8/wn
 CkV3WNonX52QYSZDQ9oaxvz0vfd1tycgV38xw3lrOPmBa+0jsJuThz9MKKtGPiJVMM9sVh917
 DY1S9KbCTa4DoioptogZVRASQB4/J85MmVTyymsyOwIsSns84TUIRFw6+qDdw4xXbUMscwGTU
 nqVCMIt1vaQi4jn3HN3JhnDcXvHV4KZ0vwBporprOhvW+t4NGKkzVsUclSovTP19QO6ATNodM
 Lprn2uvFURcR8ZGh4Tl1EFkc+jaAh5Wbjg9syskFNmBSvZO3rblMJTDwVmgp16hFLRrOSo/yo
 DwauZxwlf3eIEgRj84vstLTh31n4ixmEiAXdGur0/e/NLRDwJVpLl6BZ2ywuiyOMS3fRv2GIx
 kWWvLfD/DzwFOw3zpWNIhxUGAxO650qph653LWmLvXBA7s4o/dcHkpwduLlKVLILJByvncl6q
 tLAvYSRRaRnLxNwgTVRcnF/6yVivKaaHsAFc4nQa2R0/txDWf8ga5X44/XkmNHNYEb5jPWgU8
 dD7HKGwfFALVv64bxzttq7KPsTKEaBTsiuLeliW7jts0LKoXW1ahVQG7obvYf/MnhXDlMKrGg
 i3TJ16YQPUucYfZF+XYhq5hTf8eDE5c922aY0yicLd/rUNM5brs7es8ropqeozf1k98Qfcgwn
 zjPrwXuGPQOA6jQA8olDpadRDNmFsNmJ9e5lUNRzn495LV5iUfwPdBS/dHBbxI7hZCFY1I6xI
 +cmsKxNmPo7BzPbNpfFj7500oMwfX12oXFJOy0Bd9UFRL/2sUlYFkIQn0QcP9UHoloHIs/+X7
 4kL3fmZsRLQU4SbUJYKbaJAaJh/OOWcTT+V/QkvUEB3DmH0Uw+zQl5PI7cMPWDDWTan+jlLxB
 eP5r5K3tHkn9A9QVHJf5zlbPUzhomGFQZYA2BSTHDkQbjJBh690zXHP3nPvcxUQs6QcdTmi0b
 bYi58Key4B715KVKF5hu6nCUQIkhx/BT6gpGBVpKTP283ryxEX/Pg7YC/PT3NTue5MAvFe+RS
 Rh/e0C2tQqou9k=
Subject: Re: [Buildroot] [PATCH v2] package/grep: bump to version 3.7
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

SGVsbG8gQW5nZWxvLAoKdGhhbmtzIGZvciBxdWljayBwYXRjaCBpdGVyYXRpb24uLi4KCk9uIFRo
dSwgIDkgRGVjIDIwMjEgMjM6MTU6MjkgKzAxMDAsIEFuZ2VsbyBDb21wYWdudWNjaSA8YW5nZWxv
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZToKCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvIENv
bXBhZ251Y2NpIDxhbmdlbG9AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gLS0tCj4gdjEtPnYyOiB1
cGRhdGluZyB0aGUgc2lnbmF0dXJlIHVybCBhZnRlciBjaGVja2luZwo+ICBwYWNrYWdlL2dyZXAv
Z3JlcC5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvZ3JlcC9ncmVwLm1rICAgfCAyICstCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2dyZXAvZ3JlcC5oYXNoIGIvcGFja2FnZS9ncmVwL2dyZXAuaGFzaAo+
IGluZGV4IDlkZmUyZjJjMjMuLjI5ZDllYjFjZDYgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ncmVw
L2dyZXAuaGFzaAo+ICsrKyBiL3BhY2thZ2UvZ3JlcC9ncmVwLmhhc2gKPiBAQCAtMSw1ICsxLDUg
QEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQgYWZ0ZXIgY2hlY2tpbmcgc2lnbmF0dXJlCj4gLSMg
aHR0cDovL2Z0cC5nbnUub3JnL2dudS9ncmVwL2dyZXAtMy42LnRhci54ei5zaWcKPiArIyBodHRw
Oi8vZnRwLmdudS5vcmcvZ251L2dyZXAvZ3JlcC0zLjcudGFyLnh6LnNpZwoKVVJMIGNhbiBiZSB1
cGRhdGVkIHRvIGh0dHBzOgoKCSQgd2dldCBodHRwOi8vZnRwLmdudS5vcmcvZ251L2dyZXAvZ3Jl
cC0zLjcudGFyLnh6LnNpZwoJVVJMIHRyYW5zZm9ybWVkIHRvIEhUVFBTIGR1ZSB0byBhbiBIU1RT
IHBvbGljeQoJLS0yMDIxLTEyLTEwIDExOjA4OjU3LS0gIGh0dHBzOi8vZnRwLmdudS5vcmcvZ251
L2dyZXAvZ3JlcC0zLjcudGFyLnh6LnNpZwoJUmVzb2x2aW5nIGZ0cC5nbnUub3JnIChmdHAuZ251
Lm9yZykuLi4gMjAwMTo0NzA6MTQyOjM6OmIsIDIwOS41MS4xODguMjAKCUNvbm5lY3RpbmcgdG8g
ZnRwLmdudS5vcmcgKGZ0cC5nbnUub3JnKXwyMDAxOjQ3MDoxNDI6Mzo6Ynw6NDQzLi4uIGNvbm5l
Y3RlZC4KCUhUVFAgcmVxdWVzdCBzZW50LCBhd2FpdGluZyByZXNwb25zZS4uLiAyMDAgT0sKCUxl
bmd0aDogODMzIFthcHBsaWNhdGlvbi9wZ3Atc2lnbmF0dXJlXQoJU2F2aW5nIHRvOiDigJhncmVw
LTMuNy50YXIueHouc2ln4oCZCgoJZ3JlcC0zLjcudGFyLnh6LnNpZyAxMDAlWz09PT09PT09PT09
PT09PT09PT5dICAgICA4MzMgIC0tLi1LQi9zICAgIGluIDBzICAgICAgCgoJMjAyMS0xMi0xMCAx
MTowODo1NyAoNzY0IE1CL3MpIC0g4oCYZ3JlcC0zLjcudGFyLnh6LnNpZ+KAmSBzYXZlZCBbODMz
LzgzM10KCgpSZXZpZXdlZC1ieTogUGV0ZXIgU2VpZGVyZXIgPHBzLnJlcG9ydEBnbXgubmV0PgoK
UmVnYXJkcywKUGV0ZXIKCj4gICMgdXNpbmcga2V5IDE1NUQzRkM1MDBDODM0NDg2RDFFRUE2NzdG
RDlGQ0NCMDAwQkVFRUUKPiAtc2hhMjU2ICA2NjdlMTVlOGFmZTE4OWU5M2Y5ZjIxYTdjZDNhN2Iz
Zjc3NjIwMmY0MTczMzBiMjQ4YzJhZDRmOTk3ZDkzNzNlICBncmVwLTMuNi50YXIueHoKPiArc2hh
MjU2ICA1YzEwZGEzMTI0NjBhZWM3MjE5ODRkNWQ4MzI0NmQyNDUyMGVjNDM4ZGQ0OGQ3YWI1YTA1
ZGJjMGQ2ZDY4MjNjICBncmVwLTMuNy50YXIueHoKPiAgc2hhMjU2ICAzOTcyZGM5NzQ0ZjY0OTlm
MGY5YjJkYmY3NjY5NmYyYWU3YWQ4YWY5YjIzZGRlNjZkNmFmODZjOWRmYjM2OTg2ICBDT1BZSU5H
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ3JlcC9ncmVwLm1rIGIvcGFja2FnZS9ncmVwL2dyZXAu
bWsKPiBpbmRleCAyN2QyMDRkNGNlLi4yMzNmNWZlNjMzIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uv
Z3JlcC9ncmVwLm1rCj4gKysrIGIvcGFja2FnZS9ncmVwL2dyZXAubWsKPiBAQCAtNCw3ICs0LDcg
QEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAtR1JFUF9WRVJTSU9OID0g
My42Cj4gK0dSRVBfVkVSU0lPTiA9IDMuNwo+ICBHUkVQX1NJVEUgPSAkKEJSMl9HTlVfTUlSUk9S
KS9ncmVwCj4gIEdSRVBfU09VUkNFID0gZ3JlcC0kKEdSRVBfVkVSU0lPTikudGFyLnh6Cj4gIEdS
RVBfTElDRU5TRSA9IEdQTC0zLjArCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
