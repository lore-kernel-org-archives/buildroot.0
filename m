Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18789C27C52
	for <buildroot@archiver.kernel.org>; Tue,  4 Jun 2024 18:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C41412FD;
	Tue,  4 Jun 2024 18:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHxyZBmIFLkJ; Tue,  4 Jun 2024 18:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A63E541749
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A63E541749;
	Tue,  4 Jun 2024 18:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CD2841BF8B4
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B899741749
 for <buildroot@lists.busybox.net>; Tue,  4 Jun 2024 18:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZe80LKAXNnv for <buildroot@lists.busybox.net>;
 Tue,  4 Jun 2024 18:21:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44EBA410D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44EBA410D7
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44EBA410D7
 for <buildroot@buildroot.org>; Tue,  4 Jun 2024 18:21:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1522A60004;
 Tue,  4 Jun 2024 18:20:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sEYmH-006eIo-1O;
 Tue, 04 Jun 2024 20:20:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= via buildroot
 <buildroot@buildroot.org>
References: <20240603133243.78324-1-raphael.melotte@mind.be>
Date: Tue, 04 Jun 2024 20:20:57 +0200
In-Reply-To: <20240603133243.78324-1-raphael.melotte@mind.be>
 (=?utf-8?Q?=22Rapha=C3=ABl=09M=C3=A9lotte?= via buildroot"'s message of
 "Mon, 3 Jun 2024 15:32:42 +0200")
Message-ID: <87zfs0d0xi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] docs/manual: document python-aiohttp
 needed for pkg-stats
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
Cc: =?utf-8?Q?Rapha=C3=ABl_M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJhcGhhw6tsIiA9PSBSYXBoYcOrbCBNw6lsb3R0ZSB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wg
TcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgogPiAtLS0KID4gIGRvY3MvbWFudWFs
L3ByZXJlcXVpc2l0ZS5hZG9jIHwgMyArKysKID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCiA+IGRpZmYgLS1naXQgYS9kb2NzL21hbnVhbC9wcmVyZXF1aXNpdGUuYWRvYyBiL2Rv
Y3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jCiA+IGluZGV4IDI2MmE1MTUzZjUuLmFiNjA5YzEy
YmUgMTAwNjQ0CiA+IC0tLSBhL2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jCiA+ICsrKyBi
L2RvY3MvbWFudWFsL3ByZXJlcXVpc2l0ZS5hZG9jCiA+IEBAIC05NiwzICs5Niw2IEBAIGNvcnJl
c3BvbmRpbmcgdG9vbCBvbiB0aGUgaG9zdCBzeXN0ZW06CiA+ICAqIEdyYXBoIGdlbmVyYXRpb24g
dG9vbHM6CiA+ICAqKiArZ3JhcGh2aXorIHRvIHVzZSAnZ3JhcGgtZGVwZW5kcycgYW5kICc8cGtn
Pi1ncmFwaC1kZXBlbmRzJwogPiAgKiogK3B5dGhvbi1tYXRwbG90bGliKyB0byB1c2UgJ2dyYXBo
LWJ1aWxkJwogPiArCiA+ICsqIFBhY2thZ2Ugc3RhdGlzdGljcyB0b29scyAoJ3BrZy1zdGF0cycp
OgogPiArKiogK3B5dGhvbi1haW9odHRwKwoKQ29tbWl0dGVkLCB0aGFua3MuCgotLSAKQnllLCBQ
ZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
