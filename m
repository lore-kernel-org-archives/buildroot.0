Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90107C4829A
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 10:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ACA041DC6;
	Tue,  6 Feb 2024 10:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ACA041DC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 54FXrjz1HIck; Tue,  6 Feb 2024 10:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B6EB41E2B;
	Tue,  6 Feb 2024 10:40:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B6EB41E2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B0DF11BF95D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89AD661112
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 10:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89AD661112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxJRqH-OI8ZZ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 10:40:06 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 960796110A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 10:40:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 960796110A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C4DC240003;
 Tue,  6 Feb 2024 10:40:03 +0000 (UTC)
Date: Tue, 6 Feb 2024 11:40:02 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20240206114002.317ff5b6@windsurf>
In-Reply-To: <20240111135749.1681557-1-vincent.stehle@arm.com>
References: <20240111135749.1681557-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707216003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zr+5SJXriywhK7+njEIdN8O8cTtykVwovBiTcwPRrvw=;
 b=lFLsBuQBi3eWC8eMHTFEDTEE71rpYkyWsX6qwvGGtCJ5yTKZy7pSiY5Fsw9dYQZcq9L/iK
 56X1XOuuBPKei0uyTkKUFa9rm5olUsBzsOTDsuyweZbAwqJd2KZAW+8Lr1ecsrHGl10vLB
 TkdLW/vdVLpDUxKFGNwvonlQBr/DWjcuU1RYReIJ7fR7eiVjbO4UBEC73IbeTt/3nh0DA3
 6vmQrUIxaCsYH4cq1JIsLwqX7IGt5SB+U1PQJw8hMshIfTyzS+i75N9EsZ8qRJzVLsjoT2
 Omiq57QPXMGmRmHBdcAKrwAy0vPYwn+CSjGL1AgkA8ltr6DE3SQGJkP+PE2TeQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lFLsBuQB
Subject: Re: [Buildroot] [PATCH] configs/qemu_{arm, aarch64}_ebbr: bump Linux,
 U-Boot and TF-A
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxMSBKYW4gMjAyNCAxNDo1NzowNCArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBCdW1wIHFlbXVfYXJtX2ViYnJfZGVmY29uZmln
IGFuZCBxZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcgaW4gc3luYzoKPiAKPiAtIEJ1bXAgTGlu
dXggdG8gdjYuNi4xMQo+IC0gQnVtcCBVLUJvb3QgdG8gMjAyNC4wMQo+IC0gQnVtcCBURi1BIHRv
IHYyLjEwCj4gCj4gV2hpbGUgYXQgaXQsIGFkYXB0IFFlbXUgY29tbWFuZCBsaW5lIGFyZ3VtZW50
cyB0byBhdm9pZCBhIHdhcm5pbmcgd2hlbgo+IGRpc2FibGluZyBBQ1BJLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KPiBDYzogUm9t
YWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+IC0tLQoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgQ1RPLCBCb290bGluCkVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
