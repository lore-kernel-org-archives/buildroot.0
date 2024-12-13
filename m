Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E7BE7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 19:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 183916066F;
	Fri, 13 Dec 2024 19:13:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPhQhIY_Eguj; Fri, 13 Dec 2024 19:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19E1E6063A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E1E6063A;
	Fri, 13 Dec 2024 19:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B32975
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 19:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0843F810AF
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 19:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnrPCyGVAhhS for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 19:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.249;
 helo=lelv0142.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F3DF68112B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3DF68112B
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F3DF68112B
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 19:13:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4BDG7T1S066139;
 Fri, 13 Dec 2024 10:07:29 -0600
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BDG7TeV052187
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Dec 2024 10:07:29 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Dec 2024 10:07:29 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Dec 2024 10:07:29 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BDG7Tfj047805;
 Fri, 13 Dec 2024 10:07:29 -0600
Date: Fri, 13 Dec 2024 10:07:29 -0600
To: Romain Naour <romain.naour@smile.fr>
CC: <buildroot@buildroot.org>, Anand Gadiyar <gadiyar@ti.com>, Xuanhao Shi
 <X15000177@gmail.com>
Message-ID: <20241213160729.x5q7w7e3zkrk5e2p@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20241210-uboot-bump-v1-1-baeb59feef61@ti.com>
 <998274a1-2a12-4929-83cc-d866a89a1e93@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <998274a1-2a12-4929-83cc-d866a89a1e93@smile.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1734106049;
 bh=RPhNv9xzdHPSS4CW0fy5FWkO3Vq1sviQEnFx7vpTX3k=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=Fjc5cMOJRAV4kewaRmMjRzZlW5DJ/Z2lilOIatwIMDfn3bF2znY3xBbiaYgH24sTP
 zIOdSCJuEtcnCfsRSBIql7/wiwf2kbozo3ULR5A/n0HK0c0uO2bEnzDWRA+KkXucd6
 HjfZLcFS6fbPJYwfDJAPWlSsSQgEahXJZnvKC14Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Fjc5cMOJ
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: add host-gnutls to
 dependencies
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

SGkgUm9tYWluIQoKT24gRGVjZW1iZXIgMTEsIDIwMjQgdGh1cyBzYXlldGggUm9tYWluIE5hb3Vy
IHZpYSBidWlsZHJvb3Q6Cj4gSGVsbG8gQnJ5YW4sIEFsbCwKPiAKPiBMZSAxMS8xMi8yMDI0IMOg
IDAwOjMyLCBCcnlhbiBCcmF0dGxvZiB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gPiBOZXdl
ciB2ZXJzaW9ucyBvZiBVLUJvb3QgbWF5IHJlcXVpcmUgdGhlIEdudVRMUyBsaWJyYXJ5IHRvIGJl
IGluc3RhbGxlZAo+ID4gb24gdGhlIGhvc3QgbWFjaGluZSBkdXJpbmcgdGhlIEVGSSBjYXBzdWxl
IGNyZWF0aW9uIHBoYXNlIG9mIHRoZSBVLUJvb3QKPiA+IGJ1aWxkLiBBZGQgaG9zdC1nbnV0bHMg
dG8gdGhlIGxpc3Qgb2YgZGVwZW5kZW5jaWVzLgo+IAo+IFlvdXIgcmVwbHkgWzFdIGFib3V0IG1r
ZWZpY2Fwc3VsZSB0b29sIHVzZWQgdG8gYnVpbGQgdGlib290My5iaW4gaW1hZ2VzIHdhcwo+IHBy
b2JhYmx5IGEgZ29vZCBpbmZvIHRvIGtlZXAgaW4gdGhlIGNvbW1pdCBsb2cuCj4gCgpBaCB5ZWFo
IEknbGwgZWxhYm9yYXRlIG9uIHRoYXQgYSBiaXQgZm9yIHYyCgo+Cj4gSW5kZWVkLCBzaW5jZSB1
LWJvb3QgMjAyNC4xMCB0aGUgbWtlZmljYXBzdWxlIGlzIG5vdyBtYW5kYXRvcnkgb3RoZXJ3aXNl
IGJpbm1hbgo+IGZhaWwgKHRlc3RlZCB3aXRoIHRoZSBiZWFnbGVib2FyZGFpNjQgZGVmY29uZGlm
IHdpdGggdS1ib290IDIwMjQuMTApOgo+IAo+ICAgQklOTUFOICAuYmlubWFuX3N0YW1wCj4gICBJ
bWFnZSAnY2Fwc3VsZS10aWJvb3QzJyBoYXMgbWlzc2luZyBiaW50b29scyBhbmQgaXMgbm9uLWZ1
bmN0aW9uYWw6IG1rZWZpY2Fwc3VsZQo+IAo+ICAgSW1hZ2UgJ2NhcHN1bGUtc3lzZncnIGhhcyBt
aXNzaW5nIGJpbnRvb2xzIGFuZCBpcyBub24tZnVuY3Rpb25hbDogbWtlZmljYXBzdWxlCj4gCj4g
ICBTb21lIGltYWdlcyBhcmUgaW52YWxpZAo+IAo+IEknbSBub3Qgc3VyZSB3ZSB3YW50IHRvIGtl
ZXAgdGhlIGFiaWxpdHkgdG8gZGlzYWJsZSBob3N0LWdudXRscyBkZXBlbmRlbmN5IGZvcgo+IHRp
LWszLXI1LWxvYWRlciBzaW5jZSBvbmx5IHZlcnNpb24gdXAgdG8gMjAyNC4xMCBkb2Vzbid0IG5l
ZWQgbWtlZmljYXBzdWxlIHRvb2wKPiBmb3IgVEkgSzMgU29Dcy4KPiAKClRoYXQgd29ya3Mgd2l0
aCBtZS4gZ251dGxzIGlzIHNvIHNtYWxsIGl0J3MgcmVhbGx5IG5vdCB3b3J0aCB0aGUgCmNvbXBs
ZXhpdHkgaWYgcGVvcGxlIGV4cGxpY2l0bHkgcmVtb3ZlIEVGSSBjYXBzdWxlcyBvbiBUSSBjaGlw
cyBmcm9tIApVLUJvb3QuIAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IQoKfkJyeWFuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
