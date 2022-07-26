Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D51C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 22:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D7E2404F9;
	Tue, 26 Jul 2022 22:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D7E2404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SvqUdANkNAYb; Tue, 26 Jul 2022 22:04:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63E2A403B8;
	Tue, 26 Jul 2022 22:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63E2A403B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 628271BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E23E9607A8
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 22:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E23E9607A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zMV-ZPNq6CIm for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 22:04:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 433DB606BF
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 433DB606BF
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 22:04:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 77A6260004;
 Tue, 26 Jul 2022 22:04:03 +0000 (UTC)
Date: Wed, 27 Jul 2022 00:04:02 +0200
To: =?UTF-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>
Message-ID: <20220727000402.53dff223@windsurf>
In-Reply-To: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
References: <20220426132833.1579873-1-salvador.joseluis@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658873046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5JgjFNni/qYMphOGRulFmjmOI3or80Uy8BGIRfdyMY0=;
 b=lXkRlssZlhc6jxCp5q2qCofj2xiyiF6s+FjiFAix3lj2UoYvzlcYDBdoRLiuS7LRekRlPZ
 qr4VwGY0vVusC4GembgnE5jH4d4yFOeE0yKjQP5mynSgYzIMMHM6IObWRiyDSOXETi62UZ
 hVciJKAbokpOPVWY1ulfa/naDSkYb98RQP5qZMLbmiI1yhM5AcvBWqRcSvGFUzG1DgxwKH
 l5n+9Ly7Ih2J84liaPk6NhafTnt1BM89tln3yNrTnUIwh53n7GPFnlKAGU+KAzjgPFwCVg
 JeR8mwCJ32hbDJeL0TSsdwJwy6Wf69IBoa/KPn4k0256qz0kSfOWGhYF7ink1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lXkRlssZ
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual/prerequisite.txt: add
 diffutils
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyNiBBcHIgMjAyMiAxNToyODozNCArMDIwMApKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1
Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IFBhdGNoIHRpdGxlOiBk
b2NzL21hbnVhbC9wcmVyZXF1aXNpdGUudHh0OiBhZGQgZGlmZnV0aWxzCj4gCj4gVGhlIGNvbW1h
bmQgYGNtcGAgaXMgdXNlZCBieSBgcGFja2FnZS9wa2ctZ2VuZXJpYy5ta2AgYXQgY29tbWl0Cj4g
ODYyM2NjNWRlYjUuIFRoaXMgY29tbWFuZCBpcyBwcm92aWRlZCBieSBgZGlmZnV0aWxzYC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4KPiAtLS0KPiAgZG9jcy9tYW51YWwvcHJlcmVxdWlzaXRlLnR4dCB8IDEg
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCkFwcGxpZWQgdG8gbWFzdGVyLCB0
aGFua3MuCgpJbiBhZGRpdGlvbiB0byB0aGlzIHBhdGNoIHdlIGFsc286CgogMS4gQWRkZWQgYSBj
aGVjayBmb3IgY21wIGluIHN1cHBvcnQvZGVwZW5kZW5jaWVzL2RlcGVuZGVuY2llcy5zaAoKIDIu
IERyb3BwZWQgdGhlIHVzZSBvZiBob3N0LWRpZmZ1dGlscyBmcm9tIG9wa2ctdXRpbHMKCiAzLiBE
cm9wcGVkIGhvc3QtZGlmZnV0aWxzIGl0c2VsZgoKVGhhbmtzIQoKVGhvbWFzCi0tIApUaG9tYXMg
UGV0YXp6b25pLCBDVE8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVl
cmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
