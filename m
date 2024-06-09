Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43E4C27C55
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 08:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77CDB60671;
	Sun,  9 Jun 2024 08:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7fQ7tjFznqN; Sun,  9 Jun 2024 08:33:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71B6160766
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71B6160766;
	Sun,  9 Jun 2024 08:33:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB2E91BF3F3
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 08:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 970C540139
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 08:33:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDaHPfU0ZUTo for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 08:33:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 498F440106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 498F440106
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 498F440106
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 08:33:49 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19FC140004;
 Sun,  9 Jun 2024 08:33:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sGDzm-004tyi-0d;
 Sun, 09 Jun 2024 10:33:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20240529-ztext-v2-0-82985032f169@gmx.net>
 <20240529-ztext-v2-2-82985032f169@gmx.net>
 <878qzfxta2.fsf@dell.be.48ers.dk> <87bk4avjoa.fsf@tarshish>
Date: Sun, 09 Jun 2024 10:33:46 +0200
In-Reply-To: <87bk4avjoa.fsf@tarshish> (Baruch Siach's message of "Sun, 09 Jun
 2024 07:12:21 +0300")
Message-ID: <87tti2tt05.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/2] micropython: Add patch to avoid
 textrel on arm/thumb
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
Cc: "J. =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "J. =?utf-8?Q?Neusch=C3=A4fer?= via buildroot" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkJhcnVjaCIgPT0gQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4gd3JpdGVz
OgoKID4gSGkgUGV0ZXIsCiA+IE9uIFNhdCwgSnVuIDA4IDIwMjQsIFBldGVyIEtvcnNnYWFyZCB3
cm90ZToKCiA+Pj4+Pj4+ICJKIiA9PSBKIE5ldXNjaMOkZmVyIHZpYSBidWlsZHJvb3QgPGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CiA+PiAKID4+ID4gU2lnbmVkLW9mZi1ieTogSi4g
TmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KID4+IAogPj4gQ29tbWl0dGVkIHRv
IDIwMjQuMDIueCwgdGhhbmtzLgoKID4gTm90IGluIDIwMjQuMDIueCBhcyBvZiBjb21taXQgZWU2
Njk0ZTk3MDRiICgicGFja2FnZS9saWJvcGVuc3NsOgogPiBzZWN1cml0eSBidW1wIHRvIHZlcnNp
b24gMy4yLjIiKS4KClVwcywgdGhhbmtzIGZvciB0aGUgaGVhZHMgdXAgLSBGaXhlZCBub3cuCgot
LSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
