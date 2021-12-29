Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD150C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8436260A70;
	Wed, 29 Dec 2021 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obdfYjqHcBJD; Wed, 29 Dec 2021 17:46:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0585A607B5;
	Wed, 29 Dec 2021 17:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF8241BF36C
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCEFD40168
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fx3SHCFuAZrQ for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 17:46:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A33CD4010C
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 17:46:42 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 82E6A1C0003;
 Wed, 29 Dec 2021 17:46:39 +0000 (UTC)
Date: Wed, 29 Dec 2021 18:46:38 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Message-ID: <20211229184638.57bdb787@windsurf>
In-Reply-To: <20211125155040.90840-1-kory.maincent@bootlin.com>
References: <20211125155040.90840-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rkdeveloptool: add new package
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gS8O2cnksCgpPbiBUaHUsIDI1IE5vdiAyMDIxIDE2OjUwOjQwICswMTAwCktvcnkgTWFp
bmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiBUaGlzIHBhY2thZ2Ug
aXMgYSB0b29sIGZyb20gUm9ja2NoaXAgdG8gY29tbXVuaWNhdGUgd2l0aCBSb2NrdXNiIGRldmlj
ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290
bGluLmNvbT4KClRoYW5rcyBmb3IgdGhpcyB0b29sLiBJIGNvbmZpcm0gdGhhdCBpdCBidWlsZHMg
ZmluZSB3aXRoIGEgY29udGFpbmVyCnRoYXQgZG9lc24ndCBoYXZlIHVkZXYgZGV2ZWxvcG1lbnQg
ZmlsZXMgaW5zdGFsbGVkLiBIb3dldmVyLCB3aGVuIEkgcnVuCml0LCBub3RoaW5nIGhhcHBlbnM6
CgokIC4vaG9zdC9iaW4vcmtkZXZlbG9wdG9vbAokIC4vaG9zdC9iaW4vcmtkZXZlbG9wdG9vbCAt
LWhlbHAKJCAuL2hvc3QvYmluL3JrZGV2ZWxvcHRvb2wgLWgKJCAuL2hvc3QvYmluL3JrZGV2ZWxv
cHRvb2wgLXYKCkFsc28sIGFub3RoZXIgcHJvYmxlbSBpcyB0aGF0IGl0IGRvZXNuJ3QgYnVpbGQg
d2l0aCBnY2MgMTEueDoKCm1haW4uY3BwOiBJbiBmdW5jdGlvbiDigJhib29sIF9aOW1lcmdlQm9v
dHYucGFydC4wKCnigJk6Cm1haW4uY3BwOjE0OTM6NDM6IGVycm9yOiDigJglc+KAmSBkaXJlY3Rp
dmUgb3V0cHV0IG1heSBiZSB0cnVuY2F0ZWQgd3JpdGluZyB1cCB0byA1NTcgYnl0ZXMgaW50byBh
IHJlZ2lvbiBvZiBzaXplIDUgWy1XZXJyb3I9Zm9ybWF0LXRydW5jYXRpb249XQogMTQ5MyB8ICAg
ICAgICAgc25wcmludGYoYnVmZmVyLCBzaXplb2YoYnVmZmVyKSwgIiVzIiwgY2hpcCk7CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KLi4uLi4uCiAx
NTM0IHwgICAgICAgICAgICAgICAgIGNoaXBUeXBlID0gY29udmVydENoaXBUeXBlKGNoaXAgKyAy
KTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+Cm1haW4uY3BwOjE0OTM6MTc6IG5vdGU6IOKAmHNucHJpbnRm4oCZIG91dHB1dCBiZXR3
ZWVuIDEgYW5kIDU1OCBieXRlcyBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSA1CiAxNDkzIHwg
ICAgICAgICBzbnByaW50ZihidWZmZXIsIHNpemVvZihidWZmZXIpLCAiJXMiLCBjaGlwKTsKICAg
ICAgfCAgICAgICAgIH5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
CmNjMXBsdXM6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwptYWtlWzJdOiAq
KiogW01ha2VmaWxlOjQ5NTogbWFpbi5vXSBFcnJvciAxCgpDb3VsZCB5b3UgZml4IHRoZXNlIGlz
c3VlcywgYXMgd2VsbCBhcyBhZGQgdGhlIGxpY2Vuc2UgZmlsZSBoYXNoIGFzCnNwb3R0ZWQgYnkg
UXVlbnRpbiA/CgpUaGFua3MhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBh
bmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
