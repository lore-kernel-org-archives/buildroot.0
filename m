Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B52C4345F
	for <buildroot@archiver.kernel.org>; Thu, 25 Apr 2024 20:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B448560E07;
	Thu, 25 Apr 2024 20:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FeC5SkeSRBxU; Thu, 25 Apr 2024 20:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2F5161323
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2F5161323;
	Thu, 25 Apr 2024 20:35:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E27A71BF388
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEE1082F32
 for <buildroot@lists.busybox.net>; Thu, 25 Apr 2024 20:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZZAHjlmRkZKJ for <buildroot@lists.busybox.net>;
 Thu, 25 Apr 2024 20:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3FFCA82EF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FFCA82EF0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FFCA82EF0
 for <buildroot@buildroot.org>; Thu, 25 Apr 2024 20:35:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC1CAE0005;
 Thu, 25 Apr 2024 20:35:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s05oQ-000A5s-01;
 Thu, 25 Apr 2024 22:35:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <d443c6f25e4fe949695d7b952f196cd087e91de2.1714028961.git.baruch@tkos.co.il>
Date: Thu, 25 Apr 2024 22:35:16 +0200
In-Reply-To: <d443c6f25e4fe949695d7b952f196cd087e91de2.1714028961.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Thu, 25 Apr 2024 10:09:21
 +0300")
Message-ID: <87edat9o57.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] configs/solidrun_clearfog: bump kernel to
 6.6.28
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
Cc: buildroot@busybox.net, Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkJhcnVjaCIgPT0gQmFydWNoIFNpYWNoIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBBZGp1c3QgRFRTX05BTUUgdG8gY3VycmVudCBrZXJu
ZWwgc291cmNlIHRyZWUgbG9jYXRpb24gb2YgRFRzIGluCiA+IHBlci12ZW5kb3IgZGlyZWN0b3Jp
ZXMuCgogPiBGaXhlczoKID4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vam9icy82NjY1NzQ5OTA5CgogPiBDYzogSmFuIEt1bmRyw6F0IDxqYW4ua3VuZHJhdEBj
ZXNuZXQuY3o+CiA+IFNpZ25lZC1vZmYtYnk6IEJhcnVjaCBTaWFjaCA8YmFydWNoQHRrb3MuY28u
aWw+CgpDb21taXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
