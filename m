Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0B1C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 14:34:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CB88405DD;
	Wed,  8 Jun 2022 14:34:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ar1ZiKnHf3t8; Wed,  8 Jun 2022 14:34:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93A75401B2;
	Wed,  8 Jun 2022 14:34:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C24051BF873
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 14:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF673830C5
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 14:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDTy5utVFzz2 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 14:34:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35CA2830A8
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 14:34:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D0B8E100010;
 Wed,  8 Jun 2022 14:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654698854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oUYVQHcOxaPoZtRc/dkzXoWDrDNOr1DgJY2iM6eQDrI=;
 b=Kv8GmkRAhaCbpwdaLIn7dWI7FrtCY/Wp625gBXUmIhUnwPWCEFc/s3kJRT8dhKkSa9fnMh
 gqZOLNTdfk02ro+UqUderXCkSTaJKP7VFfyvvbfUvDSWgAexnpppi3fuC9Yzn7YB2C/PGS
 elUFCytfoO1mG91l8YLYzzWmG+Uy+HUOGz4/NrDw8t+QsnoVy6xModRuKCXDHL3OPKSvVu
 lADhzEZU9uo0+26+1wtWYxVfgt2w6AmEV82zpd9g9uTZrYW/AHFV57HehMnBjnoQwCyFWf
 8EuXhkoAIj+AQSP4wKe7NsIZ27WJIIKj+AsrEuFeX6BmuIb7sMQEiNRLht2P/w==
Date: Wed, 8 Jun 2022 16:34:12 +0200
To: =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20220608163412.4213947c@windsurf>
In-Reply-To: <20220608154609.3fb671f0@kmaincent-XPS-13-7390>
References: <20220608132957.68895-1-kory.maincent@bootlin.com>
 <20220608153511.76266cac@windsurf>
 <20220608154609.3fb671f0@kmaincent-XPS-13-7390>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: bump version to
 4.3.7
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
Cc: scooby22@web.de, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCA4IEp1biAyMDIyIDE1OjQ2OjA5ICswMjAwCkvDtnJ5IE1haW5jZW50IDxrb3J5Lm1h
aW5jZW50QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gPiA+ICsJY3AgLWEgJChARCkvJChHQ05BTk9f
QklOQVJJRVNfVVNFUkxBTkRfU1VCRElSKS9yZWxlYXNlL2luY2x1ZGUvKgo+ID4gPiAkKDEpL3Vz
ci9pbmNsdWRlLwo+ID4gPiArCWxuIC1zIGdibS9nYm0uaCAkKDEpL3Vzci9pbmNsdWRlL2dibS5o
Cj4gPiA+ICsJY2QgJChARCkvJChHQ05BTk9fQklOQVJJRVNfVVNFUkxBTkRfU1VCRElSKS9wa2dj
b25maWcvIDsgXAo+ID4gPiArCWZvciBmaWxlIGluICogOyBkbyBcCj4gPiA+ICsJCXNlZCAtZSAi
c3wjUFJFRklYI3wvdXNyfCIgJCRmaWxlID4gJCRmaWxlLnRlbXAgOyBcCj4gPiA+ICsJCSQoSU5T
VEFMTCkgLUQgLW0gMDY0NCAkJGZpbGUudGVtcAo+ID4gPiAkKDEpL3Vzci9saWIvcGtnY29uZmln
LyQkZmlsZSA7IFwKPiA+ID4gKwkJcm0gJCRmaWxlLnRlbXAgOyBcICAgIAo+ID4gCj4gPiBJJ2Qg
c2F5IHlvdSBjYW4gbGVhdmUgdGhlICQkZmlsZS50bXAgYXJvdW5kIGluIHRoZSBidWlsZCBkaXJl
Y3RvcnksIGl0Cj4gPiB3aWxsIG5vdCBjYXVzZSBhbnkgcHJvYmxlbS4gIAo+IAo+IEl0IGRvZXMs
IGluIHRoZSBjYXNlIHdlIGNhbGwgdGhlIHJlaW5zdGFsbCB0YXNrLCB0aGVzZSB0ZW1wIGZpbGVz
IHdpbGwgYmUgYWRkZWQKPiB0byB0aGUgZm9yIGxvb3AuCgpDaGFuZ2UgdGhlIGZvciBsb29wIHRv
OgoKCWZvciBmaWxlIGluICoucGM7IGRvCgphbmQgcHJvYmxlbSBzb2x2ZWQuCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNv
bQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
