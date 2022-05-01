Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B924C433F5
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 10:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A723409F8;
	Sun,  1 May 2022 10:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2RaTjmUoU3Md; Sun,  1 May 2022 10:40:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0776409F5;
	Sun,  1 May 2022 10:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4DB241BF479
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 10:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B756607C7
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 10:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=yuriev.ru
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JQEkoKWCDmnv for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 10:40:21 +0000 (UTC)
X-Greylist: delayed 00:06:57 by SQLgrey-1.8.0
Received: from forward500j.mail.yandex.net (forward500j.mail.yandex.net
 [IPv6:2a02:6b8:0:801:2::110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7CE560736
 for <buildroot@buildroot.org>; Sun,  1 May 2022 10:40:20 +0000 (UTC)
Received: from myt6-0d043a4812e9.qloud-c.yandex.net
 (myt6-0d043a4812e9.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:212b:0:640:d04:3a48])
 by forward500j.mail.yandex.net (Yandex) with ESMTP id DFC636CB67D7;
 Sun,  1 May 2022 13:33:15 +0300 (MSK)
Received: from 2a02:6b8:c12:239b:0:640:aaa7:a2dc
 (2a02:6b8:c12:239b:0:640:aaa7:a2dc [2a02:6b8:c12:239b:0:640:aaa7:a2dc])
 by myt6-0d043a4812e9.qloud-c.yandex.net (mxback/Yandex) with HTTP id
 AXERnGHgpW21-XFgKusS0; Sun, 01 May 2022 13:33:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yuriev.ru; s=mail;
 t=1651401195; bh=JxtWE6YgTfDMKKOtm5PjHMGYpS8b7QhxboJtytKXhT8=;
 h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
 b=XJjKBhCEoDU2gvYZ1UqS1Im6Z3+6B4RMlFKRHB/gFj/Fk63r4pl0shzRuze7lcicU
 gfvWwCLmqZ680mQhHqOu0QFuOEEsz1M9XptgrVRmdiaZRvME6iGftc0SjFRpgnV8Qq
 ahT83rvsfsRjV1URSp3zDEXqQwqZFNe7J/EJKr/o=
Authentication-Results: myt6-0d043a4812e9.qloud-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Received: by myt6-aaa7a2dc5b3e.qloud-c.yandex.net with HTTP;
 Sun, 01 May 2022 13:33:15 +0300
From: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= <leo@yuriev.ru>
Envelope-From: clip@yuriev.ru
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
In-Reply-To: <20220501074117.fGd4wFu8@myt5-83224607f841.qloud-c.yandex.net>
References: <20220501074117.fGd4wFu8@myt5-83224607f841.qloud-c.yandex.net>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Sun, 01 May 2022 13:33:15 +0300
Message-Id: <753111651398148@mail.yandex.ru>
Subject: [Buildroot] Autobuilder failures: microblazeel and
 toolchainfile.cmake with -D_FILE_OFFSET_BITS=64
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============6422065387378885074=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6422065387378885074==
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj4rIGJ1aWxkcm9vdEAsIGphbWVzLmhpbGxpYXJkMUA8L2Rpdj48ZGl2PsKgPC9kaXY+PGRp
dj5IaSwgQWxsLjxiciAvPjxiciAvPlNlZW1zIHRoZXJlIGlzIGEgQ01ha2UncyBhbmQvb3IgZ2xp
YmMncyBwcm9ibGVtKHMpIHdpdGggdGhlIGAtRF9GSUxFX09GRlNFVF9CSVRTPTY0YCBmb3IgbWlj
cm9ibGF6ZWVsLjxkaXY+SSBhc3N1bWUgdGhhdCBhIGB0b29sY2hhaW5maWxlLmNtYWtlYCBjb250
YWlucyBkZWZpbml0aW9ucyB0aGF0IGRvbid0IGNvbXBsaWFuY2UgdG8gZ2xpYmMgYW5kL29yIGtl
cm5lbCBjb25maWd1cmF0aW9uKHMpLjwvZGl2PjxkaXY+PGJyIC8+LS0tPGJyIC8+wqA8L2Rpdj5J
IHJlY2VpdmVkIGFuIGJ1aWxkIGVycm9yIG5vdGlmaWNhdGlvbiBvZiBhIHBhY2thZ2UgSSBzdXBw
b3J0OiA8YSBocmVmPSJodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8wYzUy
ZDMyMDI4NTQ1MjZkZTM1NzcwZGY2ZjU4MGY5YjRhZDRjNTg4IiByZWw9Im5vb3BlbmVyIG5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy8wYzUyZDMyMDI4NTQ1MjZkZTM1NzcwZGY2ZjU4MGY5YjRhZDRjNTg4PC9hPjxkaXY+PGJy
IC8+PC9kaXY+SW4gZmFjdCwgYHN0YXRpY19hc3NlcnQoKWAgd2FzIHRyaWdnZXJlZCwgY2hlY2tp
bmcgYSBjb21wbGlhbmNlIG9mIHRoZSBgb2ZmX3RgIHR5cGUgYW5kIHRoZSBgc3RydWN0IGZsb2Nr
YCBmaWVsZHMgZm9yIGBmY250bCgpYCBjYWxsOjxiciAvPi4uLjxiciAvPiNpZm5kZWYgT0ZGX1Rf
TUFYPGJyIC8+I2RlZmluZSBPRkZfVF9NQVggwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgXDxiciAvPsKgKCgoc2l6ZW9mKG9mZl90
KSAmZ3Q7IDQpID8gSU5UNjRfTUFYIDogSU5UMzJfTUFYKSAmYW1wOyB+KHNpemVfdCkweGZmZmYp
PGJyIC8+I2VuZGlmPGJyIC8+Li4uPGJyIC8+wqBzdHJ1Y3QgZmxvY2sgbG9ja19vcDs8YnIgLz7C
oFNUQVRJQ19BU1NFUlQoc2l6ZW9mKG9mZl90KSAmbHQ7PSBzaXplb2YobG9ja19vcC5sX3N0YXJ0
KSAmYW1wOyZhbXA7PGJyIC8+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2l6ZW9mKG9m
Zl90KSAmbHQ7PSBzaXplb2YobG9ja19vcC5sX2xlbikgJmFtcDsmYW1wOzxiciAvPsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoE9GRl9UX01BWCA9PSAob2ZmX3QpT0ZGX1RfTUFYKTs8L2Rp
dj48ZGl2PsKgPC9kaXY+PGRpdj5UaGlzIHBhY2thZ2UgYnVpbGQgaXMgdmlhIENNYWtlIGFuZCBp
biB0aGUgbG9ncyBJIHNlZSB0aGUgYC1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRf
U09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjRgIGZsYWdzIHdoaWNoIHByb3ZpZGVkL2FkZGVk
IGJ5IENNYWtlIGJ1dCBub3QgYW55IG9mIG15IENNYWtlTGlzdHMudHh0PC9kaXY+PGRpdj7CoDwv
ZGl2PjxkaXY+U28gSSBhc3N1bWUgdGhhdCBhIGB0b29sY2hhaW5maWxlLmNtYWtlYCBmb3IgbWlj
cm9ibGF6ZWVsIGNvbnRhaW5zIGRlZmluaXRpb25zIHRoYXQgZG8gbm90IGNvbXBsaWFuY2UgdG8g
dGhlIGNvbmZpZ3VyYXRpb24gb2YgZ2xpYmMgYW5kL29yIHRoZSB0YXJnZXQncyBrZXJuZWwuPC9k
aXY+PGRpdj48YnIgLz5SZWdhcmRzLDxiciAvPkxlb25pZC48L2Rpdj4=

--===============6422065387378885074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6422065387378885074==--
