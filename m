Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC54CCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 08:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BF4C60761;
	Wed, 10 Apr 2024 08:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ALzJOWXmNFVs; Wed, 10 Apr 2024 08:24:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C5E560770
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C5E560770;
	Wed, 10 Apr 2024 08:24:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AEDD51BF3AF
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 08:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7F5440988
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 08:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1W05iysP01Kt for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 08:24:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.141;
 helo=fllv0015.ext.ti.com; envelope-from=dannenberg@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 145064097A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 145064097A
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 145064097A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 08:24:31 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43A8OTBK062989;
 Wed, 10 Apr 2024 03:24:29 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43A8OTtN120416
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 10 Apr 2024 03:24:29 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 03:24:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 03:24:29 -0500
Received: from dasso (dasso.dhcp.ti.com [128.247.79.182])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43A8OT0N098436;
 Wed, 10 Apr 2024 03:24:29 -0500
Date: Wed, 10 Apr 2024 03:24:29 -0500
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <buildroot@buildroot.org>
Message-ID: <20240410082429.r2qhdb7uaqbr2ukk@dasso>
References: <20240407103512.1112712-1-romain.naour@smile.fr>
 <58478029-3c92-497e-bb31-4a1f1119afd4@mind.be>
 <1ec8e03b-f5b7-41cf-bfe4-17f99a871e93@mind.be>
 <0ea49f2c-fe1e-4a44-aaf8-90120ef6f9fd@smile.fr>
 <CABGWkvrVr-AY-huV-tijtt48eYtB4nSQ==gZ1VvnWy4SSyYXyQ@mail.gmail.com>
 <20240410080006.GA1545957@theia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240410080006.GA1545957@theia>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1712737469;
 bh=wjV5wb3Pm3ltmBan6oCtdWHtBSLoKDRQTctdXad2nIo=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=UOKnb+Lz0XIlICiNhUSSi1uFVkiuanuqaIb/4XRu4GQ2VJ+Q949eFfxTm9n/PTl0D
 0OJ+A4xJAf4jnqzuH+ETVlLWet4vk4/IgIy0PvW/Ohu8xe0J404+eXOXhvM8IgPd1/
 M7RpGMgypmcUf2v28h0DPZkYhQy8FJblarWAIRyc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=UOKnb+Lz
Subject: Re: [Buildroot] [PATCH v12 00/16] Add support for AM62x-SK HS-FS
 devices
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
From: Andreas Dannenberg via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Dannenberg <dannenberg@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2VybywgRGFyaW8sCgpPbiBXZWQsIEFwciAxMCwgMjAyNCBhdCAxMDowMDowNkFNICswMjAwLCBH
ZXJvIFNjaHfDpHJpY2tlIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gT24gV2VkLCBBcHIgMTAsIDIw
MjQgYXQgMDk6MzQ6MTZBTSArMDIwMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gPiBIaSBSb21h
aW4sIEFsbAo+ID4gCj4gPiBPbiBUdWUsIEFwciA5LCAyMDI0IGF0IDExOjE34oCvUE0gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyb3RlOgo+ID4gPgo+ID4gPiBIZWxsbyBB
cm5vdXQsIEFsbCwKPiBbLi4uXQo+ID4gPgo+ID4gPiBUaGFua3MsIHRoZSBzZXJpZXMgaXMgbWVy
Z2VkLgo+ID4gPgo+ID4gPiBUaGFua3MgdG8gRGFyaW8gYW5kIE1pY2hhZWwgZm9yIHRoZSBpbml0
aWFsIHdvcmsgb24gdGhlIEhTLUZTIHRvcGljIQo+ID4gPgo+ID4gPiBUaGUgaW5pdGlhbCBzZXJp
ZXMgc2hvd2VkIHRoYXQgaXQgd2FzIG5lY2Vzc2FyeSB0byByZXdvcmsgaGVhdmlseSB0aGUgVEkg
SzMgU29DCj4gPiA+IHJlbGF0ZWQgcGFja2FnZXMgaW4gQnVpbGRyb290LiBUaGlzIHdhcyB0aGUg
b3Bwb3J0aW5pdHkgdG8gYW50aWNpcGF0ZSBvbiB0aGUKPiA+ID4gYWRkaXRpb24gb2YgbmV3IFRJ
IEszIFNvQyBzdXBwb3J0Lgo+ID4gPgo+ID4gPiBUaGFua3MgdG8gQW5kcmVhcyBhbmQgQnJ5YW4g
ZnJvbSBUSSBmb3IgdGhlIHJldmlldyBhbmQgZmluZSBkZXRhaWxzIGFib3V0IFRJIEszCj4gPiA+
IFNvQyBmYW1pbGx5IGFuZCB0aGUgcnVudGltZSB0ZXN0aW5nLgo+ID4gPgo+ID4gPiBUaGFua3Mg
dG8gYWxsIHRlc3RlcnMgYW5kIHJldmlld2Vycy4KPiA+IAo+ID4gSSB0aGluayBteSB0d28gcGF0
Y2hlcyBmb3IgdmVyc2lvbiAxMCB3ZXJlIHVsdGltYXRlbHkgbG9zdDoKPiA+IAo+ID4gW3YxMCww
NS8xMl0gcGFja2FnZS90aS1rMzogZGlzYWJsZSBIUy1GUyBmb3IgQU02NSBTT0MKPiA+IFt2MTAs
MDQvMTJdIHBhY2thZ2UvdGktazM6IG1vdmUgVElfSzNfe1NFQ1RZUEUsIFNPQ30gb3V0IG9mIHRo
ZSBpbWFnZS1nZW4gc2NvcGUKPiA+IAo+ID4gU3BlY2lmaWNhbGx5LCBwYXRjaCA0IGlzIG5lY2Vz
c2FyeSBmb3IgdGhlIHByb3BlciBjcmVhdGlvbiBvZiB0aGUKPiA+IGltYWdlLiBIYXMgdmVyc2lv
biAxMiBhY3R1YWxseSBiZWVuIHRlc3RlZCBieSBhbnlvbmU/Cj4gPiBJIGNhbiBhc3N1cmUgeW91
IHZlcnNpb24gMTAgaGFzIGJlZW4uCj4gPiAKPiA+IEFkZGl0aW9uYWxseSwgaXQgc2VlbXMgdGhh
dCBwYXRjaAo+ID4gW3YxMCwwMi8xMl0gYm9vdC90aS1rMy1yNS1sb2FkZXI6IHNldCBiaW5tYW4g
ZW52aXJvbm1lbnQKPiA+IGhhcyBiZWVuIGluY29ycG9yYXRlZCBpbnRvIHlvdXIgcGF0Y2ggImJv
b3QvdGktazMtcjUtbG9hZGVyOiByZW1vdmUKPiA+IEJSMl9UQVJHRVRfVElfSzNfUjVfTE9BREVS
X1VTRV9CSU5NQU4iCj4gPiBhbmQgSSBkb24ndCB1bmRlcnN0YW5kIHdoeS4KPiA+IAo+ID4gVGhh
bmtzIGFuZCByZWdhcmRzLAo+ID4gRGFyaW8KPiAKPiBIaSBEYXJpbywKPiAKPiBJIGNhbiBjb25m
aXJtIHRoYXQgc29tZXRoaW5nIGlzIGFtaXNzLCBtYXliZSBpdCB3b3VsZCBoYXZlIGJlZW4gYmV0
dGVyCj4gdG8gYXdhaXQgbW9yZSB0ZXN0cyB3aXRoIHBhdGNoIFYxMi4KCkkganVzdCB0ZXN0ZWQg
dG9wLW9mLW1hc3RlciB3L28gYW55IGFkZGl0aW9uYWwgcGF0Y2hlcyBvbiBTSy1BTTYyICh3aXRo
CkdQIHNpbGljb24pIGFuZCBTSy1BTTYyQiAocHJvZHVjdGlvbiBib2FyZCwgd2l0aCBIUy1GUyBz
aWxpY29uKSBhbmQgaXQKd29ya2VkIGxpa2UgYSBjaGFtcC4gSGVyZSdzIHRoZSBiZWdpbm5pbmcg
b2YgdGhlIGJvb3QgdXNpbmcgU0stQU02Mi4uLgoKPC4uLnNuaXAuLi4+ClUtQm9vdCBTUEwgMjAy
NC4wMSAoQXByIDA5IDIwMjQgLSAyMDoxMTozMCAtMDUwMCkKU1lTRlcgQUJJOiAzLjEgKGZpcm13
YXJlIHJldiAweDAwMDggJzguNi40LS12MDguMDYuMDQgKENoaWxsIENhcHliYXInKQpTUEwgaW5p
dGlhbCBzdGFjayB1c2FnZTogMTMzNjggYnl0ZXMKVHJ5aW5nIHRvIGJvb3QgZnJvbSBNTUMyCkF1
dGhlbnRpY2F0aW9uIHBhc3NlZApBdXRoZW50aWNhdGlvbiBwYXNzZWQKQXV0aGVudGljYXRpb24g
cGFzc2VkCkF1dGhlbnRpY2F0aW9uIHBhc3NlZApBdXRoZW50aWNhdGlvbiBwYXNzZWQKU3RhcnRp
bmcgQVRGIG9uIEFSTTY0IGNvcmUuLi4KCk5PVElDRTogIEJMMzE6IHYyLjcocmVsZWFzZSk6djIu
NwpOT1RJQ0U6ICBCTDMxOiBCdWlsdCA6IDIwOjA4OjE2LCBBcHIgIDkgMjAyNApJL1RDOgpJL1RD
OiBPUC1URUUgdmVyc2lvbjogVW5rbm93bl80LjAgKGdjYyB2ZXJzaW9uIDEyLjMuMCAoQnVpbGRy
b290CjIwMjQuMDItNDE2LWdkMDFlMTNjNGQ0KSkgIzEgV2VkIEFwciAxMCAwMTowODoxNCBVVEMg
MjAyNCBhYXJjaDY0CkkvVEM6IFdBUk5JTkc6IFRoaXMgT1AtVEVFIGNvbmZpZ3VyYXRpb24gbWln
aHQgYmUgaW5zZWN1cmUhCkkvVEM6IFdBUk5JTkc6IFBsZWFzZSBjaGVjawpodHRwczovL29wdGVl
LnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9hcmNoaXRlY3R1cmUvcG9ydGluZ19ndWlkZWxpbmVz
Lmh0bWwKSS9UQzogUHJpbWFyeSBDUFUgaW5pdGlhbGl6aW5nCkkvVEM6IFNZU0ZXIEFCSTogMy4x
IChmaXJtd2FyZSByZXYgMHgwMDA4ICc4LjYuNC0tdjA4LjA2LjA0IChDaGlsbApDYXB5YmFyJykK
SS9UQzogSFVLIEluaXRpYWxpemVkCkkvVEM6IEFjdGl2YXRlZCBTQTJVTCBkZXZpY2UKSS9UQzog
RW5hYmxlZCBmaXJld2FsbHMgZm9yIFNBMlVMIFRSTkcgZGV2aWNlCkkvVEM6IFNBMlVMIFRSTkcg
aW5pdGlhbGl6ZWQKSS9UQzogU0EyVUwgRHJpdmVycyBpbml0aWFsaXplZApJL1RDOiBQcmltYXJ5
IENQVSBzd2l0Y2hpbmcgdG8gbm9ybWFsIHdvcmxkIGJvb3QKClUtQm9vdCBTUEwgMjAyNC4wMSAo
QXByIDA5IDIwMjQgLSAyMDoxMTo0OCAtMDUwMCkKU1lTRlcgQUJJOiAzLjEgKGZpcm13YXJlIHJl
diAweDAwMDggJzguNi40LS12MDguMDYuMDQgKENoaWxsIENhcHliYXInKQpTUEwgaW5pdGlhbCBz
dGFjayB1c2FnZTogMTg3MiBieXRlcwpUcnlpbmcgdG8gYm9vdCBmcm9tIE1NQzIKQXV0aGVudGlj
YXRpb24gcGFzc2VkCkF1dGhlbnRpY2F0aW9uIHBhc3NlZAoKClUtQm9vdCAyMDI0LjAxIChBcHIg
MDkgMjAyNCAtIDIwOjExOjQ4IC0wNTAwKQoKU29DOiAgIEFNNjJYIFNSMS4wIEhTLUZTCk1vZGVs
OiBUZXhhcyBJbnN0cnVtZW50cyBBTTYyNSBTSwpEUkFNOiAgMiBHaUIKQ29yZTogIDU2IGRldmlj
ZXMsIDIzIHVjbGFzc2VzLCBkZXZpY2V0cmVlOiBzZXBhcmF0ZQpNTUM6ICAgbW1jQGZhMTAwMDA6
IDAsIG1tY0BmYTAwMDAwOiAxCkxvYWRpbmcgRW52aXJvbm1lbnQgZnJvbSBub3doZXJlLi4uIE9L
CkluOiAgICBzZXJpYWxAMjgwMDAwMApPdXQ6ICAgc2VyaWFsQDI4MDAwMDAKRXJyOiAgIHNlcmlh
bEAyODAwMDAwCk5ldDogICBldGgwOiBldGhlcm5ldEA4MDAwMDAwcG9ydEAxCkhpdCBhbnkga2V5
IHRvIHN0b3AgYXV0b2Jvb3Q6ICAwCjwuLi5zbmlwLi4uPgoKCj4gQXQgbGVhc3QgbXkgY3VycmVu
dCB0ZXN0IG9mIHRpX2FtNjJ4X3NrX2RlZmNvbmZpZyBvbiBtYXN0ZXIgZmFpbGVkIHRvIGJvb3Q6
Cj4gCj4gICBVLUJvb3QgU1BMIDIwMjQuMDEgKEFwciAxMCAyMDI0IC0gMDk6MzI6MTcgKzAyMDAp
Cj4gICBrM19zeXN0ZW1fY29udHJvbGxlciBzeXNjdHJsZXI6IGszX3N5c2N0cmxlcl9zdGFydDog
Qm9vdCBOb3RpZmljYXRpb24gcmVzcG9uc2UgZmFpbGVkLiByZXQgPSAtMTEwCj4gICBGaXJtd2Fy
ZSBpbml0IGZhaWxlZCBvbiBycHJvYyAoLTExMCkKPiAKPiAgIHJlc2V0dGluZyAuLi4KPiAKPiBJ
IHRlc3RlZCB3aXRoIEFNNjJ4IFNLIEVWTSBFMy4gSSdsbCB0cnkgdG8gYXBwbHkgeW91ciB0d28g
bWlzc2luZwo+IHBhdGNoZXMgYW5kIHRlc3QgYWdhaW4uCgpBcmUgeW91IHVzaW5nIGEgYm9hcmQg
d2l0aCBQQ0IgcmV2aXNpb24gJ1BST0MxMTRFMyc/IElmIHNvIHRoaXMgYm9hcmQgaXMKa25vd24g
YXMgJ1RoaXJkIHByb3RvdHlwZSwgZWFybHkgcmVsZWFzZSByZXZpc2lvbiBvZiB0aGUgQU02Mngg
U0sgRVZNJwphbmQgc2hvdWxkIGhhdmUgR1Agc2lsaWNvbi4gV2hpY2ggbWVhbnMgeW91IG11c3Qg
aGF2ZSByZS1hZGRlZC4uLgoKQlIyX1RBUkdFVF9USV9LM19SNV9MT0FERVJfVElCT09UM19CSU49
InRpYm9vdDMtYW02MngtZ3AtZXZtLmJpbgoKLi4udG8geW91ciAuY29uZmlnPwoKSSBkb24ndCBo
YXZlIGEgUFJPQzExNEUzIGJvYXJkIGJ1dCB0aGUgYm9hcmQgSSB1c2VkIHRvIHRlc3QgdGhlIEdQ
CnZhcmlhbnQgdG9kYXkgaXMgYSBQUk9DMTE0RTIsIGFuZCBpdCB3b3JrZWQuIEJ1dCBuZWl0aGVy
IG9mIHRob3NlIGJvYXJkcwppcyBjb25zaWRlcmVkICJwcm9kdWN0aW9uIi4KCkFsc28ganVzdCBm
b3IgcmVmZXJuY2UsIGFuIFNLLUFNNjIgUENCIHJldmlzaW9uIGhpc3RvcnkgY2FuIGJlIGZvdW5k
IGluClRhYmxlIDEtMSBpbiB0aGUgQU02MnggU0sgRVZNIFVzZXIncyBHdWlkZSBbMV0uCgoKLS0K
QW5kcmVhcyBEYW5uZW5iZXJnClRleGFzIEluc3RydW1lbnRzIEluYwoKClsxXSBodHRwczovL3d3
dy50aS5jb20vbGl0L3BkZi9zcHJ1ajQwIAoKCgoKPiBCZXN0LAo+IEdlcm8KPiAKPiA+ID4gQmVz
dCByZWdhcmRzLAo+ID4gPiBSb21haW4KPiA+ID4KPiBbLi4uXQo+IAo+IC0tIAo+IAo+IAo+IAo+
IOKAk+KAk+KAkwo+IAo+IAo+IGdyYW5kY2VudHJpeCBHbWJIIHwgQSBWb2RhZm9uZSBDb21wYW55
wqDCt8KgSG9sem1hcmt0IDHCoMK3wqA1MDY3NiAKPiAqQ29sb2duZSrCoHzCoFBob2VuaXhzZWVz
dHJhc3NlIDE4wqDCt8KgNDQyNjMgKkRvcnRtdW5kKsKgwrfCoEdlcm1hbnkKPiB8wqBpbiAKPiA8
aHR0cHM6Ly93d3cubGlua2VkaW4uY29tL2NvbXBhbnkvZ3JhbmRjZW50cml4PiB8IHBob25lOiAr
NDktMjIxLTY3Ny04NjAtMCAKPiB8wqBlbWFpbDogaGVsbG9AZ3JhbmRjZW50cml4Lm5ldCA8bWFp
bHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+Cj4gCj4gCj4gZ3JhbmRjZW50cml4IGNhcmVzIGFi
b3V0wqBwcml2YWN5IAo+IDxodHRwczovL2dyYW5kY2VudHJpeC5uZXQvZGUvcGFnZXMvcHJpdmFj
eW1haWwvPgo+IAo+IEFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCj4gNzAxMTkgfCBHZXNjaMOk
ZnRzZsO8aHJlcjogTS4gS3LDtm1lcizCoCBSLiBIw6RuZWwgfCBVU3QuLUlkTnIuOiBERTI2NjMz
Mzk2OQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
