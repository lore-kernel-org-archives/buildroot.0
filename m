Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CD0CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 20:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FA8F81271;
	Mon, 15 Sep 2025 20:54:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WfTsOKE3EpUx; Mon, 15 Sep 2025 20:54:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EF8581140
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6EF8581140;
	Mon, 15 Sep 2025 20:54:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E1F51F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3052B60B36
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:53:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GPW2k4dpzxO9 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 20:53:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99B7F60A69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99B7F60A69
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99B7F60A69
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:53:56 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id A57943520CCC; Mon, 15 Sep 2025 22:54:04 +0200 (CEST)
Date: Mon, 15 Sep 2025 22:54:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <aMh87DWmal5nH0JK@waldemar-brodkorb.de>
References: <20250914042054.771446-1-salvador.joseluis@gmail.com>
 <55c98b57-f4be-47b7-a87c-06f5130df8fe@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55c98b57-f4be-47b7-a87c-06f5130df8fe@smile.fr>
X-Operating-System: Linux 6.12.41 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1757969644; bh=AzbpJ8Ca9Zd/ASh4H/ApA0bjpYtbFDpGus4y420P8bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PybX1sDmy+ru7gJVI9czBkaiqjX7XSPYyyq+GE46lCJwtRDlQyXW9P5dg+ovf/AKx
 PRRU/BdSRfhIpoWq3n1dh3ccpzu5wVchi0KtnjQO+bJKuciEbD4WH4/v84qMjkinFT
 AIEWrLFQsEhuC6XPki1kDopMgieB2Bd/rVG1SiO75u8Z1PF/W2KLcZy2oM9LPbn9t6
 aIOEkjmmAyckxdyziTWaf9Vww7zPyT0M/ClxMjSl1072fheqXqjs9xcHlXGI0gtzV2
 ZXs3/6HHGRkW2w5XPDxPjfikS4/atU1bg9QPF+xPPmu9/E7i8c6vTU7MivsKna5391
 d2Hf+f/rAZ6tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=PybX1sDm
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: remove arc_summary
 from ZFS tests
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
Cc: Josss Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksClJvbWFpbiBOYW91ciB3cm90ZSwKCj4gSGVsbG8gSm9zw6ksIEFsbCwKPiAKPiBMZSAxNC8w
OS8yMDI1IMOgIDA2OjIwLCBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gYSDDqWNyaXTCoDoKPiA+
IFRoaXMgcGF0Y2ggcmVwbGFjZSB0aGUgWzFdIHBhdGNoLgo+ID4gCj4gPiBUaGUgUHl0aG9uIDMu
MTMgaW50ZXJwcmV0ZXIgaXRzZWxmIHNlZ2ZhdWx0cyBhdCBydW50aW1lIHdoZW4gY29tcGlsZWQK
PiA+IHdpdGggdUNsaWJjIG9uIHRoZSBhYXJjaDY0IHBsYXRmb3JtLgo+ID4gCj4gPiBUbyBrZWVw
IFRlc3RaZnNVY2xpYmMsIHRoZSBleGVjdXRpb24gb2YgdGhlIGFyY19zdW1tYXJ5IGNvbW1hbmQg
aGFzCj4gPiBiZWVuIHJlbW92ZWQgZnJvbSB0aGUgWkZTIHRlc3RzLiBUaGlzIGNvbW1hbmQgb25s
eSBwcmludHMgc29tZSBBUkMKPiA+IHN0YXRzIGFueXdheS4KPiA+IAo+ID4gRml4ZXM6Cj4gPiBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9qb2JzLzExMjcxMTI0
ODU5IChUZXN0WmZzVWNsaWJjKQo+ID4gCj4gPiBbMV0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL3BpcGVybWFpbC9idWlsZHJvb3QvMjAyNS1TZXB0ZW1iZXIvNzg2Mzk2Lmh0bWwKPiA+IAo+
ID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3Nl
bHVpc0BnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X3pmcy5weSB8IDIgLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rf
emZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiA+IGlu
ZGV4IDFiOTA3YWM0ZGUuLjlmZWFlNDllODYgMTAwNjQ0Cj4gPiAtLS0gYS9zdXBwb3J0L3Rlc3Rp
bmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQo+ID4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKPiA+IEBAIC01Niw4ICs1Niw2IEBAIGNsYXNzIFRlc3Ra
ZnNCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gPiAgICAgICAgICAgICAgInpwb29sIHNj
cnViIC13IHBvb2wiLAo+ID4gICAgICAgICAgICAgICJzaGEyNTZzdW0gLWMgL3RtcC91cmFuZG9t
LnNoYTI1NiIsCj4gPiAgICAgICAgICAgICAgInpwb29sIHN0YXR1cyAtdiIsCj4gPiAtICAgICAg
ICAgICAgIyBDaGVjayBQeVpGUwo+ID4gLSAgICAgICAgICAgICJhcmNfc3VtbWFyeSIsCj4gCj4g
QWN0dWFsbHkgdGhlIHRlc3QgaXMgbm90IGFib3V0IEFSQyBzdGF0cyByZXBvcnRlZCBieSBhcmNf
c3VtbWFyeSBzY3JpcHQgYnV0IGEKPiBjaGVjayBpZiBQeVpGUyBkb2Vzbid0IHRyaWdnZXIgc29t
ZSBQeXRob24gZXhjZXB0aW9uIGR1ZSB0byBtaXNzaW5nIHB5dGhvbgo+IHJ1bnRpbWUgZGVwZW5k
ZW5jeSAoaWYgUHlaRlMgaXMgd29ya2luZyBhcyBleHBlY3RlZCB3aGVuIHB5dGhvbjMgaXMgZW5h
YmxlZCkuCj4gCj4gVGhpcyBhbHNvIHJlbW92ZSB0aGUgUHlaRlMgdGVzdCBmb3IgbXVzbCBhbmQg
R2xpYmMgdGhhdCBhcmUgd29ya2luZyB3ZWxsLgo+IAo+IElmIGFyY19zdW1tYXJ5IGlzIHJlbW92
ZWQgZnJvbSB0aGUgdGVzdCwgdGhlbiB3ZSBzaG91bGQgYWxzbyByZW1vdmUKPiBCUjJfUEFDS0FH
RV9QWVRIT04zPXkgZnJvbSBUZXN0WmZzQmFzZS4KPiAKPiBUaGUgVGVzdFpmc0Jhc2UgaXMgZmlu
ZSBhcyBpcywgd2Ugc2hvdWxkIG5vdCB0cnkgdG8gcmVtb3ZlIFB5WkZTIHRlc3QgZm9yIHRoZQo+
IHNha2Ugb2YgdUNsaWJjLW5nLgo+IAo+IEFjdHVhbGx5LCBJJ20gd29ycmllZCBhYm91dCB0aGUg
YWFyY2g2NCBwb3J0IG9uIHVDbGliYy1uZy4gSXQncyBwb3NzaWJsZSB0aGF0Cj4gdGhlIGlzc3Vl
IHdlIGRpc2NvdmVyIG9uIHB5dGhvbjMgcGFja2FnZSBjYW4gaGFwcGVuIGF0IHJ1bnRpbWUgb24g
b3RoZXIgcGFja2FnZXMuCj4gCj4gSWYgeW91IHJlYWxseSB3YW50IHRvIGtlZXAgVGVzdFpmc1Vj
bGliYywgdGhlIFB5WkZTIHRlc3Qgc2hvdWxkIGJlIG9ubHkgZXhlY3V0ZWQKPiBieSBUZXN0WmZz
R2xpYmMgYW5kIFRlc3RaZnNNdXNsLiBJJ20gbm90IHN1cmUgaXQgd29ydGggdGhlIGVmZm9ydC4g
TGV0cyByZW1vdmUKPiBUZXN0WmZzVWNsaWJjIGZvciBub3cgYW5kIGhvcGUgdGhlIGlzc3VlIHdp
bGwgYmUgZml4ZWQgaW4gdUNsaWJjLW5nIGluIHVwY29taW5nCj4gcmVsZWFzZXMuIFRoZW4gVGVz
dFpmc1VjbGliYyBjYW4gYmUgYWRkZWQgYmFjay4KPiAKPiBUaG91Z2h0cz8KCkkgZm91bmQgdGhl
IGJ1ZyBpbiB1Q2xpYmMtbmcgbGQuc28gY29kZSBmb3IgYWFyY2g2NC4gSSB3aWxsIGRvIGEKcmVs
ZWFzZSB0aGlzIHdlZWtlbmQgd2hlbiBJIGhhdmUgZmluaXNoZWQgdGVzdGluZy4KCmJlc3QgcmVn
YXJkcwogV2FsZGVtYXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
