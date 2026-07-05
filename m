Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0082C43458
	for <buildroot@archiver.kernel.org>; Sun,  5 Jul 2026 10:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34CB340872;
	Sun,  5 Jul 2026 10:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5_rEc_YuQtaw; Sun,  5 Jul 2026 10:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F235C4086D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783245687;
	bh=7oiCU/yjtDmvR4GQPSwiuboweehyHYdB0p50Pm7vTd0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oBMgFuyw9xpP42iLjiVyNgewMs2SkjySUnDCJsEgiDWzsKWwki7BwQmlBIPun7I3e
	 aWgbGXxoHWvaGFwEewPdB2UCmST2ye2tyDN8LNn68FNMI8KT3J4b+Caw7jY05IcUXO
	 vg79QsXIrczQeh7O8rIBMvNTK2whotj9OS0brzDPVVa0CUeOUt4Z2aIVjvMno3ce9j
	 HoulBqtHvsjT+sh9JcCyMuOz0Ilwa0+wXaDSZ53KRYIQVUMw1ycDk3gZDLIE6cTU8V
	 7VG2WDPSQKFllFzmvD7aef/sJLWF41Nx43S6erXoARcc+9V61mRQcNfZp3tU6tjfJx
	 Fcx8l8lA1PC+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F235C4086D;
	Sun,  5 Jul 2026 10:01:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D4EE316
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B2454086D
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:01:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3RHuNMxR9lm for <buildroot@buildroot.org>;
 Sun,  5 Jul 2026 10:01:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35AF44086C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35AF44086C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35AF44086C
 for <buildroot@buildroot.org>; Sun,  5 Jul 2026 10:01:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0B9B819F5B2;
 Sun,  5 Jul 2026 12:01:19 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jul 2026 12:01:19 +0200
MIME-Version: 1.0
Date: Sun, 05 Jul 2026 12:01:19 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Olivier Schonken
 <olivier.schonken@gmail.com>
In-Reply-To: <20260626202959.282713-1-thomas.perale@mind.be>
References: <20260626202959.282713-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.16
Message-ID: <69793c87da5d0a7ee6b2975e149bb1f6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783245683;
 bh=ETZPvxuEADXgzhxM4Dxg2ni5dGXZjoroQslXCtgmQ0Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ciP8Ih371KfILphdD77z2R9NmAODwYXWuE0X9M3NWqutnIskEfA09DUGy5yM7pUBA
 Hh1b5VUJ2QMql8FayQkG6kEktKjQH9SOgec4DTPZM/vfblYekpa/V4voAy3nB7GKSK
 rd8jUsASOMdAV62RJmdtF+Bys0iG0rxikYtQN8VN1VFxf8ZLGziDlUmGyfwGOjFRFd
 XuzMDYbtHXD/Bg74m6o1Z4jO6GkyI3vYokygADg9s1VoCU95LsduBdeyL++//hLVjK
 iKy+LyeuZDFBJleqnXKziM5Atoo10U3xUKswCvUXMPFAYA4OJRP/v9ThktOGO9QSRB
 vPAAFaFhtTHeQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ciP8Ih37
Subject: Re: [Buildroot] [PATCH] package/cups-filters: upstream patch
 CVE-2025-64503
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMjYvMDYvMjAyNiAyMjoyOSwgVGhvbWFzIFBlcmFsZSB2aWEgYnVpbGRyb290IHdyb3RlOgo+
IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyB2dWxuZXJhYmlsaXR5Ogo+IAo+IC0gQ1ZFLTIwMjUt
NjQ1MDM6Cj4gICAgIGN1cHMtZmlsdGVycyBjb250YWlucyBiYWNrZW5kcywgZmlsdGVycywgYW5k
IG90aGVyIHNvZnR3YXJlIAo+IHJlcXVpcmVkCj4gICAgIHRvIGdldCB0aGUgY3VwcyBwcmludGlu
ZyBzZXJ2aWNlIHdvcmtpbmcgb24gb3BlcmF0aW5nIHN5c3RlbXMgb3RoZXIKPiAgICAgdGhhbiBt
YWNvcy4gSW4gY3Vwcy1maWx0ZXJzIHByaW9yIHRvIDEuMjguMTgsIGJ5IGNyYWZ0aW5nIGEgUERG
IAo+IGZpbGUKPiAgICAgd2l0aCBhIGxhcmdlIGBNZWRpYUJveGAgdmFsdWUsIGFuIGF0dGFja2Vy
IGNhbiBjYXVzZSBDVVBTLUZpbHRlciAKPiAxLnjigJlzCj4gICAgIGBwZGZ0b3Jhc3RlcmAgdG9v
bCB0byB3cml0ZSBiZXlvbmQgdGhlIGJvdW5kcyBvZiBhbiBhcnJheS4gRmlyc3QsIGEKPiAgICAg
UERGIHdpdGggYSBsYXJnZSBgTWVkaWFCb3hgIHdpZHRoIHZhbHVlIGNhdXNlcyBgaGVhZGVyLmN1
cHNXaWR0aGAgCj4gdG8KPiAgICAgYmVjb21lIGxhcmdlLiAgTmV4dCwgdGhlIGNhbGN1bGF0aW9u
IG9mIGBieXRlc1BlckxpbmUgPQo+ICAgICAoaGVhZGVyLmN1cHNCaXRzUGVyUGl4ZWwgKiBoZWFk
ZXIuY3Vwc1dpZHRoICsgNykgLyA4YCBvdmVyZmxvd3MsCj4gICAgIHJlc3VsdGluZyBpbiBhIHNt
YWxsIHZhbHVlLiBUaGVuLCBgbGluZUJ1ZmAgaXMgYWxsb2NhdGVkIHdpdGggdGhlCj4gICAgIHNt
YWxsIGBieXRlc1BlckxpbmVgIHNpemUuIEZpbmFsbHksIGBjb252ZXJ0TGluZUNodW5rZWRgIGNh
bGxzCj4gICAgIGB3cml0ZVBpeGVsOGAsIHdoaWNoIGF0dGVtcHRzIHRvIHdyaXRlIHRvIGBsaW5l
QnVmYCBvdXRzaWRlIG9mIGl0cwo+ICAgICBidWZmZXIgc2l6ZSAob3V0IG9mIGJvdW5kcyB3cml0
ZSkuIEluIGxpYmN1cHNmaWx0ZXJzLCB0aGUgCj4gbWFpbnRhaW5lcnMKPiAgICAgZm91bmQgdGhl
IHNhbWUgYGJ5dGVzUGVyTGluZWAgbXVsdGlwbGljYXRpb24gd2l0aG91dCBvdmVyZmxvdyAKPiBj
aGVjaywKPiAgICAgYnV0IHRoZSBwcm92aWRlZCB0ZXN0IGNhc2UgZG9lcyBub3QgY2F1c2UgYW4g
b3ZlcmZsb3cgdGhlcmUsIAo+IGJlY2F1c2UKPiAgICAgdGhlIHZhbHVlcyBhcmUgZGlmZmVyZW50
LiBDb21taXQKPiAgICAgNTBkOTRjYTBmMmZhNjE3NzYxM2M5N2M1OTc5MWJkZTU2ODYzMTg2NSBj
b250YWlucyBhIHBhdGNoLCB3aGljaCBpcwo+ICAgICBpbmNvcnBvcmF0ZWQgaW50byBjdXBzLWZp
bHRlcnMgdmVyc2lvbiAxLjI4LjE4Lgo+IAo+IEZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWU6Cj4g
ICAtIGh0dHBzOi8vd3d3LmN2ZS5vcmcvQ1ZFUmVjb3JkP2lkPUNWRS0yMDI1LTY0NTAzCj4gICAt
IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9PcGVuUHJpbnRpbmcvY3Vwcy1maWx0ZXJzL2NvbW1pdC81
MGQ5NGNhMGYyZmE2MTc3NjEzYzk3YzU5NzkxYmRlNTY4NjMxODY1Cj4gCj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoKQXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
