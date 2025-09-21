Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F32ECAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 13:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38B71416F1;
	Sun, 21 Sep 2025 13:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_dimFvl7R8X; Sun, 21 Sep 2025 13:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 671BE41350
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 671BE41350;
	Sun, 21 Sep 2025 13:15:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE35DE7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 13:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6C2583C18
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 13:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oOZTF1kBnqQ for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 13:15:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD67E83C0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD67E83C0B
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD67E83C0B
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 13:15:39 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 28CA5440FAF;
 Sun, 21 Sep 2025 16:15:00 +0300 (IDT)
To: Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot <buildroot@buildroot.org>
Cc: Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250921-fix_doc_dead_link-v1-1-4f39903e93c7@bootlin.com>
 ("Alexis =?utf-8?Q?Lothor=C3=A9?= via buildroot"'s message of "Sun, 21 Sep
 2025 14:39:06 +0200")
References: <20250921-fix_doc_dead_link-v1-1-4f39903e93c7@bootlin.com>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Sun, 21 Sep 2025 16:15:35 +0300
Message-ID: <87wm5sosjs.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1758460500;
 bh=KZ7f7y3bKqZu7hW9+S0PxsEFVxM+WPWhEjKb5hraOIY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WUjTwFm5UoMd/yV1C4/YO0Vx0njmy3jTA+4d2Tr/wNiUyx64nD+2Mia/IrU0uo3iH
 DXR3xk0OwHDwC2BFLa0UjOc/Ic11+QE3e0n80sW99IELKqo20OqhFbdO40Rg9ulG/i
 RtrofuQejakGUkYCcLHcgbO+h/WZvvfJ1zp9hopTItxflvR8qZIsz6IZcHDuQdgC82
 W3ZuN2XmxyFlwUbVDJBxk6IbdVGblEKzSrlI5o/bYM0JTuEgUwt5hwwPRHws/DUXNu
 t9rUUzBkcFiX0N4D4AKHbxoMEs5je8kAdgl/w9xIEdo37CAsY9290UtPwTzPjSrDBj
 5Jb72OK3efS0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=WUjTwFm5
Subject: Re: [Buildroot] [PATCH] docs/manual/getting: fix dead link
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGlzLAoKT24gU3VuLCBTZXAgMjEgMjAyNSwgQWxleGlzIExvdGhvcsOpIHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gV2hlbiBzZWFyY2hpbmcgZm9yIHRoZSBvZmZpY2lhbCBnaXQgcmVwb3Np
dG9yeSBpbiB0aGUgZG9jdW1lbnRhdGlvbiwKPiByZWFkZXJzIGFyZSBmb3J3YXJkZWQgdG8gdGhl
IGJ1aWxkcm9vdCB3ZWJzaXRlIERvd25sb2FkIHBhZ2Ugd2l0aCBhIGxpbmsKPiBwb2ludGluZyB0
byBidWlsZHJvb3Qub3JnL2Rvd25sb2FkLCB3aGljaCByZXR1cm5zIGEgNDA0Lgo+Cj4gRml4IHRo
ZSBkZWFkIGxpbmsgYnkgYWRkaW5nIHRoZSBtaXNzaW5nIC5odG1sIHN1ZmZpeC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4g
LS0tCj4gIGRvY3MvbWFudWFsL2dldHRpbmcuYWRvYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW51
YWwvZ2V0dGluZy5hZG9jIGIvZG9jcy9tYW51YWwvZ2V0dGluZy5hZG9jCj4gaW5kZXggNTFjOTdk
NTc5MzEwNTgwODJiNDI2ZDE5YjViZWY2Yzc0ZDFmOGE1ZC4uMTQzN2EzY2NlZjIzNDk5NjU3MTBl
Nzg1YTg3ZjA3ODIyNDAyNWI1ZCAxMDA2NDQKPiAtLS0gYS9kb2NzL21hbnVhbC9nZXR0aW5nLmFk
b2MKPiArKysgYi9kb2NzL21hbnVhbC9nZXR0aW5nLmFkb2MKPiBAQCAtMzIsNSArMzIsNSBAQCB2
YWdyYW50IHVwCj4gIAo+ICBJZiB5b3Ugd2FudCB0byBmb2xsb3cgZGV2ZWxvcG1lbnQsIHlvdSBj
YW4gdXNlIHRoZSBkYWlseSBzbmFwc2hvdHMgb3IKPiAgbWFrZSBhIGNsb25lIG9mIHRoZSBHaXQg
cmVwb3NpdG9yeS4gUmVmZXIgdG8gdGhlCj4gLWh0dHA6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fk
W0Rvd25sb2FkIHBhZ2VdIG9mIHRoZSBCdWlsZHJvb3Qgd2Vic2l0ZQo+ICtodHRwOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZC5odG1sW0Rvd25sb2FkIHBhZ2VdIG9mIHRoZSBCdWlsZHJvb3Qgd2Vi
c2l0ZQoKTWF5YmUgc3dpdGNoIHRvIGh0dHBzIHdoaWxlIGF0IGl0PyBUaGlzIGxpbmsgcmVkaXJl
Y3RzIHRoZXJlIGFueXdheS4KCmJhcnVjaAoKPiAgZm9yIG1vcmUgZGV0YWlscy4KPgo+IC0tLQo+
IGJhc2UtY29tbWl0OiA1ZDJhYmRjNjZjYTY4N2M5MjZlMWM0NTQ2YzEyYWNhN2Y3ZDcyY2E0Cj4g
Y2hhbmdlLWlkOiAyMDI1MDkyMS1maXhfZG9jX2RlYWRfbGluay1jZTllZDRlODQxNzIKPgo+IEJl
c3QgcmVnYXJkcywKCi0tIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH4uIC5+ICAgVGsgT3BlbiBTeXN0ZW1zCj19LS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tb29PLS1VLS1Pb28tLS0tLS0tLS0tLS17PQog
ICAtIGJhcnVjaEB0a29zLmNvLmlsIC0gdGVsOiArOTcyLjUyLjM2OC40NjU2LCBodHRwOi8vd3d3
LnRrb3MuY28uaWwgLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
