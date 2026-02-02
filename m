Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 618ABE7DEF7
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 15:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E4F5816E2;
	Mon,  2 Feb 2026 15:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMK6R-Abh9Yi; Mon,  2 Feb 2026 15:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D19A8176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770047001;
	bh=3mDvA2Pug2PXMHmy4WwGuruc1GdokX8qcApEosHmkgo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fAHhgn94T8tQl87ysoiRyUzvcKbm+hK0aeYW1aqSDLG5Hbmy5GLlChSPbNWZafZ65
	 SKjKhHWPzvacuoFpr+FV3tLHP9ZB3AdEonBrnoK/MSu5HUIzJlXqY0E5R2evihTbbg
	 crnrJQ34IV1ryeU4plc4lldBw8ooGzzolibpQER+vVhKpJfz4nU/8jyhUWQryvrUE1
	 NJPaf/BiT12YvhRCNI7FOrF3cmj4UWcK4ivdRSLaZRrAkADIeNwubemUYzMaetSyvu
	 yDzJvSAKDWoveMahlw6xBLU66oQgbzdyeZAme4ELcL36vNourda/xllhHMP2mcR8Vi
	 6yi8zuuGCtc5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D19A8176D;
	Mon,  2 Feb 2026 15:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B87761E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B1CD60DD8
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu0kh97QMetv for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 15:43:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C55F060DEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C55F060DEF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C55F060DEF
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 15:43:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 03F876013E;
 Mon,  2 Feb 2026 16:43:12 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:35538])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 02 Feb 2026 16:43:12 +0100
MIME-Version: 1.0
Date: Mon, 02 Feb 2026 16:43:12 +0100
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250921125422.7944-2-vincent.stehle@laposte.net>
References: <20250921125422.7944-1-vincent.stehle@laposte.net>
 <20250921125422.7944-2-vincent.stehle@laposte.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <db5e12d3db137115080bc69c9fe1d728@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770046996;
 bh=5YcWwNCELn2p2bDNjPsBn4QS3Denxoutvi0KCuhPXyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rgObmpdmDZgeuo30RNT4sZUji7wscbLlreBAC58OJFBtktCtb7uJBRbRFt6ZOpQh3
 KLowTYYlt3yatqVMDaZOUbsyYwE6/iPSptFoc0UxN/IOdMd+BCyhugnwA+ZzqCvHhY
 CjNBli/sZyx/qogjv3mun2a/NzDu47CcFQZtepe3q/2MQc5vZbJCeg5cQUcTEeS6Sy
 Hm1fEjgMaTC5o4DRS57jMrMi7ZaI1YGBUKEyOpxosw9sRCSQPUiMate15qct7cXSVS
 Ry8BKfEoXbX7fo6KMAqfZonM1Ag+/S1KWk2o5ciYuyMwlPy8jJ4IEbdI+6qxQgrzDw
 FNWq2VWdmP+wQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rgObmpdm
Subject: Re: [Buildroot] [PATCH 1/6 v2] hppa: Add new architecture
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVmluY2VudCwgQWxsLAoKT24gMjEvMDkvMjAyNSAxNDo1NCwgVmluY2VudCBTdGVobMOpIHZp
YSBidWlsZHJvb3Qgd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIHRoZSBQcmVjaXNpb24gQXJjaGl0
ZWN0dXJlIChhLmsuYS4gUEEtUklTQyksCj4gYSAzMi1iaXQgYXJjaGl0ZWN0dXJlIGRldmVsb3Bl
ZCBieSBIZXdsZXR0IFBhY2thcmQuCj4gCj4gV2hpbGUgYXQgaXQsIGFkZCB0aGlzIGFyY2ggdG8g
bXlzZWxmIGluIERFVkVMT1BFUlMuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOp
IDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KPiBDYzogUm9tYWluIE5hb3VyIDxyb21haW4u
bmFvdXJAZ21haWwuY29tPgo+IENjOiBKdWxpZW4gT2xpdmFpbiA8anUub0BmcmVlLmZyPgoKU2Vy
aWVzIGFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpXZSBkaXNjdXNzZWQgYWJvdXQgdGhpcyBz
ZXJpZXMgZHVyaW5nIHRoZSBCdWlsZHJvb3QgRGV2RGF5cyAyMDI2CmluIEJydXhlbHMuIE9uIG9u
ZSBoYW5kLCBldmVuIGlmIHRoaXMgSFBQQSBhcmNoaXRlY3R1cmUgaXMgb2xkLAppdCBpcyBzdGls
bCB3ZWxsIHN1cHBvcnRlZCB1cHN0cmVhbS4gU28gdGhlcmUgaXMgbm8gdGVjaG5pY2FsCnJlYXNv
bnMgdG8gZXhjbHVkZSB0aGlzIHNlcmllcy4gT24gdGhlIG90aGVyIGhhbmQsIHRoZSBCdWlsZHJv
b3QKcHJvamVjdCBkb2VzIG5vdCB0byBzcGVuZCB0b28gbXVjaCB0aW1lIHRvIHN1cHBvcnQgdGhp
cy4gT3VyIGJpZ2dlc3QKY29uY2VybiB3YXMgdGhlIGF1dG9idWlsZGVycywgZG9pbmcgcmFuZG9t
IGJ1aWxkcy4gSFBQQSBpcyBub3QgdGhlCm9ubHkgYXJjaGl0ZWN0dXJlIGluIHRoYXQgc2l0dWF0
aW9uIGluIEJ1aWxkcm9vdC4gU28gd2UgZGVjaWRlZCB3ZQp3aWxsIGZsYWcgdGhvc2UgYXJjaGl0
ZWN0dXJlcyBzbyB0aGV5IGNhbiBiZSBzZWxlY3RlZCBpbgphdXRvYnVpbGRlcnMgd2l0aCBhIGxv
d2VyIHByb2JhYmlsaXR5LiBXaXRoIHRoYXQsIHdlIHNob3VsZCBiZSBhYmxlCnRvIGZvY3VzIG9u
IHRoZSBtYWluc3RyZWFtIG9uZXMuCgpCZXN0IHJlZ2FyZHMsCgpKdWxpZW4uCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
