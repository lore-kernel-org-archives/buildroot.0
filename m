Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60EAC5AD4C
	for <buildroot@archiver.kernel.org>; Thu, 23 Nov 2023 17:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C9D740148;
	Thu, 23 Nov 2023 17:41:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C9D740148
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHrZKkVXjHZU; Thu, 23 Nov 2023 17:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6540740519;
	Thu, 23 Nov 2023 17:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6540740519
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7801BF3DD
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA07641FB8
 for <buildroot@lists.busybox.net>; Thu, 23 Nov 2023 17:41:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA07641FB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mKrYRrgB1g0 for <buildroot@lists.busybox.net>;
 Thu, 23 Nov 2023 17:41:14 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050:0:465::202])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0A42B41E3E
 for <buildroot@buildroot.org>; Thu, 23 Nov 2023 17:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A42B41E3E
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4SbllW6qCLz9srM;
 Thu, 23 Nov 2023 18:41:11 +0100 (CET)
From: Ralf Dragon <hypnotoad@lindra.de>
To: buildroot@buildroot.org
Date: Thu, 23 Nov 2023 18:41:05 +0100
Message-Id: <20231123174105.2435757-1-hypnotoad@lindra.de>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4SbllW6qCLz9srM
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lindra.de; s=MBO0001; t=1700761271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=k+trDuloxig3bW5QBeHtKqgu4aSXGQYHu3MZ/OYaUEs=;
 b=mRYJUwo3cEYpTZmDYr+AEI2VLjc+9RWUbmFAnl2RO8NQTVN1Eb3wGh3NjI4kMqPodf8GTv
 HqteetEeIfr2VQnAQr5mEts4dR5yFzGFmI4erZUAWRwSmWSo49I/Cby/WjwvPODjr3FBQU
 ffYFVlpCSgOo6/djBkSOgZEzOes7hcK9IzvR43W3wRCxqZ/EEFB5XZ19j4RWcJQXbG+3FH
 g8SqfrMSDt4B7Dr012tPEir1Qww+Fc7WfFVMw1VpoAk0RkzdNNMkZb29CVOXTHvPY9hnG/
 kOM4t6R9rjGLrdrByuOq/KDrDJRUqf9XM+74m1fxjenhqmCosbNlZCbMCq9MqA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=lindra.de header.i=@lindra.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=mRYJUwo3
Subject: [Buildroot] [PATCH 1/1] python-sip: fix compile error
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
Cc: Ralf Dragon <hypnotoad@lindra.de>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2l0aG91dCB0aGUgcGF0Y2gsIHB5dGhvbi1zaXAgZmFpbHMgd2l0aDoKCnNpcGxpYi5jOiBJbiBm
dW5jdGlvbiDigJhzaXBfYXBpX2dldF9mcmFtZeKAmToKc2lwbGliLmM6MTM3NTA6MjI6IGVycm9y
OiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1Y3QgX2ZyYW1l4oCZCjEzNzUw
IHwgICAgICAgICBmcmFtZSA9IGZyYW1lLT5mX2JhY2s7CgpTaWduZWQtb2ZmLWJ5OiBSYWxmIERy
YWdvbiA8aHlwbm90b2FkQGxpbmRyYS5kZT4KLS0tCiBwYWNrYWdlL3B5dGhvbi1zaXAvMDAwMi1m
aXhmcmFtZS5wYXRjaCB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNDYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9u
LXNpcC8wMDAyLWZpeGZyYW1lLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2lw
LzAwMDItZml4ZnJhbWUucGF0Y2ggYi9wYWNrYWdlL3B5dGhvbi1zaXAvMDAwMi1maXhmcmFtZS5w
YXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44NmViODc4YjExCi0t
LSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9weXRob24tc2lwLzAwMDItZml4ZnJhbWUucGF0Y2gK
QEAgLTAsMCArMSw0NiBAQAorU2lnbmVkLW9mZi1ieTogUmFsZiBEcmFnb24gPGh5cG5vdG9hZEBs
aW5kcmEuZGU+CisKK0luZGV4OiBob3N0LXB5dGhvbi1zaXAtNC4xOS4yNS9zaXBsaWIvc2lwLmgK
Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KKy0tLSBob3N0LXB5dGhvbi1zaXAtNC4xOS4yNS5vcmlnL3NpcGxpYi9zaXAu
aAorKysrIGhvc3QtcHl0aG9uLXNpcC00LjE5LjI1L3NpcGxpYi9zaXAuaAorQEAgLTE3OTksNyAr
MTc5OSw3IEBAIHR5cGVkZWYgc3RydWN0IF9zaXBBUElEZWYgeworICAgICBpbnQgKCphcGlfZ2V0
X3RpbWUpKFB5T2JqZWN0ICosIHNpcFRpbWVEZWYgKik7CisgICAgIFB5T2JqZWN0ICooKmFwaV9m
cm9tX3RpbWUpKGNvbnN0IHNpcFRpbWVEZWYgKik7CisgICAgIGludCAoKmFwaV9pc191c2VyX3R5
cGUpKGNvbnN0IHNpcFdyYXBwZXJUeXBlICopOworLSAgICBzdHJ1Y3QgX2ZyYW1lICooKmFwaV9n
ZXRfZnJhbWUpKGludCk7CisrICAgIFB5RnJhbWVPYmplY3QgKigqYXBpX2dldF9mcmFtZSkoaW50
KTsKKyAgICAgaW50ICgqYXBpX2NoZWNrX3BsdWdpbl9mb3JfdHlwZSkoY29uc3Qgc2lwVHlwZURl
ZiAqLCBjb25zdCBjaGFyICopOworICAgICBQeU9iamVjdCAqKCphcGlfdW5pY29kZV9uZXcpKFNJ
UF9TU0laRV9ULCB1bnNpZ25lZCwgaW50ICosIHZvaWQgKiopOworICAgICB2b2lkICgqYXBpX3Vu
aWNvZGVfd3JpdGUpKGludCwgdm9pZCAqLCBpbnQsIHVuc2lnbmVkKTsKK0luZGV4OiBob3N0LXB5
dGhvbi1zaXAtNC4xOS4yNS9zaXBsaWIvc2lwbGliLmMKKz09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKy0tLSBob3N0LXB5
dGhvbi1zaXAtNC4xOS4yNS5vcmlnL3NpcGxpYi9zaXBsaWIuYworKysrIGhvc3QtcHl0aG9uLXNp
cC00LjE5LjI1L3NpcGxpYi9zaXBsaWIuYworQEAgLTQ0OCw3ICs0NDgsNyBAQCBzdGF0aWMgUHlP
YmplY3QgKnNpcF9hcGlfZnJvbV9kYXRldGltZShjCisgc3RhdGljIGludCBzaXBfYXBpX2dldF90
aW1lKFB5T2JqZWN0ICpvYmosIHNpcFRpbWVEZWYgKnRpbWUpOworIHN0YXRpYyBQeU9iamVjdCAq
c2lwX2FwaV9mcm9tX3RpbWUoY29uc3Qgc2lwVGltZURlZiAqdGltZSk7Cisgc3RhdGljIGludCBz
aXBfYXBpX2lzX3VzZXJfdHlwZShjb25zdCBzaXBXcmFwcGVyVHlwZSAqd3QpOworLXN0YXRpYyBz
dHJ1Y3QgX2ZyYW1lICpzaXBfYXBpX2dldF9mcmFtZShpbnQpOworK3N0YXRpYyBQeUZyYW1lT2Jq
ZWN0ICpzaXBfYXBpX2dldF9mcmFtZShpbnQpOworIHN0YXRpYyBpbnQgc2lwX2FwaV9jaGVja19w
bHVnaW5fZm9yX3R5cGUoY29uc3Qgc2lwVHlwZURlZiAqdGQsCisgICAgICAgICBjb25zdCBjaGFy
ICpuYW1lKTsKKyBzdGF0aWMgUHlPYmplY3QgKnNpcF9hcGlfdW5pY29kZV9uZXcoU0lQX1NTSVpF
X1QgbGVuLCB1bnNpZ25lZCBtYXhjaGFyLAorQEAgLTEzNzQxLDEzICsxMzc0MSwxMyBAQCBzdGF0
aWMgaW50IHNpcF9hcGlfaXNfdXNlcl90eXBlKGNvbnN0IHNpCisgLyoKKyAgKiBSZXR1cm4gYSBm
cmFtZSBmcm9tIHRoZSBleGVjdXRpb24gc3RhY2suCisgICovCistc3RhdGljIHN0cnVjdCBfZnJh
bWUgKnNpcF9hcGlfZ2V0X2ZyYW1lKGludCBkZXB0aCkKKytzdGF0aWMgUHlGcmFtZU9iamVjdCAq
c2lwX2FwaV9nZXRfZnJhbWUoaW50IGRlcHRoKQorIHsKKy0gICAgc3RydWN0IF9mcmFtZSAqZnJh
bWUgPSBQeUV2YWxfR2V0RnJhbWUoKTsKKysgICAgUHlGcmFtZU9iamVjdCAqZnJhbWUgPSBQeUV2
YWxfR2V0RnJhbWUoKTsKKyAKKyAgICAgd2hpbGUgKGZyYW1lICE9IE5VTEwgJiYgZGVwdGggPiAw
KQorICAgICB7CistICAgICAgICBmcmFtZSA9IGZyYW1lLT5mX2JhY2s7CisrICAgICAgICBmcmFt
ZSA9IFB5RnJhbWVfR2V0QmFjayhmcmFtZSk7CisgICAgICAgICAtLWRlcHRoOworICAgICB9Cisg
CisKLS0gCjIuMzkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
