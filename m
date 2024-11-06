Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D419BD40D13
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 00:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FA1F40281;
	Wed,  6 Nov 2024 00:54:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pStB7vO4JuaF; Wed,  6 Nov 2024 00:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 406034028B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 406034028B;
	Wed,  6 Nov 2024 00:54:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 490983B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 00:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 361C580D28
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 00:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mdl0aGRcUSuV for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 00:54:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6621280D26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6621280D26
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6621280D26
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 00:54:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A60sQQK003329;
 Tue, 5 Nov 2024 18:54:26 -0600
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A60sQFj002421;
 Tue, 5 Nov 2024 18:54:26 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Nov 2024 18:54:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Nov 2024 18:54:26 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A60sQnQ093401;
 Tue, 5 Nov 2024 18:54:26 -0600
Date: Tue, 5 Nov 2024 18:54:26 -0600
To: Bryce Johnson <bryce@redpinelabs.com>
CC: <buildroot@buildroot.org>, Xuanhao Shi <X15000177@gmail.com>, Anand
 Gadiyar <gadiyar@ti.com>
Message-ID: <20241106005426.esubbd6efmerh5p3@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241022225457.568323-1-bryce@redpinelabs.com>
 <20241022225457.568323-3-bryce@redpinelabs.com>
 <20241030220902.yo475pa5avafzo4c@bryanbrattlof.com>
 <CADXxVSKZPX68AMzYhu7zyV7sKmfUdVkvX8+d=vprh5GOMEW6eQ@mail.gmail.com>
 <CADXxVSLLzk=Ct_ca93b337bqDuUNORnF602T+snxV+5-_L97nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADXxVSLLzk=Ct_ca93b337bqDuUNORnF602T+snxV+5-_L97nQ@mail.gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1730854466;
 bh=cWCw7+lKlafVQl/gSQoVmgOFnIh4XKy1cXTZ/LPARro=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=qNk1D6FStSjDnv7cfjOgZNnPsvr9d9eZxcgoZm+wKrsRIqlwe01S4litGjUDoQr4z
 nQZJd1GwKf229u+E4hG1TzbdU5dz6O8IM8uOx52s6k9X5vwOxyxtLoFKcjSjJKpZi1
 sCtjhdvnaQ+pFHgk2dZOmGMp5cNypHze4uvMS3wU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=qNk1D6FS
Subject: Re: [Buildroot] [PATCH 3/3] boot/ti-k3-r5-loader: use
 HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTm92ZW1iZXIgIDQsIDIwMjQgdGh1cyBzYXlldGggQnJ5Y2UgSm9obnNvbjoKPiBPbiBNb24s
IE5vdiA0LCAyMDI0IGF0IDk6NTLigK9BTSBCcnljZSBKb2huc29uIDxicnljZUByZWRwaW5lbGFi
cy5jb20+IHdyb3RlOgo+ID4KPiA+IEhleSBCcnlhbiwKPiA+IE5vdCBzdXJlIG9uIHRoYXQgb25l
LiAgSSB0aGluayB0aGUgQlIyX2FhcmNoNjQgaXMgdGhlcmUgc2luY2UgdGhlIGFtNioKPiA+IHRo
YXQgdXNlIHRoZSB0aS1rMy1yNS1sb2FkZXIgYXJlIGFsbCBhYXJjaDY0IGFwcGxpY2F0aW9uIHBy
b2Nlc3NvcnMKPiA+IGV2ZW4gdGhvdWdoIHRoZSBSNSBpcyAzMmJpdD8gIE15IGd1ZXNzIGlzIGl0
IHByb2JhYmx5IGlzbid0IG5lZWRlZC4KPiA+IEFueSByZWFzb24gc29tZW9uZSB3b3VsZCB3YW50
IHRvIGJ1aWxkIHRoZSBhbTYyKiBhcyAzMi1iaXQsIHRoZW4gdGhlcmUKPiA+IG1pZ2h0IGJlIGFu
IGlzc3VlIHdpdGggaGF2aW5nIHRoYXQgdGhlcmUuCj4gPgoKQWggdGhhbmtzISBZZWFoIEkgZGlk
bid0IG5vdGljZSBpdCB1bnRpbCB5b3VyIHBhdGNoLiAKCj4gCj4gT29wcywgdG9wIHBvc3RlZCBi
eSBhY2NpZGVudCEKCm5vIHdvcnJpZXMgOikKCn5CcnlhbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
