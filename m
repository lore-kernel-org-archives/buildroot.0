Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B0DFEDA1A
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 20:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085E7415E9;
	Tue, 17 Mar 2026 20:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ER7aAQla5kx3; Tue, 17 Mar 2026 20:13:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34581415EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773778431;
	bh=25MTW2he0TpLgKjsFnSaXLBLFgS00WVZTUvPfj+lCIo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=dfvSUmI4n2t1MQIiTBOjsk5vWDGJ+c42kv2daplGPoqM6xc3233MKdtdnnoh7nUf/
	 spwAA/SLUVV+ACXCQXK02XYHqJ1WLszvkZ5fZBkzyURPfmDmx194TIBuOy+jBomCBt
	 /LMEaW9L4WsxymBnxvZFv2YQApqC/P/aLL6Lyp0ACgaza8EU63mP1kV3ypG9H4xlbu
	 2TW9BN12n63gQKT1ns6iqu0f1vSl54UqDFQ8H/GaAY+YUwLW54GotyZumr/tt69xaD
	 u/6H9+l8c30D+FwAgRANpmvKBxT2RORh/+acjRFZ5kjawToNPRrnm/mE9rEf79QYDi
	 dFLbkd9oyj90w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34581415EF;
	Tue, 17 Mar 2026 20:13:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4F411B6;
 Tue, 17 Mar 2026 20:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C643361425;
 Tue, 17 Mar 2026 20:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSch1IcObLp5; Tue, 17 Mar 2026 20:13:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8FA12605D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FA12605D4
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FA12605D4;
 Tue, 17 Mar 2026 20:13:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14EFFB97B861; Tue, 17 Mar 2026 21:13:44 +0100 (CET)
Message-ID: <124c21a6-5810-495e-8b85-f3db41afa1a9@rnout.be>
Date: Tue, 17 Mar 2026 21:13:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot-lts-sponsors@buildroot.org, buildroot-users@buildroot.org,
 buildroot@buildroot.org
References: <20260317201059.778898-1-arnout@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260317201059.778898-1-arnout@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1773778425; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=yo20NLj5B51CxzwBJMc/Hr+kWYwpmoVEMlk/GCdmM9Y=;
 b=OQK20ftTCJCBY7va31VK18rz8JK9KDCtCuyRN035+1CA8Fp7qxpU4Ts0TGs0tunpIHNoD1
 0rNhpJRK3O6hso7UR/z1xJVlg6adoQNtOcymFbwSlu53VaoT7bq7dp7v7y7ZatP3nwk4JG
 2R/BV0WACvFt0/TE8vxio1T1Y9ASZCD2gnwmnaEoOxEwtp4j4lz/aMKFg4mdBWDp+xUfrM
 2eBqfoGbHEmJue1IR+PBbNC79MyKGsXivvBbKnTwUG2G48RZKD+yBplZC8SxVCeruVUwgK
 ZPx9ccQXmkgk12JujEJ8q1lhX/UxAIiztUWwm6LbaR30mOOCEL60YxtnBQFhGw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=OQK20ftT
Subject: Re: [Buildroot] Buildroot 2025.11.3 released
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBJIGZvcmdvdCB0byBtZW50aW9uOiB0aGlzIHdpbGwgYmUgdGhlIGxhc3QgcmVsZWFzZSBvZiB0
aGUgMjAyNS4xMS54IHNlcmllcy4gClRoZSBuZXh0IGJhdGNoIG9mIHJlbGVhc2VzIHdpbGwgaGF2
ZSAyMDI2LjAyLjEuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgpPbiAxNy8wMy8yMDI2IDIxOjEwLCBB
cm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiBIaSwKPiAKPiBCdWlsZHJvb3QgaXMgYSBzaW1w
bGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1iZWRkZWQgTGludXggc3lzdGVtcwo+ICho
dHRwczovL2J1aWxkcm9vdC5vcmcpLgo+IAo+IEJ1aWxkcm9vdCAyMDI1LjExLjMgaXMgcmVsZWFz
ZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKPiAKPiBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxv
YWRzL2J1aWxkcm9vdC0yMDI1LjExLjMudGFyLmd6Cj4gCj4gb3IKPiAKPiBodHRwczovL2J1aWxk
cm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI1LjExLjMudGFyLnh6Cj4gCj4gT3IgZ2V0
IGl0IGZyb20gR2l0Ogo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC5naXQgKDIwMjUuMTEuMyB0YWcpCj4gCj4gQnVpbGRyb290IDIwMjUuMTEuMyBpcyBhIGJ1
Z2ZpeCByZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIgb2YgaW1wb3J0YW50IC8KPiBzZWN1cml0eSBy
ZWxhdGVkIGlzc3VlcyBkaXNjb3ZlcmVkIHNpbmNlIHRoZSAyMDI1LjExLjIgcmVsZWFzZS4KPiAK
PiAKPiBJbXBvcnRhbnQgLyBzZWN1cml0eSByZWxhdGVkIGZpeGVzOgo+IAo+IGJvdGFuOiBDVkUt
MjAyNC01MDM4MiwgQ1ZFLTIwMjQtNTAzODMKPiBjLWFyZXM6IENWRS0yMDI1LTYyNDA4Cj4gICAg
ICAgICAgY2xhbWF2OiBDVkUtMjAyNi0yMDAzMQo+IGNvbnRhaW5lcmQ6IENWRS0yMDI0LTI1NjIx
LCBDVkUtMjAyNC00MDYzNSwgQ1ZFLTIwMjUtNDcyOTEsCj4gICAgQ1ZFLTIwMjUtNjQzMjkKPiBj
dXBzOiBDVkUtMjAyNS01ODQzNiwgQ1ZFLTIwMjUtNjE5MTUKPiBleGl2MjogQ1ZFLTIwMjYtMjU4
ODQsIENWRS0yMDI2LTI3NTk2LCBDVkUtMjAyNi0yNzYzMQo+IGZsdWlkc3ludGg6IENWRS0yMDI1
LTU2MjI1Cj4gZnJlZXJkcDogQ1ZFLTIwMjQtMzI2NjEsIENWRS0yMDI2LTIzNTMwLCBDVkUtMjAy
Ni0yMzUzMSwKPiAgICBDVkUtMjAyNi0yMzUzMiwgQ1ZFLTIwMjYtMjM1MzMsIENWRS0yMDI2LTIz
NTM0LCBDVkUtMjAyNi0yMzk0OCwKPiAgICBDVkUtMjAyNi0yNDY3NSwgQ1ZFLTIwMjYtMjQ2NzYs
IENWRS0yMDI2LTI0Njc5LCBDVkUtMjAyNi0yNDY4MSwKPiAgICBDVkUtMjAyNi0yNDY4MiwgQ1ZF
LTIwMjYtMjQ2ODMKPiBmcmVldHlwZTogQ1ZFLTIwMjYtMjM4NjUKPiBncmFwaGljc21hZ2ljaywg
Q1ZFLTIwMjUtMjc3OTYKPiBpZ21wcHJveHk6IENWRS0yMDI1LTUwNjgxCj4gaW1hZ2VtYWdpY2s6
IENWRS0yMDI2LTIyNzcwLCBDVkUtMjAyNi0yMzg3NCwgQ1ZFLTIwMjYtMjM4NzYsCj4gICAgQ1ZF
LTIwMjYtMjQ0ODEsIENWRS0yMDI2LTI1NjM4LCBDVkUtMjAyNi0yNTc5NCwgQ1ZFLTIwMjYtMjU3
OTUsCj4gICAgQ1ZFLTIwMjYtMjU3OTYsIENWRS0yMDI2LTI1Nzk4LCBDVkUtMjAyNi0yNTc5OSwg
Q1ZFLTIwMjYtMjU4OTcsCj4gICAgQ1ZFLTIwMjYtMjU5ODksIENWRS0yMDI2LTI2MDY2LCBDVkUt
MjAyNi0yNjI4MywgQ1ZFLTIwMjYtMjYyODQsCj4gICAgQ1ZFLTIwMjYtMjY5ODMKPiBqYXNwZXI6
IENWRS0yMDI1LTg4MzYsIENWRS0yMDI1LTg4MzcKPiBsaWJzb3VwMzogQ1ZFLTIwMjUtMTQ1MjMK
PiBsaWJzc2g6IENWRS0yMDI1LTE0ODIxLCBDVkUtMjAyNi0wOTY0LCBDVkUtMjAyNi0wOTY1LCBD
VkUtMjAyNi0wOTY2LAo+ICAgIENWRS0yMDI2LTA5NjcsIENWRS0yMDI2LTA5NjgKPiBsaWJ0cG1z
OiBDVkUtMjAyNi0yMTQ0NAo+IG11cGRmOiBDVkUtMjAyNi0yNTU1Ngo+IG5ldHNubXA6IENWRS0y
MDI1LTY4NjE1Cj4gcGF0Y2g6IENWRS0yMDE4LTY5NTIsIENWRS0yMDE5LTIwNjMzCj4gcG9zdGdy
ZXNxbDogQ1ZFLTIwMjYtMjAwMywgQ1ZFLTIwMjYtMjAwNCwgQ1ZFLTIwMjYtMjAwNSwgQ1ZFLTIw
MjYtMjAwNgo+IHB5dGhvbi1tdWx0aXBhcnQ6IENWRS0yMDI2LTI0NDg2Cj4gcnRsXzQzMzogQ1ZF
LTIwMjUtMzQ0NTAKPiBzcXVpZDogQ1ZFLTIwMjUtNjIxNjgKPiB0aW55cHJveHk6IENWRS0yMDI1
LTYzOTM4Cj4gdmltOiBDVkUtMjAyNi0yNTc0OSwgQ1ZFLTIwMjYtMjYyNjkKPiB3cGV3ZWJraXQ6
IENWRS0yMDI1LTMxMjczLCBDVkUtMjAyNS0zMTI3OCwgQ1ZFLTIwMjUtNDMyMTEsCj4gICAgQ1ZF
LTIwMjUtNDMyMTIsIENWRS0yMDI1LTQzMjE2LCBDVkUtMjAyNS00MzIyNywgQ1ZFLTIwMjUtNDMy
MjgsCj4gICAgQ1ZFLTIwMjUtNDMyNDAsIENWRS0yMDI1LTQzMjY1LCBDVkUtMjAyNS00MzI3Miwg
Q1ZFLTIwMjUtNDMzNDIsCj4gICAgQ1ZFLTIwMjUtNDMzNDMsIENWRS0yMDI1LTQzMzU2LCBDVkUt
MjAyNS00MzM2OCwgQ1ZFLTIwMjUtNjU1OAo+IAo+IEluZnJhc3RydWN0dXJlIHVwZGF0ZXMvZml4
ZXM6Cj4gCj4gbGludXg6IG1ha2UgbGljZW5zZSBvcHRpb24gdmlzaWJsZSBmb3IgX0NVU1RPTV9W
RVJTSU9OIGFzIHdlbGwKPiBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzOiBmaXggRGViaWFuIHRl
c3RpbmcvdW5zdGFibGUKPiAKPiBVcGRhdGVkIC8gZml4ZWQgcGFja2FnZXM6IGJvdGFuLCBjLWFy
ZXMsIGNsYW1hdiwgY29udGFpbmVyZCwgY3VwcywKPiAgICBkb2NrZXIsIGR0YywgZXhpdjIsIGZh
a2V0aW1lLCBmbGFzaGJlbmNoLCBmcmVlcmRwLCBmcmVldHlwZSwKPiAgICBncmFwaGljc21hZ2lj
aywgaWdtcHByb3h5LCBpbWFnZW1hZ2ljaywgamFzcGVyLCBsaWJzb3VwMywgbGlic3NoLAo+ICAg
IGxpYnRwbXMsIGxpYnZpcHMsIGxpYnZpcnQsIGxpYnpsaWIsIG1waXIsIG11cGRmLCBuZXRzbm1w
LCBwYXRjaCwgcG9jbywKPiAgICBwb3N0Z3Jlc3FsLCBweXRob24zLCBweXRob24tbXVsdGlwYXJ0
LCBxZW11LCBydGxfNDMzLCBzYW1iYTQsIHNub3J0LAo+ICAgIHNxdWlkLCB0aW55cHJveHksIHV0
aWwtbGludXgsIHZpbSwgd2Via2l0Z3RrLCB3aXJlc2hhcmssIHdtY3RybCwKPiAgICB3cGV3ZWJr
aXQKPiAKPiBSZW1vdmVkIHBhY2thZ2VzOiBxZW11IChjcmlzIHRhcmdldCksIHB5dGhvbjMgKG9z
c2F1ZGlvZGV2KQo+IAo+IAo+IEZvciBtb3JlIGRldGFpbHMsIHNlZSB0aGUgQ0hBTkdFUyBmaWxl
Ogo+IAo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2Iv
MjAyNS4xMS4zL0NIQU5HRVMKPiAKPiBVc2VycyBvZiB0aGUgYWZmZWN0ZWQgcGFja2FnZXMgYXJl
IHN0cm9uZ2x5IGVuY291cmFnZWQgdG8gdXBncmFkZS4KPiAKPiBNYW55IHRoYW5rcyB0byBhbGwg
dGhlIHBlb3BsZSBjb250cmlidXRpbmcgdG8gdGhpcyByZWxlYXNlOgo+IAo+IGdpdCBzaG9ydGxv
ZyAtcyAtbiAyMDI1LjExLjIuLgo+IAo+ICAgICAgMjUJVGhvbWFzIFBlcmFsZQo+ICAgICAgMjAJ
QmVybmQgS3VobHMKPiAgICAgICA1CUFkcmlhbiBQZXJleiBkZSBDYXN0cm8KPiAgICAgICA1CVBl
dGVyIEtvcnNnYWFyZAo+ICAgICAgIDIJSnVsaWVuIE9saXZhaW4KPiAgICAgICAxCUFsZXhpcyBM
b3Rob3LDqQo+ICAgICAgIDEJQXJub3V0IFZhbmRlY2FwcGVsbGUKPiAgICAgICAxCURvd2FuIEd1
bGxpZW50Cj4gICAgICAgMQlNYXJ0aW4gQmFjaG1hbm4KPiAgICAgICAxCU1hcnRpbiBCYWNobWFu
biB2aWEgYnVpbGRyb290Cj4gICAgICAgMQlNYXR0aWFzIFdhbHN0csO2bQo+ICAgICAgIDEJU2h1
YmhhbSBDaGFrcmFib3J0eQo+IAo+IFJlZ2FyZHMsCj4gQXJub3V0CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
