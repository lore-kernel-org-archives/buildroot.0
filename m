Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2197C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 05:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 581BE8175A;
	Mon,  9 Jan 2023 05:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 581BE8175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szbseP2pX8u0; Mon,  9 Jan 2023 05:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A56F81758;
	Mon,  9 Jan 2023 05:12:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A56F81758
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EDA9A1BF3EF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7FC440920
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 05:12:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7FC440920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id whtpN5dy27ni for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 05:12:32 +0000 (UTC)
X-Greylist: delayed 00:06:40 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F9D403D8
Received: from mfwd01.mailplug.co.kr (mfwd01.mailplug.co.kr [14.63.160.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51F9D403D8
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 05:12:32 +0000 (UTC)
Received: (qmail 18192 invoked from network); 9 Jan 2023 14:05:46 +0900
Received: from wmail10.mailplug.com (121.156.118.13)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 9 Jan 2023 14:05:34 +0900
Received: (qmail 2470563 invoked from network); 9 Jan 2023 14:05:33 +0900
Received: from unknown (HELO sslauth56)
 (cherniaev.andrei@kairo.space@211.252.86.86)
 by 0 (qmail 1.03 + mailplug 2.0) with SMTP; 9 Jan 2023 14:05:33 +0900
From: AndreiCherniaev <cherniaev.andrei@kairo.space>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 14:05:24 +0900
Message-Id: <20230109050525.1560963-1-cherniaev.andrei@kairo.space>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Makefile: add good message when user try make
 O=$PWD -C path/to/buildroot without cd /tmp/build
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
Cc: AndreiCherniaev <dungeonlords789@yandex.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogQW5kcmVpQ2hlcm5pYWV2IDxkdW5nZW9ubG9yZHM3ODlAeWFuZGV4LnJ1PgoKaHR0cHM6
Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwKVGhlcmUgaXMgIjgu
NS7CoEJ1aWxkaW5nIG91dC1vZi10cmVlIi4gVGhlcmUgaXMgZXhhbXBsZSBvZiB1c2luZwokIGNk
IC90bXAvYnVpbGQ7IG1ha2UgTz0kUFdEIC1DIHBhdGgvdG8vYnVpbGRyb290CmJ1dCB3aGVuIHVz
ZXIgaWdub3JlIGNkIC90bXAvYnVpbGQ7IHRoZXJlIGlzIG1lc3NhZ2UKImVycm9yIFBsZWFzZSBj
b25maWd1cmUgQnVpbGRyb290IGZpcnN0IChlLmcuICJtYWtlIG1lbnVjb25maWciKSIKYnV0IHRo
aXMgbWVzc2FnZSBpcyBub3QgY29ycmVjdC4gSSBzdWdnZXN0IGEgbmV3IG1lc3NhZ2UgaW4gdGhp
cyBjYXNlLiBUaGlzIGlzIG1lc3NhZ2UgZnJvbSBteSBQQzoKImVycm9yIFBsZWFzZSBnbyB0byB5
b3VyIG91dHB1dCBkaXJlY3RvcnkgZmlyc3QgKGUuZy4gImNkIC9ob21lL3VzZXJuYW1lL0Rvd25s
b2Fkcy9teUdpdC9idWlsZHJvb3RfT19idWcvT19mb2xkZXI7IG1ha2UgbWVudWNvbmZpZyIpIgoK
U2lnbmVkLW9mZi1ieTogQW5kcmVpQ2hlcm5pYWV2IDxkdW5nZW9ubG9yZHM3ODlAeWFuZGV4LnJ1
PgotLS0KIE1ha2VmaWxlIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9NYWtlZmlsZSBiL01ha2VmaWxlCmluZGV4
IDg4ZjkwY2QyZmEuLjE3NmJlMTJhYzQgMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2Vm
aWxlCkBAIC05NDUsNyArOTQ1LDExIEBAIGVsc2UgIyBpZmVxICgkKEJSMl9IQVZFX0RPVF9DT05G
SUcpLHkpCiAjIEFsc28gZm9yICdhbGwnIHdlIGVycm9yIG91dCBhbmQgYXNrIHRoZSB1c2VyIHRv
IGNvbmZpZ3VyZSBmaXJzdC4KIC5QSE9OWTogbGludXggdG9vbGNoYWluCiBsaW51eCB0b29sY2hh
aW4gYWxsOiBvdXRwdXRtYWtlZmlsZQotCSQoZXJyb3IgUGxlYXNlIGNvbmZpZ3VyZSBCdWlsZHJv
b3QgZmlyc3QgKGUuZy4gIm1ha2UgbWVudWNvbmZpZyIpKQorCWlmZXEgKCQoTkVFRF9XUkFQUEVS
KSx5KSAgIyBpZmVxICgiJChvcmlnaW4gTykiLCAiY29tbWFuZCBsaW5lIikgIyBPIDo9ICQoQ1VS
RElSKS9vdXRwdXQKKwkJJChlcnJvciBQbGVhc2UgZ28gdG8geW91ciBvdXRwdXQgZGlyZWN0b3J5
IGZpcnN0IChlLmcuICJjZCAkKE8pOyBtYWtlIG1lbnVjb25maWciKSkKKwllbHNlCisJCSQoZXJy
b3IgUGxlYXNlIGNvbmZpZ3VyZSBCdWlsZHJvb3QgZmlyc3QgKGUuZy4gIm1ha2UgbWVudWNvbmZp
ZyIpKQorCWVuZGlmCiAJQGV4aXQgMQogCiBlbmRpZiAjIGlmZXEgKCQoQlIyX0hBVkVfRE9UX0NP
TkZJRykseSkKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
