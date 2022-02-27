Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D2EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 19:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233B781BB2;
	Sun, 27 Feb 2022 19:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gx-L-2GNvoOC; Sun, 27 Feb 2022 19:17:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B63F81B70;
	Sun, 27 Feb 2022 19:17:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A4F91BF356
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4654040148
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 19:16:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cDjpd4SKU0qC for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 19:16:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8DCF240143
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 19:16:56 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 25042200006;
 Sun, 27 Feb 2022 19:16:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nOP2K-00Dpn0-14; Sun, 27 Feb 2022 20:16:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>
References: <20220131202151.937124-1-joerg.krause@embedded.rocks>
Date: Sun, 27 Feb 2022 20:16:51 +0100
In-Reply-To: <20220131202151.937124-1-joerg.krause@embedded.rocks>
 (=?utf-8?Q?=22J=C3=B6rg?=
 Krause"'s message of "Mon, 31 Jan 2022 20:21:51 +0000")
Message-ID: <87v8x02k7w.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux: build after wireless-regdb if
 enabled for early loading support
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

Pj4+Pj4gIkrDtnJnIiA9PSBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5yb2Nr
cz4gd3JpdGVzOgoKID4gVG8gc3VwcG9ydCBidWlsZGluZyBpbiB0aGUgd2lyZWxlc3MgcmVndWxh
dG9yeSBkYXRhYmFzZSBmaWxlcyAocmVndWxhdG9yeS5kYiopCiA+IGludG8gdGhlIGtlcm5lbCB1
c2luZyB0aGUgQ09ORklHX0VYVFJBX0ZJUk1XQVJFIG9wdGlvbiwgd2UgbmVlZCB0byBlbnN1cmUg
dGhhdAogPiB0aGUgZGF0YWJhc2UgZmlsZXMgYXJlIGluc3RhbGxlZCBiZWZvcmUgdGhlIExpbnV4
IGtlcm5lbCBpcyBidWlsdC4KCiA+IFNpZ25lZC1vZmYtYnk6IErDtnJnIEtyYXVzZSA8am9lcmcu
a3JhdXNlQGVtYmVkZGVkLnJvY2tzPgoKQ29tbWl0dGVkIHRvIDIwMjEuMDIueCBhbmQgMjAyMS4x
MS54LCB0aGFua3MuCgotLSAKQnllLCBQZXRlciBLb3JzZ2FhcmQKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
