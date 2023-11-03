Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78CEC4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 09:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AA8B61327;
	Fri,  3 Nov 2023 09:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AA8B61327
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8cbwAG1Z_FfB; Fri,  3 Nov 2023 09:16:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB54D61331;
	Fri,  3 Nov 2023 09:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB54D61331
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F80D1BF27E
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:16:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47FFC61331
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 09:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47FFC61331
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6CIC5F-zsJN for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 09:16:31 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0FEF861327
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 09:16:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FEF861327
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7C9260004;
 Fri,  3 Nov 2023 09:16:27 +0000 (UTC)
Date: Fri, 3 Nov 2023 10:16:26 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20231103101626.70a83c47@windsurf>
In-Reply-To: <20231011110932.4425-2-sebastien.szymanski@armadeus.com>
References: <20231011110932.4425-1-sebastien.szymanski@armadeus.com>
 <20231011110932.4425-2-sebastien.szymanski@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699002988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uuS3LyCQvj4skYZBXpS1kcQGhNyWI/wrPycCSx4ZjEw=;
 b=jNqI1Fu5oyMliY2N7lgdKnYvAGiAcfVx9bPVZIhP8VVoyHvgfSq0stW0cZwdFiZT2dVgMI
 SYstSTfQG6v997kO2CnUjO0gMN+YIdiAO8KnGZgGKU8xuyMGMoa5JclrZdDMIdkyXXZowY
 S5OQDMU4QMbsWhKFrFNhAsdvem05Sfsz0xvR3YeZIZ4oH0TPlIhuLZa+3yLYx8Bl46TsJd
 GFAYVI5skpXAhFeh0gO1DTW0j5n/t31UA61ufKrNnOevZj8b0d5aXyaEKGKC7lyu5pDHAk
 yOwappAn1xlGa48LFQz5v8ge2yna0F540STrb/Z0HT/cgHY9k4TMmtdmQhrU1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jNqI1Fu5
Subject: Re: [Buildroot] [PATCH 1/4] package/imx-mkimage: bump version to
 lf-6.1.36-2.1.0
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gU8OpYmFzdGllbiwKCk9uIFdlZCwgMTEgT2N0IDIwMjMgMTM6MDk6MjkgKzAyMDAKU8Op
YmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPiB3cm90
ZToKCj4gQnVtcCBpbXgtbWtpbWFnZSB0byB0aGUgbGF0ZXN0IHZlcnNpb24gdG8gZ2FpbiBpLk1Y
OSBzdXBwb3J0Lgo+IAo+IFBhdGNoIDAwMDEgYW5kIDAwMDQgYXJlIG1lcmdlZCB1cHN0cmVhbToK
PiBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9pbXgtbWtpbWFnZS9jb21taXQvZmYyM2M0ZmQ4
NGJiODhkNzNiNTJhMGNjYWQ3MzM1MjJkMmZhYTQ3Nwo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ueHAt
aW14L2lteC1ta2ltYWdlL2NvbW1pdC9iY2U4MjkxMmM4MjA2ZWRkMGNjOTdhZjhjNmIzMDI0MDIy
OWZhZTdmCj4gCj4gUGF0Y2ggMDAwMiBpcyBubyBtb3JlIG5lZWRlZCwgQlVJTERfTERGTEFHUyB2
YXIgaXMgbm93IGF2YWlsYWJsZToKPiBodHRwczovL2dpdGh1Yi5jb20vbnhwLWlteC9pbXgtbWtp
bWFnZS9jb21taXQvODE4NWEwMDBhN2M2YWY1NjJlNzczZGE4MTJjNmM4ZDE0MTgxNTUzMQo+IAo+
IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tp
QGFybWFkZXVzLmNvbT4KCkkndmUgYXBwbGllZCwgYWZ0ZXIgZG9pbmcgc29tZSBmaXhlcy4KCj4g
LS0tCj4gIC4uLm92ZXJyaWRpbmctQkwzMi1hbmQtQkwzMy1ub3Qtb25seS1CTC5wYXRjaCB8IDYw
IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICAuLi4vMDAwMi1BZGQtTERGTEFHUy10by1saW5rLXN0ZXAu
cGF0Y2ggICAgICAgfCAyNiAtLS0tLS0tLQo+ICAuLi5ydC1mb3Itb3ZlcnJpZGluZy1CTDMxLUJM
MzItYW5kLUJMMzMucGF0Y2ggfCA2MSAtLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvaW14
LW1raW1hZ2UvaW14LW1raW1hZ2UuaGFzaCAgICAgICAgICB8ICAyICstCj4gIHBhY2thZ2UvaW14
LW1raW1hZ2UvaW14LW1raW1hZ2UubWsgICAgICAgICAgICB8ICA3ICsrLQo+ICA1IGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTUxIGRlbGV0aW9ucygtKQo+ICBkZWxldGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9pbXgtbWtpbWFnZS8wMDAxLUFkZC1zdXBwb3J0LWZvci1vdmVycmlkaW5n
LUJMMzItYW5kLUJMMzMtbm90LW9ubHktQkwucGF0Y2gKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvaW14LW1raW1hZ2UvMDAwMi1BZGQtTERGTEFHUy10by1saW5rLXN0ZXAucGF0Y2gKPiAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW14LW1raW1hZ2UvMDAwNC1BZGQtc3VwcG9ydC1m
b3Itb3ZlcnJpZGluZy1CTDMxLUJMMzItYW5kLUJMMzMucGF0Y2gKClRoZSByZW1haW5pbmcgcGF0
Y2ggMDAwMyBzaG91bGQgaGF2ZSBiZWVuIHJlbnVtYmVyZWQgMDAwMSwgYW5kIHRoZQpyZW1vdmVk
IHBhdGNoZXMgMDAwMSwgMDAwMiBhbmQgMDAwNCBzaG91bGQgaGF2ZSBiZWVuIGRyb3BwZWQgZnJv
bSB0aGUKLmNoZWNrcGFja2FnZWlnbm9yZSBmaWxlLgoKPiAgSU1YX01LSU1BR0VfTElDRU5TRSA9
IEdQTC0yLjArCj4gIElNWF9NS0lNQUdFX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCgpUaGlzIHdh
cyBubyBsb25nZXIgY29ycmVjdCBhcyB0aGUgZmlsZSBoYXMgYmVlbiByZW5hbWVkICJMSUNFTlNF
Iiwgc28KdGhlIGxlZ2FsIGluZm9ybWF0aW9uIHdhcyBub3Qgd29ya2luZy4KCkluIGdlbmVyYWws
IHBsZWFzZSB0cnkgdG8gcnVuICJtYWtlIGNoZWNrLXBhY2thZ2UiIGFuZCAibWFrZQo8cGtnPi1s
ZWdhbC1pbmZvIiB0byB2ZXJpZnkgdGhpcyBzb3J0IG9mIGRldGFpbHMuCgpQdXNoZWQgd2l0aCB0
aG9zZSBjaGFuZ2VzLiBUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdp
bmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
