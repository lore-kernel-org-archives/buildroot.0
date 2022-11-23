Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E357C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 21:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D80840C66;
	Wed, 23 Nov 2022 21:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D80840C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1CC5XAKKhTp; Wed, 23 Nov 2022 21:39:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F4EE404DD;
	Wed, 23 Nov 2022 21:39:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F4EE404DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9551BF2F7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6091860A9E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 21:39:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6091860A9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jjk6SzRjZzDz for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 21:39:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CBB460A6C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CBB460A6C
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 21:39:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 55AE41C0006;
 Wed, 23 Nov 2022 21:39:32 +0000 (UTC)
Date: Wed, 23 Nov 2022 22:39:31 +0100
To: Vincent =?UTF-8?B?U3RlaGzDqQ==?= <vincent.stehle@arm.com>
Message-ID: <20221123223931.1b4c799b@windsurf>
In-Reply-To: <20221123102035.2221-1-vincent.stehle@arm.com>
References: <20221123102035.2221-1-vincent.stehle@arm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669239572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VRpLwmXBVQI1kKrxXRx6hAOOFsks9bhHf806EXxdoF8=;
 b=WVJFgKamBJvDhZ8fXXNKM6mpoAauCxuq5ekpaQWY7RGeQa/FDmGyvNs3oim1nSj/U1HXC8
 LVajKnl+/my2GGhb+Au1ACMwMLacKowJI3dNdIQTjOkHrTQzJCdEhMfI7p4rGfKy6ndj32
 2uMMt4qcG6KzmDLWqpCpuVV7J0z/JlHbz9+B0VsHoqVpR4idQjNQikXcu6xsDe15IPyPZK
 Irr/xpcF3or2o/VcCdjEQQzxl349vTHar9YEC2PooPr/h7C/ccWjMEVTtTw/AgwW/Xg4qV
 Bl6oozemgm7ZPbw3IfTrRTY2Gwe13x3wx7Rt9GXXUAe7p99XW7v6sITym9UE+w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WVJFgKam
Subject: Re: [Buildroot] [PATCH 0/2] refine license of edk2*
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMyBOb3YgMjAyMiAxMToyMDozMyArMDEwMApWaW5jZW50IFN0ZWhsw6kgPHZpbmNl
bnQuc3RlaGxlQGFybS5jb20+IHdyb3RlOgoKPiBWaW5jZW50IFN0ZWhsw6kgKDIpOgo+ICAgcGFj
a2FnZS9lZGsyLXBsYXRmb3JtczogcmVmaW5lIGxpY2Vuc2UKPiAgIGJvb3QvZWRrMjogcmVmaW5l
IGxpY2Vuc2UKClRoYW5rcywgYm90aCBhcHBsaWVkIHRvIG1hc3RlciEKClRob21hcwotLSAKVGhv
bWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
