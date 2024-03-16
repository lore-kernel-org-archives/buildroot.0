Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38367C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 21:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2B7B6066D;
	Sat, 16 Mar 2024 21:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bAphMIGDn35a; Sat, 16 Mar 2024 21:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B72E6067C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B72E6067C;
	Sat, 16 Mar 2024 21:20:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 722211BF83A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EB2381FC9
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 21:20:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vpr_3fxAb7uY for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 21:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5EB3B81E46
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EB3B81E46
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5EB3B81E46
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 21:20:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 476E2C0003;
 Sat, 16 Mar 2024 21:20:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rlbST-001W7l-2J;
 Sat, 16 Mar 2024 22:20:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240217170840.3623044-1-yann.morin.1998@free.fr>
Date: Sat, 16 Mar 2024 22:20:49 +0100
In-Reply-To: <20240217170840.3623044-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 17 Feb 2024 18:08:40 +0100")
Message-ID: <87y1ahlvpq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/sudo: fix build with uClibc
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIllhbm4iID09IFlhbm4gRSBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdy
aXRlczoKCiA+IHVDbGliYyBsYWNrcyBwcm9jZXNzX3ZtX3JlYWR2KCksIGFuZCBzdWRvIGZhaWxz
IHRvIGJ1aWxkOgogPiAgICAgLi9leGVjX3B0cmFjZS5jOiBJbiBmdW5jdGlvbiDigJhwdHJhY2Vf
d3JpdGVfdmVj4oCZOgogPiAgICAgLi9leGVjX3B0cmFjZS5jOjg5NTo5OiBlcnJvcjog4oCYbndy
aXR0ZW7igJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91
IG1lYW4g4oCYcHdyaXRl4oCZPwogPiAgICAgICA4OTUgfCAgICAgICAgIG53cml0dGVuID0gcHRy
YWNlX3dyaXRlX3N0cmluZyhwaWQsIHN0cnRhYiwgdmVjW2ldKTsKID4gICAgICAgICAgIHwgICAg
ICAgICBefn5+fn5+fgogPiAgICAgICAgICAgfCAgICAgICAgIHB3cml0ZQoKID4gVGhlIGZpeCBp
cyBwcmV0dHkgdHJpdmlhbCwgYW5kIGhhcyBiZWVuIHN1Ym1pdHRlZCB1cHN0cmVhbS4KCiA+IFNp
Z25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgoKQ29t
bWl0dGVkIHRvIDIwMjMuMDIueCBhbmQgMjAyMy4xMS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRl
ciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
