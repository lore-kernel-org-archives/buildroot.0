Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04C5CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 20:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A028402E3;
	Mon, 22 Sep 2025 20:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuOEEwOmWyHs; Mon, 22 Sep 2025 20:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D569140325
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D569140325;
	Mon, 22 Sep 2025 20:33:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27EC2498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AFCC4006E
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:33:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0T7dGxaeeABQ for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 20:33:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 165BA4004E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 165BA4004E
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 165BA4004E
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 20:33:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2A0924E40D2C;
 Mon, 22 Sep 2025 20:33:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E61B760635;
 Mon, 22 Sep 2025 20:33:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 68467102F178F; 
 Mon, 22 Sep 2025 22:33:05 +0200 (CEST)
Mime-Version: 1.0
Date: Mon, 22 Sep 2025 22:33:01 +0200
Message-Id: <DCZM5YNM1Q71.1JWKE4FL7ONKG@bootlin.com>
To: "Julien Olivain" <ju.o@free.fr>, =?utf-8?q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250921-fix_doc_dead_link-v1-1-4f39903e93c7@bootlin.com>
 <87wm5sosjs.fsf@tarshish> <DCZE1NNPYVQP.VA152ACRNNYT@bootlin.com>
 <84848ccb6383f38eff8fcdf17ac292ab@free.fr>
In-Reply-To: <84848ccb6383f38eff8fcdf17ac292ab@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1758573189; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OVt6pVmTQrveIuWojeZsPw3dw7sNSWaUqGyoLmelWO4=;
 b=vjCE1aEZw0lmLZypt1uxRIzQCzLNyUa0rHaIx5o2mLo2DVewUp3eD/X3daMqGdQWcjAYtp
 Sd7ZokTuXz/YLjeWYMto2zVDSYHsnboXu5yEm+TLcr6txa2pplmcVjoDI/KuKDSsEoRS84
 8jh2Kp5sGi0XcgZgQdwEIqGlTvL3e7/r4WYoWKwack8BiiN8KbDaZPcZsRKeopzJ2pXYIy
 8Ebaxqu/6iWsulGnKWiOe0lIhfxhWFuiPIjOJZbhERA1m+iiGbBMaUzUZ3Z/V3vYl36Mqx
 HtI2OYdReUkN1dhBvetsajQAUXG3vwhFq+XHhx9p0Z78bODnDXK6W8+hcNQXnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vjCE1aEZ
Subject: Re: [Buildroot] [PATCH] docs/manual/getting: fix dead link
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gTW9uIFNlcCAyMiwgMjAyNSBhdCAxMDowNiBQTSBDRVNULCBKdWxpZW4g
T2xpdmFpbiB3cm90ZToKPiBIaSBBbGV4aXMsIEJhcnVjaCwgQWxsLAoKWy4uLl0KCj4+IElmIG1h
aW50YWluZXJzIGFyZSBmaW5lIHdpdGggdGhhdCwgSSBjYW4gYWRkIGEgZGVkaWNhdGVkIGNvbW1p
dCBpbiBhIAo+PiB2Mi4KPgo+IEkgYXBwbGllZCB0aGlzIHBhdGNoIG9uIG1hc3RlciwgdG8gZml4
IHRoaXMgYnJva2VuIGxpbmsuCgpUaGFua3MgOikKCgo+IEJ1dCBJIGFncmVlIHdlIGNvdWxkIG1v
dmUgYWxsIGh0dHA6Ly9idWlsZHJvb3Qub3JnIGxpbmtzIHRvIGh0dHBzLiBDb3VsZAo+IHlvdSBz
ZW5kIGEgc2VwYXJhdGUgcGF0Y2ggZm9yIHRoYXQgcGxlYXNlPwo+Cj4gRm9yIGFub3RoZXIgZG9j
dW1lbnRhdGlvbiB1cmwgY2xlYW51cCwgSSdtIGFsc28gc3VnZ2VzdGluZyB0byB1cGRhdGUgYWxs
Cj4gZ2l0LmJ1aWxkcm9vdC5vcmcgbGlua3MgdG8gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9v
dC5vcmcKClN1cmUsIEknbGwgZm9sbG93IHVwIHdpdGggYSBzbWFsbCBzZXJpZXMgdG8gdXBkYXRl
IHRob3NlIHR3byBwb2ludHMgYXMKd2VsbC4KClRoYW5rcywKCkFsZXhpcwoKCi0tIApBbGV4aXMg
TG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpo
dHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
