Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71408CDD54E
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 17:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 240E940096;
	Wed, 18 Sep 2024 17:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QKblDxjpCMi2; Wed, 18 Sep 2024 17:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF6AC4026C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF6AC4026C;
	Wed, 18 Sep 2024 17:05:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52B111BF5A7
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4122E4026C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 17:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMBDr2UIfI4T for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 17:05:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8F8AA40096
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F8AA40096
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8F8AA40096
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 17:05:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5B72E0003;
 Wed, 18 Sep 2024 17:05:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sqy7E-00DF6u-0r;
 Wed, 18 Sep 2024 19:05:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
References: <20240824-x264-textrel-v1-1-fbfcedc7179d@gmx.net>
Date: Wed, 18 Sep 2024 19:05:20 +0200
In-Reply-To: <20240824-x264-textrel-v1-1-fbfcedc7179d@gmx.net> ("J.
 =?utf-8?Q?Neusch=C3=A4fer?=
 via buildroot"'s message of "Sat, 24 Aug 2024 22:11:02 +0200")
Message-ID: <87v7ysq4dr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/x264: disable assembly code on x86
 + musl + PIC/PIE
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Yann Morin <yann.morin@orange.com>,
 "J. =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>,
 David du Colombier <0intro@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkoiID09IEogTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyaXRlczoKCiA+IFRoZSB4MjY0IHBhY2thZ2UgdXNlcyBsYXJnZSBhbW91bnRz
IG9mIG5vbi1QSUMgYXNzZW1ibHkgY29kZQogPiAoZS5nLiBjb21tb24veDg2L2RjdC1hLmFzbSks
IHdoaWNoIHJlc3VsdHMgaW4gdGV4dHJlbHMsIHdoaWNoIGFyZW4ndAogPiBzdXBwb3J0ZWQgYnkg
bXVzbC1saWJjJ3MgZHluYW1pYyBsaW5rZXIuCgogPiBEaXNhYmxlIHgyNjQncyBhc3NlbWJseSBj
b2RlIHdoZW4gY29tcGlsaW5nIGZvciB4ODYgd2l0aCBQSUMvUElFIGFuZAogPiBtdXNsLWxpYmMg
dG8gYXZvaWQgdGhpcyBwYXJ0aWN1bGFyIGluY29tcGF0aWJpbGl0eS4KCiA+IFJlcG9ydGVkLWJ5
OiBZYW5uIE1vcmluIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+CiA+IEZpeGVzOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9idWlsZHJvb3QvWnJzaXJucnZnc0VJcEFKSUB0bC1sbngtbnltYTc0ODYt
Mi8KID4gU2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5l
dD4KCkNvbW1pdHRlZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
