Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3407CEBF96
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 10:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78CA960622;
	Fri, 27 Sep 2024 10:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrrMTedXo3uk; Fri, 27 Sep 2024 10:59:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C12960675
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C12960675;
	Fri, 27 Sep 2024 10:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5AEE1BF2F0
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 10:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9421560675
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 10:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkC0fCdrybIg for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 10:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.195;
 helo=relay3-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B1A660622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B1A660622
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B1A660622
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 10:58:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 634766000B;
 Fri, 27 Sep 2024 10:58:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1su8gY-000C3J-1M;
 Fri, 27 Sep 2024 12:58:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Anssi Hannula <anssi.hannula@bitwise.fi>
References: <20240911190900.982461-1-yann.morin.1998@free.fr>
 <871q1eidg8.fsf@dell.be.48ers.dk>
 <ddca9f53-fc22-4bba-9c68-ed867b691a76@bitwise.fi>
Date: Fri, 27 Sep 2024 12:58:54 +0200
In-Reply-To: <ddca9f53-fc22-4bba-9c68-ed867b691a76@bitwise.fi> (Anssi
 Hannula's message of "Fri, 27 Sep 2024 12:39:08 +0300")
Message-ID: <87tte1icr5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] support/scripts: fix RPATH fixups
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkFuc3NpIiA9PSBBbnNzaSBIYW5udWxhIDxhbnNzaS5oYW5udWxhQGJpdHdpc2UuZmk+
IHdyaXRlczoKCkhpLAoKID4+ID4gRml4ZXM6IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qu
b3JnL2J1aWxkcm9vdC8tL2lzc3Vlcy8zOQogPj4gCiA+PiA+IEFsc28gZml4IGEgdHlwbyBpbiB0
aGUgY29tbWVudCBqdXN0IGFib3ZlLgogPj4gCiA+PiA+IFJlcG9ydGVkLWJ5OiBKb3PDqSBMdWlz
IFNhbHZhZG9yIFJ1Zm8gQGpsc2FsdmFkb3IKID4+ID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CiA+PiAKID4+IENvbW1pdHRlZCwgdGhhbmtz
LgogPj4gCgogPiBUaGUgdHJpZ2dlcmluZyBjb21taXQgd2FzIGJhY2twb3J0ZWQgdG8gMjAyNC4w
OC54IGFuZCAyMDI0LjAyLnggdG9vIHNvCiA+IHRoZXkgYXJlIGFmZmVjdGVkLCBjYW4gd2UgZ2V0
IHRoaXMgb25lIHRoZXJlIGFzIHdlbGw/CgpZZXMsIEkgd2lsbCBoYW5kbGUgaXQgbmV4dCB0aW1l
IEkgc3luYyB0aGUgc3RhYmxlIHRyZWVzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
