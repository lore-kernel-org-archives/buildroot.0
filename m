Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A075C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 19:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A7B40FD3;
	Sun, 17 Apr 2022 19:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgpSEKt9Q7Qb; Sun, 17 Apr 2022 19:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C157C4091F;
	Sun, 17 Apr 2022 19:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C22B1BF38C
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 19:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6924A84008
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 19:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lt1yU1JSHiOH for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 19:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 436BF83F10
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 19:36:12 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 28A0EC5550
 for <buildroot@buildroot.org>; Sun, 17 Apr 2022 19:36:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A73F01BF205;
 Sun, 17 Apr 2022 19:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650224163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+yz2x1vJkBnpwCFmRZmNFD6XZzd2Lx1OfjUhN74YJL4=;
 b=W4LTH0zDaDgn8EejrU56wWqfXfCP5PGejUoF7CASzMan2k6T9IWfevdkbnbeY5TLuyDHQW
 uHLhQO1FhloCuEMoZ091N8u7YGrH4q7X9f6Zp4p/Jg2BLWDE9ZFAroHhUXEz0oFOJ4Tqm3
 OTsWh7FiykZa27A2lnfeN6XgIiJUyhmxUEFxnB49K3U8HRocvEu2OBEcpsFjSTRu02GItQ
 DIxczuEX2qvT43DsY4PYSlWZvo0BoEXxJRBMWD8/4cWzz1t6FvvV7BGr6dev+nMRJkrrJR
 dm2MWNeN9+Cmqjt/KTeKyR0s+wtdc+K2K9E+FWWnrXMi+h1LYDi3gHBQwPkxXA==
Date: Sun, 17 Apr 2022 21:36:01 +0200
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20220417213601.78389ca7@windsurf>
In-Reply-To: <20220415083657.357a65ce@bootlin.com>
References: <20220414203059.1818820-1-fontaine.fabrice@gmail.com>
 <20220415083657.357a65ce@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/php-apcu: needs threads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Herve Codina via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVydsOpLAoKT24gRnJpLCAxNSBBcHIgMjAyMiAwODozNjo1NyArMDIwMApIZXJ2ZSBD
b2RpbmEgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgoKPiBB
Y2tlZC4KCklmIHlvdSB3YW50IHlvdXIgQWNrZWQtYnkgdG8gYmUgcmVjb3JkZWQgYnkgcGF0Y2h3
b3JrLCBpdCBuZWVkcyB0byBiZSBhCmZ1bGwgQWNrZWQtYnk6LCBmb2xsb3dlZCBieSB5b3VyIG5h
bWUgYW5kIGUtbWFpbC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0
cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
