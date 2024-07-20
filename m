Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DF9C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C09404C6;
	Sat, 20 Jul 2024 21:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lcti0xnj11t1; Sat, 20 Jul 2024 21:52:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4B34055D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4B34055D;
	Sat, 20 Jul 2024 21:52:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3C11BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15161401C9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1-YTuT8Ey-M for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7DB49400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DB49400D8
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DB49400D8
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:52:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1613A1BF203;
 Sat, 20 Jul 2024 21:52:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sVHzx-00GKb7-2j;
 Sat, 20 Jul 2024 23:52:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Hilse <andreas.hilse@googlemail.com>
References: <CA+h8R2rXC7pFxf4EtUM1ppGjLviduQki4UD1bzZb8_ZByj4JXA@mail.gmail.com>
 <8b4e27a50df0f4c4770eeb7f7edfed5f2c1f8483.camel@gmail.com>
 <87zfqxuxc7.fsf@dell.be.48ers.dk>
 <b335fcb8-5ea2-4ca9-9bf8-a5d62caab290@mind.be>
 <becc07c45d7f9b8fef18ef9c1a22a3f307524bae.camel@gmail.com>
 <87v81jvko4.fsf@dell.be.48ers.dk>
 <CANabuZer5AXD=y-6Qc0y6h5DHB4yNoYdQF5P1w2uRBvtn51d8Q@mail.gmail.com>
 <17002fb1-13c6-4d47-adfd-cbd4b0490673@mind.be>
 <CANabuZfTRZwbAyVZ5Ha27Ch5r+nTb6YjFgM2Pu1vC16wi1v4TA@mail.gmail.com>
Date: Sat, 20 Jul 2024 23:52:13 +0200
In-Reply-To: <CANabuZfTRZwbAyVZ5Ha27Ch5r+nTb6YjFgM2Pu1vC16wi1v4TA@mail.gmail.com>
 (Andreas Hilse's message of "Sat, 20 Jul 2024 21:39:13 +0200")
Message-ID: <87a5ibenoy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] package/openssh: please backport bump to 9.8p1
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFuZHJlYXMiID09IEFuZHJlYXMgSGlsc2UgPGFuZHJlYXMuaGlsc2VAZ29vZ2xlbWFp
bC5jb20+IHdyaXRlczoKCiA+IEhpLAogPiBPbiBGcmksIEp1bCAxOSwgMjAyNCBhdCA1OjMy4oCv
UE0gQXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKID4+IEkgd291
bGQgc2F5LCBpbiB0aGF0IGNhc2UsIGZpeCB5b3VyIHZ1bG5lcmFiaWxpdHkgc2Nhbm5lci4gV2Ug
aGF2ZSBkb3plbnMgb2YKID4+IHBhY2thZ2VzIHdoZXJlIENWRXMgYXJlIHBhdGNoZWQuIFNlZSB0
aGUgSUdOT1JFX0NWRVMgdmFyaWFibGVzIGluIHZhcmlvdXMgcGFja2FnZXMuCgogPiBJIGtub3cg
YWJvdXQgdGhhdCwgYnV0IHRoZSBwcm9ibGVtIGxpZXMgbm90IHdpdGggb3VyIHZ1bG5lcmFiaWxp
dHkKID4gc2Nhbm5lciwgdGhhdCBhbG9uZSB3ZSBjYW4gaGFuZGxlLgogPiBUaGUgcHJvYmxlbSBp
cyB0aGF0IG91ciBjdXN0b21lcnMgY29uZHVjdCB0aGVpciBvd24gc2NhbnMgb3IgaGlyZSBhCiA+
IDNyZCBwYXJ0eSB0byBkbyBibGFja2JveCB0ZXN0cy4gV2hlbiB0aGV5IHNlZSBvcGVuc3NoIDku
NyB0aGV5IHdpbGwKID4gY29tcGxhaW4uCgpCdXQgdGhhdCBpcyBwcmVzdW1hYmx5IHRoZSBzYW1l
IGZvciBhbnkgb3RoZXIgcGFja2FnZSB3aGVyZSB3ZSBhcHBseSBhCnNlY3VyaXR5IHBhdGNoIHJh
dGhlciB0aGFuIGJ1bXBpbmcgdGhlIHZlcnNpb24/CgpUaGlzIGlzIGhhcmRseSBhIHByb2JsZW0g
c3BlY2lmaWMgdG8gQnVpbGRyb290LCBFLkcuIERlYmlhbiB0ZW5kcyB0bwpwYXRjaCByYXRoZXIg
dGhhbiBidW1wIHZlcnNpb25zIGFzIHdlbGwuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
