Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2887BC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DB561039
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96DB561039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6612081C21;
	Fri, 12 Nov 2021 13:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otFkx7As8D2t; Fri, 12 Nov 2021 13:13:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A461081C0A;
	Fri, 12 Nov 2021 13:13:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 991241BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 952696060D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rGlzSc3kZeoe for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:13:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3398F6064F
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:13:09 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPA id 44308200004;
 Fri, 12 Nov 2021 13:13:07 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:12:53 +0100
Message-Id: <20211112131258.2671293-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/5] Add Alchemy build system and some
 related libs
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIHRoZSBQYXJyb3QgQWxjaGVteSBidWls
ZCBzeXN0ZW0gYXMgYQpob3N0IHRvb2wgKHBhdGNoIDEpLgpUaGlzIHRvb2wgaXMgdGhlbiB1c2Vk
IHRvIGJ1aWxkIHNldmVyYWwgbGlicyAocGF0Y2ggMiwgMyBhbmQgNCkuCkZpbmFseSAocGF0Y2gg
NSksIGEgdGVzdCBpcyBwcm92aWRlZCB0byBjaGVjayB0aGF0IHRoZSBiaW5hcmllcwp3ZXJlIGNv
cnJlY3RseSBidWlsdC4KCkFzIGl0IHdhcyBtZW50aW9ubmVkIGJ5IFRob21hcyBQZXRlYXp6b25p
IGluIHRoZSBwcmV2aW91cyByZXZpZXcsCmEgbmV3IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgd2Fz
IG5vdCBhZGRlZCBmb3IgdGhlIEFsY2hlbXkgYnVpbGQgc3lzdGVtLgpJbmRlZWQsIHdlIGRvIG5v
dCBleHBlY3QgdG8gaGF2ZSBhIHNpZ25pZmljYW50IG51bWJlciBvZiBwYWNrYWdlcyB0aGF0Cndp
bGwgcmVseSBvbiB0aGUgQWxjaGVteSBidWlsZCBzeXN0ZW0uCgpPZiBjb3Vyc2UsIHNob3VsZCB3
ZSBoYXZlIG1vcmUgb2YgdGhlc2UgcGFja2FnZXMgaW4gdGhlIGZ1dHVyZSwgd2UgY2FuCmNvbnNp
ZGVyIGFkZGluZyBhIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUuCgpCZXN0IHJlZ2FyZHMsCkhlcnbD
qSBDb2RpbmEKCkhlcnZlIENvZGluYSAoNSk6CiAgcGFja2FnZS9hbGNoZW15OiBuZXcgaG9zdCBw
YWNrYWdlCiAgcGFja2FnZS91bG9nOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvbGliZnV0aWxzOiBu
ZXcgcGFja2FnZQogIHBhY2thZ2UvbGlic2hkYXRhOiBuZXcgcGFja2FnZQogIHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlic2hkYXRhOiBuZXcgdGVzdAoKIERFVkVMT1BFUlMg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiBwYWNrYWdlL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArCiAuLi5sY2hhaW5zLXJlbW92
ZS1oYXNoLXN0eWxlLW1hbmFnZW1lbnQucGF0Y2ggfCAzNiArKysrKysrKysrCiBwYWNrYWdlL2Fs
Y2hlbXkvYWxjaGVteS5oYXNoICAgICAgICAgICAgICAgICAgfCAgNCArKwogcGFja2FnZS9hbGNo
ZW15L2FsY2hlbXkubWsgICAgICAgICAgICAgICAgICAgIHwgNzEgKysrKysrKysrKysrKysrKysr
KwogcGFja2FnZS9saWJmdXRpbHMvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgIHwgMTUgKysr
KwogcGFja2FnZS9saWJmdXRpbHMvbGliZnV0aWxzLmhhc2ggICAgICAgICAgICAgIHwgIDMgKwog
cGFja2FnZS9saWJmdXRpbHMvbGliZnV0aWxzLm1rICAgICAgICAgICAgICAgIHwgNTAgKysrKysr
KysrKysrKwogLi4uMDEtYmFja2VuZC1BZGQtbWlzc2luZy1pbmNsdWRlLWZpbGVzLnBhdGNoIHwg
NDcgKysrKysrKysrKysrCiBwYWNrYWdlL2xpYnNoZGF0YS9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICAgfCAyNSArKysrKysrCiBwYWNrYWdlL2xpYnNoZGF0YS9saWJzaGRhdGEuaGFzaCAgICAg
ICAgICAgICAgfCAgMyArCiBwYWNrYWdlL2xpYnNoZGF0YS9saWJzaGRhdGEubWsgICAgICAgICAg
ICAgICAgfCA1OCArKysrKysrKysrKysrKysKIHBhY2thZ2UvdWxvZy9Db25maWcuaW4gICAgICAg
ICAgICAgICAgICAgICAgICB8IDEyICsrKysKIHBhY2thZ2UvdWxvZy91bG9nLmhhc2ggICAgICAg
ICAgICAgICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvdWxvZy91bG9nLm1rICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDQ0ICsrKysrKysrKysrKwogLi4uL3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X2xpYnNoZGF0YS5weSAgIHwgMjUgKysrKysrKwogMTYgZmlsZXMgY2hhbmdlZCwgNDA0
IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2FsY2hlbXkvMDAwMS10
b29sY2hhaW5zLXJlbW92ZS1oYXNoLXN0eWxlLW1hbmFnZW1lbnQucGF0Y2gKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9hbGNoZW15L2FsY2hlbXkubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xp
YmZ1dGlscy9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmZ1dGlscy9s
aWJmdXRpbHMuaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnV0aWxzL2xpYmZ1
dGlscy5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlic2hkYXRhLzAwMDEtYmFja2Vu
ZC1BZGQtbWlzc2luZy1pbmNsdWRlLWZpbGVzLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9saWJzaGRhdGEvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJz
aGRhdGEvbGlic2hkYXRhLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnNoZGF0
YS9saWJzaGRhdGEubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3Vsb2cvQ29uZmlnLmlu
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS91bG9nL3Vsb2cuaGFzaAogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvdWxvZy91bG9nLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJzaGRhdGEucHkKCi0tIAoyLjMxLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
