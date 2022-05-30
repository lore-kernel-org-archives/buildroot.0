Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91089C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B12441B6F;
	Mon, 30 May 2022 20:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id akBOKlUHaMLx; Mon, 30 May 2022 20:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D62541966;
	Mon, 30 May 2022 20:23:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75BD41BF31A
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72E12827AF
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DEEBtcIOY8rL for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:23:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 037F6830A8
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:23:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f587:e70b:15ff:66a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 663BE5FF10;
 Mon, 30 May 2022 22:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653942221;
 bh=GRKtfl/JQf1JLr5llJtvc0moK6od3vW2LdkxBT5duHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jpwFqTIrgI3Up+iY+A7eQpP1M0yV38z1PTscKU7mEmuDIa1qaHQntkeWnW2M71hbB
 zIGpYPNjIYly4NlNeLOuZGsSNpT9yPBrljnxlr9wrcm79VyVNOtWu7DJ+6KeZQhgeu
 sNNcjrYfIqrnSp2/QnbK9CepQwjiPPP6oSkvxu4JNthKpafOCqOUvlJ/QIYpzSRaI+
 +sdcEWESflDZgWRWK6blAUmO4d7ge48eE/egapwkv9TW02DE4IzoLJGFh6Vfid0FA+
 1huQS7it8LaqXEpcz4VM45ndytqtaa9FH81P7Y6UN7K1nJW6dw/mVQ6R1oigeBpLw/
 6hgg1oVViJI4g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 30 May 2022 22:23:39 +0200
Date: Mon, 30 May 2022 22:23:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220530202339.GA1390376@scaer>
References: <20220527112146.387164-1-romain.naour@gmail.com>
 <20220528100508.GE301044@scaer>
 <f76f9cc6-4188-e92a-a753-b962849f2230@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f76f9cc6-4188-e92a-a753-b962849f2230@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] boot/edk2: fix gcc 11 Werror
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

Um9tYWluLCBBbGwsCgpPbiAyMDIyLTA1LTMwIDIxOjA0ICswMjAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDI4LzA1LzIwMjIgw6AgMTI6MDUsIFlhbm4gRS4gTU9SSU4gYSDDqWNy
aXTCoDoKPiA+IE9uIDIwMjItMDUtMjcgMTM6MjEgKzAyMDAsIFJvbWFpbiBOYW91ciBzcGFrZSB0
aHVzbHk6Cj4gPj4gQmFja3BvcnQgYSBwYXRjaCBbMV0gaW5jbHVkZWQgaW4gZWRrMi1zdGFibGUy
MDIyMDIgcmVsZWFzZS4KWy0tU05JUC0tXQo+IEl0IHNlZW1zIHRoZSBwYXRjaCBmaWxlIGhhcyBi
ZWVuIGNvcnJ1cHRlZCBieSBwYXRjaHdvcms6ClstLVNOSVAtLV0KPiBJdCdzIGR1ZSB0byBsaW5l
IGVuZGluZy4KPiBTZWUgYXR0YWNobWVudCBmaWxlLgoKQXMgZGlzY3Vzc2VkIG9uIElSQzogdGhp
cyBpcyBhbHNvIGJvcmtlZCBzb21laG93Li4uCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKLS0g
Ci4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVt
YmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2
MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18g
ICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTog
IFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5p
cy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJh
Y3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
