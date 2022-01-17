Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69604C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 18:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D25381346;
	Mon, 17 Jan 2022 18:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uV69rv3FQD1q; Mon, 17 Jan 2022 18:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FFF88132A;
	Mon, 17 Jan 2022 18:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B11921BF2F3
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F97E60B99
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 18:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zw5ywdWt2JpE for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 18:55:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4167160B96
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 18:55:09 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9X9onBaOwBBmw9X9onvOyz; Mon, 17 Jan 2022 19:55:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642445708; bh=QhjxfQa8m72X4MP4dKILSNhm5q2HKieaTM5Jf1k04OQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=DaTfmcercJEtDkb7wsAHi8nQU+nQQgW+0Qt5l+aT7vPOWxe5AJG+t0xz0cGdxkNtD
 vVusXywkbScCZtuKqiwSbJ1hfdKumL1coVvYdJKRJIHfbyTOTKkmy4BvORTHV8hNI5
 py6wbDtC3HVJ/ikdrIusCNpIxxAAy68Wz6OhbwfQaxnqOG/esl+oa41siMjdCFI/bk
 XZOCtRxvVcbM3hLuiDEnBEUvkbqyucnXGT0vJJzLfsuM24MSKmkuj0FInKOFohfhgw
 xNMXGGbEYSqJlywysJFosO430sfXC6Nu8IKJSs5lH1HPKzh7MhXGgq7EwWVwsLpgA9
 hajsqKJ+oeBqA==
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 buildroot@buildroot.org
References: <20211106181424.299041-1-peron.clem@gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <e10d6399-a688-b455-9a71-c4b8d4159ab4@benettiengineering.com>
Date: Mon, 17 Jan 2022 19:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211106181424.299041-1-peron.clem@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfGlfXAzE711vQvSYv/R18QU/YZbeC+eA6gvoI6eKQd4cDRnSdphnMNFJMIEM/hJnOeMZTdnPsp9SFlQLxdK/7Aoigw0rxon+gyn8UrMK8U6o4Xm80N+Q
 8GjK575c2+KBVVWszB2Q7h6h/E8OoJ+eBScO7p2a8XhzSjYRUAffzFHgPkCuvIYWgGMhZfMR2ZSM1RiuEzv0EOJkjVtBGk1Qdg7WbEO3Wmebob9/HpnguBJc
 PrG2WngPZommT/6hP8zoKw==
Subject: Re: [Buildroot] [PATCH 1/2] configs/beelink_gs1: increase rootfs
 size to 120M
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2zDqW1lbnQsCgpPbiAwNi8xMS8yMSAxOToxNCwgQ2zDqW1lbnQgUMOpcm9uIHdyb3RlOgo+
IEZvciB0aGUgbW9tZW50IEJlZWxpbmsgR1MxIHVzZSBhIGRlZmF1bHQgcm9vdGZzIHNpemUgb2Yg
NjBNCj4gd2hpY2ggbWFrZSBzb21ldGltZXMgdGhlIGJ1aWxkIGZhaWxlZCBkdWUgdG8gbWlzc2lu
ZyBzcGFjZS4KPiAKPiBJbmNyZWFzZSB0aGUgcm9vdGZzIHNpemUgdG8gMTIwTS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgoKUmV2aWV3
ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcu
Y29tPgoKLS0gCkdpdWxpbyBCZW5ldHRpCkJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCgo+IC0tLQo+
ICAgY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdzL2JlZWxpbmtfZ3MxX2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCj4gaW5kZXggZTg4ZjNlM2I2
OS4uMTg3MmFhYmRmMCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZp
Zwo+ICsrKyBiL2NvbmZpZ3MvYmVlbGlua19nczFfZGVmY29uZmlnCj4gQEAgLTI0LDYgKzI0LDcg
QEAgQlIyX1BBQ0tBR0VfQVVUT1NTSD15Cj4gICBCUjJfUEFDS0FHRV9EUk9QQkVBUj15Cj4gICBC
UjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiAgIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15Cj4g
K0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKPiAgIAo+ICAgIyBGaXJtd2FyZQo+
ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Cj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
