Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C64C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78740409F5;
	Wed,  1 Jun 2022 21:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQ10SYlygpTa; Wed,  1 Jun 2022 21:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C2C4409E3;
	Wed,  1 Jun 2022 21:43:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 961111BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:43:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 729A083342
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:43:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v_daRoBxh4cC for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:43:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CAD6832C9
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:43:43 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4B124E0004;
 Wed,  1 Jun 2022 21:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654119821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BgI/6TkONDq/a0OGbbUDvUnjCTkQjr47/2ldSA0YEeI=;
 b=hqWxTfBwF0sZcarsXw4i3PYEikoWtzQdI4llzbe1Tf/JOZVo/r5g8mUkaVxoKj4JdY0sB/
 XJ9q08ar7W4ZwiABUMVaoHd1QCTdXE/KEsKPoQdhEl8snSD4lh1N3bDz3nxN2ZxhSk71Nl
 aJDppTi6gpx8BK/YXek4vw0zUDrOr/8FOfbXJ03iiu80AiBIZ//ccK52wGj4/LteJvEWuz
 8uuIt8h4mhZ+QsPJWGzN1qcxvIk0MX6z7seq1hXmDRgsCEg+O/fMrkqbz5QexMlHBbgwzQ
 Yfw6+Pjsl/H159uDKayWDi02kaCiKgwTQs07waLIP1+xAuW308J/7SqppCZLnQ==
Date: Wed, 1 Jun 2022 23:43:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220601234340.543614a1@windsurf>
In-Reply-To: <20220522203814.1408407-1-fontaine.fabrice@gmail.com>
References: <20220522203814.1408407-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8812au-aircrack-ng: bump to
 version 37e27f9165300c89607144b646545fac576ec510
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU3VuLCAyMiBNYXkgMjAyMiAyMjozODoxNCArMDIwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEZpeCB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmUgd2l0aCBrZXJuZWwgPj0gNS4xNyB0aGFua3MgdG8KPiBodHRwczovL2dpdGh1Yi5j
b20vYWlyY3JhY2stbmcvcnRsODgxMmF1L2NvbW1pdC83ZTYxYWQ4OWNjYWU1MWE4MDcwNmY3NjVl
MWQ1ZjJlODJhMTY2MmM3Ogo+IAo+IC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
MTQvb3V0cHV0LTEvYnVpbGQvcnRsODgxMmF1LWFpcmNyYWNrLW5nLTNhNjQwMmU5ZTc5ODAyODkx
ZjE1MzFiNDM1YmU1NGY0ZDhiNzFmMGIvLi9vc19kZXAvb3NkZXBfc2VydmljZS5jOiBJbiBmdW5j
dGlvbiDigJh0aHJlYWRfZXhpdOKAmToKPiAvaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3Rh
bmNlLTE0L291dHB1dC0xL2J1aWxkL3J0bDg4MTJhdS1haXJjcmFjay1uZy0zYTY0MDJlOWU3OTgw
Mjg5MWYxNTMxYjQzNWJlNTRmNGQ4YjcxZjBiLy4vb3NfZGVwL29zZGVwX3NlcnZpY2UuYzoxMjk1
OjI6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhjb21wbGV0ZV9h
bmRfZXhpdOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgMTI5
NSB8ICBjb21wbGV0ZV9hbmRfZXhpdChjb21wLCAwKTsKPiAgICAgICB8ICBefn5+fn5+fn5+fn5+
fn5+fgo+IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1
bHRzLzFmZmY1MDIzYjViNzlhN2Q4MWZkNGNiYTZkZWE4ZGNiM2Y0MjgzNDAKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAt
LS0KPiAgcGFja2FnZS9ydGw4ODEyYXUtYWlyY3JhY2stbmcvcnRsODgxMmF1LWFpcmNyYWNrLW5n
Lmhhc2ggfCAyICstCj4gIHBhY2thZ2UvcnRsODgxMmF1LWFpcmNyYWNrLW5nL3J0bDg4MTJhdS1h
aXJjcmFjay1uZy5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpUaG9tYXMKLS0g
ClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
