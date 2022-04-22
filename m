Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FDAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96CB241C84;
	Fri, 22 Apr 2022 18:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x_L1RbM_yM_N; Fri, 22 Apr 2022 18:16:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7425A41C74;
	Fri, 22 Apr 2022 18:16:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E57631BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:16:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E22CD61033
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GeypOjOTtVu5 for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:16:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FD7560F18
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:16:33 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 425AD20E7045;
 Fri, 22 Apr 2022 11:16:31 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 425AD20E7045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650651392;
 bh=rNjNSx0FnVGImFiIaB/hDexIDSR6m9HU1s3Fd1WVjKo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LigPDjH2WKTBoLYUZN7T5qW/h6t/enZWk3TWSy5qUKWpDZZrK05+Z96/AkEtL9zGO
 7rw/kf0pZNrhhwjap9YCauKaxPGdGF9jZa4+NPOZOnddKr/p646T/L60hDy7ZKIB5w
 r1fFi+Jve8uEtEGjlFCXDSEPFKFqvxJZCWb8iwXM=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 19:16:11 +0100
Message-Id: <20220422181612.51246-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422181612.51246-1-flaniel@linux.microsoft.com>
References: <20220422181612.51246-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 1/2] package/libbpf: build for host
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogRnJhbmNpcyBMYW5pZWwgPGZsYW5pZWxAbGludXgubWljcm9zb2Z0LmNv
bT4KLS0tCiBwYWNrYWdlL2xpYmJwZi9saWJicGYubWsgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGliYnBmL2xpYmJwZi5tayBiL3BhY2thZ2UvbGliYnBmL2xpYmJwZi5tawppbmRleCBk
NjkxNDc1N2Q3Li43MDkyNzdmYWM0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYmJwZi9saWJicGYu
bWsKKysrIGIvcGFja2FnZS9saWJicGYvbGliYnBmLm1rCkBAIC0xMCw2ICsxMCw3IEBAIExJQkJQ
Rl9MSUNFTlNFID0gR1BMLTIuMCwgTEdQTC0yLjEsIEJTRC0yLUNsYXVzZQogTElCQlBGX0xJQ0VO
U0VfRklMRVMgPSBMSUNFTlNFIExJQ0VOU0UuQlNELTItQ2xhdXNlIExJQ0VOU0UuTEdQTC0yLjEK
IExJQkJQRl9DUEVfSURfVkVORE9SID0gbGliYnBmX3Byb2plY3QKIExJQkJQRl9ERVBFTkRFTkNJ
RVMgPSBob3N0LWJpc29uIGhvc3QtZmxleCBob3N0LXBrZ2NvbmYgZWxmdXRpbHMgemxpYgorSE9T
VF9MSUJCUEZfREVQRU5ERU5DSUVTID0gaG9zdC1iaXNvbiBob3N0LWZsZXggaG9zdC1wa2djb25m
IGhvc3QtZWxmdXRpbHMgaG9zdC16bGliCiBMSUJCUEZfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiAK
IGRlZmluZSBMSUJCUEZfQlVJTERfQ01EUwpAQCAtMzgsNCArMzksMjggQEAgZGVmaW5lIExJQkJQ
Rl9JTlNUQUxMX1RBUkdFVF9DTURTCiAJCS1DICQoQEQpL3NyYyBpbnN0YWxsIERFU1RESVI9JChU
QVJHRVRfRElSKQogZW5kZWYKIAorZGVmaW5lIEhPU1RfTElCQlBGX0lOU1RBTExfQ01EUworCSQo
SE9TVF9NQUtFX0VOVikgJChIT1NUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIFwKKwkJLUMgJChA
RCkvc3JjIGluc3RhbGwgaW5zdGFsbF91YXBpX2hlYWRlcnMgREVTVERJUj0kKEhPU1RfRElSKQor
CisJIyBXZSBuZWVkIHRvIGluc3RhbGxfdWFwaV9oZWFkZXJzIHNvIHdlIGhhdmUgYnRmLmggdG8g
Y29tcGlsZQorCSMgaG9zdC1wYWhvbGUuCisJIyBOb25ldGhlbGVzcywgdGhpcyB0YXJnZXQgYWRk
cyBicGYuaCB3aGljaCBnZW5lcmF0ZXMgYSBjb25mbGljdCB3aGVuCisJIyBidWlsZGluZyB0aGUg
a2VybmVsOgorCSMgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGxpYmJwZl9pbnRlcm5hbC5oOjE3OjAs
IGZyb20gc3Ryc2V0LmM6OToKKwkjIHJlbG9fY29yZS5oOjEwOjY6IGVycm9yOiBuZXN0ZWQgcmVk
ZWZpbml0aW9uIG9mIOKAmGVudW0gYnBmX2NvcmVfcmVsb19raW5k4oCZCisJIyBlbnVtIGJwZl9j
b3JlX3JlbG9fa2luZCB7CisJIyBefn5+fn5+fn5+fn5+fn5+fn4KKwkjIHJlbG9fY29yZS5oOjEw
OjY6IGVycm9yOiByZWRlY2xhcmF0aW9uIG9mIOKAmGVudW0gYnBmX2NvcmVfcmVsb19raW5k4oCZ
CisJIyBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGliYnBmX2xlZ2FjeS5oOjEzOjAsCisJIyAJCWZy
b20gbGliYnBmX2ludGVybmFsLmg6MTYsCisJIyAJCWZyb20gc3Ryc2V0LmM6OToKKwkjIC9ob21l
L2ZyYW5jaXMvYnVpbGRyb290L291dHB1dC9ob3N0L2luY2x1ZGUvbGludXgvYnBmLmg6NjQ5Nzo2
OiBub3RlOiBvcmlnaW5hbGx5IGRlZmluZWQgaGVyZQorCSMgZW51bSBicGZfY29yZV9yZWxvX2tp
bmQgeworCSMgU28sIGJldHRlciB0byByZW1vdmUgcmVtb3ZlIGl0IG5vdyBzaW5jZSB3ZSBkbyBu
b3QgbmVlZCBpdCB0byBidWlsZAorCSMgaG9zdC1wYWhvbGUuCisJcm0gJChIT1NUX0RJUikvaW5j
bHVkZS9saW51eC9icGYuaAorZW5kZWYKKwogJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKKyQo
ZXZhbCAkKGhvc3QtZ2VuZXJpYy1wYWNrYWdlKSkKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
