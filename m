Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0100EC3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 20:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7B3C81E51;
	Tue,  6 May 2025 20:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sjDgWmCgXK6V; Tue,  6 May 2025 20:43:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D972481C46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D972481C46;
	Tue,  6 May 2025 20:43:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2369EDF
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3FFA81C46
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NGRnoC1RXqb3 for <buildroot@buildroot.org>;
 Tue,  6 May 2025 20:43:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DBB1681B9D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBB1681B9D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBB1681B9D
 for <buildroot@buildroot.org>; Tue,  6 May 2025 20:43:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5F23A604E9;
 Tue,  6 May 2025 22:43:52 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:51690])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 22:43:52 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 22:43:52 +0200
From: Julien Olivain <ju.o@free.fr>
To: Fabio Estevam <festevam@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <CAOMZO5DGRVK+bHTz=B9sdhegNmiBYyC9gDMtrctfJhix_xBM2Q@mail.gmail.com>
References: <20250506194502.2960556-1-ju.o@free.fr>
 <CAOMZO5DGRVK+bHTz=B9sdhegNmiBYyC9gDMtrctfJhix_xBM2Q@mail.gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <f324ac2d355db62d000e389579025f16@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746564233;
 bh=FfeadXwuGBbNbZDoV+dMRNpqG+5g2OIjZRcaAAwrUNY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F8VZOBJjmTTGfvZAM9O80a1j1QTJo7Pu1PpqgMtK8MYFs9kohgx/Y+3roKXY+ThgD
 QQ23EDiMgRTpoEA7sFmYethA3pRJ/PCdbEDs32bU5iPR8auds78bEU1rGLrqghwoLR
 vdDs1xgR/RHe7pk4N0syYXHeq9x46yUOVwid1d3aXQnI2YudE73tQA6af+vTDWaElj
 +UMgdhH3fz0pOkwBReBExufuWuUoufouRV/h58tc3JbCR071h0F2171+dN5lxRLodY
 r70me9xqG7EsGx9inUU4WG/WnDqUVQmQed9eppDmvCqeAkovMXNFcFCyUqb320tm8P
 UprNy8yCK7glg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F8VZOBJj
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx28evk: enable
 BR2_DOWNLOAD_FORCE_CHECK_HASHES
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDYvMDUvMjAyNSAyMjozMCwgRmFiaW8gRXN0ZXZhbSB3cm90ZToKPiBIaSBKdWxpZW4sCj4g
Cj4gT24gVHVlLCBNYXkgNiwgMjAyNSBhdCA0OjQ14oCvUE0gSnVsaWVuIE9saXZhaW4gPGp1Lm9A
ZnJlZS5mcj4gd3JvdGU6Cj4+IAo+PiBUaGlzIGNvbW1pdCBhZGRzIEJSMl9ET1dOTE9BRF9GT1JD
RV9DSEVDS19IQVNIRVM9eSBpbiB0aGUgZGVmY29uZmlnCj4+IGFuZCBhZGRzIGN1c3RvbSBoYXNo
IGZpbGVzLiBUaGUgZXhjZXB0aW9uIGVudHJ5IGluIC5jaGVja3BhY2thZ2VpZ25vcmUKPj4gaXMg
YWxzbyByZW1vdmVkLgo+PiAKPj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNv
bT4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAKPiBU
aGFua3MgZm9yIHRoZSBwYXRjaDoKPiAKPiBSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVz
dGV2YW1AZ21haWwuY29tPgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBJIGFwcGxpZWQgdG8gbWFz
dGVyLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
