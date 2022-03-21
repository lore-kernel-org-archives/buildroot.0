Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA68DC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3E2B8411F;
	Mon, 21 Mar 2022 16:25:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5biNcUH2XVoq; Mon, 21 Mar 2022 16:25:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C804B82416;
	Mon, 21 Mar 2022 16:25:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67CF51BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:25:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 556A360EE7
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:25:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mVTt-3MKLt6j for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:25:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5554B60BF9
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:25:23 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4593D6000E;
 Mon, 21 Mar 2022 16:25:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nWKqO-008KFk-Hg; Mon, 21 Mar 2022 17:25:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Yann E. MORIN <yann.morin.1998@free.fr>
References: <20220318223159.059C983944@busybox.osuosl.org>
Date: Mon, 21 Mar 2022 17:25:20 +0100
In-Reply-To: <20220318223159.059C983944@busybox.osuosl.org> (Yann E. MORIN's
 message of "Fri, 18 Mar 2022 23:21:44 +0100")
Message-ID: <875yo7i87j.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/pkg-generic: host variant
 inherits target download settings
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
aXRlczoKCiA+IGNvbW1pdDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29t
bWl0Lz9pZD1lZmE3NzEyYjA5Mjk1MGM5MmY5OTRlMmVlMzBjMTIwYTY0ZTU0NTFiCiA+IGJyYW5j
aDogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD1yZWZzL2hl
YWRzL21hc3RlcgoKID4gSXQgc2VlbXMgcmVhc29uYWJsZSB0byBleHBlY3QgdGhhdCB0aGUgZG93
bmxvYWQgb2YgdGhlIGhvc3QgYW5kIHRhcmdldAogPiB2YXJpYW50cyBzaG91bGQgdXN1YWxseSBi
ZSBleGFjdGx5IHRoZSBzYW1lIGFuZCB0aHVzIHJldXNlIHRoZSB0YXJnZXQKID4gcGFja2FnZSB2
YWx1ZXMgZm9yIHRoZSBob3N0IHBhY2thZ2UuIFRoaXMgY29tbWl0cyBhZGQgc3VwcG9ydCB0bwog
PiBpbmhlcml0IGhvc3QgX0RMX1NVQkRJUiwgX0RPV05MT0FEX0RFUEVOREVOQ0lFUywgX0RMX0VO
ViBhbmQKID4gX0RPd05MT0FEX1BPU1RfUFJPQ0VTUyB2YXJpYWJsZXMgZnJvbSB0YXJnZXQgb25l
cy4gVGhlc2UgdmFyaWFibGVzIGNhbgogPiBzdGlsbCBiZSBvdmVycmlkZW4gaWYgbmVjZXNzYXJ5
IGZvciB0aGUgaG9zdCBwYWNrYWdlLgoKID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8
eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CiA+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdl
ciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KID4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBN
T1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+CgpDb21taXR0ZWQgdG8gMjAyMi4wMi54IHRv
IG1ha2UgZnV0dXJlIGJhY2twb3J0cyBlYXNpZXIsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtv
cnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
