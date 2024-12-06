Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7263E7717B
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57509408A3;
	Fri,  6 Dec 2024 22:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wlqW6pVSMlu; Fri,  6 Dec 2024 22:21:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A30408A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40A30408A4;
	Fri,  6 Dec 2024 22:21:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 372F5ED7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B8F81EF7
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HFvWt6ZPEFWj for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6E94B81EE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E94B81EE8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E94B81EE8
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:21:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C384B1BF204;
 Fri,  6 Dec 2024 22:21:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJgh2-008l5L-0D;
 Fri, 06 Dec 2024 23:21:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <20241023-microblaze-v1-1-7ad68e2f271c@gmx.net>
 <0f55a317-5146-4397-926f-8964842cca3e@mind.be>
Date: Fri, 06 Dec 2024 23:21:00 +0100
In-Reply-To: <0f55a317-5146-4397-926f-8964842cca3e@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Wed, 4 Dec 2024 21:04:21
 +0100")
Message-ID: <87v7vw5u7n.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/musl: Fix -ztext build failures on
 microblaze
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
Cc: "J. =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFybm91dCIgPT0gQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCA8YnVp
bGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IE9uIDIzLzEwLzIwMjQgMjM6NDMsIEou
IE5ldXNjaMOkZmVyIHZpYSBidWlsZHJvb3Qgd3JvdGU6CiA+PiBUaGUgcGFydGljdWxhciBjb21i
aW5hdGlvbiBvZiBMVk0yICh3aGljaCBlbmFibGVzIC1QSUUpLCBtdXNsLWxpYmMgd2l0aAogPj4g
ZHluYW1pYyBsaW5raW5nIChhbmQgdGh1cyAtenRleHQsIGJhbm5pbmcgVEVYVFJFTHMpLCBhbmQg
bWljcm9ibGF6ZQogPj4gbGVhZHMgdG8gYW4gZXJyb3IgYmVjYXVzZSBhIFRFWFRSRUwgaXMgcHJv
ZHVjZWQgaW4gbXVzbC1saWJjJ3MgU2NydDEuby4KID4+IFRoZSB1cHN0cmVhbSBwYXRjaCBhZGRl
ZCBpbiB0aGlzIGNvbW1pdCBmaXhlcyAob3Igd29ya3MgYXJvdW5kKSB0aGUKID4+IHByb2JsZW0u
CiA+PiBGaXhlczoKID4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzVi
YjI4M2VmZjRiNGEyYjE3ZDEwMjhiYmUwYjNlMWJlYThmYmViYTgvCiA+PiBTaWduZWQtb2ZmLWJ5
OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgoKID4gIEFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA4LngsIHRo
YW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
