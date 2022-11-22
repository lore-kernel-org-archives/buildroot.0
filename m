Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88BFC43217
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 21:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8572961037;
	Tue, 22 Nov 2022 21:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8572961037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMDHr-3FGdmw; Tue, 22 Nov 2022 21:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B290E6115F;
	Tue, 22 Nov 2022 21:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B290E6115F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6AC1BF38C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0021041916
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 21:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0021041916
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGY8fF27a4xN for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 21:32:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2AF34190D
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2AF34190D
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 21:32:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CA4B81C0003;
 Tue, 22 Nov 2022 21:32:42 +0000 (UTC)
Date: Tue, 22 Nov 2022 22:32:41 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20221122223241.724195df@windsurf>
In-Reply-To: <20221122160544.121691-1-vincent.stehle@arm.com>
References: <20221122160544.121691-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669152763;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRgCOtUhZWO+jT3S76sdAYjBlJ3lRwluzvMbswGzljk=;
 b=IeqqdrzF3DtCuDSiwqHwugQvpR2dNmxUHFqRCSblfmM6Nb39Y7qRs6LY3VQxhc5KcrsyqX
 GqSxv50/pOB+pg1Al/D8IDtzZuKGknspn4fgIdJOKP/sRQvkQJ9fRKiw11a32c1qnZPdmw
 8mQv41s21z06K4RecHzh0oxcz/xeXGB6IxhwhUXqz+7GepCEgOj4sKiJoqMuXSE+/OaXAR
 ZYzd9aNHGoOMhBtVHj/jUTcP2t2z/cizEGDBiJVAm/1AAFyKw8ulLzJpl/PvH2CO2qoObo
 vu/ueV6A+HIs/3x0DOEM1yQ5hWHfOsO3Xb7GIMNtikanVAOHLaHooSOMOBu3mQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IeqqdrzF
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix the build for arm sgi575
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyMiBOb3YgMjAyMiAxNzowNTo0NCArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBUaGUgZWRrMiBwYWNrYWdlIGNhbiBiZSBjb25m
aWd1cmVkIGZvciBwbGF0Zm9ybSBBcm0gU2dpNTc1IGJ1dCB0aGlzIGRvZXMKPiBub3QgYnVpbGQg
Y29ycmVjdGx5LiBBZGQgdGhlIG5lY2Vzc2FyeSBkZWZpbml0aW9ucyB0byBmaXggdGhlIGJ1aWxk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJt
LmNvbT4KPiBDYzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgo+IC0tLQoKQXBwbGllZCB0
byBtYXN0ZXIgd2l0aCBhbiBpbXByb3ZlZCBjb21taXQgbG9nIHRoYXQgY29udGFpbnMgZGV0YWls
cwphYm91dCB0aGUgYnVpbGQgZmFpbHVyZS4KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBl
dGF6em9uaSwgQ1RPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJp
bmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
