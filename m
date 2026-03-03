Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7503CEDEBF0
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34B868133E;
	Tue,  3 Mar 2026 20:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id buN1ZQEASIba; Tue,  3 Mar 2026 20:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DD8981366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772571421;
	bh=ALaMfat59w0yNMZBmT349Sh8aYVlhxsjo1Ed7xguNjo=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nqw4GcrxEzjelbC/baVxvsrGAQkPqAheYVat/PIMA3sYE+AZHH/OY0VVP5dmqScZU
	 aP7hYN1D4ws7JEpit7z1l8Nh0+yGdoFSqF33e6ysnMtwV+grrSMeOjvYhpYdm5Id7m
	 lkkrTTIxr18brLW7QVFeGPiPtOv0kPiDrc0+iHMXo6dxA0B776VkE9iIMwmcdWUgWP
	 YLiJn2WaV2BG0Iep7pcFjI3f+HssfKzxTWRpsOEP7TtcWZMGz6SNsWq9tN6BEX5I1D
	 1efW0zPfar9Ta9ETS0s0hBFlZrkL2zenO7PoOnAhREn6vNEnVGCXpB/YeFcUj1SdUg
	 vz6C4EQtGD/2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD8981366;
	Tue,  3 Mar 2026 20:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2FA725B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4C6481366
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p5nwZW9fPl4W for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:56:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E852F8133E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E852F8133E
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E852F8133E
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:56:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64E91B97B552; Tue,  3 Mar 2026 21:56:55 +0100 (CET)
Message-ID: <578a97c0-6200-4c5a-87cf-99f02e26aa64@rnout.be>
Date: Tue, 3 Mar 2026 21:56:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
Cc: Gregory Dymarek <gregd72002@gmail.com>
References: <20250224-libwebsockets-zlib-opt-v1-1-16419ae3e82b@cherry.de>
 <a980f4f5-27bb-4ae1-94ee-69f7abe96ae0@rnout.be>
 <7952c8b9-0069-471d-ae1c-dd021c4bd63d@cherry.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <7952c8b9-0069-471d-ae1c-dd021c4bd63d@cherry.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1772571416; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=IvKRkh+sSKBUtPet4Ye8jEn9foReGm1ReHL4YbLlzzk=;
 b=Ap10H8xSiS7NVuk/G1dTFtt/DiB9xPKrdTGRDofBxszBdE97ENqtIIJDVfs+lRhZA/LWhl
 8AIY+iJWv3FCcFEoBpLcausiGXgiuu/CQF11WhXDLEpAhT/wv+C2HKqwN882umjjpyq0eh
 ExMuZ9HnzuYq4YvNt9YUq+vUMHTJ8fsXWDUT5sFO0xvpXts4rUxM/+pJg8swKZR4KGkqOB
 Rqt2IX4i1Kv/fj6QQRBAnKdCAV6xOwWuxILLxWKdxY4SvOqXtDVFa8kQdhvBkcw9yjMEcy
 cO3SAuV+Y6VjO91nsoYMcin+faviDW7amWbz2gfOn78/KkCMhy//Q1Kbu5tdlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=Ap10H8xS
Subject: Re: [Buildroot] [PATCH RFC] package/libwebsockets: make zlib
 dependency optional
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNy8wMi8yMDI2IDE2OjQ2LCBRdWVudGluIFNjaHVseiB3cm90ZToKPiBIaSBBcm5vdXQs
Cj4gCj4gT24gMi80LzI2IDU6MjUgUE0sIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgpbc25p
cF0KPj4gwqDCoEdpdmVuIHRoZSBicmVha2FnZSBvZiBleHRlcm5hbCBwYWNrYWdlcywgSSB0aGlu
ayB0aGlzIG5lZWRzIGFuIGV4cGxpY2l0Cj4+IENvbmZpZy5pbiBvcHRpb24gdGhhdCBkZWZhdWx0
cyB0byB5LiBCdXQgSSByZWFsbHkgZG9uJ3Qgc2VlIHRoZSBwb2ludCBhdCB0aGlzIAo+PiB0aW1l
Lgo+Pgo+IAo+IEZhaXIgZW5vdWdoLCB0aGF0IHdhcyBteSBmaXJzdCBpZGVhIGFzIHdlbGwgKGFz
IHlvdSBjYW4gc2VlIGJlbG93IHRoZSBjb21taXQgCj4gbG9nIDopICkgYnV0IEkgZm9yIHNvbWUg
cmVhc29uIGNoYW5nZWQgbXkgbWluZCBhbmQgd2VudCBmb3IgdGhpcyBpbXBsZW1lbnRhdGlvbiAK
PiBoZXJlLgo+IAo+IFdvdWxkIHlvdSBiZSBvcGVuIHRvIGEgcGF0Y2ggZm9yIGFuIG9wdGlvbiBl
bmFibGVkIGJ5IGRlZmF1bHQgdG8gZW5hYmxlIAo+IGV4dGVuc2lvbnMgKGFuZCBzZWxlY3QgWkxJ
QiBkZXBlbmRlbmN5KT8gU3VjaCB0aGF0IEkgY2FuIGRpc2FibGUgdGhpcyB0aHJvdWdoIGEgCj4g
ZGVmY29uZmlnIGluc3RlYWQgb2YgYSBwYXRjaD8KCiAgWWVzLCBJIHRoaW5rIHRoYXQgd291bGQg
YmUgdGhlIHdheSB0byBnby4KCiAgRG8gbWFrZSBzdXJlIHRvIG1lbnRpb24gdGhlIGF0dGFjayB2
ZWN0b3IgYXNwZWN0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCiAgUmVnYXJkcywKICBBcm5vdXQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
