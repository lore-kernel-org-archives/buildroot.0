Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5637C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 14:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 497966059A;
	Wed, 15 May 2024 14:44:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XB3TxeHo24go; Wed, 15 May 2024 14:44:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C9D2605AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C9D2605AD;
	Wed, 15 May 2024 14:44:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BEB1D1BF4E5
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABE8140B3D
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 14:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW3dJ5LETnHe for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 14:44:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAD59404C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAD59404C3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAD59404C3
 for <buildroot@buildroot.org>; Wed, 15 May 2024 14:44:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B811B1BF203;
 Wed, 15 May 2024 14:44:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s7Frc-001KAz-0B;
 Wed, 15 May 2024 16:44:16 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
References: <20240402210856.67418-1-gero.schwaericke@posteo.de>
Date: Wed, 15 May 2024 16:44:15 +0200
In-Reply-To: <20240402210856.67418-1-gero.schwaericke@posteo.de> ("Gero
 =?utf-8?Q?Schw=C3=A4ricke=22's?= message of "Tue, 2 Apr 2024 21:08:52
 +0000")
Message-ID: <87le4bqgn4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/sipeed_licheepi_nano_defconfig: fix
 missing linux headers
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
Cc: Francois Dugast <francois.dugast.foss@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdlcm8iID09IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9zdGVv
LmRlPiB3cml0ZXM6CgogPiBUaGUgYnVpbGQgZmFpbGVkIHdpdGg6CiA+ICAgSW5jb3JyZWN0IHNl
bGVjdGlvbiBvZiBrZXJuZWwgaGVhZGVyczogZXhwZWN0ZWQgNi44LngsIGdvdCA2LjUueAoKID4g
Rml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMv
NjQ5ODI3ODA3OAoKID4gU2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3
YWVyaWNrZUBwb3N0ZW8uZGU+CgpDb21taXR0ZWQgdG8gMjAyNC4wMi54LCB0aGFua3MuCgotLSAK
QnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
