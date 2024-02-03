Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F15C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A580741C01;
	Sat,  3 Feb 2024 18:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A580741C01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDbAhnQ9_Pvw; Sat,  3 Feb 2024 18:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4E5F41BBF;
	Sat,  3 Feb 2024 18:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4E5F41BBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8EFD1BF982
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D275B4056D
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 12:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJcrpWXOFjA3 for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 12:09:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EF7184054E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF7184054E
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF7184054E
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 12:09:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFB5C60002;
 Sat,  3 Feb 2024 12:09:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWEq4-009Oe6-2i;
 Sat, 03 Feb 2024 13:09:40 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
 <20240117225049.28443-10-adam.duskett@amarulasolutions.com>
 <ZaxBhznBIS8hkxDE@landeda>
Date: Sat, 03 Feb 2024 13:09:40 +0100
In-Reply-To: <ZaxBhznBIS8hkxDE@landeda> (Yann E. MORIN's message of "Sat, 20
 Jan 2024 22:56:23 +0100")
Message-ID: <87sf29sq9n.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v3 09/10] package/flutter-gallery: fix build
 options
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IEFEYW0sIEFsbCwKID4gT24gMjAyNC0wMS0xNyAxNTo1MCAtMDcwMCwgQWRhbSBE
dXNrZXR0IHNwYWtlIHRodXNseToKID4+IEFzIHRoZSBmbHV0dGVyLWdhbGxlcnkgcGFja2FnZSBp
cyBhIHJlZmVyZW5jZSBwYWNrYWdlIGZvciB1c2VycyB3aXNoaW5nIHRvIHVzZQogPj4gRmx1dHRl
ciBmb3IgdGhlaXIgVVggd2l0aCBCdWlsZHJvb3QsIHRoaXMgcGFja2FnZSBtdXN0IGhhdmUgdGhl
IGNvcnJlY3QgYnVpbGQKID4+IG9wdGlvbnMuIEluZGVlZCwgdGhpcyBwYWNrYWdlIGN1cnJlbnRs
eSBzdGFydHMgYW5kIHJ1bnMsIGJ1dCBvbmx5IGJlY2F1c2Ugb2YKID4+IHRoZSAwMDAxLXJlbW92
ZS1HZXRTdG9yYWdlLnBhdGNoLiBUaHJvdWdoIHRlc3RpbmcsIGZsdXR0ZXItZ2FsbGVyeSBmYWls
cyB0bwogPj4gcnVuIGR1cmluZyB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOgogPj4gLSBUaGUgeGRn
LXVzZXItZGlycyBwYWNrYWdlIGlzIHBvcnRlZCBhbmQgcHJlc2VudC4KID4+IC0gZmx1dHRlci1n
YWxsZXJ5IGRlcGVuZHMgb24geGRnLXVzZXItZGlycy4KID4+IC0gVGhlIDAwMDEtcmVtb3ZlLUdl
dFN0b3JhZ2UucGF0Y2ggZmlsZSBpcyByZW1vdmVkLgogPj4gCiA+PiBBZnRlciBleHRlbnNpdmUg
dGVzdGluZyBhbmQgY29tcGFyaW5nIHRoZSBjdXJyZW50IGJ1aWxkIGFyZ3VtZW50cyBhZ2FpbnN0
IHdoYXQKID4+IHRoZSBtZXRhLWZsdXR0ZXIgcmVwb3NpdG9yeSBmb3IgWW9jdG8gcGFzc2VzIHRv
IGFsbCBvZiB0aGUgYXBwbGljYXRpb25zIHRoYXQKID4+IGluaGVyaXQgZmx1dHRlci1hcHAsIGl0
IGlzIGNsZWFyIHRoYXQgaGFuZGxpbmcgdGhlIGRhcnRfcGx1Z2luX3JlZ2lzdHJhbnQuZGFydAog
Pj4gZmlsZSBpcyBtaXNzaW5nIGZyb20gdGhlIGRhcnQgYXJndW1lbnRzIGluIHRoZSBmbHV0dGVy
LWdhbGxlcnkgYnVpbGQgc3RlcC4KID4gWy0tU05JUC0tXQoKID4gR3JlYXQgY29tbWl0IGxvZyEg
VGhpcyBpcyBleGFjdGx5IHRoZSBraW5kIG9mIGNvbW1pdCBsb2cgdGhhdCBnaXZlcwogPiBjb25m
aWRlbmNlIGluIHRoZSBwYXRjaCwgYXMgaXQgZGVtb25zdHJhdGVzIHRoYXQgdGhlIHRvcGljIGhh
cyBiZWVuCiA+IHJlc2VhcmNoZWQsIGFuZCB0aGUgc29sdXRpb24gaXMgZXhwbGFpbmVkLCBhbmQg
dGhlIGRyYXdiYWNrcyBpZGVudGlmaWVkCiA+IGFuZCBqdXN0aWZpZWQuCgogPiBJIGRpZCBub3Qg
dW5kZXJzdGFuZCBhbGwgdGhlIGRldGFpbHMgb2YgaXQsIGJ1dCB0aGUgY29tbWl0IGxvZyByZWFs
bHkKID4gaGVscGVkIG1lIGp1c3QgYXBwbHkgdGhlIGNvbW1pdCB3aWh0b3V0IHRvbyBtdWNoIHRo
b3VnaHQuCgogPiBUaGFuayB5b3UhIPCfkY0KCkNvbW1pdHRlZCB0byAyMDIzLjExLngsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
