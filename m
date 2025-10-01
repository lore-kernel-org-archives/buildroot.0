Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98967CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 16:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC226128D;
	Wed,  1 Oct 2025 16:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBsMKrUDDuF1; Wed,  1 Oct 2025 16:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 526F461281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 526F461281;
	Wed,  1 Oct 2025 16:03:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7C022A6
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A92C741275
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1dgqi31fQiew for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 16:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0EF541272
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0EF541272
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0EF541272
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 16:03:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id EC63D4E40E67;
 Wed,  1 Oct 2025 16:03:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AA8A0606BF;
 Wed,  1 Oct 2025 16:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 39EDF102F1870; 
 Wed,  1 Oct 2025 18:02:58 +0200 (CEST)
Date: Wed, 1 Oct 2025 18:02:56 +0200
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: buildroot@buildroot.org, Etienne Carriere
 <etienne.carriere@foss.st.com>, Alistair Francis <alistair@alistair23.me>,
 Dick Olsson <hi@senzilla.io>, Sergey Matyukevich <geomatsi@gmail.com>,
 Simon Dawson <spdawson@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Message-ID: <20251001180256.1de20ac4@kmaincent-XPS-13-7390>
In-Reply-To: <fb085f40-4394-4870-996a-515af302fe39@grenoble.cnrs.fr>
References: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
 <20251001-fix_license-v2-7-bf18911c835d@bootlin.com>
 <fb085f40-4394-4870-996a-515af302fe39@grenoble.cnrs.fr>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759334594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oM0AtpYUHfXEuxl1/8uQaTAorMA8J89lFrDpJOHsgns=;
 b=KJ0ddIXrC+2xVwr9xTZ6uluN5SMiVNlBDXOcCa3ZYNZ/MkMZ6LTrx1Wm/8aocqMSxQ5y7l
 UtCt4WkMofv/CRaEtBvuCDz6mutqfWf/U5DZfx429vBt2Hhm/yXGntjqEs3VoV3OsSyuV5
 +qNsRLEHXEr8KdPl3grenXJPPMDtbfOG0mFYUan1UC68vOg7C86EEq85gIa+BGC9ldh819
 nRK7zVrPAiA9PZ/M0otHbjNlkY7NrTF31K2ca/sOsOFEl2Hbi5M1r14uwIEr/us5mfwIfm
 E6I/KsphJNUytqxJ8H4zY16ItdSY+n2YiPJHUHe6UNZwhDlRTJHG0ENrwCGTKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=KJ0ddIXr
Subject: Re: [Buildroot] [PATCH v2 7/7] at91bootstrap3: Add support for
 custom license files
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAxIE9jdCAyMDI1IDE3OjQ0OjI2ICswMjAwCkVkZ2FyIEJvbmV0IDxib25ldEBncmVu
b2JsZS5jbnJzLmZyPiB3cm90ZToKCj4gSGVsbG8gZXZlcnlib2R5IQo+IAo+IE9uIDAxLzEwLzIw
MjUsIEtvcnkgTWFpbmNlbnQgd3JvdGU6Cj4gPiBUaGUgQVQ5MUJvb3RzdHJhcDMgcGFja2FnZSB3
YXMgbm90IHByb3ZpZGluZyBhbnkgbGljZW5zZSBmaWxlIHdoZW4gYSBjdXN0b20KPiA+IExpbnV4
IHZlcnNpb24gd2FzIHNlbGVjdGVkLgo+ID4gCj4gPiBGaXggdGhpcyBieSBhZGRpbmcgYSBLY29u
ZmlnIG9wdGlvbiB0byBzcGVjaWZ5IHRoZSBsaWNlbnNlIGZpbGUsCj4gPiB3aXRoIGEgZGVmYXVs
dCB2YWx1ZSBzZXQgdG8gdGhlIGNvbW1vbmx5IHVzZWQgbGljZW5zZSBwYXRocy4KPiA+IAo+ID4g
U2lnbmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4K
PiA+IC0tLQo+ID4gCj4gPiBDaGFuZ2UgaW4gdjI6Cj4gPiAtIERvIG5vdCBzaG93IGxpY2Vuc2Ug
b3B0aW9uIGlmIGl0IGlzIG5vdCBhIGN1c3RvbSByZXBvCj4gPiAtLS0KPiA+ICBib290L2F0OTFi
b290c3RyYXAzL0NvbmZpZy5pbiAgICAgICAgIHwgMTkgKysrKysrKysrKysrKysrKysrKwo+ID4g
IGJvb3QvYXQ5MWJvb3RzdHJhcDMvYXQ5MWJvb3RzdHJhcDMubWsgfCAgMyArKy0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluIGIvYm9vdC9hdDkxYm9vdHN0
cmFwMy9Db25maWcuaW4KPiA+IGluZGV4Cj4gPiAzNWJkYjI4MTYyYmVkYTk1NmZmNGZmZDE3Nzcy
YjQ5MWJmNWY1Y2EwLi45ODdiNWViN2VmZDNkODQ1ODY1ZDM0YWZhY2E0ZjM1YWU1ZTg4ZjgwCj4g
PiAxMDA2NDQgLS0tIGEvYm9vdC9hdDkxYm9vdHN0cmFwMy9Db25maWcuaW4gKysrCj4gPiBiL2Jv
b3QvYXQ5MWJvb3RzdHJhcDMvQ29uZmlnLmluIEBAIC02Niw2ICs2NiwyNSBAQCBjb25maWcKPiA+
IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfVkVSU0lPTiBpZiBCUjJfVEFSR0VUX0FUOTFCT09U
U1RSQVAzX0NVU1RPTV9HSVQKPiA+IHx8IEJSMl9UQVJHRVRfQVQ5MUJPT1RTVFJBUDNfQ1VTVE9N
X1NWTiBkZWZhdWx0ICJjdXN0b20iCWlmCj4gPiBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NV
U1RPTV9UQVJCQUxMIAo+ID4gK2NvbmZpZyBCUjJfVEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RP
TV9MSUNFTlNFX0ZJTEVTCj4gPiArCXN0cmluZyAiQVQ5MUJvb3RzdHJhcDMgbGljZW5zZSBmaWxl
cyIKPiA+ICsJZGVmYXVsdCAiTElDRU5TRVMvTUlULnR4dCIKPiA+ICsJZGVwZW5kcyBvbiBCUjJf
VEFSR0VUX0FUOTFCT09UU1RSQVAzX0NVU1RPTV9HSVQgfHwgXAo+ID4gKwkJICAgQlIyX1RBUkdF
VF9BVDkxQk9PVFNUUkFQM19DVVNUT01fU1ZOIHx8IFwKPiA+ICsJCSAgIEJSMl9UQVJHRVRfQVQ5
MUJPT1RTVFJBUDNfQ1VTVE9NX1RBUkJBTEwKPiA+ICsJaGVscAo+ID4gKwkgIEEgc3BhY2Utc2Vw
YXJhdGVkIGxpc3Qgb2YgbGljZW5zZSBmaWxlcyByZWxhdGVkIHRvIHRoZQo+ID4gKwkgIEFUOTFC
b290c3RyYXAzIGtlcm5lbCBwYWNrYWdlLiAgCj4gCj4gcy9rZXJuZWwgcGFja2FnZS9wYWNrYWdl
LwoKT29wcyBpbmRlZWQsIHRoYW5rcy4KClJlZ2FyZHMKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290
bGluCkVtYmVkZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGlu
LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
