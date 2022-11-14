Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD2AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 14 Nov 2022 10:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DE2D815AD;
	Mon, 14 Nov 2022 10:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DE2D815AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5B7MNlRiZ9i; Mon, 14 Nov 2022 10:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CBFA81466;
	Mon, 14 Nov 2022 10:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CBFA81466
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 97A4A1BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8099960BCD
 for <buildroot@lists.busybox.net>; Mon, 14 Nov 2022 10:41:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8099960BCD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sLAf6zeYcZ2 for <buildroot@lists.busybox.net>;
 Mon, 14 Nov 2022 10:41:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B1DB60B99
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B1DB60B99
 for <buildroot@buildroot.org>; Mon, 14 Nov 2022 10:41:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8BB3CC000D;
 Mon, 14 Nov 2022 10:41:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouWtk-006iF2-KW; Mon, 14 Nov 2022 11:41:04 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
References: <20221004111528.384625-1-nunog@fr24.com>
 <20221004111528.384625-3-nunog@fr24.com>
Date: Mon, 14 Nov 2022 11:41:04 +0100
In-Reply-To: <20221004111528.384625-3-nunog@fr24.com> ("Nuno =?utf-8?Q?Gon?=
 =?utf-8?Q?=C3=A7alves=22's?=
 message of "Tue, 4 Oct 2022 12:15:28 +0100")
Message-ID: <87cz9plsxr.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] package/libopenssl: don't build afalgeng
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

Pj4+Pj4gIk51bm8iID09IE51bm8gR29uw6dhbHZlcyA8bnVub2dAZnIyNC5jb20+IHdyaXRlczoK
CiA+IEFmYWxnZW5nIGlzIG5vdCBjcm9zcy1jb21waWxlZCBzbyBpcyB1c2VsZXNzIGFuZCBsZWFr
cyBidWlsZCBob3N0IGluZm8KID4gU2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5v
Z0BmcjI0LmNvbT4KCkNvbW1pdHRlZCB0byAyMDIyLjA4LnggYW5kIDIwMjIuMDIueCwgdGhhbmtz
LgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
