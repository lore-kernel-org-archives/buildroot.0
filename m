Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF11CE7A91
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 02:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5DCE607E1;
	Mon, 25 Sep 2023 02:59:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DCE607E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gT_YHld80Xct; Mon, 25 Sep 2023 02:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AD9060F5D;
	Mon, 25 Sep 2023 02:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AD9060F5D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 715C51BF2A9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 02:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1960C403F9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 02:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1960C403F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TgPIwtPC41p for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 02:59:50 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F2AD400B9
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 02:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F2AD400B9
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC0F3C0004;
 Mon, 25 Sep 2023 02:59:45 +0000 (UTC)
Date: Mon, 25 Sep 2023 04:59:44 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230925045944.6a88abd4@booty>
In-Reply-To: <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230904100443.1613306-1-neal.frager@amd.com>
 <20230922145236.027dc287@booty>
 <CH2PR12MB50040897854080471200F9E0F0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <20230922155735.43ddc356@booty>
 <CH2PR12MB5004C65AFCE251505428888AF0FFA@CH2PR12MB5004.namprd12.prod.outlook.com>
 <MN0PR12MB60045761B225083426E7B1A1A0FFA@MN0PR12MB6004.namprd12.prod.outlook.com>
 <CH2PR12MB5004761ED87FCAC8E37E9667F0FEA@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695610786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WtB/EhkIUsPqLfGv50h2MUmptL3BBGQ3Ttolnr5bteA=;
 b=iy05QFp3Vcx3R71BxDkKnk+xYpmbjVIzqdhZc/Ax/dJuJdxR5dzlvlcJYwc7855H5oMPdq
 VQdr9PoImpf+52GE2CIYr+2g1gYg2b3I8R17DnmpMuhf9o1Fiy0CmWEyvuGr0k6tw25qp4
 gEC1DXtaonn255M7LGXUeSzeItZYEwnk5q0CHuKu4U82rbpVKAJRLyqKlG0R4qkti6DTLh
 FpqX0O4s3PqzR6BKbTpSFGK7xrOAQdLR/3x4E+997np4X0DmT3cNmzsjGFVT0qzkB5Uw/M
 qqtmnvRBbmdOGaKJzmw/uft3RMeEfAteDzmD2IVUDxkK0KUQnP2qZYy5P4a0vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iy05QFp3
Subject: Re: [Buildroot] [PATCH v3 1/6] package/binutils-bare-metal: new
 package
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, "Simek,
 Michal" <michal.simek@amd.com>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgTmVhbCwgSWJhaSwKCk9uIFNhdCwgMjMgU2VwIDIwMjMgMDk6NTA6MzQgKzAwMDAKIkZyYWdl
ciwgTmVhbCIgPG5lYWwuZnJhZ2VyQGFtZC5jb20+IHdyb3RlOgoKPiA+ID4gRnJvbSBteSB2aWV3
LCBpdCBpcyBlYXNpZXIgZm9yIG1lIHRvIG1haW50YWluIHRoaXMgaWYgd2UgZWl0aGVyIHRha2UK
PiA+ID4gYWxsIG9mIHRoZSAgCj4gPiBwYXRjaGVzIGFzIGlzIG9yIG5vbmUgYXQgYWxsLgo+ID4g
IAo+ID4gPiBBZ3JlZWQgaXQgaXMgc2ltcGxlciB0byBtYWludGFpbiwgc28gdGhpcyBib2lscyBk
b3duIHRvIHRoZSBxdWVzdGlvbjoKPiA+ID4gYXJlIHRob3NlIHBhdGNoZXMgYmVpbmcgYWN0aXZl
bHkgbWFpbmxpbmVkPyBJIGhhdmUgYSBzYWQgZmVlbGluZwo+ID4gPiBhYm91dCBpdCBhcyAgCj4g
PiB0aGUgbnVtYmVyIGFuZCBvdmVyYWxsIHF1YWxpdHkgb2YgdGhvc2UgcGF0Y2hlcyBzZWVtcyB0
aGUgc2FtZSBJIHNhdwo+ID4gbW9yZSB0aGFuIGFuIHllYXIgYWdvLgo+ID4KPiA+IEFzIGEgcXVp
Y2sgdGVzdCwgSSB0cmllZCByZW1vdmluZyB0aGUgWGlsaW54IHBhdGNoIHNldCB0byBzZWUgaWYg
dGhlCj4gPiBidWlsZCB3b3VsZCBzdGlsbCB3b3JrLgo+ID4KPiA+IEkgZW5kZWQgdXAgZ2V0dGlu
ZyB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9yIHdpdGggdGhlIHp5bnFtcCBwbXVmdzoKPiA+IG1p
Y3JvYmxhemVfc2xlZXAuYzo4MTo5OiBub3RlOiAnI3ByYWdtYSBtZXNzYWdlOiBGb3IgdGhlIHNs
ZWVwCj4gPiByb3V0aW5lcywgYXNzZW1ibHkgaW5zdHJ1Y3Rpb25zIGFyZSB1c2VkJwo+ID4gICAg
ODEgfCAjcHJhZ21hIG1lc3NhZ2UgKCJGb3IgdGhlIHNsZWVwIHJvdXRpbmVzLCBhc3NlbWJseQo+
ID4gaW5zdHJ1Y3Rpb25zIGFyZQo+ID4gdXNlZCIpCj4gPiAgICAgICB8ICAgICAgICAgXn5+fn5+
fgo+ID4gbWljcm9ibGF6ZV9zZWxmdGVzdC5TOiBBc3NlbWJsZXIgbWVzc2FnZXM6Cj4gPiBtaWNy
b2JsYXplX3NlbGZ0ZXN0LlM6NTU0OiBFcnJvcjogdW5rbm93biBvcGNvZGUgImJzaWZpIgo+ID4g
bWljcm9ibGF6ZV9zZWxmdGVzdC5TOjU1NTogRXJyb3I6IHVua25vd24gb3Bjb2RlICJic2VmaSIK
PiA+Cj4gPiBUaGlzIGlzIHRoZSBzYW1lIGVycm9yIHdlIHNlZSB3aGVuIHVzaW5nIHRoZSB6eW5x
bXAtcG11ZnctYnVpbGRlci4KPiA+Cj4gPiBJIHdpbGwgZ28gdGhyb3VnaCB0aGUgZ2NjIHBhdGNo
IHNldC4gIFBlcmhhcHMgaW5zdGVhZCBvZiBhcHBseWluZyBhbGwKPiA+IHBhdGNoZXMsIEkganVz
dCBsb29rIGZvciB0aGUgb25lIHRoYXQgZml4ZXMgdGhlIGFib3ZlIGlzc3VlIGFuZCBhcHBseSB0
aGF0Lgo+ID4gIAo+IAo+ID4gTm90ZSB0aGF0IHRoZSBtaWNyb2JsYXplIHRvb2xjaGFpbiBidWls
ZCBpbiBZb2N0byB3aGVyZSB0aGVzZSBwYXRjaGVzIGFyZSBjb21pbmcgZnJvbSwgaXMgYSBtdWx0
aWxpYiBjb25maWd1cmF0aW9uIHRvIHN1cHBvcnQgZGlmZmVyZW50IG1pY3JvYmxhemUgY29uZmln
dXJhdGlvbnMuIEFzIHRoZSBnb2FsIG9mIHRoaXMgcGFja2FnZSBpcyB0byBidWlsZCBqdXN0IGEg
dG9vbGNoYWluIGZvciB0aGUgUE1VIChhbmQgUE1DIGluIFZlcnNhbCkgdGhlcmUgaXMgbm8gbmVl
ZCBmb3IgbXVsdGlsaWIgY29uZmlndXJhdGlvbiBhbmQgbmVpdGhlciBmb3Igc29tZSBvZiB0aGVz
ZSBwYXRjaGVzIChpLmUuIDY0Yml0IGFyY2hpdGVjdHVyZSkuIFRoZSB0cmlja3kgcG9pbnQgaXMg
dG8gZmlndXJlIG91dCB3aGljaCBvbmVzIGFyZSByZWFsbHkgbmVlZGVkIGZvciB0aGlzIHVzZSBj
YXNlIPCfmIogIAo+IAo+IEkgdHJpZWQgY2hlcnJ5LXBpY2tpbmcgdGhlIHBhdGNoZXMgbmVlZGVk
IGZvciB0aGUgYnNpZmkgYW5kIGJzZWZpIGluc3RydWN0aW9ucy4gIFVuZm9ydHVuYXRlbHksIGJv
dGggdGhlIGJpbnV0aWxzIGFuZCBnY2MgcGF0Y2ggc2V0cyBpbmNsdWRlIG1hbnkgbW9kaWZpY2F0
aW9ucyBvZiB0aGUgc2FtZSBzb3VyY2UgZmlsZXMuCj4gCj4gRm9yIGV4YW1wbGUsIGlmIEkgb25s
eSBhcHBseSB0aGUgZ2NjIHBhdGNoIDAwMjQtUGF0Y2gtTWljcm9CbGF6ZS10aGlzLXBhdGNoLWhh
cy0xLkZpeGVkLXRoZS1idWctaW4ucGF0Y2ggdGhhdCBhZGRzIHRoZSBic2lmaSBhbmQgYnNlZmkg
ZnVuY3Rpb25hbGl0eSwgaXQgY2Fubm90IGFwcGx5IHVubGVzcyBJIGhhdmUgc2V2ZXJhbCBwcm9j
ZWVkaW5nIHBhdGNoZXMgaW5jbHVkZWQgdG9vLiAgQW5kIHRoZW4gd2hlbiBJIG9ubHkgaW5jbHVk
ZSB0aGUgcGF0Y2hlcyBuZWVkZWQgZm9yIGFwcGx5aW5nIHRoaXMgdXBkYXRlLCBnY2MgZG9lcyBu
b3QgYnVpbGQgcHJvcGVybHkgdW5sZXNzIEkgaW5jbHVkZSBldmVuIG1vcmUgcGF0Y2hlcy4KPiAK
PiBUaGUgb25seSB3YXkgSSBjYW4gZWFzaWx5IGZpbmQgZm9yIGFkZGluZyB0aGUgcGF0Y2hlcyBm
b3IgdGhlIGJzaWZpIGFuZCBic2VmaSBpbnN0cnVjdGlvbnMgaXMgdG8ganVzdCBpbmNsdWRlIHRo
ZSBmdWxsIHNldCBvZiA1NCBwYXRjaGVzLiAgV2hlbiBJIGRvIHRoaXMsIEkgY2FuIGJ1aWxkIGdj
YyBhbmQgdGhlIHp5bnFtcCBwbXVmdyB3aXRob3V0IGVycm9ycy4KPiAKPiBTaW5jZSBwYXRjaGVz
IGFyZSByZXF1aXJlZCBpbiBib3RoIHRoZSBiaW51dGlscyBzZXQgYW5kIHRoZSBnY2Mgc2V0LCBJ
IHRoaW5rIHRoZSBlYXNpZXN0IHNvbHV0aW9uIGZvciB1cyBpcyB0byBqdXN0IHRha2UgdGhlIGZ1
bGwgcGF0Y2ggc2V0IGZvciBlYWNoIHRoYXQgeW9jdG8gaXMgdXNpbmcuCj4gCj4gSSBkbyBub3Qg
YmVsaWV2ZSB0aGVyZSBpcyBjdXJyZW50bHkgYW55IG9yZ2FuaXplZCBlZmZvcnQgdG8gdXBzdHJl
YW0gYW55IG9mIHRoZXNlIHBhdGNoZXMsIGJ1dCBldmVyeSBBTUQgWGlsaW54IHNvZnR3YXJlIHJl
bGVhc2Ugd2lsbCBpbmNsdWRlIGEgbWljcm9ibGF6ZSBjb21waWxlciB3aXRoIGEgcGF0Y2ggc2V0
IHRoYXQgd2UgY2FuIGFwcGx5LiAgVG8ga2VlcCBtYWludGVuYW5jZSBvZiBhbGwgdGhpcyBhcyBl
YXN5IGFzIHBvc3NpYmxlLCBJIGJlbGlldmUgdGhlIGJlc3Qgc29sdXRpb24gaXMgdG8ganVzdCBh
cHBseSB0aGUgZnVsbCBwYXRjaCBzZXQgZm9yIGJpbnV0aWxzIGFuZCBnY2MgZXZlcnkgdGltZS4K
PiAKPiBJcyB0aGlzIG9rIGZvciBib3RoIG9mIHlvdT8KCkknbSBPSyB3aXRoIHRoZSB3aG9sZSBh
cHByb2FjaCwgZXhjZXB0IGZvciB0aGUgc2VudGVuY2UgIkkgZG8gbm90CmJlbGlldmUgdGhlcmUg
aXMgY3VycmVudGx5IGFueSBvcmdhbml6ZWQgZWZmb3J0IHRvIHVwc3RyZWFtIGFueSBvZgp0aGVz
ZSBwYXRjaGVzIi4uLiB3aGljaCBpcyBwcm9iYWJseSBhbHJlYWR5IGNsZWFyIHRvIHRoZSByZWNp
cGllbnRzCm9mIHRoaXMgbWVzc2FnZSwgYW5kIHRodXMgaXMgbm90IGdvaW5nIHRvIGJlIHNvbHZl
ZCBpbiB0aGlzIHRocmVhZCwKaG93ZXZlciBJIGp1c3Qgd2FudCB0byBiZSBzdXJlIG15IHBvc2l0
aW9uIGlzIGNsZWFyLiBJJ2QgYWxzbyBsaWtlIHRvCnN0cmVzcyB0aGF0IEkgYXBwcmVjaWF0ZSBh
IGxvdCB0aGUgd29yayB5b3UgYXJlIGRvaW5nIHRvIHByb3Blcmx5CnN1cHBvcnQgdGhlIHBtdWZ3
IGluIEJ1aWxkcm9vdC4gVGhhbmtzIQoKTHVjYQoKLS0gCkx1Y2EgQ2VyZXNvbGksIEJvb3RsaW4K
RW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
