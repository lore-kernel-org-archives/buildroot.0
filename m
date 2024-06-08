Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBDAC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 11:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 432704249A;
	Sat,  8 Jun 2024 11:20:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgUMwm3Qgn6U; Sat,  8 Jun 2024 11:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20833424CB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20833424CB;
	Sat,  8 Jun 2024 11:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBF6C1BF5DA
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6E476067E
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 11:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwIRvw_1AaRY for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 11:20:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 923F060679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 923F060679
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 923F060679
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 11:20:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A38940005;
 Sat,  8 Jun 2024 11:20:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sFu7t-00GqJg-2H;
 Sat, 08 Jun 2024 13:20:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Jan =?utf-8?B?xIxlcm3DoWs=?= <sairon@sairon.cz>
References: <20240301094949.175637-1-sairon@sairon.cz>
Date: Sat, 08 Jun 2024 13:20:49 +0200
In-Reply-To: <20240301094949.175637-1-sairon@sairon.cz> ("Jan
 =?utf-8?B?xIxlcm3DoWsiJ3M=?=
 message of "Fri, 1 Mar 2024 10:49:48 +0100")
Message-ID: <87plsr7ka6.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] linux-firmware: add options for missing
 Intel b/g/n cards
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkphbiIgPT0gSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PiB3cml0ZXM6Cgog
PiBBZGQgZmlybXdhcmUgZmlsZXMgZm9yIG1pc3NpbmcgY2FyZHMgZnJvbSB0aGUgODAyLjExYmdu
IHByb2R1Y3QgbGlzdAogPiBpbiB0aGUgTGludXggRmlybXdhcmUgV2lraSBbMV0uCgogPiBTbyBm
YXIgb25seSBXaXJlbGVzcy1OIDEzMCBhbmQgMTAzMCB3ZXJlIHN1cHBvcnRlZCwgd2hpY2ggdXNl
IHRoZQogPiA2MDAwRzJCIG1pY3JvY29kZS4KCiA+IFsxXSBodHRwczovL3dpcmVsZXNzLndpa2ku
a2VybmVsLm9yZy9lbi91c2Vycy9kcml2ZXJzL2l3bHdpZmkjc3VwcG9ydGVkX2RldmljZXMKCiA+
IFNpZ25lZC1vZmYtYnk6IEphbiDEjGVybcOhayA8c2Fpcm9uQHNhaXJvbi5jej4KCkNvbW1pdHRl
ZCB0byAyMDI0LjAyLngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
