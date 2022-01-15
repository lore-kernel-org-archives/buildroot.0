Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBCAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:24:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE69A81CFE;
	Sat, 15 Jan 2022 15:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gfFRP39ioATX; Sat, 15 Jan 2022 15:24:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3545081CE9;
	Sat, 15 Jan 2022 15:24:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F0B8F1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77C84010E
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtPAmWd-Kb0y for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:24:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 741CE40004
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:24:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B73DE40005;
 Sat, 15 Jan 2022 15:24:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1n8kvB-00058M-TW; Sat, 15 Jan 2022 16:24:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunojpg@gmail.com>
References: <CAEXMXLRZ5d3RaipEw3ftPfmqLCyYb0CFTyR+oz34COWBVkKfZA@mail.gmail.com>
 <CAEXMXLQVQr_837fH5jR-a0HTfnGZo6Fb+meJLDHh5A1B=_=0QA@mail.gmail.com>
Date: Sat, 15 Jan 2022 16:24:49 +0100
In-Reply-To: <CAEXMXLQVQr_837fH5jR-a0HTfnGZo6Fb+meJLDHh5A1B=_=0QA@mail.gmail.com>
 ("Nuno =?utf-8?Q?Gon=C3=A7alves=22's?= message of "Wed, 15 Dec 2021
 12:00:03 +0000")
Message-ID: <87ilul2f9a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] connman: remove iptables as a fixed
 dependency
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

Pj4+Pj4gIk51bm8iID09IE51bm8gR29uw6dhbHZlcyA8bnVub2pwZ0BnbWFpbC5jb20+IHdyaXRl
czoKCiA+IGNvbm5tYW4gbWlnaHQgZGVwZW5kIG9uIGlwdGFibGVzIG9yIG5mdGFibGVzLCBhbmQg
dGhvc2UgZGVwZW5kZW5jaWVzCiA+IGFyZSBhbHJlYWR5IHNlbGVjdGVkIGxhdGVyIGluIHRoaXMg
ZmlsZSBhcyByZXF1aXJlZC4KCiA+IFNpZ25lZC1vZmYtYnk6IE51bm8gR29uY2FsdmVzIDxudW5v
anBnQGdtYWlsLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIxLjAyLnggYW5kIDIwMjEuMTEueCwgdGhh
bmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
