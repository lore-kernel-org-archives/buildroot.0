Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02482C27C55
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B161E405EF;
	Sat,  8 Jun 2024 11:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5QRqOqfoWwY; Sat,  8 Jun 2024 11:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9372C4064C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9372C4064C;
	Sat,  8 Jun 2024 11:15:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 672EC1BF589
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60A8C40169
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kfx8yvUm9RBM for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57FA8400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57FA8400FE
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57FA8400FE
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:15:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 42DD01C0003;
 Sat,  8 Jun 2024 11:15:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFu2r-00Gpbo-1l;
 Sat, 08 Jun 2024 13:15:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
References: <20240301092103.3902039-1-sairon@sairon.cz>
Date: Sat, 08 Jun 2024 13:15:37 +0200
In-Reply-To: <20240301092103.3902039-1-sairon@sairon.cz> ("Jan
 =?utf-8?B?xIxlcm3DoWsiJ3M=?=
 message of "Fri, 1 Mar 2024 10:21:02 +0100")
Message-ID: <87tti37kiu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: only install fsidd
 binary and unit file with enabled nfsd
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
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphbiIgPT0gSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PiB3cml0ZXM6Cgog
PiBGU0lEIGRhZW1vbiBhbmQgaXRzIHN5c3RlbWQgdW5pdCBmaWxlIGJvdGggZGVwZW5kIG9uCiA+
IEJSMl9QQUNLQUdFX05GU19VVElMU19SUENfTkZTRCBidXQgdGhleSdyZSBub3cgYWx3YXlzIGlu
c3RhbGxlZC4gUmVtb3ZlIHRoZW0KID4gYm90aCBpZiBCUjJfUEFDS0FHRV9ORlNfVVRJTFNfUlBD
X05GU0QgaXMgZGlzYWJsZWQuCgogPiBSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxp
by5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CiA+IFNpZ25lZC1vZmYtYnk6IEphbiDE
jGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRoYW5r
cy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
