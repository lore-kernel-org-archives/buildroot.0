Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8B4C001DE
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 07:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF23440A47;
	Tue, 15 Aug 2023 07:23:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF23440A47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L6XfVHCLvXSj; Tue, 15 Aug 2023 07:23:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20BB8409AC;
	Tue, 15 Aug 2023 07:23:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20BB8409AC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03E3B1BF34F
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 07:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A70804038C
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 07:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A70804038C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0N-BOqGmSWU for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 07:23:14 +0000 (UTC)
X-Greylist: delayed 489 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 15 Aug 2023 07:23:14 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D5EB400D4
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D5EB400D4
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 07:23:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37F7F0Zn053975;
 Tue, 15 Aug 2023 02:15:00 -0500
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37F7F0WX038126
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Aug 2023 02:15:00 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 02:15:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 02:15:00 -0500
Received: from dasso (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37F7F0KK029304;
 Tue, 15 Aug 2023 02:15:00 -0500
Date: Tue, 15 Aug 2023 02:15:00 -0500
To: Bryce Johnson <bryce@redpinelabs.com>
Message-ID: <20230815071500.4lzfocp6p5clfnos@dasso>
References: <20230622160212.2063472-1-dannenberg@ti.com>
 <20230622160212.2063472-3-dannenberg@ti.com>
 <CADXxVSKn3-kg_-CEJaDPhvAA4vB8n22M+88m+eUO4ruOo32r1A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADXxVSKn3-kg_-CEJaDPhvAA4vB8n22M+88m+eUO4ruOo32r1A@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1692083700;
 bh=q/lk4sMcpdrAnmx2nUlVSRm8GabkNknZVK8oapxq2O4=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=fci85H0bglhLbH6hgsrQQ2iSeBywU1O4JgP8+LMCAUc1eMKFBv1XG032je0kfJsA6
 tgcP4x5pV/b2E2ENIVoK99AUzT34YKiMUC6n9oN2s+FN2zfi/EtNnYXMxxuiwhMdLW
 rEjzqPvRmTdiiDLspxOMpWUMYslG16i+S1CmPr38=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=fci85H0b
Subject: Re: [Buildroot] [PATCH v9 02/11] boot/ti-k3-image-gen: new package
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
Cc: Bryan Brattlof <bb@ti.com>, Andrew Davis <afd@ti.com>,
 Julien Olivain <ju.o@free.fr>, Xuanhao Shi <x-shi@ti.com>,
 buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQnJ5Y2UsIEFsbCwKZmlyc3QgSSB3YW50ZWQgdG8gc2F5IG15IGFwb2xvZ2llcyBmcm9tIHRo
ZSBsYWNrIG9mIHByb2dyZXNzIG9uIHVwZGF0aW5nCnRoaXMgc2VyaWVzLCB0aGUgdjkgcmV3b3Jr
IGdvdCBjYXVnaHQgdXAgaW4gbXkgc3VtbWVyIGJyZWFrLCBhbmQgdGhlbiBUSQpoYXMgc2luY2Ug
cmVsZWFzZWQgbmV3IFUtQm9vdCAyMDIzLjA0IGFuZCBLZXJuZWwgNi4xLWJhc2VkIFNES3MgZm9y
IHRoZQpBTTYyeC9BTTY0IGRldmljZXMgd2hpY2ggc2hvdWxkIG5vdyBiZSB0aGUgdXBkYXRlZCBn
b2FsIGZvciB0aGlzCnVwc3RyZWFtIGVmZm9ydC4gSW4gYWRkaXRpb24gdG8gbmV3ZXIgY29tcG9u
ZW50cyB0aGlzIHNob3VsZCBhY3R1YWxseQpoZWxwL3NpbXBsaWZ5IHNvbWUgb2YgdGhlIGJvb3Qg
aW1hZ2UgY3JlYXRpb24gYW5kIHNlY3VyZSBib290IHJlbGF0ZWQKIlRJIHF1aXJrcyIsIGZvciBl
eGFtcGxlIHdlJ2xsIG5vIGxvbmdlciBuZWVkIHRoZSB0aS1rMy1pbWFnZS1nZW4gYW5kCnRpLWNv
cmUtc2VjZGV2LWszIHBhY2thZ2VzICh5ZWV5ISkgYXMgdGhvc2UgaXRlbXMgd2lsbCBiZSB0YWtl
biBjYXJlIG9mCmJ5IFUtQm9vdCAodmlhIGJpbm1hbikuIEknbSBwbGFubmluZyBvbiBtYWtpbmcg
dGltZSB0byBwaWNrIHRoaXMgYmFjayB1cApvdmVyIHRoZSBuZXh0IGZldyB3ZWVrcyBhbmQgd29y
ayBvbiBhIHYxMCBzZXJpZXMgd2l0aCB0aG9zZSBjaGFuZ2VzIHBsdXMKYXBwbGljYWJsZSBmZWVk
YmFjayB0aGF0IHdhcyBwcm92aWRlZCBvbiB2OS4KCkFzIGZvciB5b3VyIGZlZWRiYWNrLCBzZWUg
YmVsb3cuLi4KCgpPbiBUdWUsIEF1ZyAwOCwgMjAyMyBhdCAwNDozODoxOFBNIC0wNzAwLCBCcnlj
ZSBKb2huc29uIHdyb3RlOgo+IEhpIEFuZHJlYXMgYW5kIGFsbCwKPiAKPiAKPiBPbiBUaHUsIEp1
biAyMiwgMjAyMyBhdCA5OjA14oCvQU0gQW5kcmVhcyBEYW5uZW5iZXJnIHZpYSBidWlsZHJvb3QK
PiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+ID4KPiA+IEZyb206IFh1YW5oYW8g
U2hpIDx4LXNoaUB0aS5jb20+Cj4gPgo+ID4gVGhpcyBpcyB0aGUgaW1hZ2UgZ2VuZXJhdG9yIHRo
YXQgYnVpbGRzIHRoZSBpbml0aWFsIGJvb3QgYmluYXJ5LAo+ID4gdGlib290My5iaW4sIGZvciB0
aGUgUjUgY29yZSBvbiBUSSdzIEszIGZhbWlseSBvZiBkZXZpY2VzLgo+ID4gVGhpcyByZXF1aXJl
cyB0aGUgUjUgU1BMIG91dHB1dCBmcm9tIHRoZSB0aS1rMy1yNS1sb2FkZXIgcGFja2FnZS4KPiA+
Cj4gPiBodHRwczovL2dpdC50aS5jb20vY2dpdC9rMy1pbWFnZS1nZW4vazMtaW1hZ2UtZ2VuCj4g
Cj4gSSB3YXMgYWJsZSB0byBidWlsZCB3aXRoIHlvdXIgcGF0Y2hzZXQgZm9yIGFtNjJ4X3NrX2Rl
ZmNvbmZpZyBhcwo+IGluY2x1ZGVkLiAgSSBhdHRlbXB0ZWQgdG8gZG8gYSByZXByb2R1Y2libGUg
YW5kIHBlcl9wYWNrYWdlIHBhcmFsbGVsCj4gYnVpbGQgYW5kIHJhbiBpbnRvIGFuIGVycm9yLiAg
V2UgdGVuZCB0byB1c2UgdGhhdCBmb3IgYnVpbGRzIGJlY2F1c2UKPiBpdCBpcyBzaWduaWZpY2Fu
dGx5IGZhc3RlciBidWlsZCB0aW1lcyBlc3BlY2lhbGx5IG9uIGEgZGVkaWNhdGVkCj4gc2VydmVy
Lgo+IAo+IEFkZGluZyB0byB0aGUgZGVmY29uZmlnOgo+IEJSMl9SRVBST0RVQ0lCTEU9eQo+IEJS
Ml9QRVJfUEFDS0FHRV9ESVJFQ1RPUklFUz15CgpHb29kIGZpbmQsIEknbGwgZXhwZXJpbWVudCB3
aXRoIHRoaXMgaW4gdGhlIGNvbnRleHQgb2YgdjEwIGFuZCBzZWUgaG93CnRoaXMgYmVoYXZpb3Ig
Y2FuIGJlIGltcHJvdmVkLgoKLS0KQW5kcmVhcyBEYW5uZW5iZXJnClRleGFzIEluc3RydW1lbnRz
IEluYwoKPiAKPiAgYW5kIEkgd2FzIHJ1bm5pbmcgaW4gdG8gdGhlIGJlbG93IGVycm9yOgo+IAo+
ID4+PiB0aS1rMy1pbWFnZS1nZW4gMDguMDYuMDAuMDA3IEluc3RhbGxpbmcgdG8gaW1hZ2VzIGRp
cmVjdG9yeQo+IGNwIC9idWlsZF9kYXRhL2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRwdXQvYnVp
bGQvdGktazMtaW1hZ2UtZ2VuLTA4LjA2LjAwLjAwNy90aWJvb3QzLmJpbgo+IC9idWlsZF9kYXRh
L2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRwdXQvaW1hZ2VzCj4gWzE5LzMwXSBDb21waWxpbmcg
QyBvYmplY3QKPiBzcmMvbGlid2F5bGFuZC1zZXJ2ZXIuc28uMC4yMS4wLnAvd2F5bGFuZC1zaG0u
Yy5vbWFrZVs1XTogTGVhdmluZwo+IGRpcmVjdG9yeSAnL2J1aWxkX2RhdGEvam9obnNvbmIvYnVp
bGRyb290X3RpL291dHB1dC9idWlsZC91dGlsLWxpbnV4LWxpYnMtMi4zOCcKPiBtYWtlWzRdOiBM
ZWF2aW5nIGRpcmVjdG9yeQo+ICcvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0
cHV0L2J1aWxkL3V0aWwtbGludXgtbGlicy0yLjM4Jwo+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0
b3J5Cj4gJy9idWlsZF9kYXRhL2pvaG5zb25iL2J1aWxkcm9vdF90aS9vdXRwdXQvYnVpbGQvdXRp
bC1saW51eC1saWJzLTIuMzgnCj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkKPiAnL2J1aWxk
X2RhdGEvam9obnNvbmIvYnVpbGRyb290X3RpL291dHB1dC9idWlsZC91dGlsLWxpbnV4LWxpYnMt
Mi4zOCcKPiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeQo+ICcvYnVpbGRfZGF0YS9qb2huc29u
Yi9idWlsZHJvb3RfdGkvb3V0cHV0L2J1aWxkL3V0aWwtbGludXgtbGlicy0yLjM4Jwo+IGNwOiBj
YW5ub3Qgc3RhdAo+ICcvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0cHV0L2J1
aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcvdGlib290My5iaW4nOgo+IE5vIHN1Y2gg
ZmlsZSBvciBkaXJlY3RvcnkKPiBwYWNrYWdlL3BrZy1nZW5lcmljLm1rOjM3MTogcmVjaXBlIGZv
ciB0YXJnZXQKPiAnL2J1aWxkX2RhdGEvam9obnNvbmIvYnVpbGRyb290X3RpL291dHB1dC9idWls
ZC90aS1rMy1pbWFnZS1nZW4tMDguMDYuMDAuMDA3Ly5zdGFtcF9pbWFnZXNfaW5zdGFsbGVkJwo+
IGZhaWxlZAo+IG1ha2U6ICoqKiBbL2J1aWxkX2RhdGEvam9obnNvbmIvYnVpbGRyb290X3RpL291
dHB1dC9idWlsZC90aS1rMy1pbWFnZS1nZW4tMDguMDYuMDAuMDA3Ly5zdGFtcF9pbWFnZXNfaW5z
dGFsbGVkXQo+IEVycm9yIDEKPiBtYWtlOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2Jz
Li4uLgo+IAo+IAo+IAo+IEkgY2FuIHNlZSB0aGF0IGZpbGUgbG9jYXRlZCB0aGVyZToKPiBscyAt
YWwgL2J1aWxkX2RhdGEvam9obnNvbmIvYnVpbGRyb290X3RpL291dHB1dC9idWlsZC90aS1rMy1p
bWFnZS1nZW4tMDguMDYuMDAuMDA3L3RpYm9vdDMuYmluCj4gbHJ3eHJ3eHJ3eCAxIGpvaG5zb25i
IHVzZXJzIDEwMyBBdWcgIDggMTg6MTgKPiAvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3Rf
dGkvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcvdGlib290My5iaW4K
PiAtPiAvYnVpbGRfZGF0YS9qb2huc29uYi9idWlsZHJvb3RfdGkvb3V0cHV0L2J1aWxkL3RpLWsz
LWltYWdlLWdlbi0wOC4wNi4wMC4wMDcvdGlib290My1hbTYyeC1ocy1mcy1ldm0uYmluCj4gCj4g
TWlnaHQgYmUgc29tZXRoaW5nIG91dCBvZiBvcmRlciBvciBhIG1pc3NpbmcgZGVwZW5kZW5jeS4g
IEkgZGlkbid0IGRpZwo+IGludG8gaXQgdG9vIGZhciwgYnV0IEkgdGhvdWdodCBJIHdvdWxkIGxl
dCB5b3Uga25vdy4KPiAKPiBCcnljZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
