Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4B2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 11:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DCE44097E;
	Sun, 17 Jul 2022 11:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DCE44097E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JNGnaECYIcO3; Sun, 17 Jul 2022 11:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 334CC40190;
	Sun, 17 Jul 2022 11:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 334CC40190
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 248091BF299
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 11:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0528240352
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 11:15:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0528240352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WUz3Q6q6oCbN for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 11:15:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ED464013E
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ED464013E
 for <buildroot@uclibc.org>; Sun, 17 Jul 2022 11:15:05 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1oD2En-0003XD-QE
 for buildroot@uclibc.org; Sun, 17 Jul 2022 13:15:01 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jul 2022 12:35:02 +0200
Message-ID: <pan$74e01$fcffd6ef$3d65ea3d$2f8905a6@ID-313208.user.individual.net>
References: <20220625141223.26460-1-vincent.stehle__29291.7750471801$1656166387$gmane$org@laposte.net>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH v2] package/zerofree: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gU2F0LCAyNSBKdW4gMjAyMiAxNjoxMjoyMyArMDIwMCBzY2hyaWViIFZpbmNlbnQgU3RlaGzD
qSB2aWEgYnVpbGRyb290OgoKPiArY29tbWVudCAiemVyb2ZyZWUgbmVlZHMgTU1VIGFuZCBkeW5h
bWljIGxpYnJhcnkiCj4gKwlkZXBlbmRzIG9uICFCUjJfVVNFX01NVSB8fCBCUjJfU1RBVElDX0xJ
QlMKCkhpLAoKYWNjb3JkaW5nIHRvIHRoZSBkb2NzLCBzZWN0aW9uIDE4LjIuNApodHRwOi8vYnVp
bGRyb290LnVjbGliYy5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNfY29uZmlnX2Zp
bGVzCm5vIGNvbW1lbnQgaXMgdG8gYmUgYWRkZWQgZm9yICFCUjJfVVNFX01NVQoKc28gdGhlIGNv
bW1lbnQgc2hvdWxkIGxvb2sgbGlrZSB0aGlzOgoKY29tbWVudCAiemVyb2ZyZWUgbmVlZHMgZHlu
YW1pYyBsaWJyYXJ5IgoJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQoJZGVwZW5kcyBvbiBCUjJfU1RB
VElDX0xJQlMKClJlZ2FyZHMsIEJlcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
