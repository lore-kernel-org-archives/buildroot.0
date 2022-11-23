Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B13CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 15:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB1A060B69;
	Wed, 23 Nov 2022 15:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB1A060B69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I47WvNGYikXg; Wed, 23 Nov 2022 15:09:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DEC360B19;
	Wed, 23 Nov 2022 15:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DEC360B19
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E92771BF3DF
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 15:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4E904032E
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 15:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4E904032E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KelGO97R-jv9 for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 15:09:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0A9640104
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0A9640104
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 15:09:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 040A31FB;
 Wed, 23 Nov 2022 07:09:12 -0800 (PST)
Received: from localhost.localdomain (unknown [10.57.7.127])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D09D63F73B;
 Wed, 23 Nov 2022 07:09:04 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 16:08:59 +0100
Message-Id: <20221123150859.4003-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/qemu_aarch64_ebbr: add host-qemu
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHRoZSBob3N0LXFlbXUgcGFja2FnZSB0byBlbmFibGUgdGVzdGluZyBvbiBnaXRsYWIuCgpT
aWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+CkNj
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Ci0tLQogY29uZmlncy9xZW11
X2FhcmNoNjRfZWJicl9kZWZjb25maWcgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZp
ZyBiL2NvbmZpZ3MvcWVtdV9hYXJjaDY0X2ViYnJfZGVmY29uZmlnCmluZGV4IGEwZDgxMDVjNDM4
Li5kMjkzYWQwZTYwOCAxMDA2NDQKLS0tIGEvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZj
b25maWcKKysrIGIvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcKQEAgLTQ4LDMg
KzQ4LDcgQEAgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU1NMPXkKIEJSMl9QQUNLQUdFX0hP
U1RfRE9TRlNUT09MUz15CiBCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkKIEJSMl9QQUNLQUdF
X0hPU1RfTVRPT0xTPXkKKworIyBob3N0LXFlbXUgZm9yIGdpdGxhYiB0ZXN0aW5nCitCUjJfUEFD
S0FHRV9IT1NUX1FFTVU9eQorQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkKLS0g
CjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
