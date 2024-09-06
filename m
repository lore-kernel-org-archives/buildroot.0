Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D781DCD5BDD
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 11:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8959781A6A;
	Fri,  6 Sep 2024 11:52:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhy8U9iCHM6y; Fri,  6 Sep 2024 11:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD57581A92
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD57581A92;
	Fri,  6 Sep 2024 11:52:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3F4E1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A177860729
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 11:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVTgWySsB5GX for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 11:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 437F960590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 437F960590
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 437F960590
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 11:52:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 40AB460003;
 Fri,  6 Sep 2024 11:52:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1smXW9-00CzYp-1n;
 Fri, 06 Sep 2024 13:52:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: J. =?utf-8?Q?Neusch=C3=A4fer?= via buildroot <buildroot@buildroot.org>
References: <20240901-aer-v2-1-2080780f907d@gmx.net>
Date: Fri, 06 Sep 2024 13:52:45 +0200
In-Reply-To: <20240901-aer-v2-1-2080780f907d@gmx.net> ("J. =?utf-8?Q?Neusc?=
 =?utf-8?Q?h=C3=A4fer?= via
 buildroot"'s message of "Sun, 01 Sep 2024 18:40:07 +0200")
Message-ID: <87wmjphucy.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2] package/aer-inject: switch upstream
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
Cc: "J. =?utf-8?Q?Neusch=C3=A4fer?=" <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkoiID09IEogTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxk
cm9vdC5vcmc+IHdyaXRlczoKCiA+IEFjY29yZGluZyB0byBhIGNvbW1pdCBpbiBMaW51eFsxXSwg
dGhlIHVwc3RyZWFtIG9mIGFlci1pbmplY3QgY2hhbmdlZCB0bwogPiBodHRwczovL2dpdGh1Yi5j
b20vaW50ZWwvYWVyLWluamVjdC4KCiA+IFsxXTogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9saW51
cy9hMjllNTI5MGUzNTY2YWU0ZGI0ZTZmZTVmMzFjYWYyMzExOGM4MmI2CgogPiBTaWduZWQtb2Zm
LWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PgogPiAtLS0KID4gQ2hh
bmdlcyBpbiB2MjoKID4gLSBLZWVwIFNJVEVfTUVUSE9EIHRoZSBnYW1lIChnaXQpCiA+IC0gRml4
IFMtby1iIGxpbmUKID4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjQwOTAxLWFlci12MS0xLTAzYjEyNGNiNjRiMUBnbXgubmV0CgpDb21taXR0ZWQgdG8gMjAyNC4w
Mi54IGFuZCAyMDI0LjA1LngsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
