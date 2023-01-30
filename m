Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562C1C54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 22:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBBB5612BA;
	Mon, 30 Jan 2023 22:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBBB5612BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6F0Yr25-JZUP; Mon, 30 Jan 2023 22:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7F56121B;
	Mon, 30 Jan 2023 22:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D7F56121B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0FF61BF41F
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B813E821C3
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 22:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B813E821C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clqWpv2Q0oPw for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 22:05:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73BA781FD7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73BA781FD7
 for <buildroot@busybox.net>; Mon, 30 Jan 2023 22:05:36 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D47C340003;
 Mon, 30 Jan 2023 22:05:32 +0000 (UTC)
Date: Mon, 30 Jan 2023 23:05:31 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230130230531.03687d05@windsurf>
In-Reply-To: <pan$2724f$ad18d855$3c1930f1$855c20a8@ID-313208.user.individual.net>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-4-bernd.kuhls@t-online.de>
 <20230130221514.2d58df14__31334.1615417571$1675113344$gmane$org@windsurf>
 <pan$86f7$3b01a6c4$a6498246$160afa18@ID-313208.user.individual.net>
 <20230130223941.11f007d8@windsurf>
 <pan$2724f$ad18d855$3c1930f1$855c20a8@ID-313208.user.individual.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675116333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VV/roxXW0xku2HbystA0KK1BSFJxYQwNGQzdUlnwqNg=;
 b=Gz3UbXD1DEwmbvcxE/rSOWbmGoJ5B53yfPErVjCCk/lq/ODnp39JOQO53pANwlS11Uugu9
 ZFo/VKLEkfqmyf88paYGDQ8KWPpfhcquJfvVJ/Ul8sZ3jezA7IiBr6Ll3NUZ/SaBq/gdAo
 wTTogWxWlndLFspCnozoPQPRo5uJ2ZM91WE1UDgcdO92qTQcNfl65FviMoCGJcJruyXrpq
 bS8t8ftiA75axRmSJkCk2SuJcWUA++hHgWXXKgTFFuTSW+Q8dyb8WITvpgj2LfKZUKPzya
 FTxq5+5bIziX0Vaqnlr7Uy58DztOPE1TfgrY5vTnV4xxjkllZTh3anzrS8QIOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Gz3UbXD1
Subject: Re: [Buildroot] [PATCH 4/5] package/intel-mediadriver: bump version
 to 23.1.0
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
Cc: buildroot@busybox.net, buildroot@uclibc.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAzMCBKYW4gMjAyMyAyMjo0OTowNCArMDEwMApCZXJuZCBLdWhscyA8YmVybmQua3Vo
bHNAdC1vbmxpbmUuZGU+IHdyb3RlOgoKPiBUaGUgcmVzdWx0IGlzIGEgMjM1IE1CIGxvZyBmaWxl
IHN0YXJ0aW5nIHdpdGg6Cj4gCj4gLS0tIG9sZF9lZGFlL2ludGVsLW1lZGlhLTIzLjEuMC50YXIu
Z3oKPiArKysgbmV3X2Y0N2YvaW50ZWwtbWVkaWEtMjMuMS4wLnRhci5nego+IOKUguKUhCBGb3Jt
YXQtc3BlY2lmaWMgZGlmZmVyZW5jZXMgYXJlIHN1cHBvcnRlZCBmb3IgR3ppcHBlZCBmaWxlcyBi
dXQgbm8gCj4gZmlsZS1zcGVjaWZpYyBkaWZmZXJlbmNlcyB3ZXJlIGRldGVjdGVkOyBmYWxsaW5n
IGJhY2sgdG8gYSBiaW5hcnkgZGlmZi4gCj4gZmlsZSgxKSByZXBvcnRzOiBnemlwIGNvbXByZXNz
ZWQgZGF0YSwgZnJvbSBVbml4LCBvcmlnaW5hbCBzaXplIG1vZHVsbyAKPiAyXjMyIDI0NTg5MzEy
MAoKQ291bGQgeW91IHB1dCBvbmxpbmUgc29tZXdoZXJlIHRoZSAib2xkIiB0YXJiYWxsLCBzbyB0
aGF0IHdlIGNhbiBoYXZlIGEKbG9vayBhdCB3aGF0J3MgZ29pbmcgb24/CgpUaGFua3MgYSBsb3Qh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
