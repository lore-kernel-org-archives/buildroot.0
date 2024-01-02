Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889FC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 08:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F447408C3;
	Tue,  2 Jan 2024 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F447408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KK97kFBa1wPT; Tue,  2 Jan 2024 08:55:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E744640876;
	Tue,  2 Jan 2024 08:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E744640876
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3A5911BF5A6
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FF7F40876
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 08:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF7F40876
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gW5RPCOeAuQR for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 08:55:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BDA940564
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 08:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BDA940564
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2B92A240005;
 Tue,  2 Jan 2024 08:55:11 +0000 (UTC)
Date: Tue, 2 Jan 2024 09:55:10 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240102095510.395f7b6f@windsurf>
In-Reply-To: <20240101221317.39694-1-fontaine.fabrice@gmail.com>
References: <20240101221317.39694-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1704185711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ozKRn5P7vMpp0I5idG7jmfWIWBcZWbJFcqOVGaUU6ak=;
 b=ljsCvRxcWDbRdJBm7a+wW/mEAD1338gETPsHz/UI+8IKIDhvYfjtujeA6OkmTAfnR74orx
 LgfHksDiQVBYbFUGFGRwnTJrJReIwlgy8DSVXzzBPotx5WtFoAMraT0aYhZPw+B8907Euj
 Sz6ISGZHr4B/vC2jPOqd+vXOrzshkwhd6tHKytLyqAuOJKI+1P3RzDIOI8jERpII4Il6hJ
 kOgugja9j8ItY9iy9DBDj2C8mbiPe+KWaIvvksXOtDD3A4Gf7v2FPF2Vo+tRJZ2EVilAsN
 1uQ2NHcW4Jp3Bn/RX2CtDvfepMYuVMx6zzjJ144kiPU6WKVacHy5Yt7V5ObLCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ljsCvRxc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-paramiko: security bump
 to version 3.4.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCAgMSBKYW4gMjAyNCAyMzoxMzoxNyArMDEwMApGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cgo+IEFkZHJlc3MgQ1ZFIDIwMjMtNDg3OTUg
KGFrYSB0aGUg4oCcVGVycmFwaW4gQXR0YWNr4oCdLCBhIHZ1bG5lcmFiaWxpdHkgZm91bmQKPiBp
biB0aGUgU1NIIHByb3RvY29sIHJlCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL3BhcmFtaWtvL3Bh
cmFtaWtvL2Jsb2IvMy40LjAvc2l0ZXMvd3d3L2NoYW5nZWxvZy5yc3QKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiAtLS0K
PiAgcGFja2FnZS9weXRob24tcGFyYW1pa28vcHl0aG9uLXBhcmFtaWtvLmhhc2ggfCA0ICsrLS0K
PiAgcGFja2FnZS9weXRob24tcGFyYW1pa28vcHl0aG9uLXBhcmFtaWtvLm1rICAgfCA0ICsrLS0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpBcHBs
aWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBDVE8s
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
