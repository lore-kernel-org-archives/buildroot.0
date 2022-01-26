Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB25C2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 12:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF79682F13;
	Wed, 26 Jan 2022 12:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ihk6SAVmzoLm; Wed, 26 Jan 2022 12:24:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2738A81551;
	Wed, 26 Jan 2022 12:24:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E15951BF473
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFB2F60C00
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 12:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOxwex9AkExe for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 12:24:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBC7460BE5
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 12:24:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 17CC660003;
 Wed, 26 Jan 2022 12:24:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nChLg-00021x-8Q; Wed, 26 Jan 2022 13:24:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
 <20211230135621.2255847-7-romain.naour@gmail.com>
Date: Wed, 26 Jan 2022 13:24:28 +0100
In-Reply-To: <20211230135621.2255847-7-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 30 Dec 2021 14:56:21 +0100")
Message-ID: <87lez2it1f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 7/7] package/x11r7/xdriver_xf86-video-ati:
 Guard local variable priv only used with glamor
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIlJvbWFpbiIgPT0gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3
cml0ZXM6CgogPiBGaXhlczoKID4gcmFkZW9uX3ByZXNlbnQuYzogSW4gZnVuY3Rpb24g4oCYcmFk
ZW9uX3ByZXNlbnRfY2hlY2tfZmxpcOKAmToKID4gcmFkZW9uX3ByZXNlbnQuYzoyODE6MjE6IGVy
cm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3QgcmFkZW9uX3BpeG1h
cOKAmQogPiAgIDI4MSB8ICAgICBpZiAocHJpdiAmJiBwcml2LT5mYl9mYWlsZWQpCiA+ICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICBefgoKID4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3Vy
IDxyb21haW4ubmFvdXJAZ21haWwuY29tPgogPiBDYzogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxz
QHQtb25saW5lLmRlPgoKSXMgdGhpcyBvbmx5IG5lZWRlZCBmb3IgeHNlcnZlciAyMS54IG9yIGRv
ZXMgaXQgYWxzbyBuZWVkIHRvIGJlCmJhY2twb3J0ZWQgdG8gMjAyMS4wMi54IC8gMjAyMS4xMS54
PwoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
