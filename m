Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C5AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 14:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE4B40906;
	Mon, 10 Jan 2022 14:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1I9sUByRNl64; Mon, 10 Jan 2022 14:50:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 018A0408B1;
	Mon, 10 Jan 2022 14:50:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5F11BF3C3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C0482CA5
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 14:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tKfpm4uViNGL for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 14:50:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6609D82C99
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 14:50:14 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPA id DF45D6000E;
 Mon, 10 Jan 2022 14:50:10 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 15:50:02 +0100
Message-Id: <20220110145007.133329-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/5] Add Alchemy build system and some
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
ZGVyIGFkZGluZyBhIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUuCgpUaGlzIHYzIHNlcmllcyB0YWtl
cyBjYXJlIG9mIHRoZSBZYW5uIE1vcmluJ3MgcmV2aWV3LgoKQ2hhbmdlcyB2Mi0+djMgYXJlIGRl
dGFpbGVkIGluIGVhY2ggcGF0Y2guCgpCZXN0IHJlZ2FyZHMsCkhlcnbDqSBDb2RpbmEKCkhlcnZl
IENvZGluYSAoNSk6CiAgcGFja2FnZS9hbGNoZW15OiBuZXcgaG9zdCBwYWNrYWdlCiAgcGFja2Fn
ZS91bG9nOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvbGliZnV0aWxzOiBuZXcgcGFja2FnZQogIHBh
Y2thZ2UvbGlic2hkYXRhOiBuZXcgcGFja2FnZQogIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNr
YWdlL3Rlc3RfbGlic2hkYXRhOiBuZXcgdGVzdAoKIERFVkVMT1BFUlMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICA1ICsrCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMyArCiAuLi5sY2hhaW5zLXJlbW92ZS1oYXNoLXN0eWxlLW1h
bmFnZW1lbnQucGF0Y2ggfCAzNiArKysrKysrKysKIHBhY2thZ2UvYWxjaGVteS9hbGNoZW15Lmhh
c2ggICAgICAgICAgICAgICAgICB8ICA0ICsKIHBhY2thZ2UvYWxjaGVteS9hbGNoZW15Lm1rICAg
ICAgICAgICAgICAgICAgICB8IDcxICsrKysrKysrKysrKysrKysrKwogcGFja2FnZS9hbGNoZW15
L2F0b20ubWsuaW4gICAgICAgICAgICAgICAgICAgIHwgIDggKysKIHBhY2thZ2UvbGliZnV0aWxz
L0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysKIHBhY2thZ2UvbGliZnV0aWxz
L2xpYmZ1dGlscy5oYXNoICAgICAgICAgICAgICB8ICAzICsKIHBhY2thZ2UvbGliZnV0aWxzL2xp
YmZ1dGlscy5tayAgICAgICAgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrCiAuLi4wMS1iYWNr
ZW5kLUFkZC1taXNzaW5nLWluY2x1ZGUtZmlsZXMucGF0Y2ggfCA0NyArKysrKysrKysrKysKIC4u
LnN0cmVzc190ZXN0LUZpeC1idWlsZC13aXRoLW11c2wtbGliYy5wYXRjaCB8IDM0ICsrKysrKysr
KwogcGFja2FnZS9saWJzaGRhdGEvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgIHwgMjkgKysr
KysrKwogcGFja2FnZS9saWJzaGRhdGEvbGlic2hkYXRhLmhhc2ggICAgICAgICAgICAgIHwgIDMg
KwogcGFja2FnZS9saWJzaGRhdGEvbGlic2hkYXRhLm1rICAgICAgICAgICAgICAgIHwgNzUgKysr
KysrKysrKysrKysrKysrKwogcGFja2FnZS91bG9nL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAg
ICAgICAgIHwgMTIgKysrCiBwYWNrYWdlL3Vsb2cvdWxvZy5oYXNoICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMyArCiBwYWNrYWdlL3Vsb2cvdWxvZy5tayAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCA1MCArKysrKysrKysrKysrCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGli
c2hkYXRhLnB5ICAgfCAyNSArKysrKysrCiAxOCBmaWxlcyBjaGFuZ2VkLCA0NzkgaW5zZXJ0aW9u
cygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYWxjaGVteS8wMDAxLXRvb2xjaGFpbnMt
cmVtb3ZlLWhhc2gtc3R5bGUtbWFuYWdlbWVudC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvYWxjaGVteS9hbGNoZW15Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2Fs
Y2hlbXkvYWxjaGVteS5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYWxjaGVteS9hdG9t
Lm1rLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJmdXRpbHMvQ29uZmlnLmluCiBj
cmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJmdXRpbHMvbGliZnV0aWxzLmhhc2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmZ1dGlscy9saWJmdXRpbHMubWsKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2xpYnNoZGF0YS8wMDAxLWJhY2tlbmQtQWRkLW1pc3NpbmctaW5jbHVk
ZS1maWxlcy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlic2hkYXRhLzAwMDIt
ZXhhbXBsZXMtc3RyZXNzX3Rlc3QtRml4LWJ1aWxkLXdpdGgtbXVzbC1saWJjLnBhdGNoCiBjcmVh
dGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJzaGRhdGEvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9saWJzaGRhdGEvbGlic2hkYXRhLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2xpYnNoZGF0YS9saWJzaGRhdGEubWsKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL3Vsb2cvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS91bG9nL3Vsb2cu
aGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvdWxvZy91bG9nLm1rCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJzaGRhdGEucHkK
Ci0tIAoyLjMzLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
