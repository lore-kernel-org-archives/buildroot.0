Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1730C71151
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 06:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41D7940733;
	Thu, 29 Aug 2024 06:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09EML8lqL2vL; Thu, 29 Aug 2024 06:01:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24BBD408F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24BBD408F0;
	Thu, 29 Aug 2024 06:01:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 285E71BF357
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156CA404DB
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 06:01:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MEUkWNvJYzJJ for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 06:01:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 52002403A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52002403A7
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52002403A7
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 06:01:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90A95C0002;
 Thu, 29 Aug 2024 06:01:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sjYDP-006Ecz-2v;
 Thu, 29 Aug 2024 08:01:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@posteo.de>
References: <20240403213135.699268-1-gero.schwaericke@posteo.de>
Date: Thu, 29 Aug 2024 08:01:03 +0200
In-Reply-To: <20240403213135.699268-1-gero.schwaericke@posteo.de> ("Gero
 =?utf-8?Q?Schw=C3=A4ricke=22's?= message of "Wed, 3 Apr 2024 21:30:38
 +0000")
Message-ID: <87jzfz7tr4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] docs/manual: promote using fixed version
 for kernel headers when contributing a board
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkdlcm8iID09IEdlcm8gU2Nod8Okcmlja2UgPGdlcm8uc2Nod2Flcmlja2VAcG9zdGVv
LmRlPiB3cml0ZXM6CgogPiBXaGVuIHRoZSBkZWZhdWx0IChuZXdlc3QpIGtlcm5lbCBoZWFkZXJz
IHNlcmllcyBjaGFuZ2VzIHRoZSBidWlsZCBjYW4KID4gYnJlYWsuIEV4YW1wbGUgZXJyb3IgbWVz
c2FnZToKCiA+ICAgSW5jb3JyZWN0IHNlbGVjdGlvbiBvZiBrZXJuZWwgaGVhZGVyczogZXhwZWN0
ZWQgNi44LngsIGdvdCA2LjUueAoKID4gSW4gdGhlIGFib3ZlIGNhc2UgdGhlIGRlZmNvbmZpZyB1
c2VkOgoKID4gICBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKID4gICBCUjJfTElO
VVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjUuOSIKCiA+IFRoZSBrZXJuZWwgaGVh
ZGVycyB3ZXJlIG5vdCBzcGVjaWZpZWQsIHNvIHRoZSBidWlsZCBkZWZhdWx0ZWQgdG8gdXNpbmcK
ID4gdGhlIGtlcm5lbCBzb3VyY2VzIGFzIGhlYWRlciBzb3VyY2UgYW5kIHRoZSBkZWZhdWx0IChu
ZXdlc3QpIGhlYWRlcgogPiBzZXJpZXMuIEZyb20gLmNvbmZpZzoKCiA+ICAgQlIyX0tFUk5FTF9I
RUFERVJTX0FTX0tFUk5FTD15CiA+ICAgQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NV
U1RPTV82Xzg9eQoKID4gU2lnbmVkLW9mZi1ieTogR2VybyBTY2h3w6RyaWNrZSA8Z2Vyby5zY2h3
YWVyaWNrZUBwb3N0ZW8uZGU+CgpDb21taXR0ZWQgdG8gMjAyNC4wMi54IGFuZCAyMDI0LjA1Lngs
IHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
