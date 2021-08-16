Return-Path: <SRS0=nfe+=NH=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E485BC4338F
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 03:30:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BB3E615E6
	for <buildroot@archiver.kernel.org>; Mon, 16 Aug 2021 03:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BB3E615E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF92140012;
	Mon, 16 Aug 2021 03:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cuM3swHUUKEu; Mon, 16 Aug 2021 03:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1B7140142;
	Mon, 16 Aug 2021 03:30:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4A431BF97E
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 03:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A30DC80D0C
 for <buildroot@lists.busybox.net>; Mon, 16 Aug 2021 03:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J7xyYQTl6Eyb for <buildroot@lists.busybox.net>;
 Mon, 16 Aug 2021 03:30:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9A4A80D00
 for <buildroot@busybox.net>; Mon, 16 Aug 2021 03:30:21 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id D33AF440033;
 Mon, 16 Aug 2021 06:30:08 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: buildroot@busybox.net
Date: Mon, 16 Aug 2021 06:30:11 +0300
Message-Id: <c6b5f83bd938d39574e7a6968941de7a6db6ad0a.1629084611.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] boot/arm-trusted-firmware: don't force
 ENABLE_STACK_PROTECTOR
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Q29tbWl0IDVmNDMyZGY3ZTJkMiAoImJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmU6IGNoYW5nZQpF
TkFCTEVfU1RBQ0tfUFJPVEVDVE9SIHZhbHVlIHdoZW4gZGlzYWJsZWQiKSBzZXQKRU5BQkxFX1NU
QUNLX1BST1RFQ1RPUj0wIHdoZW4gZGlzYWJsZWQuIEJ1dCBzaW5jZSB3ZSBwYXNzIHRoaXMgdmFs
dWUgYXMKTUFLRV9PUFQsIHRoZSBpbnRlcm5hbCBBVEYgbG9naWMgdGhhdCBzZXRzIEVOQUJMRV9T
VEFDS19QUk9URUNUT1IgYWdhaW4KYmFzZWQgb24gaXRzIGluaXRpYWwgdmFsdWUgYnJlYWtzLiBU
aGlzIGxlYWRzIHRvIGJ1aWxkIGZhaWx1cmU6CgptYWtlWzFdOiAqKiogWy9idWlsZHMvYnVpbGRy
b290Lm9yZy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL2FybS10cnVzdGVkLWZpcm13YXJlLXYyLjQv
YnVpbGQvYTgweDBfbWNiaW4vcmVsZWFzZS9saWJjL2Fzc2VydC5vXSBFcnJvciAxCmFhcmNoNjQt
YnVpbGRyb290LWxpbnV4LXVjbGliYy1nY2MuYnJfcmVhbDogZXJyb3I6IHVucmVjb2duaXplZCBj
b21tYW5kLWxpbmUgb3B0aW9uIOKAmC1mc3RhY2stcHJvdGVjdG9yLTDigJk7IGRpZCB5b3UgbWVh
biDigJgtZnN0YWNrLXByb3RlY3RvcuKAmT8KCk1vdmUgRU5BQkxFX1NUQUNLX1BST1RFQ1RPUiB0
byBtYWtlIGVudmlyb25tZW50IGluc3RlYWQgdG8gYWxsb3cgbWFrZSB0bwpjaGFuZ2UgaXRzIHZh
bHVlLgoKRml4ZXM6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8t
L2pvYnMvMTQ5NzY2MzI5NAoKQ2M6IERpY2sgT2xzc29uIDxoaUBzZW56aWxsYS5pbz4KQ2M6IFNl
cmdleSBNYXR5dWtldmljaCA8Z2VvbWF0c2lAZ21haWwuY29tPgpDYzogVGhvbWFzIFBldGF6em9u
aSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbQpTaWduZWQtb2ZmLWJ5OiBCYXJ1Y2ggU2lh
Y2ggPGJhcnVjaEB0a29zLmNvLmlsPgotLS0KIGJvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJt
LXRydXN0ZWQtZmlybXdhcmUubWsgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jvb3QvYXJtLXRydXN0ZWQt
ZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUubWsgYi9ib290L2FybS10cnVzdGVkLWZpcm13
YXJlL2FybS10cnVzdGVkLWZpcm13YXJlLm1rCmluZGV4IDFmMDhmNWRhYmI2Yy4uMDBiNjhhMzBh
ZmI3IDEwMDY0NAotLS0gYS9ib290L2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10cnVzdGVkLWZp
cm13YXJlLm1rCisrKyBiL2Jvb3QvYXJtLXRydXN0ZWQtZmlybXdhcmUvYXJtLXRydXN0ZWQtZmly
bXdhcmUubWsKQEAgLTUxLDcgKzUxLDEwIEBAIGVuZGlmCiBBUk1fVFJVU1RFRF9GSVJNV0FSRV9N
QUtFX09QVFMgKz0gXAogCUNST1NTX0NPTVBJTEU9IiQoVEFSR0VUX0NST1NTKSIgXAogCSQoY2Fs
bCBxc3RyaXAsJChCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0FERElUSU9OQUxfVkFS
SUFCTEVTKSkgXAotCVBMQVQ9JChBUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STSkgXAorCVBM
QVQ9JChBUk1fVFJVU1RFRF9GSVJNV0FSRV9QTEFURk9STSkKKworQVJNX1RSVVNURURfRklSTVdB
UkVfTUFLRV9FTlYgKz0gXAorCSQoVEFSR0VUX01BS0VfRU5WKSBcCiAJRU5BQkxFX1NUQUNLX1BS
T1RFQ1RPUj0kKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9T
U1BfTEVWRUwpKQogCiBpZmVxICgkKEJSMl9BUk1fQ1BVX0FSTVY3QSkseSkKQEAgLTE2NCw3ICsx
NjcsOCBAQCBBUk1fVFJVU1RFRF9GSVJNV0FSRV9NQUtFX1RBUkdFVFMgKz0gXAogCiBkZWZpbmUg
QVJNX1RSVVNURURfRklSTVdBUkVfQlVJTERfQ01EUwogCSQoQVJNX1RSVVNURURfRklSTVdBUkVf
QlVJTERfRklQVE9PTCkKLQkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKSAkKEFS
TV9UUlVTVEVEX0ZJUk1XQVJFX01BS0VfT1BUUykgXAorCSQoQVJNX1RSVVNURURfRklSTVdBUkVf
TUFLRV9FTlYpICQoTUFLRSkgLUMgJChARCkgXAorCQkkKEFSTV9UUlVTVEVEX0ZJUk1XQVJFX01B
S0VfT1BUUykgXAogCQkkKEFSTV9UUlVTVEVEX0ZJUk1XQVJFX01BS0VfVEFSR0VUUykKIAkkKEFS
TV9UUlVTVEVEX0ZJUk1XQVJFX0JMMzFfVUJPT1RfQlVJTEQpCiBlbmRlZgotLSAKMi4zMC4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5u
ZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
