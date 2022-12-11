Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AAFC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A01481429;
	Sun, 11 Dec 2022 13:16:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A01481429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IW-M3FgKU2Y7; Sun, 11 Dec 2022 13:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7FD81699;
	Sun, 11 Dec 2022 13:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB7FD81699
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ECDE1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4751640520
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4751640520
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqcy9OQ6HFbc for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:16:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AF0440517
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AF0440517
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:16:41 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48A5FFF804;
 Sun, 11 Dec 2022 13:16:39 +0000 (UTC)
Date: Sun, 11 Dec 2022 14:16:38 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221211141638.710a66e5@windsurf>
In-Reply-To: <20221211093716.1149172-1-peter@korsgaard.com>
References: <20221211093716.1149172-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1670764599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Lsv7kTuPsDfh4PZROcfrvtfOqbwQns3/9OAtF/2Ge4=;
 b=Lyzq0y3aKyfjBV4Tv+c5s1XdoNF1fgNJt1DNcA/k3wNtoMHfjY1Ml0DfpnuY18mB3F9HsV
 6NTpqGJeDQQLAJ/5aw8j5Szx0SeYjOxn/WEvJQq09Dascs2rms0Iq7d8wpg/MhSiYfp9uV
 OXo4iS6RjCiGIG48AeR83DBVBi17mTILUiXzQX1WcZ0Hc+VaVSVzxVSrY+i6XdmGDQBboX
 LzpkWpAGYJBqsFjgUQ+xdY+Wwkk5Z+sEvtLGyoc1kLGDFhLRpwiK2EUu9ufJzcwdEA5taS
 nMeikzK8yujBmEESrsFKGCL4tf3urwX3EpqjmTJPca2nZFYoV7FiHqHNjRihsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Lyzq0y3a
Subject: Re: [Buildroot] [PATCH] package/asterisk: security bump to version
 16.29.1
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAxMSBEZWMgMjAyMiAxMDozNzoxNiArMDEwMApQZXRlciBLb3JzZ2FhcmQgPHBldGVy
QGtvcnNnYWFyZC5jb20+IHdyb3RlOgoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHNlY3VyaXR5IGlz
c3VlczoKPiAKPiAtIENWRS0yMDIyLTM3MzI1OiBBIHplcm8gbGVuZ3RoIENhbGxlZCBvciBDYWxs
aW5nIFBhcnR5IE51bWJlciBjYW4gY2F1c2UgYQo+ICAgYnVmZmVyIHVuZGVyLXJ1biBhbmQgQXN0
ZXJpc2sgY3Jhc2guCj4gCj4gICBodHRwczovL2Rvd25sb2Fkcy5hc3Rlcmlzay5vcmcvcHViL3Nl
Y3VyaXR5L0FTVC0yMDIyLTAwNy5odG1sCj4gCj4gLSBDVkUtMjAyMi00MjcwNTogVXNlIGFmdGVy
IGZyZWUgaW4gcmVzX3Bqc2lwX3B1YnN1Yi5jIG1heSBhbGxvdyBhIHJlbW90ZQo+ICAgYXV0aGVu
dGljYXRlZCBhdHRhY2tlciB0byBjcmFzaCBBc3RlcmlzayAoZGVuaWFsIG9mIHNlcnZpY2UpIGJ5
IHBlcmZvcm1pbmcKPiAgIGFjdGl2aXR5IG9uIGEgc3Vic2NyaXB0aW9uIHZpYSBhIHJlbGlhYmxl
IHRyYW5zcG9ydCBhdCB0aGUgc2FtZSB0aW1lCj4gICBBc3RlcmlzayBpcyBhbHNvIHBlcmZvcm1p
bmcgYWN0aXZ0eSBvbiB0aGF0IHN1YnNjcmlwdGlvbi4KPiAKPiAgIGh0dHBzOi8vZG93bmxvYWRz
LmFzdGVyaXNrLm9yZy9wdWIvc2VjdXJpdHkvQVNULTIwMjItMDA4Lmh0bWwKPiAKPiAtIENWRS0y
MDIyLTQyNzA2OiBBTUkgVXNlcnMgd2l0aCDigJxjb25maWfigJ0gcGVybWlzc2lvbnMgbWF5IHJl
YWQgZmlsZXMgb3V0c2lkZQo+ICAgb2YgQXN0ZXJpc2sgZGlyZWN0b3J5IHZpYSBHZXRDb25maWcg
QU1JIEFjdGlvbiBldmVuIGlmIOKAnGxpdmVfZGFuZ2Vyb3VzbHkiCj4gICBpcyBzZXQgdG8gIm5v
Igo+IAo+ICAgaHR0cHM6Ly9kb3dubG9hZHMuYXN0ZXJpc2sub3JnL3B1Yi9zZWN1cml0eS9BU1Qt
MjAyMi0wMDkuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJA
a29yc2dhYXJkLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9hc3Rlcmlzay9hc3Rlcmlzay5oYXNoIHwg
MiArLQo+ICBwYWNrYWdlL2FzdGVyaXNrL2FzdGVyaXNrLm1rICAgfCAyICstCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
