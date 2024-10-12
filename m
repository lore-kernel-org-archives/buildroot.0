Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95168CF2568
	for <buildroot@archiver.kernel.org>; Sat, 12 Oct 2024 13:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3E382083;
	Sat, 12 Oct 2024 13:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D81LO2xHEeC8; Sat, 12 Oct 2024 13:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EEB28197D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EEB28197D;
	Sat, 12 Oct 2024 13:56:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCE631BF5DF
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D801B8197D
 for <buildroot@lists.busybox.net>; Sat, 12 Oct 2024 13:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfeIJ9spr67h for <buildroot@lists.busybox.net>;
 Sat, 12 Oct 2024 13:56:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CD11281951
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD11281951
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD11281951
 for <buildroot@buildroot.org>; Sat, 12 Oct 2024 13:56:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 399CD60002;
 Sat, 12 Oct 2024 13:55:58 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1szcb8-00DHU3-1H;
 Sat, 12 Oct 2024 15:55:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Anssi Hannula <anssi.hannula@bitwise.fi>
References: <20240911190900.982461-1-yann.morin.1998@free.fr>
 <871q1eidg8.fsf@dell.be.48ers.dk>
 <ddca9f53-fc22-4bba-9c68-ed867b691a76@bitwise.fi>
 <87tte1icr5.fsf@dell.be.48ers.dk>
Date: Sat, 12 Oct 2024 15:55:58 +0200
In-Reply-To: <87tte1icr5.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 27 Sep 2024 12:58:54 +0200")
Message-ID: <87iktxfms1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlBldGVyIiA9PSBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+IHdy
aXRlczoKCj4+Pj4+ICJBbnNzaSIgPT0gQW5zc2kgSGFubnVsYSA8YW5zc2kuaGFubnVsYUBiaXR3
aXNlLmZpPiB3cml0ZXM6CiA+IEhpLAoKID4+PiA+IEZpeGVzOiBodHRwczovL2dpdGxhYi5jb20v
YnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9pc3N1ZXMvMzkKID4+PiAKID4+PiA+IEFsc28gZml4
IGEgdHlwbyBpbiB0aGUgY29tbWVudCBqdXN0IGFib3ZlLgogPj4+IAogPj4+ID4gUmVwb3J0ZWQt
Ynk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyBAamxzYWx2YWRvcgogPj4+ID4gU2lnbmVkLW9m
Zi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CiA+Pj4gCiA+Pj4g
Q29tbWl0dGVkLCB0aGFua3MuCiA+Pj4gCgogPj4gVGhlIHRyaWdnZXJpbmcgY29tbWl0IHdhcyBi
YWNrcG9ydGVkIHRvIDIwMjQuMDgueCBhbmQgMjAyNC4wMi54IHRvbyBzbwogPj4gdGhleSBhcmUg
YWZmZWN0ZWQsIGNhbiB3ZSBnZXQgdGhpcyBvbmUgdGhlcmUgYXMgd2VsbD8KCiA+IFllcywgSSB3
aWxsIGhhbmRsZSBpdCBuZXh0IHRpbWUgSSBzeW5jIHRoZSBzdGFibGUgdHJlZXMuCgpDb21taXR0
ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
