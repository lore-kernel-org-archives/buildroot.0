Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E6DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 12:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03FA381A9C;
	Tue, 15 Nov 2022 12:55:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03FA381A9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m7iA2ZG3N547; Tue, 15 Nov 2022 12:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF0B8132D;
	Tue, 15 Nov 2022 12:55:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF0B8132D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 247161BF348
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00A168132D
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 12:55:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00A168132D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Z3H0wIVyHl4 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 12:55:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6D28131A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B6D28131A
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 12:55:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0C7E61C0004;
 Tue, 15 Nov 2022 12:55:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ouvTd-008dRt-1J; Tue, 15 Nov 2022 13:55:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= via buildroot <buildroot@buildroot.org>
References: <20221110140054.252389-1-nunog@fr24.com>
Date: Tue, 15 Nov 2022 13:55:45 +0100
In-Reply-To: <20221110140054.252389-1-nunog@fr24.com> ("Nuno =?utf-8?Q?Gon?=
 =?utf-8?Q?=C3=A7alves?= via
 buildroot"'s message of "Thu, 10 Nov 2022 14:00:53 +0000")
Message-ID: <87bkp8gywe.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] packages/sudo: explicitly set with-tzdir
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
Cc: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk51bm8iID09IE51bm8gR29uw6dhbHZlcyB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RA
YnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gSWYgVFpEQVRBIGlzIGJ1aWx0IHRoZW4gdXNlIGFj
dHVhbCB6b25laW5mbyBwYXRoLgogPiBPdGhlcndpc2UgZXhwbGljaXRseSBkaXNhYmxlIGl0IHRv
IGF2b2lkIGluY2x1ZGluZyB0aGUgaG9zdCBwYXRoLgoKID4gU2lnbmVkLW9mZi1ieTogTnVubyBH
b27Dp2FsdmVzIDxudW5vZ0BmcjI0LmNvbT4KCkNvbW1pdHRlZCB0byAyMDIyLjA4LnggYW5kIDIw
MjIuMDIueCwgdGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
