Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA9DC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 07:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2415605A9;
	Sun, 28 Jul 2024 07:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dc4AGOIvlTm9; Sun, 28 Jul 2024 07:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5640605F4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5640605F4;
	Sun, 28 Jul 2024 07:18:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AB301BF32E
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28286403CA
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 07:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CRbLHYQC9lL8 for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 07:18:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF4FA403BE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF4FA403BE
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF4FA403BE
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 07:17:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9EA1C0003;
 Sun, 28 Jul 2024 07:17:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sXyAF-0020cd-0Y;
 Sun, 28 Jul 2024 09:17:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
 <20240620110905.1205820-2-gero.schwaericke@grandcentrix.net>
 <20240710233014.16677ba1@windsurf>
Date: Sun, 28 Jul 2024 09:17:55 +0200
In-Reply-To: <20240710233014.16677ba1@windsurf> (Thomas Petazzoni via
 buildroot's message of "Wed, 10 Jul 2024 23:30:14 +0200")
Message-ID: <87a5i2x9wc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] board/ti/am62x-sk: update custom hashes
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
Cc: Xuanhao Shi <X15000177@gmail.com>,
 Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 Bryan Brattlof <bb@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlRob21hcyIgPT0gVGhvbWFzIFBldGF6em9uaSB2aWEgYnVpbGRyb290IDxidWlsZHJv
b3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gT24gVGh1LCAyMCBKdW4gMjAyNCAxMzowODoy
MCArMDIwMAogPiBHZXJvIFNjaHfDpHJpY2tlIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnPiB3cm90ZToKCiA+PiBTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxn
ZXJvLnNjaHdhZXJpY2tlQGdyYW5kY2VudHJpeC5uZXQ+CiA+PiAtLS0KID4+IC4uLi9wYXRjaGVz
L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgfCAyICst
CiA+PiAuLi4vdGkvYW02Mngtc2svcGF0Y2hlcy90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9h
ZGVyLmhhc2ggIHwgNCArKy0tCiA+PiBib2FyZC90aS9hbTYyeC1zay9wYXRjaGVzL3Vib290L3Vi
b290Lmhhc2ggICAgICAgICAgICAgICAgICAgIHwgNCArKy0tCiA+PiAzIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCiA+IFRoYW5rcyBmb3IgeW91ciB0d28g
cGF0Y2hlcy4gVGhleSBhcmUgYm90aCBjb3JyZWN0IGluZGVlZCwgYnV0IHRoZQogPiBjb21taXQg
bG9nIHNob3VsZCBoYXZlIGV4cGxhaW5lZCB3aGF0IGhhcHBlbmVkLiBTbyBoZXJlIGlzIHdoYXQg
SSBhZGRlZAogPiAoc28gdGhhdCB5b3UgY2FuIHNlZSB0aGUgc29ydCBvZiBleHBsYW5hdGlvbiB3
ZSBleHBlY3QgdG8gc2VlIGluIGNvbW1pdAogPiBsb2dzKToKCiA+ICAgICBib2FyZC90aS9hbTYy
eC1zazogdXBkYXRlIGN1c3RvbSBoYXNoZXMKICAgIAogPiAgICAgQ29tbWl0CiA+ICAgICBjYzI5
MTBhN2RiZDMzMWFlMGFkNmE4ZjA2Y2U3Y2QwNTU5YTFlYmUxICgiY29uZmlncy90aV9hbTYyeF9z
a19kZWZjb25maWc6CiA+ICAgICB1cGRhdGUgVS1Cb290IHRvIHYyMDI0LjA0IikgdXBkYXRlZCBV
LUJvb3QgYW5kIHRoZSB0aS1rMy1yNS1sb2FkZXIgdG8KID4gICAgIDIwMjQuMDQsIGJ1dCBkaWQg
bm90IHVwZGF0ZSB0aGUgaGFzaCBmaWxlcyBpbiBib2FyZC90aS9hbTYyeC1zay8uIEl0CiA+ICAg
ICBlbmRlZCB1cCB3b3JraW5nIGZvciBub3csIGJlY2F1c2UgdGhlIG9mZmljaWFsIHZlcnNpb25z
IG9mIGJvb3QvdWJvb3QKID4gICAgIGFuZCBib290L3RpLWszLXI1LWxvYWRlci8gYWxzbyB1c2Ug
MjAyNC4wNCBhbmQgdGhlcmVmb3JlIGhhdmUgdGhpcwogPiAgICAgaGFzaCwgYnV0IGl0IHdvdWxk
IGhhdmUgc3RhcnRlZCBmYWlsaW5nIGFzIHNvb24gYXMgYm9vdC91Ym9vdCBhbmQvb3IKID4gICAg
IGJvb3QvdGktazMtcjUtbG9hZGVyIG9mZmljaWFsIHZlcnNpb24gd2VyZSB1cGRhdGVkLgogICAg
CiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBHZXJvIFNjaHfDpHJpY2tlIDxnZXJvLnNjaHdhZXJpY2tl
QGdyYW5kY2VudHJpeC5uZXQ+CiA+ICAgICBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25p
IDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgoKID4gQm90aCBwYXRjaGVzIGFwcGxpZWQg
d2l0aCB0aG9zZSBpbXByb3ZlZCBjb21taXQgbWVzc2FnZXMuIFRoYW5rcyBhZ2FpbiEKCkNvbW1p
dHRlZCBib3RoIHRvIDIwMjQuMDUueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJk
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
