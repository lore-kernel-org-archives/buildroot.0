Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461B6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 20:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 043A383E5A;
	Tue, 26 Apr 2022 20:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cOE7BKB_ZXcg; Tue, 26 Apr 2022 20:50:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 260908151E;
	Tue, 26 Apr 2022 20:50:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A6021BF5AD
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3866B414C4
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 20:50:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3IMwbxn7wgd for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 20:50:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC37441497
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 20:49:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 79DBF20005;
 Tue, 26 Apr 2022 20:49:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1njS8C-002LIO-JP; Tue, 26 Apr 2022 22:49:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Dario Binacchi via buildroot <buildroot@buildroot.org>
References: <20220406211034.3672-1-dariobin@libero.it>
Date: Tue, 26 Apr 2022 22:49:56 +0200
In-Reply-To: <20220406211034.3672-1-dariobin@libero.it> (Dario Binacchi via
 buildroot's message of "Wed, 6 Apr 2022 23:10:34 +0200")
Message-ID: <877d7bk1sb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/qemu: fix host-qemu compilation
 with recent GCC
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIkRhcmlvIiA9PSBEYXJpbyBCaW5hY2NoaSB2aWEgYnVpbGRyb290IDxidWlsZHJvb3RA
YnVpbGRyb290Lm9yZz4gd3JpdGVzOgoKID4gRml4ZXM6CiA+IGNjMTogZXJyb3I6IOKAmC1mY2Yt
cHJvdGVjdGlvbuKAmSBpcyBub3QgY29tcGF0aWJsZSB3aXRoIHRoaXMgdGFyZ2V0CgogPiBUaGUg
bmV3IFVidW50dSBHQ0MgcGFja2FnZXMgKGUuZy4gVWJ1bnR1IDExLjIuMC03dWJ1bnR1MiwgMTEu
Mi4wKSB0dXJuCiA+IG9uIOKAmC1mY2YtcHJvdGVjdGlvbuKAmSBnbG9iYWxseSwgd2hpY2ggY2F1
c2VzIGEgYnVpbGQgZmFpbHVyZSBpbiB0aGUgeDg2CiA+IHJlYWxtb2RlIGNvZGUuIFR1cm4gaXQg
b2ZmIGV4cGxpY2l0bHkgb24gY29tcGlsZXJzIHRoYXQgdW5kZXJzdGFuZCB0aGlzCiA+IG9wdGlv
bi4KCiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpb2JpbkBsaWJlcm8uaXQ+
CiA+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxh
c29sdXRpb25zLmNvbT4KCkNvbW1pdHRlZCB0byAyMDIyLjAyLngsIHRoYW5rcy4KCi0tIApCeWUs
IFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
