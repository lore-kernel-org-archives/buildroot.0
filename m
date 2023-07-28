Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5523C0015E
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 07:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE5441743;
	Fri, 28 Jul 2023 07:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE5441743
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMVRWBlz_CSx; Fri, 28 Jul 2023 07:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A0114177C;
	Fri, 28 Jul 2023 07:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A0114177C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AABBE1BF489
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 80F9D403FD
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 07:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F9D403FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lJjmN44ThFiQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 07:24:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C05340103
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 07:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C05340103
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F09420009;
 Fri, 28 Jul 2023 07:24:09 +0000 (UTC)
Date: Fri, 28 Jul 2023 09:24:07 +0200
To: Christian Stewart <christian@paral.in>
Message-ID: <20230728092407.7426532a@windsurf>
In-Reply-To: <CA+h8R2qJF87Wi_w9DBjFZO__x=Kku+hfU1_-uhn2tLegFtc37g@mail.gmail.com>
References: <20230726212009.221147-1-thomas.petazzoni@bootlin.com>
 <CA+h8R2qJF87Wi_w9DBjFZO__x=Kku+hfU1_-uhn2tLegFtc37g@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690529050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u11xFtPt0ENm9LjoyYTU3Sqa2q7pw5myy9GuJTKwY6M=;
 b=GnBurBmOQ2siERMLVJakWsJ9Dr4qiM84rP30o5BxyjqpuDCNzX1YkIFc+KryU9ew+zoUZb
 SDEseWYJzl0z2mkmEO7aRiLbZbkpCd11BXr8X16FaQLn7ED1XALe3oDiGz4jGaEoKEfKPi
 aAMxxNykz9cXDqBaA2GBDDyGYIFEaM2aLvHvPcvX1uiTcF+h7U3St09TfYdY8vOb0Wgqo8
 FlxQXz6fQMw/BJBUcRm472RRT6BObNo2chbDjZWTzb9hOuXZofRBUn60KFLniOPs3IYKtG
 xafdIGy8jPnf0lfAPyUKbWbJLh9211tt8fUYPXY7lhjqRFBwbJ+77hLxiAz3kA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GnBurBmO
Subject: Re: [Buildroot] [PATCH RFC 1/2] utils/docker-run: make it
 compatible with SELinux
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ2hyaXN0aWFuLAoKT24gVGh1LCAyNyBKdWwgMjAyMyAyMDoxMzowOCAtMDcwMApDaHJp
c3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQHBhcmFsLmluPiB3cm90ZToKCj4gT24gV2VkLCBKdWwg
MjYsIDIwMjMgYXQgMjoyMOKAr1BNIFRob21hcyBQZXRhenpvbmkKPiA8dGhvbWFzLnBldGF6em9u
aUBib290bGluLmNvbT4gd3JvdGU6Cj4gPiAtICAgIC0tbW91bnQgInR5cGU9YmluZCxzcmM9JHtN
QUlOX0RJUn0sZHN0PSR7TUFJTl9ESVJ9Igo+ID4gLSAgICAtLW1vdW50ICJ0eXBlPWJpbmQsc3Jj
PSR7R0lUX0RJUn0sZHN0PSR7R0lUX0RJUn0iCj4gPiArICAgIC0tdm9sdW1lICIke01BSU5fRElS
fToke01BSU5fRElSfTpaIgo+ID4gKyAgICAtLXZvbHVtZSAiJHtHSVRfRElSfToke0dJVF9ESVJ9
OloiCj4gPiAgICAgIC0td29ya2RpciAiJHtNQUlOX0RJUn0iICAKPiAKPiBXaGF0IGlzIHRoZSBw
dXJwb3NlIG9mIHRoZSBHSVRfRElSIG1vdW50IGhlcmUsIGRvZXNuJ3QgTUFJTl9ESVIgY29udGFp
biAuZ2l0PwoKVGhpcyBpcyBleHBsYWluZWQgaW4gNzkxYzE2M2IyZjlmMDdkNGMwMmIxOGVhYmQ5
YjE5NTkxOGUxYzYwMzoKCmNvbW1pdCA3OTFjMTYzYjJmOWYwN2Q0YzAyYjE4ZWFiZDliMTk1OTE4
ZTFjNjAzCkF1dGhvcjogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CkRh
dGU6ICAgU2F0IE1heSA2IDIzOjQ2OjE4IDIwMjMgKzAyMDAKCiAgICB1dGlscy9kb2NrZXItcnVu
OiBtYWtlIGl0IHdvcmsgaW4gd29ya2RpcnMvd29rdHJlZXMKICAgIAogICAgSXQgaXMgcXVpdGUg
Y3VzdG9tYXJ5IHRvIHVzZSBhIHNpbmdsZSByZXBvc2l0b3J5IHdpdGggbXVsdGlwbGUgd29ya2Rp
cnMsCiAgICBvbmUgZm9yIGVhY2ggYWN0aXZlIGJyYW5jaCwgd2l0aCBlaXRoZXIgdGhlIGFnaW5n
ICdnaXQgbmV3LXdvcmtkaXInIG9yCiAgICB0aGUgbW9yZSByZWNlbnQgJ2dpdCB3b3JrdHJlZScu
CiAgICAKICAgIEhvd2V2ZXIsIGluIGEgd29ya2Rpci93b3JrdHJlZSwgbW9zdCBlbnRyaWVzIGlu
IC5naXQvIGFyZSBvbmx5IHN5bWxpbmtzCiAgICB0byB0aGUgYWN0dWFsIGZpbGVzIGluIHRoZSBt
YWluIHJlcG9zaXRvcnkuCiAgICAKICAgIEN1cnJlbnRseSwgdXRpbHMvZG9ja2VyLXJ1biBvbmx5
IGJpbmQtbW91bnRzIHRoZSBjdXJyZW50IHdvcmtpbmcgY29weS4KICAgIElmIHRoYXQgaXMgYSB3
b3JrZGlyL3dvcmt0cmVlLCB0aGVuIGl0IGlzIGdvaW5nIHRvIGJlIG1pc3NpbmcgdGhlIGFjdHVh
bAogICAgZ2l0IGRhdGEsIHJlc3VsdGluZyBpbiBlcnJvcnMgbGlrZToKICAgIAogICAgICAgICQg
Li91dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQogICAgICAgIGZhdGFsOiBub3Qg
YSBnaXQgcmVwb3NpdG9yeSAob3IgYW55IHBhcmVudCB1cCB0byBtb3VudCBwb2ludCBbLi4uLl0v
YnVpbGRyb290KQogICAgICAgIFN0b3BwaW5nIGF0IGZpbGVzeXN0ZW0gYm91bmRhcnkgKEdJVF9E
SVNDT1ZFUllfQUNST1NTX0ZJTEVTWVNURU0gbm90IHNldCkuCiAgICAgICAgTm8gZmlsZXMgdG8g
Y2hlY2sgc3R5bGUKICAgICAgICBtYWtlOiAqKiogW01ha2VmaWxlOjEyNTc6IGNoZWNrLXBhY2th
Z2VdIEVycm9yIDEKICAgIAogICAgU28sIHdlIGFsc28gYmluZC1tb3VudCB0aGUgYWN0dWFsIGdp
dCBkaXJlY3RvcnkuIElmIHRoYXQgaXMgYSBzdWJkaXIKICAgIG9mIHRoZSBjdXJyZW50IHdvcmtp
bmcgY29weSwgdGhlbiBpdCBpcyBhbHJlYWR5IG1vdW50ZWQgYW5kIHRodXMgdGhlCiAgICBiaW5k
LW1vdW50IGlzIHN1cGVyZmx1b3VzIGJ1dCBoYXJtbGVzczsgZm9yIHNpbXBsaWNpdHksIHdlIG1v
dW50IGl0CiAgICB1bmNvbmRpdGlvbmFsbHkuCiAgICAKICAgIFNpZ25lZC1vZmYtYnk6IFlhbm4g
RS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgogICAgQ2M6IFJpY2FyZG8gTWFydGlu
Y29za2kgPHJpY2FyZG8ubWFydGluY29za2lAZGF0YWNvbS5jb20uYnI+Cgo+IEkgdGhpbmsgdGhp
cyBtb3VudCBtaWdodCBiZSBjYXVzaW5nIHNvbWUgdW5wcmVkaWN0YWJsZSBiZWhhdmlvciBpbiB0
aGUKPiBob3N0LWdvIHBhY2thZ2UsIGJ1dCBpdCdzIGp1c3QgYSBodW5jaCBhdCB0aGUgbW9tZW50
LgoKRGlkIHlvdSBjb25maXJtIHRoaXM/CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNv
LW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
