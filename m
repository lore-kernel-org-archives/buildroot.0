Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89ABCCFA1A
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9549A8169F;
	Wed, 12 Nov 2025 07:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gXbfG4ugcGvP; Wed, 12 Nov 2025 07:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE49880E17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE49880E17;
	Wed, 12 Nov 2025 07:56:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 734E51C3
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A2F64045D
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jkoa_HhDXfyA for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 07:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4522C4031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4522C4031C
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4522C4031C
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 07:56:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -866859063; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 12 Nov 2025 07:56:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1vJ5hv-00Go0B-2w;
 Wed, 12 Nov 2025 08:55:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Dick Olsson <hi@senzilla.io>,  Romain
 Naour <romain.naour@smile.fr>,  Vincent =?utf-8?Q?Stehl=C3=A9?=
 <vincent.stehle@arm.com>
References: <20251111145008.910172-1-ju.o@free.fr>
Date: Wed, 12 Nov 2025 08:55:59 +0100
In-Reply-To: <20251111145008.910172-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Tue, 11 Nov 2025 15:50:08 +0100")
Message-ID: <87y0obu1kg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=AZYl5P1xraIidBdpvjJkvk8mvssw+VdHrJCmPuHKYSs3uEaLVQPASvClyjA4RYDipjbkre1JagVGKwBIeGrwpwWEdJDBc9exaTSe4YwC0LaBDbvsekWIVWKBPdVdeHP0js2aKaPGHwbGNDpPELauWgsx7uqfFwCKtmZFVttvH1d92v58+p0u4oW9x2wx/X87xdJv1ZbCCd9qByzNb1cJGgkWK68nANzO/N+H7K5KnLgqqqdzexXESfQz4EkZF07EvDFfUZxkhewpRb7YRtYiqSz2NPF2VA29CeR/XSzUOFDpIGiCoPQ9rUIam/pSkVdMgIT0LAcAuhgFuZa9LmqTPA==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=FJQkZXQ7qx18Ykr6roFHJAGFeLamV9JQYvcCtH3QMGU=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=AZYl5P1x
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: bump to version
 edk2-stable202508
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkp1bGllbiIgPT0gSnVsaWVuIE9saXZhaW4gdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290
QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IEZvciByZWxlYXNlIG5vdGVzIHNpbmNlIGVkazIt
c3RhYmxlMjAyNTA1LCBzZWU6CiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90aWFub2NvcmUvZWRrMi9y
ZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDI1MDgKCiA+IFRoaXMgY29tbWl0IGFsc28gdXBkYXRl
cyB0aGUgZWRrMi1wbGF0Zm9ybXMgcGFja2FnZXMgd2l0aCB0aGUgbGFzdAogPiBjb21taXQgbWVy
Z2VkIGF0IHRoZSBlZGsyIHJlbGVhc2UgZGF0ZSAoMjAyNS0wOC0xMiksIHdoaWNoIGNvcnJlc3Bv
bmRzCiA+IHRvIGNvbW1pdCBbMV0uCiA+IFRoZSBlZGsyLW5vbi1vc2kgcGFja2FnZSBpcyBub3Qg
dXBkYXRlZCBiZWNhdXNlIGl0IGRpZCBub3QgcmVjZWl2ZWQKID4gYW55IGNvbW1pdCBzaW5jZSB0
aGUgbGFzdCBlZGsyIGJ1bXAuCgogPiBUaGlzIGNvbW1pdCBoYXMgYmVlbiBydW50aW1lIHRlc3Rl
ZCB3aXRoIHRlc3RzIHVzaW5nIEVESzIgcGFja2FnZSwKID4gd2l0aCBjb21tYW5kczoKCiA+ICAg
ICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKID4gICAgICAgICAtZCBkbCAtbyBvdXRwdXRf
Zm9sZGVyIFwKID4gICAgICAgICAgICAgdGVzdHMuYm9vdC50ZXN0X2VkazIgXAogPiAgICAgICAg
ICAgICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1YkFBcmNoNjRFRkkgXAogPiAgICAgICAg
ICAgICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1YmkzODZFRkkgXAogPiAgICAgICAgICAg
ICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1YlJpc2NWNjRFRkkgXAogPiAgICAgICAgICAg
ICB0ZXN0cy5ib290LnRlc3RfZ3J1Yi5UZXN0R3J1Ylg4NjY0RUZJIFwKID4gICAgICAgICAgICAg
dGVzdHMuZnMudGVzdF9pc285NjYwLlRlc3RJc285NjYwR3J1YjJFRkkgXAogPiAgICAgICAgICAg
ICB0ZXN0cy5mcy50ZXN0X2lzbzk2NjAuVGVzdElzbzk2NjBHcnViMkh5YnJpZCBcCiA+ICAgICAg
ICAgICAgIHRlc3RzLnBhY2thZ2UudGVzdF9md3RzCgogPiBJdCBoYXMgYWxzbyBiZWVuIHJ1bnRp
bWUgdGVzdGVkIChieSBib290aW5nIGluIHFlbXUpIHdpdGggZGVmY29uZmlncwogPiB1c2luZyBF
REsyIHBhY2thZ2U6CiA+IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZwogPiBxZW11X2xvb25n
YXJjaDY0X3ZpcnRfZWZpX2RlZmNvbmZpZwogPiBxZW11X3Jpc2N2NjRfdmlydF9lZmlfZGVmY29u
ZmlnCgogPiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyLXBsYXRmb3Jtcy9j
b21taXQvZDFiMjk3YjJhYTY5M2ZjNzIzYWM4ODM4NjZjOTI1ZTlkMDQyNjBjOQoKID4gQ2M6IERp
Y2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KID4gQ2M6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQHNtaWxlLmZyPgogPiBDYzogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0u
Y29tPgogPiBUZXN0ZWQtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CiA+IFNpZ25l
ZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+CgpDb21taXR0ZWQsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
