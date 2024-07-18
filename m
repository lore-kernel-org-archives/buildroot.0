Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBEC3DA61
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 22:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5FC340556;
	Thu, 18 Jul 2024 22:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPmVa2oq7GEo; Thu, 18 Jul 2024 22:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BC01404BF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BC01404BF;
	Thu, 18 Jul 2024 22:21:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE4E91BF346
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 22:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB371404BF
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 22:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XE4cEYNFAVbt for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 22:21:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.23.248;
 helo=lelv0143.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 74FC140146
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74FC140146
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74FC140146
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 22:21:49 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46IMLi65123429;
 Thu, 18 Jul 2024 17:21:44 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46IMLidB026079
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 18 Jul 2024 17:21:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 Jul 2024 17:21:43 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 Jul 2024 17:21:43 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46IMLhT3127019;
 Thu, 18 Jul 2024 17:21:43 -0500
Date: Thu, 18 Jul 2024 17:21:43 -0500
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20240718222143.v47khuin7vl3g5nt@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <DM4PR84MB1664512ACED9F33EDD096ADEB6DA2@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <69f8bf8d-7bf9-4941-987e-9fc59ba40a7a@smile.fr>
 <5d78c650-f662-4733-ba33-dff3aa71727a@mind.be>
 <DM4PR84MB1664C75FF1FD9995EEE4E3A8B6A22@DM4PR84MB1664.NAMPRD84.PROD.OUTLOOK.COM>
 <fbabd24f-673d-4f60-a5b3-d502146947cd@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbabd24f-673d-4f60-a5b3-d502146947cd@mind.be>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1721341304;
 bh=VY8wstjSZ5/AeqZxWW9S+vSX7TcQygLcNyC/2XIvM8E=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=iMFGxt+tw1324gDbBQGnC6I8ucqEbQamf5J2Su4e5xxnJwx0arsw+CVKxHwx+dmLm
 yP7O5SK0NwSZAh3XQu6EFo83M4YgbjfKW1Ax1qmynNfLQ5i6JROUSYfKUcFrR9/f3a
 X7Mc4vl06btukvxeOpcg/npyZEYpdMZTXSQALXNU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=iMFGxt+t
Subject: Re: [Buildroot] bare metal toolchain tuning options
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, "Rush, David" <david.rush2@hpe.com>,
 Neal Frager <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gSnVseSAxNiwgMjAyNCB0aHVzIHNheWV0aCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB2aWEgYnVp
bGRyb290Ogo+ICBBZGRpbmcgc29tZSBwZW9wbGUgd2hvIGFyZSBhY3R1YWxseSBpbnZvbHZlZCBp
biB0aGlzIGJhcmVtZXRhbCBzdHVmZiBpbiBDYy4KPiAKPiBPbiAxNi8wNy8yMDI0IDE2OjEzLCBS
dXNoLCBEYXZpZCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4g
RnJvbTogQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPgo+ID4gPiBTZW50OiBG
cmlkYXksIEp1bHkgMTIsIDIwMjQgMjo1MiBQTQo+ID4gPiBUbzogUm9tYWluIE5hb3VyIDxyb21h
aW4ubmFvdXJAc21pbGUuZnI+OyBSdXNoLCBEYXZpZAo+ID4gPiA8ZGF2aWQucnVzaDJAaHBlLmNv
bT47IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPiA+IFN1YmplY3Q6IFJlOiBbQnVpbGRyb290
XSBiYXJlIG1ldGFsIHRvb2xjaGFpbiB0dW5pbmcgb3B0aW9ucwo+ID4gPiAKPiA+ID4gCj4gPiA+
IAo+ID4gPiBPbiAxMi8wNy8yMDI0IDIxOjM3LCBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCB3
cm90ZToKPiA+ID4gPiBIZWxsbyBEYXZpZCwgQWxsLAo+ID4gPiA+IAo+ID4gPiA+IExlIDA4LzA3
LzIwMjQgw6AgMTk6NTgsIFJ1c2gsIERhdmlkIGEgw6ljcml0wqA6Cj4gPiA+ID4gPiBIaSwKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gSGF2aW5nIHRoZSBvcHRpb24gdG8gYnVpbGQgYSBiYXJlIG1ldGFs
IHRvb2xjaGFpbiBhbG9uZ3NpZGUgdGhlIExpbnV4IGJpdHMKPiA+ID4gaXMgZmFudGFzdGljLiBB
cyB0aGluZ3MgYXJlIG5vdyBvbmx5IHRoZSBhcmNoIHR1cGxlIGlzIGNvbmZpZ3VyYWJsZSB0aG91
Z2ggdGhlCj4gPiA+IGRlZmNvbmZpZywgd2hpY2ggbWF5IG5vdCBhbHdheXMgZ2V0IHRvIHRoZSBk
ZXNpcmVkIHJlc3VsdC4gSGFzIGFueW9uZSBsb29rZWQKPiA+ID4gYXQgYWRkaW5nIGNvbmZpZ3Vy
ZSBvcHRpb25zIGZvciB0dW5pbmcgdGhlIGJhcmUgbWV0YWwgdG9vbGNoYWluIHBhY2thZ2U/IEZv
cgo+ID4gPiBleGFtcGxlLCB3aGVuIGV4cGVyaW1lbnRpbmcgd2l0aCBhbiBhcm0gY29ydGV4IG00
IG1pY3JvY29udHJvbGxlciB3aXRoIGEKPiA+ID4gJ25hbm8nIG5ld2xpYiBjb25maWd1cmF0aW9u
LCB0aGUgZm9sbG93aW5nIGNoYW5nZXMgdG8gZ2NjIGFuZCBuZXdsaWIncwo+ID4gPiBjb25maWd1
cmUgY29tbWFuZCBnb3QgbWUgYSB3b3JraW5nIHRvb2xjaGFpbjoKPiA+ID4gPiAKPiA+ID4gPiBU
aGUgQlIyX1RPT0xDSEFJTl9CQVJFX01FVEFMX0JVSUxEUk9PVCBvcHRpb24gaXMgc29tZXRoaW5n
IG5ldwo+ID4gPiBpbgo+ID4gPiA+IEJ1aWxkcm9vdCAoYWRkZWQgaW4gSmFudWFyeSAyMDI0KSBh
bmQgaW5pdGlhbGx5IGludGVuZGVkIHRvIGJ1aWxkCj4gPiA+ID4genlucW1wLWZpcm13YXJlICh4
aWxpbngpIHJlcXVpcmVkIHRvIGJvb3QgdGhlIGJvYXJkLgo+ID4gPiA+IAo+ID4gPiA+IEkgZG9u
J3QgdGhpbmsgaXQncyBtZWFudCBmb3IgYW5vdGhlciBwdXJwb3NlLiBGb3IgZXhhbXBsZSwgYnVp
bGRpbmcgYQo+ID4gPiA+IHJlbW90ZWNvcmUKPiA+ID4gPiBtNCBiYXNlZCBmaXJtd2FyZSBldGMu
Li4KPiA+ID4gCj4gPiA+ICAgIEFjdHVhbGx5LCBJIHRoaW5rIGl0IHdhcyBpbnRyb2R1Y2VkIGlu
IHRoaXMgZ2VuZXJpYyB3YXkgcHJlY2lzZWx5IHRvIGJlIGFibGUgdG8KPiA+ID4gdXNlIGl0IGZv
ciBvdGhlciBwdXJwb3NlcywgbGlrZSByZW1vdGVjb3JlIGZpcm13YXJlLi4uCj4gCj4gIExpdHRs
ZSBzaWRlLXRyYWNrOiB3ZSBhbHNvIGhhdmUgdGhlIGFybS1nbnUtdG9vbGNoYWluIHBhY2thZ2Ug
dGhhdCBjYW4gYmUKPiB1c2VkIGZvciByZW1vdGVjb3JlIHN0dWZmLiBUaGlzIGlzIG9ubHkgYWRk
aW5nIHRvIHRoZSBjb25mdXNpb24uLi4KPiAKCkhhIGl0J3MgaW50ZXJlc3RpbmcgdGhpcyB0aHJl
YWQgc2hvd2VkIHVwLiBUaGVyZSB3YXMgYSB0aHJlYWQgYSBmZXcgCndlZWtzIGFnbyBvbiB0aGUg
dS1ib290IG1haWxpbmcgbGlzdCBhYm91dCB0aGlzIHNhbWUgdGhpbmdbMF0uCgpTYWRseSBpZiB5
b3UgZ28gc2hvcHBpbmcgZm9yIG5ldyBJUCBmcm9tIElQIHZlbmRvcnMgeW91J2xsIHF1aWNrbHkg
Cm5vdGljZSB0aGUgdHJlbmQgKEREUiBlc3BlY2lhbGx5KSB3aGVyZSBldmVuIGluZGl2aWR1YWwg
SVAgaXMgc3RhcnRpbmcgCnRvIHJlcXVpcmUgdGhlaXIgb3duIGZpcm13YXJlIGJsb2JzIHRvIGZ1
bmN0aW9uIHByb3Blcmx5LiBVLUJvb3QgYW5kIG91ciAKb3RoZXIgYm9vdC1sb2FkZXJzIGFyZSBz
bG93bHkgYmVjb21pbmcgdGhlaXIgb3duIG1pbmktZGlzdHJpYnV0aW9uLgoKUGVyc29uYWxseSBJ
IHdhbnQgdG8gZW5jb3VyYWdlIHZlbmRvcnMgdG8gYmVoYXZlIG1vcmUgbGlrZSB4aWxpbnggaGVy
ZSAKcmF0aGVyIHRoYW4gZG8gd2hhdCB3ZSAoVEkpIGN1cnJlbnRseSBkbyB3aGljaCBpcyBkaXN0
cmlidXRlIHRoZXNlIApiaW5hcmllcyBvcGVubHkgKGJvb3QvdGktazMtYm9vdC1maXJtd2FyZS8p
LiBUZWNobmljYWxseSBvdXIgRE0gZmlybXdhcmUgCmlzIG9wZW4gYnV0IHlvdSdsbCBuZWVkIG91
ciBNQ1UrIFNESyB0byBidWlsZCBpdCB3aGljaCBpcyBtb3JlIHBhaW4gbW9zdCAKd2lsbCBnbyB0
aHJvdWdoLCBob3dldmVyIG91ciBUSUZTIGFuZCBETVNDIGZpcm13YXJlIGNvbnRpbnVlcyB0byBi
ZSAKY2xvc2VseSBndWFyZGVkLgoKQW55dGhpbmcgd2UgY2FuIGRvIHRvIGF2b2lkIHJlcGxpY2F0
aW5nIHRoZSBHUFUgbWFya2V0IHRvZGF5IGluIG15IG1pbmQgCndpbGwgZ28gYSBsb25nIHdheSB0
byBpbmNyZWFzZSB0aGUgc2VjdXJpdHkgYW5kIGxvbmdldml0eSBvZiB0aGVzZSAKYm9hcmRzIGFu
ZCBTb0NzIDIwKyB5ZWFycyBhZnRlciB0aGUgdmVuZG9yJ3MgZGV2ZWxvcG1lbnQgdGVhbXMgaGF2
ZSAKbW92ZWQgb24uCgpbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDYyMDIxMzUz
OS5mdG1qaHBoeXBzc3hwNW40QGRlc29sYXRlCgo+IAo+ID4gPiAgICBBbmQgSSB3YXNuJ3QgYSBi
aWcgZmFuIGZvciBtZXJnaW5nIHRoaXMgYmVjYXVzZSBJIGZlYXJlZCB0aGVyZSB3b3VsZCBiZSBu
bwo+ID4gPiBlbmQgb2YgdHVuYWJsZXMgYW5kIGFkZGl0aW9uYWwgY29uZmlnIG9wdGlvbnMgbmVl
ZGVkIHRvIHJlYWxseSBtYWtlIGl0IHdvcmssCj4gPiA+IGFuZCBJTUhPIHRoYXQgZmFsbHMgb3V0
c2lkZSB0aGUgc2NvcGUgb2YgQnVpbGRyb290IChidWlsZGluZyBhIExpbnV4IHJvb3RmcykuCj4g
PiAKPiA+IElmIHRoZSBnY2MgYW5kIG5ld2xpYiBiYXJlbWV0YWwgcGFja2FnZXMgZWFjaCBoYWQg
YW4gZXh0cmEgY29uZmlnIHNldHRpbmcgZm9yCj4gPiBhcHBlbmRpbmcgYSBjdXN0b21pemVkIGxp
c3Qgb2YgY29uZmlndXJlIHNjcmlwdCBhcmd1bWVudHMsIG9yIHVzZSBhIGRlZmF1bHQKPiA+IGxp
c3QgaWYgdW5zcGVjaWZpZWQsIHdvdWxkIGdvIGEgbG9uZyB3YXkgaW4gbWFraW5nIHRoaXMgZmVh
dHVyZSBtb3JlIGdlbmVyYWxseQo+ID4gdXNlZnVsLiBBbmQsIGl0IHdvdWxkbid0IHJlcXVpcmUg
YSBidW5jaCBvZiBleHRyYSBtYWNoaW5lcnkuCj4KPiAgSSB0aGluayBleHRyYSBvcHRpb25zIHRv
IGdjYydzIGNvbmZpZ3VyZSBpcyBkZWZpbml0ZWx5IGFuIG9wdGlvbi4gV2UKPiBhbHJlYWR5IGRv
IHNvbWV0aGluZyBzaW1pbGFyIGZvciBlLmcuIGFybS10cnVzdGVkLWZpcm13YXJlLiBCdXQgSSBn
dWVzcyBzb21lCj4gb2YgdGhvc2Ugb3B0aW9ucyB3aWxsIG5lZWQgdG8gYmUgcmVwbGljYXRlZCBm
b3IgYmludXRpbHM/IEFuZCB3aGF0IGFib3V0Cj4gcHJlYnVpbHQgdG9vbGNoYWlucyBsaWtlIGFy
bS1nbnUtdG9vbGNoYWluPwo+IAoKWWVhaCBJIGxpa2UgdGhpcyBpZGVhLiArMQoKfkJyeWFuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
