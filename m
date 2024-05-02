Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832EAC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 12:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25E1180C1C;
	Thu,  2 May 2024 12:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vLxsFJbSNBhI; Thu,  2 May 2024 12:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38F6B812FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38F6B812FA;
	Thu,  2 May 2024 12:29:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F6861BF599
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 12:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BE18812FA
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 12:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5nP8QPdJaeKl for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 12:29:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 772B9812F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 772B9812F1
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 772B9812F1
 for <buildroot@buildroot.org>; Thu,  2 May 2024 12:29:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 442CTa14036339;
 Thu, 2 May 2024 07:29:36 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 442CTZer061731
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 2 May 2024 07:29:35 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 May 2024 07:29:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 May 2024 07:29:35 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 442CTZH5064637;
 Thu, 2 May 2024 07:29:35 -0500
Date: Thu, 2 May 2024 07:29:35 -0500
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20240502122935.fgvb4otspby3hjz3@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20240430-optee-update-v1-0-6f73c4903ec3@ti.com>
 <af7d74ed-24e7-447c-acbf-8fc6b7e1a0fc@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af7d74ed-24e7-447c-acbf-8fc6b7e1a0fc@smile.fr>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1714652976;
 bh=Y/mh+bZifLUazHARlwPgmUZXupvtXzXBQWIgV6qv358=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=dsBFVAA1b3v6F55k60ewznZHi1uc1jYVNie4NjiNn7kVcvmf6bPUv6haHUwLG1/V4
 Ahw68wmzJ7K6xTVKIfE0jLBV3SljoKIJxxrK7Ne1/aTuZSUkJ53RlVL8RkOn9U2N6m
 jO7hbso0QbBNzLT/CXKrAAbvBMyEPGX8EkPF/kjE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=dsBFVAA1
Subject: Re: [Buildroot] [PATCH 00/11] update bsp binaries for TI SoCs
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>,
 Bryan Brattlof via buildroot <buildroot@buildroot.org>,
 Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgUm9tYWluLAoKT24gTWF5ICAxLCAyMDI0IHRodXMgc2F5ZXRoIFJvbWFpbiBOYW91cjoKPiBI
ZWxsbyBCcnlhbiwgQWxsLAo+IAo+IExlIDAxLzA1LzIwMjQgw6AgMTc6MjcsIEJyeWFuIEJyYXR0
bG9mIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiA+IEhlbGxvIGV2ZXJ5b25lIQo+ID4gCj4g
PiBUaGlzIHNlcmllcyB1cGRhdGVzIGFsbCB0aGUgYm9vdCBiaW5hcmllcyAoVS1Cb290LCBPUC1U
RUUsIFRGLUEsIGFuZCAKPiA+IExpbnV4KSB0byB0aGVpciBsYXRlc3QgdmVyc2lvbnMgdG8gcHVs
bCBpbiBhbGwgYnVnIGZpeGVzIGFuZCBuZXcgCj4gPiBmZWF0dXJlcyBhZGRpdGlvbnMgaW4gdGhl
c2UgcHJvamVjdHMuCj4gPiAKPiA+IFRoaXMgYWxzbyBpbmNsdWRlcyBhIHBhdGNoIEkgc2VuZCBv
dXQgYSB3aGlsZSBhZ28ganVzdCB0byBrZWVwIHRoaW5ncyAKPiA+IG9yZ2FuaXplZC4gCj4gPiAK
PiA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjQwNDAyMTUzMzI4LjE4
NTk2NDItMS1iYkB0aS5jb20vCj4gPiAKPiA+IGFuZCBmaW5hbGx5IHNvbWUgcHJvb2YgSSBkaWRu
J3QgY29tcGxldGVseSBicmVhayBzb21ldGhpbmcgOykKPiA+IAo+ID4gICBodHRwczovL3Bhc3Rl
LnNyLmh0L35icnlhbmIvYjY2NmFkZWY3ZGE0MTJkZTc2ZWZiNWU0YTY4ZTY4ZTA2NTFmNzkyOAo+
IAo+IFdlIHJlY2VpdmVkIG9ubHkgcGF0Y2ggWzQvMTFdIGJvb3QvdGktazMtYm9vdC1maXJtd2Fy
ZTogYnVtcCB0byBsYXRlc3QgdmVyc2lvbgo+IAo+IENhbiB5b3UgdHJ5IHRvIHJlc2VuZCB0aGUg
c2VyaWVzPwo+IAo+IE5vdGU6IEl0IHdvdWxkIGJlIGJldHRlciB0byB1c2UgImJvb3QvdGktazMt
Ym9vdC1maXJtd2FyZTogYnVtcCB0byB2ZXJzaW9uCj4gMDkuMDIuMDAuMDA5Igo+IAoKSG93IG9k
ZCwgSSBkaWRuJ3QgcmVjZWl2ZSBhbiBlcnJvciBiYWNrIGZyb20gbXkgY2xpZW50IHNvIEkgYXNz
dW1lZCB0aGV5CndvdWxkIHNob3cgdXAgZXZlbnR1YWxseS4gT2ggd2VsbC4KCkFuZCB5ZXMgSSds
bCB1cGRhdGUgdGhlIHdvcmRpbmcgdG8gYmUgbW9yZSBleHBsaWNpdCBhYm91dCB3aGljaCB2ZXJz
aW9uIAp3ZSBhcmUgc3dpdGNoaW5nIHRvLgoKfkJyeWFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
