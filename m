Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3219CA1005
	for <buildroot@archiver.kernel.org>; Tue,  2 Sep 2025 15:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B189660E08;
	Tue,  2 Sep 2025 15:12:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRkhtzQhcJCa; Tue,  2 Sep 2025 15:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9ED960DD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9ED960DD2;
	Tue,  2 Sep 2025 15:12:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F25F210E
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE98E407F6
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhynFMfUqFpi for <buildroot@buildroot.org>;
 Tue,  2 Sep 2025 15:12:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7FC7D40AAF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FC7D40AAF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FC7D40AAF
 for <buildroot@buildroot.org>; Tue,  2 Sep 2025 15:12:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9CA22C8EC69;
 Tue,  2 Sep 2025 15:11:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 933DA60695;
 Tue,  2 Sep 2025 15:11:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28B3F1C22DA13; 
 Tue,  2 Sep 2025 17:11:51 +0200 (CEST)
Date: Tue, 2 Sep 2025 17:11:44 +0200
To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: buildroot@buildroot.org, David Pierret <david.pierret@smile.fr>, Romain
 Naour <romain.naour@smile.fr>
Message-ID: <20250902171144.479f13a6@windsurf>
In-Reply-To: <cdae50eb-2553-4baf-ac3d-450838705c32@smile.fr>
References: <20250902134250.622347-1-elmehdi.younes@smile.fr>
 <20250902154936.1563f079@windsurf>
 <cdae50eb-2553-4baf-ac3d-450838705c32@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756825919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZalVQxoWQ4WdLpod491SlAcH+zlrmdVqKH7c52Yp5GQ=;
 b=U3am9tHDZPq+XJ/7GG3fWCVP2jTfB2pR2DbZv/BKt80oqCUptIW1fOIayC2/l8ES+3d+Do
 2g2ebEZmugMBNYWQgUpFgTbXakaHXDwgeNQarEisxExzC44p4sdVAiRRNZmhdI5blGaOvg
 nFUFYLBdiURKUVs3oUvGIhFCBI7ZyFKUsyeZvS4SXGHS238LUWpEhSUNJESzg8HZN25m8B
 lQ4VsIAQVqTQhJ8NbGh5O1zR+Vf8TaVW2KsKpUZ14V20aIKhe1ZN8NS/Spt8xjNPYTUFAP
 y9pb15EIIMV8fCcjRvCq4Rbl5Ct1BWl1cB32D6j4JGDb9gS58hlMtf4n4/WKfA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=U3am9tHD
Subject: Re: [Buildroot] [PATCH 1/1] package/bat: fix build with GCC 15
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyIFNlcCAyMDI1IDE2OjU2OjU5ICswMjAwCkVsIE1laGRpIFlPVU5FUyA8ZWxtZWhk
aS55b3VuZXNAc21pbGUuZnI+IHdyb3RlOgoKPiA+IFRoaXMgbGluayBkb2Vzbid0IG1ha2Ugc2Vu
c2UgYXMgaXQgY2FuIGNvbnRhaW4gZmFpbHVyZXMgdW5yZWxhdGVkIHRvCj4gPiB0aGlzIG9uZSwg
ZXNwZWNpYWxseSBpbiB0aGUgZnV0dXJlLiBZb3UgbmVlZCB0byBpbmNsdWRlIHRoZSBsaW5rIHRv
IG9uZQo+ID4gc3BlY2lmaWMgYnVpbGQgcmVzdWx0LiAgCj4gSSBjYW4gZml4IHRoaXMgaW4gYSB2
MiBpZiBuZWVkZWQuCgrwn5GN77iPCgo+ID4+ICtVcHN0cmVhbTogbm90IHN1Ym1pdHRlZCAgCj4g
PiBXaHk/ICAKPiAKPiBEbyB5b3UgbWVhbiB3aHkgd2UgYXJlIHN3aXRjaGluZyBmcm9tICdyZWdl
eC1vbmlnJyB0byAncmVnZXgtZmFuY3knLAo+IAo+IG9yIHdoeSB0aGUgcGF0Y2ggaGFzIG5vdCBi
ZWVuIHN1Ym1pdHRlZCB1cHN0cmVhbT8KCldoeSB0aGUgcGF0Y2ggd2FzIG5vdCBzdWJtaXR0ZWQg
dXBzdHJlYW0uCgo+IEluIHRoaXMgcGF0Y2gsIEkgc3dpdGNoZWQgdGhlIGZlYXR1cmUgZnJvbSAn
cmVnZXgtb25pZycgdG8gJ3JlZ2V4LWZhbmN5Jy4KPiBUaGlzIGRvZXMgbm90IGFmZmVjdCB2ZW5k
b3JpbmcgaW4gb3VyIGNhc2UsIHNpbmNlIHZlbmRvcmluZyBpcyBiYXNlZCBvbgo+IENhcmdvLmxv
Y2suIEluIHRoZSBjdXJyZW50IENhcmdvLmxvY2ssICdzeW50ZWN0JyBhbHJlYWR5IGxpc3RzIGJv
dGgKPiAnZmFuY3ktcmVnZXgnIGFuZCAnb25pZycgYXMgZGVwZW5kZW5jaWVzLiBUaGVyZWZvcmUs
IHRoZSBzZXQgb2YgY3JhdGVzCj4gaW5jbHVkZWQgaW4gdmVuZG9yaW5nIHJlbWFpbnMgZXhhY3Rs
eSB0aGUgc2FtZSBiZWZvcmUgYW5kIGFmdGVyIHRoZSBwYXRjaAo+IChJIHRlc3RlZCB0aGlzIGxv
Y2FsbHkpLgo+IAo+IFdoYXQgcmVhbGx5IGNoYW5nZXMgaXMgb25seSBhdCBjb21waWxlIHRpbWU6
IGFmdGVyIHRoZSBwYXRjaCwgQ2FyZ28gYnVpbGRzCj4gd2l0aCAnZmFuY3ktcmVnZXgnIGluc3Rl
YWQgb2YgJ29uaWcnLydvbmlnX3N5cycuCj4gCj4gRG8geW91IHRoaW5rIEkgc2hvdWxkIGF2b2lk
IHRoaXMgYXBwcm9hY2g/IElmIHNvLCBJIGNhbiBsb29rIGludG8gYW5vdGhlcgo+IHdheXMgdG8g
Zml4IHRoaXMKCkFhYWgsIG1ha2VzIHNlbnNlLiBJIHdhcyBub3QgYXdhcmUgb2YgdGhpcyBtZWNo
YW5pc20uIFNvdW5kcyBnb29kLgpDb3VsZCB5b3Ugc3VibWl0IGEgdjIgdG8gZml4IHRoZSBvdGhl
ciBtaW5vciBpc3N1ZXM/CgpUaGFua3MgYSBsb3QhCgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpv
bmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBl
bmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
