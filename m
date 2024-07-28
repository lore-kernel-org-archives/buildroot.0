Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F87C3DA49
	for <buildroot@archiver.kernel.org>; Sun, 28 Jul 2024 09:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00ACA80F42;
	Sun, 28 Jul 2024 09:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id StkrBxGcerjG; Sun, 28 Jul 2024 09:58:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11CC180CE7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11CC180CE7;
	Sun, 28 Jul 2024 09:58:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397201BF588
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 09:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2496A80CE7
 for <buildroot@lists.busybox.net>; Sun, 28 Jul 2024 09:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0tyCdYBO5fMQ for <buildroot@lists.busybox.net>;
 Sun, 28 Jul 2024 09:58:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0CCD280BD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CCD280BD2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CCD280BD2
 for <buildroot@buildroot.org>; Sun, 28 Jul 2024 09:58:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF50420003;
 Sun, 28 Jul 2024 09:58:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sY0fm-0024i7-16;
 Sun, 28 Jul 2024 11:58:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240711175104.2989194-1-dario.binacchi@amarulasolutions.com>
Date: Sun, 28 Jul 2024 11:58:38 +0200
In-Reply-To: <20240711175104.2989194-1-dario.binacchi@amarulasolutions.com>
 (Dario Binacchi's message of "Thu, 11 Jul 2024 19:51:03 +0200")
Message-ID: <87sevtx2gh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/snappy: fix compilation
 error raised by vqtbl1q_u8 instruction
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
Cc: linux-amarula@amarulasolutions.com, "Yann E .
 MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkRhcmlvIiA9PSBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNv
bHV0aW9ucy5jb20+IHdyaXRlczoKCiA+IFRoZSBwYWNrYWdlIGNvbXBpbGF0aW9uIGZvciB0aGUg
cmFzcGJlcnJ5cGkzX3F0NXdlX2RlZmNvbmZpZyByYWlzZXMgdGhlCiA+IGZvbGxvd2luZyBlcnJv
cjoKCiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBidWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3NuYXBw
eS0xLjEuMTAvc25hcHB5LmNjOjI5OgogPiBidWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3NuYXBweS0x
LjIuMS9zbmFwcHktaW50ZXJuYWwuaDogSW4gZnVuY3Rpb24KID4g4oCYc25hcHB5OjppbnRlcm5h
bDo6VjEyOCBzbmFwcHk6OmludGVybmFsOjpWMTI4X1NodWZmbGUoVjEyOCwgVjEyOCnigJk6CiA+
IGJ1aWxkcm9vdC9vdXRwdXQvYnVpbGQvc25hcHB5LTEuMi4xL3NuYXBweS1pbnRlcm5hbC5oOjEw
OToxMDogZXJyb3I6CiA+IOKAmHZxdGJsMXFfdTjigJkgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlz
IHNjb3BlOyBkaWQgeW91IG1lYW4g4oCYdnRibDFfdTjigJk/CiA+ICAgMTA5IHwgICByZXR1cm4g
dnF0YmwxcV91OChpbnB1dCwgc2h1ZmZsZV9tYXNrKTsKID4gICAgICAgfCAgICAgICAgICBefn5+
fn5+fn5+CiA+ICAgICAgIHwgICAgICAgICAgdnRibDFfdTgKID4gbWFrZVs0XTogKioqIFtDTWFr
ZUZpbGVzL3NuYXBweS5kaXIvYnVpbGQubWFrZToxMTg6IENNYWtlRmlsZXMvc25hcHB5LmRpci9z
bmFwcHkuY2Mub10gRXJyb3IgMQoKID4gVGhlIGlzc3VlIHdhcyByYWlzZWQgYnkgY29tbWl0IGIz
ZmIwYjViNGIwNzYgKCJFbmFibGUgdmVjdG9yIGJ5dGUKID4gc2h1ZmZsZSBvcHRpbWl6YXRpb25z
IG9uIEFSTSBORU9OIikgY29udGFpbmVkIGluIHZlcnNpb24gMS4xLjEwLgoKID4gU2lnbmVkLW9m
Zi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29t
PgogPiAtLS0KID4gQ2hhbmdlcyB2MSAtPiB2MjoKID4gIC0gU3dhcCBwb3NpdGlvbiB3aXRoIHRo
ZSBvdGhlciBwYXRjaC4gU28gZmlyc3QgYXBwbHkgdGhlIGZpeGluZwogPiAgICBjb21waWxhdGlv
biBlcnJvciBwYXRjaCBhbmQgdGhlbiBidW1wIHRvIHZlcnNpb24gMS4yLjEuCgpDb21taXR0ZWQg
dG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
