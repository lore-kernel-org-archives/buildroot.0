Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D6FC32772
	for <buildroot@archiver.kernel.org>; Thu, 18 Aug 2022 16:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EA22403B4;
	Thu, 18 Aug 2022 16:13:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA22403B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iwCT8hCHjBpW; Thu, 18 Aug 2022 16:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C4C40491;
	Thu, 18 Aug 2022 16:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5C4C40491
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E76D91BF868
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 16:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C22EA611A4
 for <buildroot@lists.busybox.net>; Thu, 18 Aug 2022 16:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C22EA611A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id myKEy91SNfHf for <buildroot@lists.busybox.net>;
 Thu, 18 Aug 2022 16:13:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB94660C28
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB94660C28
 for <buildroot@buildroot.org>; Thu, 18 Aug 2022 16:13:10 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 418EC100006;
 Thu, 18 Aug 2022 16:13:08 +0000 (UTC)
Date: Thu, 18 Aug 2022 18:13:06 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20220818181306.64b0039e@booty>
In-Reply-To: <CH2PR12MB50047F205184CA0DFD7C688DF06A9@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20220503152425.1069617-1-neal.frager@amd.com>
 <20220503152425.1069617-2-neal.frager@amd.com>
 <87h7653i8q.fsf@dell.be.48ers.dk>
 <edddb58b-dee7-21aa-05b8-3a94c3e2c4d1@xilinx.com>
 <87ilqccu3k.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758738449EEBFE4991D7973D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758FE7F237530275606A745D7C89@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <875ymcawvb.fsf@dell.be.48ers.dk>
 <56c3feaa-cbd2-eaa9-7800-cd2102fa8545@lucaceresoli.net>
 <D9EEAC86-D8CB-46E0-A019-B0F792B0511C@xilinx.com>
 <874k1ua6mw.fsf@dell.be.48ers.dk>
 <B695963F-1D4C-4D05-B152-54F424FE025B@xilinx.com>
 <200341c2-809e-8d14-686c-8bf838a15df6@lucaceresoli.net>
 <SJ0PR02MB77589186692C36CA8975DE4ED7CA9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <CH2PR12MB5004860BC0816E61B757266AF09A9@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20220802170112.00ff0966@booty>
 <CH2PR12MB50047F205184CA0DFD7C688DF06A9@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660839188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M6xkHowVT211iC81HqETZjzekxEjZY+MLlmh85yohAk=;
 b=lLKL+ZBa/4HnKP1sgp4JO57v/ZXQAaObmFLO8zQO0+bJeefm5IxgQTRI4ANpBc55sCkmQ4
 3M1s9YuWBDz9G2Aea06qvXyhXLbwNYci5tTr1cB6Xg7/pJOFfshwkkSeiYffGxplaVNMO9
 BihfecwWI/cCKxF4zK79KLd8jTFoNXKCX057A6Gjk5QBJdKTBNeJj2Lvd1V/Q3TrzfSFGs
 UqMugLbvfMSvcw/aodWBLSfrqKfyr2ZcL+Dk/A0vMZ2HHNEA5DT7s1WgTQEnzogWpV30yu
 xMdHQBMfFx9IdhYw8gz14IplSC5lm4/8Csubf9dw4tZAvX59Q7kfxSr82Ba6pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lLKL+ZBa
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp_zcu106_defconfig:
 transition to tarballs
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Simek, Michal" <michal.simek@amd.com>,
 "'giulio.benetti@benettiengineering.com'"
 <giulio.benetti@benettiengineering.com>,
 "'buildroot@buildroot.org'" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwKCk9uIFdlZCwgMTcgQXVnIDIwMjIgMTc6MjM6NDEgKzAwMDAKIkZyYWdlciwgTmVh
bCIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOgoKPiBIaSBMdWNhLAo+IAo+ID4gSGkgTHVj
YSwKPiA+ICAgCj4gPiA+IEhpIE5lYWwsICAKPiA+IAo+ID4gT24gMTMvMDUvMjIgMDY6MjEsIE5l
YWwgRnJhZ2VyIHdyb3RlOiAgCj4gPiA+IEhpIFBldGVyLCBMdWNhLAo+ID4gPgo+ID4gPgo+ID4g
PiAgICAKPiA+ID4+IExlIDEyIG1haSAyMDIyIMOgIDIxOjMzLCBQZXRlciBLb3JzZ2FhcmQgPHBl
dGVyQGtvcnNnYWFyZC5jb20+IGEgw6ljcml0IDoKPiA+ID4+Cj4gPiA+PiDvu79DQVVUSU9OOiBU
aGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBTb3VyY2UuIFBsZWFz
ZSB1c2UgcHJvcGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9uIHdoZW4gb3BlbmluZyBhdHRhY2htZW50
cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFpbC4KPiA+ID4+Cj4g
PiA+PiAgICAKPiA+ID4+Pj4+Pj4gIk5lYWwiID09IE5lYWwgRnJhZ2VyIDxuZWFsZkB4aWxpbngu
Y29tPiB3cml0ZXM6ICAgIAo+ID4gPj4KPiA+ID4+IEhpLAo+ID4gPj4gICAgCj4gPiA+Pj4+PiBJ
IGhhZCB0byBhbHNvIHBhc3MgdGhlIC1tKiBmbGFncyBpbiBFWFRSQV9DT01QSUxFUl9GTEFHUyB0
byBnZXQgCj4gPiA+Pj4+PiBpdCB0byBsaW5rLCBwcmVzdW1hYmx5IHRoZSBwZXRhbGludXggdG9v
bGNoYWluIGhhcyBpbmNvbXBhdGlibGUgCj4gPiA+Pj4+PiBkZWZhdWx0cy4gTHVjYSwgYW55IHNw
ZWNpZmljIHJlYXNvbnMgdG8gbm90IHBhc3MgQ0ZMQUdTIHRoZXJlPyAgCj4gPiA+Pj4+Cj4gPiA+
Pj4+IEknbSBhZnJhaWQgSSBoYXZlIG5vIHJlYWwgYW5zd2VyLiA6KCBXaGVuIEkgaW5pdGlhbGx5
IHdyb3RlIHRoZSAKPiA+ID4+Pj4gc2NyaXB0IEkgZGlkIGl0IHRvIGhhdmUgdGhlIHNhbWUgbG9n
aWMgYXMgcGV0YWxpbnV4LiBMYXRlciBJIAo+ID4gPj4+PiBkaWRuJ3Qgd2F0Y2ggZm9yIGl0cyBj
aGFuZ2VzLiBJIHdvdWxkIGxvdmUgdG8gYmUgaGVscGZ1bCBidXQgSSAKPiA+ID4+Pj4gaGF2ZSBu
byBhY2Nlc3MgdG8gYSB6eW5xbXAgYm9hcmQgbm93LiAgCj4gPiA+PiAgICAKPiA+ID4+PiBXb3Vs
ZCBpdCBiZSBwb3NzaWJsZSBmb3IgeW91IHRvIGp1c3QgaW1wbGVtZW50IHRoZSBjaGFuZ2VzIHRo
YXQgCj4gPiA+Pj4gUGV0ZXIgaGFzIHByb3Bvc2VkPyAgUGV0ZXIgYXBwZWFycyB0byBoYXZlIGFs
cmVhZHkgaWRlbnRpZmllZCBhIHNvbHV0aW9uLiAgCj4gPiA+PiAgICAKPiA+ID4+PiBCb3RoIFBl
dGVyIGFuZCBJIGhhdmUgemN1MTA2IGJvYXJkcywgc28gd2UgY2FuIGJvdGggdGVzdCBhbmQgCj4g
PiA+Pj4gdmVyaWZ5IHRoZSB1cGRhdGUgd29ya3MuICAKPiA+ID4+Cj4gPiA+PiBTb3JyeSwgdGhh
dCBpcyBub3QgdHJ1ZS4gSSBoYXZlbid0IGZvdW5kIHRoZSBtYWdpYyBpbmNhcm5hdGlvbiB0byAK
PiA+ID4+IGdldCBhIHdvcmtpbmcgcG11ZncgYnVpbGQgd2l0aCB0aGUgdG9vbGNoYWluIGJ1aWx0
IGJ5IGNyb3NzdG9vbC1uZy4gCj4gPiA+PiBNeSBkaWZmIHdhcyBqdXN0IHRvIHNob3cgd2hhdCBJ
IGhhZCB0byBjaGFuZ2UgdG8gYWRqdXN0IAo+ID4gPj4genlucW1wLXBtdWZ3LWJ1aWxkZXIgdG8g
dXNlIGEgcGV0YWxpbnV4IHRvb2xjaGFpbi4KPiA+ID4+ICAgIAo+ID4gPgo+ID4gPiBJcyB0aGVy
ZSBhIHJlYXNvbiB3aHkgd2UgY2Fubm90IGNoYW5nZSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXIg
dG8gZG93bmxvYWQgdGhlIHNhbWUgdG9vbGNoYWluIHRoYXQgcGV0YWxpbnV4IHVzZXMgYXMgdGhl
IGNyb3NzdG9vbC1uZyB0b29sY2hhaW4/ICAgIAo+ID4gICAKPiA+ID4gQ2FuIHlvdSBwb2ludCB0
byB3aGVyZSB0aGUgcGV0YWxpbnV4IHRvb2xjaGFpbiBjb21lcyBmcm9tPyAgICAKPiA+ICAgCj4g
PiA+IElmIHBldGFsaW51eCB1c2VzIGEgcHVibGljbHkgYXZhaWxhYmxlIHByZWJ1aWx0IHRvb2xj
aGFpbiwgcG9zc2libHkgd2l0aCBzb3VyY2VzIGF2YWlsYWJsZSwgdGhlbiB0aGlzIGNvdWxkIGJl
IGNvbnNpZGVyZWQuICAgIAo+ID4gICAKPiA+ID4gSG93ZXZlciBJIHN1c3BlY3QgaXQgZG9lcyB1
c2UgYSB0b29sY2hhaW4gdGhhdCBpcyBzaGlwcGVkIGJ5IFZpdGlzLiBJZiBpdCBpcyB0aGUgY2Fz
ZSwgdGhlbiBpdCdzIG5vdCBhbiBvcHRpb24gaGVyZS4gICAgCj4gPiAgIAo+ID4gPiBUaGUgZXN0
IG9wdGlvbiB3b3VsZCBiZSB0byBmaXggdGhlIGN0LW5nIHRvb2xjaGFpbiBvZiBjb3Vyc2UsIGJ1
dCAKPiA+ID4gSSdtIGFmcmFpZCBJIGNhbm5vdCBiZSB2ZXJ5IGhlbHBmdWwgb24gdGhpcywgZXNw
ZWNpYWxseSB3aXRob3V0IGFuIAo+ID4gPiBoYXJkd2FyZSB0byB0ZXN0LiA6KCAgCj4gPiAgIAo+
ID4gPiBWaXRpcyBhbmQgUGV0YUxpbnV4IDIwMjIuMSB1c2UgR0NDIGNvbXBpbGVyIDExLjIuMCB3
aXRoIHRoZSBmb2xsb3dpbmcgcGF0Y2ggc2V0Ogo+ID4gPiBodHRwczovL2dpdGh1Yi5jb20vWGls
aW54L21ldGEteGlsaW54L3RyZWUveGxueC1yZWwtdjIwMjIuMS9tZXRhLW1pYwo+ID4gPiByb2Js
YXplL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMSAgCj4gPiAKPiA+IEkgd2FudGVkIHRvIGZv
bGxvdyB1cCBvbiB0aGlzLiAgSGF2ZSB5b3UgaGFkIGEgY2hhbmNlIHRvIGFwcGx5IHRoZXNlIHBh
dGNoZXMgdG8gdGhlIGNvbXBpbGVyIHVzZWQgYnkgdGhlIHp5bnFtcC1wbXVmdy1idWlsZGVyPwo+
ID4gCj4gPiBJdCB3b3VsZCBiZSBncmVhdCBpZiB3ZSBjb3VsZCB1cGRhdGUgdGhlIHp5bnFtcC1w
bXVmdy1idWlsZGVyIHRvIGdlbmVyYXRlIGdvb2QgcG11ZncgaW1hZ2VzIGZvciB6eW5xbXAgYW5k
IGtyaWEgc29tcyBpbiB0aW1lIGZvciB0aGUgMjAyMi4yIHVwZGF0ZS4gIAo+IAo+ID4gQXBvbG9n
aWVzLCBJIGhhZCB6ZXJvIHNwYXJlIHRpbWUgdG8gdHJ5IHRoaXMuIDooICAKPiAKPiBJIGhvcGUg
aXQgaXMgb2ssIGJ1dCB3aGlsZSB0aGUgenlucW1wLXBtdWZ3LWJ1aWxkZXIgY29tcGlsZXIgaXMg
c3RpbGwgY3JlYXRpbmcgcG11ZncgaW1hZ2VzIHRoYXQgY2Fubm90IGNvcnJlY3RseSBzb2Z0IHJl
Ym9vdCwKPiBJIGhhdmUgY3JlYXRlZCBhIHRlbXBvcmFyeSBzb2x1dGlvbiB1c2luZyBwbXVmdyBp
bWFnZXMgYnVpbHQgd2l0aCBwZXRhbGludXguCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL25lYWxm
cmFnZXIvenlucW1wX3BtdWZ3Cj4gCj4gSSBqdXN0IHN1Ym1pdHRlZCBhIHBhdGNoIHRvZGF5IHRo
YXQgbWlncmF0ZXMgdGhlIHp5bnFtcCBkZWZjb25maWdzIHRvIHVzZSB0aGVzZSBwbXVmdyBpbWFn
ZXMgaW5zdGVhZCBvZiB0aGUgb25lcwo+IGdlbmVyYXRlZCBieSB0aGUgenlucW1wLXBtdWZ3LWJ1
aWxkZXIgdG9vbC4KPiAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVp
bGRyb290L3BhdGNoLzIwMjIwODE3MTE1MjQ5Ljk4OTQtMS1uZWFsLmZyYWdlckB4aWxpbnguY29t
Lwo+IAo+IE9uY2Ugd2UgZ2V0IHRoZSB6eW5xbXAtcG11ZnctYnVpbGRlciB0b29sIHdvcmtpbmcg
cHJvcGVybHkgYWdhaW4sIEkgd291bGQgYmUgaGFwcHkgdG8gc3dpdGNoIGJ1aWxkcm9vdCBiYWNr
IHRvIHVzaW5nIGl0Lgo+IAo+IEFyZSB5b3Ugb2sgd2l0aCB0aGlzIHNvbHV0aW9uPwoKR2l2ZW4g
SSdtIHRoZSBvbmUgd2hvIGlzIGtlZXBpbmcgdGhpcyBpZGxlLCBJIHN1cmVseSBjYW5ub3QgYmxh
bWUgeW91IQoKRllJOiBJIGRlZmluaXRlbHkgd291bGQgbGlrZSB0byBhZGRyZXNzIHRoaXMgaXNz
dWUgYW5kIGhvcGUgdG8gZmluZApzb21lIHRpbWUgdG8gZG8gdGhhdC4gVGhhdCBzYWlkLCBhbnkg
cGF0Y2hlcyB3b3VsZCBiZSB3ZWxjb21lIHRvby4KClRoYW5rcyBmb3IgeW91ciBlZmZvcnQuCgot
LSAKTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
