Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9652CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95D6442DE5;
	Sat, 30 May 2026 08:41:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eFbzgeLtqcUr; Sat, 30 May 2026 08:41:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9925042AE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130499;
	bh=Zye/Or5owgElVzDPJeNrNmkiQFZijEfe3Enkq4Hbt6U=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ABEsBC7WTS5isSRckvEzmdQG0WdCue9V+JU5sGBLn+jxDrIu/IOCru0Bg2yGFB6B7
	 kFuafySK0DEkLYvKl+jCSas3S3yAzT2ywlO0eqi1gEg9lzdLYD15M8uIHiBODfn9CH
	 XTgtLxUav90MDKqxDJUA6cVTDquk5niQXOHaTDg2WKpRvJqikEuBOcCKysBDktdxN0
	 G3iEKUtRN2MMhoIMe7d+kmMU5u8gU23hZ7tp9pYzOeSjIszxBNKb3Cjcoxb2FTlj7A
	 Y5fNldPZ5f9Qjj4I0UEN4EOVsg03fpDUkzT6EqFufvBuYG0ompGBR6ti1AQfvMqGci
	 9aHWdynhc53/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9925042AE1;
	Sat, 30 May 2026 08:41:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F8DD3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27D71407DE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jeExdLHdbZjR for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:41:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 49AF140363
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49AF140363
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 49AF140363
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:41:38 +0000 (UTC)
Received: from [192.168.1.80] (82-65-127-30.subs.proxad.net [82.65.127.30])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 05D2A2C89063;
 Sat, 30 May 2026 10:41:35 +0200 (CEST)
Message-ID: <81142bb4-7eef-48e5-ba81-bb50d09f4a4d@bubu1.eu>
Date: Sat, 30 May 2026 10:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260522-openscap_nptl_threads-v2-1-cb06d4d208da@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260522-openscap_nptl_threads-v2-1-cb06d4d208da@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1780130496; bh=jtAlNKm5KUnoeDMKVVENc7ja8HJdMwb1xdp5p+6ceac=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BXUDUBWW/dEqfvK/UTfh4uCNeGEAhIJjTR2fRGPprmIwe9Zj4Uj/OirE9bv7PUgBY
 lPioeAbBLlYXR4Q0dys1OIvZSGjd23l7eWPKnF6fMGV3IxYmJeBH6ZOLblW3bGutuq
 rhqTIquwq+vC3BYSrqzOKrszxaf/vgXOqs7rJ+rpZAheBRv1YIDFxsEzWfPW420hvO
 JgLnU4K9nyy5IxJZ8J26tixqV+9QW/sXLuK7bWOA+1VyafMIK4mI6xz/put+XEWlrU
 DkRbe2saMLcVcIlm1orMMU2nCjlF3+LXL6WGHYUkhRX4Ydk5LGsc1t9nhDf7AdFowB
 bcJoW8gZ54q5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=BXUDUBWW
Subject: Re: [Buildroot] [PATCH RESEND v2] package/openscap: add dependency
 on NPTL threads
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNS8yMi8yNiAwOToxMCwgQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4g
T3BlbnNjYXAgY29kZSBpcyBjYWxsaW5nIE5QVEwgZnVuY3Rpb25zIHN1Y2ggYXMgcHRocmVhZF9i
YXJyaWVyX3dhaXQsCj4gd2hpY2ggYXJlIG5vdCBwcm92aWRlZCBieSBwdGhyZWFkcy4KPiAKPiBN
YWtlIHRoZSByZXF1aXJlbWVudCBvbiBOUFRMIHRocmVhZHMgZXhwbGljaXQgYnkgYWRkaW5nIHRo
ZQo+IGNvcnJlc3BvbmRpbmcgIGRlcGVuZGVuY3kgaW4gb3BlbnNjYXAgQ29uZmlnLmluLgo+IAo+
IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMmQ5NDc1Yjdj
ZDJkNDEzYzk5ZDYyMzNlYmIyMTNiYzkzMmYxZTM5OC8KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4aXMg
TG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgo+IC0tLQo+IENoYW5nZXMgaW4g
djI6Cj4gLSBkcm9wIGJvZ3VzIHBhdGNoIDEvMiwgYXMgb3JpZ2luYWwgQ29uZmlnLmluIHdhcyBm
aW5lCj4gLSByZWZvcm1hdCBtaXNzaW5nIGRlcGVuZGVuY3kgY29tbWVudAo+IC0gTGluayB0byB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDMwNC1vcGVuc2NhcF9ucHRsX3RocmVh
ZHMtdjEtMC05ZGZmOTJjYzM3ZTBAYm9vdGxpbi5jb20KPiAtLS0KQXBwbGllZCB0byBtYXN0ZXIs
IHRoYW5rcyEKCk1hcmN1cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
