Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1CFC4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 15:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E316140583;
	Wed, 12 Oct 2022 15:41:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E316140583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqCorfwb3dkq; Wed, 12 Oct 2022 15:41:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA47C40567;
	Wed, 12 Oct 2022 15:41:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA47C40567
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 210FD1BF4DD
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 15:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF42841937
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 15:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF42841937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsnT0Wonxtr3 for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 15:41:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A9CF414C8
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A9CF414C8
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 15:41:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48D66FF810;
 Wed, 12 Oct 2022 15:41:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oidrJ-00D4rJ-7e; Wed, 12 Oct 2022 17:41:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
References: <20220925132218.3848758-1-clg@kaod.org>
Date: Wed, 12 Oct 2022 17:41:25 +0200
In-Reply-To: <20220925132218.3848758-1-clg@kaod.org> (=?utf-8?Q?=22C=C3=A9?=
 =?utf-8?Q?dric?= Le Goater"'s
 message of "Sun, 25 Sep 2022 15:22:18 +0200")
Message-ID: <87pmexnj6i.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/aspeed_ast2600evb: Set
 BR2_ARM_FPU_VFPV4D16
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
Cc: Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkPDqWRyaWMiID09IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+IHdyaXRl
czoKCiA+IFRoZSBmZWF0dXJlcyBvZiB0aGUgQ29ydGV4IEE3IENQVSBvbiB0aGUgQXNwZWVkIEFT
VDI2MDAgQTMgU29DIGFyZSA6CiA+ICAgaGFsZiB0aHVtYiBmYXN0bXVsdCB2ZnAgZWRzcCB2ZnB2
MyB2ZnB2M2QxNiB0bHMgdmZwdjQgaWRpdmEgaWRpdnQgbHBhZSBldnRzdHJtCgogPiB0aGUgdmZw
djNkMTYgZmVhdHVyZSBiaXQgaXMgY29tbW9uIHRvIGJvdGggdmZwdjMgYW5kIHZmcHY0LgoKID4g
RHJvcCBCUjJfQVJNX0ZQVV9WRlBWNCB3aGljaCBhY3RpdmF0ZXMgdGhlIHVzZSBvZiB2cGZkMzIg
KGFuZCBicmVha3MKID4gdXNlciBzcGFjZSkuIFNldCBCUjJfQVJNX0ZQVV9WRlBWNEQxNiBpbnN0
ZWFkLgoKID4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4K
CkNvbW1pdHRlZCB0byAyMDIyLjA4LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFy
ZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
