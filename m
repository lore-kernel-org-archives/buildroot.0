Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00A4C43217
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 051AB60BAA;
	Sun, 13 Nov 2022 14:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 051AB60BAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDqZpYbpLVVw; Sun, 13 Nov 2022 14:02:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 371F460B2B;
	Sun, 13 Nov 2022 14:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371F460B2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3AD221BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C9AC40881
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9AC40881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z97blohUBHsA for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:02:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E5E40879
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 96E5E40879
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:02:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 425AC13F8CC;
 Sun, 13 Nov 2022 15:02:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Nov 2022 15:02:06 +0100
Date: Sun, 13 Nov 2022 15:02:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nuno =?utf-8?Q?Gon=C3=A7alves?= <nunog@fr24.com>
Message-ID: <20221113140206.GF2123054@scaer>
References: <20221110140054.252389-1-nunog@fr24.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110140054.252389-1-nunog@fr24.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1668348129;
 bh=GD7PQYyanUz6sqp+27xFZksA1koBoBszkZP5YXaIOFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VbjYVd3M9ee6RhMFHs6eDUEfMjXJ5sz+fYs3eIwqNJ9eRs+2fdp8kSGMXl3kfx737
 Cj3dfU42WrxV7uEtAUSFfXfMu8APVmQdasX7ilBt1E/yLHctZjGUJQA8HrgXQfZl28
 S3+rZ/Ip1/dSYLVZh+3ty11GodaI9zGZw7hSyK1ZcggGTUzfSz11ald8xly2nzW7I0
 bGO8+ZrWUtR12h6wJdZStl5Fwp+RnWWOetXHfx9rHWgpSUWA+jiuejzIU2NBHuWnn0
 U6Pv4KCQKYcr3OyZCNIv89HoPnYEGadsTMz0zVTy7xzYmIwzabXQToAX/6FprKmrBS
 Nw21iR8s4wNIQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VbjYVd3M
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TnVubywgQWxsLAoKT24gMjAyMi0xMS0xMCAxNDowMCArMDAwMCwgTnVubyBHb27Dp2FsdmVzIHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IElmIFRaREFUQSBpcyBidWlsdCB0aGVuIHVzZSBh
Y3R1YWwgem9uZWluZm8gcGF0aC4KPiAKPiBPdGhlcndpc2UgZXhwbGljaXRseSBkaXNhYmxlIGl0
IHRvIGF2b2lkIGluY2x1ZGluZyB0aGUgaG9zdCBwYXRoLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE51
bm8gR29uw6dhbHZlcyA8bnVub2dAZnIyNC5jb20+CgpCb3RoIGFwcGxpZWQgdG8gbWFzdGVyLCBh
ZnRlciBleHBhbmRpbmcgdGhlIGNvbW1pdCBsb2dzLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKPiAtLS0KPiAgcGFja2FnZS9zdWRvL3N1ZG8ubWsgfCAxICsKPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3Vkby9zdWRv
Lm1rIGIvcGFja2FnZS9zdWRvL3N1ZG8ubWsKPiBpbmRleCAxODI2ZjcyMDE3Li4yOGNmY2JiMWUy
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvc3Vkby9zdWRvLm1rCj4gKysrIGIvcGFja2FnZS9zdWRv
L3N1ZG8ubWsKPiBAQCAtMTYsNiArMTYsNyBAQCBTVURPX1NFTElOVVhfTU9EVUxFUyA9IHN1ZG8K
PiAgIyBUaGlzIGlzIHRvIGF2b2lkIHN1ZG8ncyBtYWtlIGluc3RhbGwgZnJvbSBjaG93bigpaW5n
IGZpbGVzIHdoaWNoIGZhaWxzCj4gIFNVRE9fSU5TVEFMTF9UQVJHRVRfT1BUUyA9IElOU1RBTExf
T1dORVI9IiIgREVTVERJUj0iJChUQVJHRVRfRElSKSIgaW5zdGFsbAo+ICBTVURPX0NPTkZfT1BU
UyA9IFwKPiArCS0td2l0aC10emRpcj0kKGlmICQoQlIyX1BBQ0tBR0VfVFpEQVRBKSwvdXNyL3No
YXJlL3pvbmVpbmZvLG5vKSBcCj4gIAktLXdpdGhvdXQtbGVjdHVyZSBcCj4gIAktLXdpdGhvdXQt
c2VuZG1haWwgXAo+ICAJLS13aXRob3V0LXVtYXNrIFwKPiAtLSAKPiAyLjM4LjEKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0t
LS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFT
Q0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGlyYWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29m
dHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8
CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0tLS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAg
ICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8CnwgaHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8
IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0t
LS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
