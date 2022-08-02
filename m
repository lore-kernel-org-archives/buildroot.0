Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F223DC00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 15:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FE7840931;
	Tue,  2 Aug 2022 15:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FE7840931
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JPjDZ43__Ch3; Tue,  2 Aug 2022 15:01:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E072340926;
	Tue,  2 Aug 2022 15:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E072340926
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0351C1BF57C
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 15:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD37E40640
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 15:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD37E40640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EIEHhgJgBvOa for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 15:01:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52868401A4
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52868401A4
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 15:01:17 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 117D4FF807;
 Tue,  2 Aug 2022 15:01:13 +0000 (UTC)
Date: Tue, 2 Aug 2022 17:01:12 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20220802170112.00ff0966@booty>
In-Reply-To: <CH2PR12MB5004860BC0816E61B757266AF09A9@CH2PR12MB5004.namprd12.prod.outlook.com>
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
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659452474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hC1K0xfBZKi/oPyjLy3hitDuF54zR4klzPVEWVJPw90=;
 b=byDYlKIe6pvFy81rGNb6hUy8EX/QuY/oqwb5ZGUcUH2iGmWoON33X/0sFYSUlGnNoL1iYt
 +qvLiK0IE0g+3to8BTqc6yxYfxOWb87dbqMon/vPrIG0PhtwEZiwqMh8gulAfrUxl/x6hQ
 BvM4XbDMsKPaFkT78Ts7ZC7HE0Jh45u3ZOJ+DVZlkFp+5fJRU4jBPuZtQFmHzIKOSi3riH
 Xyo+kbmoge80WlzXST5L5WGsqNU9kGj+2hkmBy/uN2ujnH78x8Yl6Q0kxO4ctGksJETwnv
 HfSMvef0CVmoZDPZgXVi2st7JjGCZHaQ+hKHBrgsCu+5se5yKRbgZcCBOQnK6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=byDYlKIe
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

SGkgTmVhbCwKCk9uIE1vbiwgMSBBdWcgMjAyMiAxMzo1OToxMSArMDAwMAoiRnJhZ2VyLCBOZWFs
IiA8bmVhbC5mcmFnZXJAYW1kLmNvbT4gd3JvdGU6Cgo+IEhpIEx1Y2EsCj4gCj4gPiBIaSBOZWFs
LCAgCj4gCj4gT24gMTMvMDUvMjIgMDY6MjEsIE5lYWwgRnJhZ2VyIHdyb3RlOgo+ID4gSGkgUGV0
ZXIsIEx1Y2EsCj4gPgo+ID4KPiA+ICAKPiA+PiBMZSAxMiBtYWkgMjAyMiDDoCAyMTozMywgUGV0
ZXIgS29yc2dhYXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4gPj4KPiA+PiDv
u79DQVVUSU9OOiBUaGlzIG1lc3NhZ2UgaGFzIG9yaWdpbmF0ZWQgZnJvbSBhbiBFeHRlcm5hbCBT
b3VyY2UuIFBsZWFzZSB1c2UgcHJvcGVyIGp1ZGdtZW50IGFuZCBjYXV0aW9uIHdoZW4gb3Blbmlu
ZyBhdHRhY2htZW50cywgY2xpY2tpbmcgbGlua3MsIG9yIHJlc3BvbmRpbmcgdG8gdGhpcyBlbWFp
bC4KPiA+Pgo+ID4+ICAKPiA+Pj4+Pj4+ICJOZWFsIiA9PSBOZWFsIEZyYWdlciA8bmVhbGZAeGls
aW54LmNvbT4gd3JpdGVzOiAgCj4gPj4KPiA+PiBIaSwKPiA+PiAgCj4gPj4+Pj4gSSBoYWQgdG8g
YWxzbyBwYXNzIHRoZSAtbSogZmxhZ3MgaW4gRVhUUkFfQ09NUElMRVJfRkxBR1MgdG8gZ2V0IGl0
IAo+ID4+Pj4+IHRvIGxpbmssIHByZXN1bWFibHkgdGhlIHBldGFsaW51eCB0b29sY2hhaW4gaGFz
IGluY29tcGF0aWJsZSAKPiA+Pj4+PiBkZWZhdWx0cy4gTHVjYSwgYW55IHNwZWNpZmljIHJlYXNv
bnMgdG8gbm90IHBhc3MgQ0ZMQUdTIHRoZXJlPyAgCj4gPj4+Pgo+ID4+Pj4gSSdtIGFmcmFpZCBJ
IGhhdmUgbm8gcmVhbCBhbnN3ZXIuIDooIFdoZW4gSSBpbml0aWFsbHkgd3JvdGUgdGhlIAo+ID4+
Pj4gc2NyaXB0IEkgZGlkIGl0IHRvIGhhdmUgdGhlIHNhbWUgbG9naWMgYXMgcGV0YWxpbnV4LiBM
YXRlciBJIGRpZG4ndCAKPiA+Pj4+IHdhdGNoIGZvciBpdHMgY2hhbmdlcy4gSSB3b3VsZCBsb3Zl
IHRvIGJlIGhlbHBmdWwgYnV0IEkgaGF2ZSBubyAKPiA+Pj4+IGFjY2VzcyB0byBhIHp5bnFtcCBi
b2FyZCBub3cuICAKPiA+PiAgCj4gPj4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciB5b3UgdG8g
anVzdCBpbXBsZW1lbnQgdGhlIGNoYW5nZXMgdGhhdCAKPiA+Pj4gUGV0ZXIgaGFzIHByb3Bvc2Vk
PyAgUGV0ZXIgYXBwZWFycyB0byBoYXZlIGFscmVhZHkgaWRlbnRpZmllZCBhIHNvbHV0aW9uLiAg
Cj4gPj4gIAo+ID4+PiBCb3RoIFBldGVyIGFuZCBJIGhhdmUgemN1MTA2IGJvYXJkcywgc28gd2Ug
Y2FuIGJvdGggdGVzdCBhbmQgdmVyaWZ5IAo+ID4+PiB0aGUgdXBkYXRlIHdvcmtzLiAgCj4gPj4K
PiA+PiBTb3JyeSwgdGhhdCBpcyBub3QgdHJ1ZS4gSSBoYXZlbid0IGZvdW5kIHRoZSBtYWdpYyBp
bmNhcm5hdGlvbiB0byBnZXQgCj4gPj4gYSB3b3JraW5nIHBtdWZ3IGJ1aWxkIHdpdGggdGhlIHRv
b2xjaGFpbiBidWlsdCBieSBjcm9zc3Rvb2wtbmcuIE15IAo+ID4+IGRpZmYgd2FzIGp1c3QgdG8g
c2hvdyB3aGF0IEkgaGFkIHRvIGNoYW5nZSB0byBhZGp1c3QgCj4gPj4genlucW1wLXBtdWZ3LWJ1
aWxkZXIgdG8gdXNlIGEgcGV0YWxpbnV4IHRvb2xjaGFpbi4KPiA+PiAgCj4gPgo+ID4gSXMgdGhl
cmUgYSByZWFzb24gd2h5IHdlIGNhbm5vdCBjaGFuZ2UgdGhlIHp5bnFtcC1wbXVmdy1idWlsZGVy
IHRvIGRvd25sb2FkIHRoZSBzYW1lIHRvb2xjaGFpbiB0aGF0IHBldGFsaW51eCB1c2VzIGFzIHRo
ZSBjcm9zc3Rvb2wtbmcgdG9vbGNoYWluPyAgCj4gCj4gPiBDYW4geW91IHBvaW50IHRvIHdoZXJl
IHRoZSBwZXRhbGludXggdG9vbGNoYWluIGNvbWVzIGZyb20/ICAKPiAKPiA+IElmIHBldGFsaW51
eCB1c2VzIGEgcHVibGljbHkgYXZhaWxhYmxlIHByZWJ1aWx0IHRvb2xjaGFpbiwgcG9zc2libHkg
d2l0aCBzb3VyY2VzIGF2YWlsYWJsZSwgdGhlbiB0aGlzIGNvdWxkIGJlIGNvbnNpZGVyZWQuICAK
PiAKPiA+IEhvd2V2ZXIgSSBzdXNwZWN0IGl0IGRvZXMgdXNlIGEgdG9vbGNoYWluIHRoYXQgaXMg
c2hpcHBlZCBieSBWaXRpcy4gSWYgaXQgaXMgdGhlIGNhc2UsIHRoZW4gaXQncyBub3QgYW4gb3B0
aW9uIGhlcmUuICAKPiAKPiA+IFRoZSBlc3Qgb3B0aW9uIHdvdWxkIGJlIHRvIGZpeCB0aGUgY3Qt
bmcgdG9vbGNoYWluIG9mIGNvdXJzZSwgYnV0IEknbSAKPiA+IGFmcmFpZCBJIGNhbm5vdCBiZSB2
ZXJ5IGhlbHBmdWwgb24gdGhpcywgZXNwZWNpYWxseSB3aXRob3V0IGFuIAo+ID4gaGFyZHdhcmUg
dG8gdGVzdC4gOiggIAo+IAo+ID4gVml0aXMgYW5kIFBldGFMaW51eCAyMDIyLjEgdXNlIEdDQyBj
b21waWxlciAxMS4yLjAgd2l0aCB0aGUgZm9sbG93aW5nIHBhdGNoIHNldDoKPiA+IGh0dHBzOi8v
Z2l0aHViLmNvbS9YaWxpbngvbWV0YS14aWxpbngvdHJlZS94bG54LXJlbC12MjAyMi4xL21ldGEt
bWljcm9ibGF6ZS9yZWNpcGVzLWRldnRvb2xzL2djYy9nY2MtMTEgIAo+IAo+IEkgd2FudGVkIHRv
IGZvbGxvdyB1cCBvbiB0aGlzLiAgSGF2ZSB5b3UgaGFkIGEgY2hhbmNlIHRvIGFwcGx5IHRoZXNl
IHBhdGNoZXMgdG8gdGhlIGNvbXBpbGVyIHVzZWQgYnkgdGhlIHp5bnFtcC1wbXVmdy1idWlsZGVy
Pwo+IAo+IEl0IHdvdWxkIGJlIGdyZWF0IGlmIHdlIGNvdWxkIHVwZGF0ZSB0aGUgenlucW1wLXBt
dWZ3LWJ1aWxkZXIgdG8gZ2VuZXJhdGUgZ29vZCBwbXVmdyBpbWFnZXMgZm9yIHp5bnFtcCBhbmQg
a3JpYSBzb21zIGluIHRpbWUgZm9yIHRoZSAyMDIyLjIgdXBkYXRlLgoKQXBvbG9naWVzLCBJIGhh
ZCB6ZXJvIHNwYXJlIHRpbWUgdG8gdHJ5IHRoaXMuIDooCgotLSAKTHVjYSBDZXJlc29saSwgQm9v
dGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxp
bi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
