Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DA7C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F470416F2;
	Wed,  2 Nov 2022 20:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F470416F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q-n-tFamU31q; Wed,  2 Nov 2022 20:19:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A1B41674;
	Wed,  2 Nov 2022 20:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1A1B41674
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0B41BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE46760881
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:19:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE46760881
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fhssUi3JW_HK for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:19:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89A1B607D1
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89A1B607D1
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:19:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 8DEB720002;
 Wed,  2 Nov 2022 20:19:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 21:18:55 +0100
Message-Id: <20221102201858.555294-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102201858.555294-1-thomas.petazzoni@bootlin.com>
References: <20221102201858.555294-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667420344;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NociJnJCJSPOrMAvmoy9j246UwpRy4+S0eSsnzmPAfo=;
 b=V3jQ+s/TuPNinXnO2wOzkpaZizkKWoxr1L01N8qXWg6HN6qobAKgyIcC+TPRmb03l6rzax
 v5hu6OpUB8vWOflC9wLuV61ccLnXl4B9XP6jVxgLQ3SvIZiJXpzLkOAiJcP7ptdOHVrugG
 YqNF9SIqGrVmJmZ/gi4Elw7MLJyjs1u+PgvgJAX/gvjLFRWJdmpDhA7jHxDt4CO+pByCX1
 EF8wCffPKvLPyfczEtsxjcAOwDDmjnKxUmX+U4hWCHlTbQgHJHhc/YpgOB8OVSGbY7ZVkp
 Nv4QGmdOfBRcNEqx2ttxFiEHAk/VD48BSyMC0GFPEti9R4UgXTvHZvJf+PmryA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=V3jQ+s/T
Subject: [Buildroot] [PATCH 1/3] configs/roc_pc_rk3399: remove defconfig
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBkZWZjb25maWcgaGFzIGJlZW4gZmFpbGluZyB0byBidWlsZCBmb3Igc2V2ZXJhbCBtb250
aHMsIHdpdGgKbm9ib2R5IHN0ZXBwaW5nIHVwIHRvIGZpeCBpdC4gSXQncyB0aW1lIHRvIGRyb3Ag
aXQuCgpTZWUKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjIwODA2MjI0MzM4
LjAxNTllMTVjQHdpbmRzdXJmLwpmb3IgYSBub3RpZmljYXRpb24gb24gQXVndXN0IDYsIDIwMjIg
YWJvdXQgdGhlIGlzc3VlcyB3aXRoIHRoaXMKZGVmY29uZmlnLgoKRml4ZXM6CgogIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMzI1OTY3MTIyNgoKQ2M6
IFN1bmllbCBNYWhlc2ggPHN1bmlsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgpTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0KIERF
VkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLS0KIGJvYXJkL2Zp
cmVmbHkvcm9jLXJrMzM5OS1wYy9leHRsaW51eC5jb25mIHwgIDQgLS0tCiBib2FyZC9maXJlZmx5
L3JvYy1yazMzOTktcGMvZ2VuaW1hZ2UuY2ZnICB8IDIyIC0tLS0tLS0tLS0tLS0KIGJvYXJkL2Zp
cmVmbHkvcm9jLXJrMzM5OS1wYy9wb3N0LWJ1aWxkLnNoIHwgIDUgLS0tCiBib2FyZC9maXJlZmx5
L3JvYy1yazMzOTktcGMvcmVhZG1lLnR4dCAgICB8IDQwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiA1IGZpbGVzIGNoYW5nZWQsIDczIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IGJv
YXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9leHRsaW51eC5jb25mCiBkZWxldGUgbW9kZSAxMDA2
NDQgYm9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL2dlbmltYWdlLmNmZwogZGVsZXRlIG1vZGUg
MTAwNzU1IGJvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9wb3N0LWJ1aWxkLnNoCiBkZWxldGUg
bW9kZSAxMDA2NDQgYm9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL3JlYWRtZS50eHQKCmRpZmYg
LS1naXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCA5NTY5ZWU3MjBiLi41OTEyNzZi
ZWM4IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTI3MjksMTMg
KzI3MjksMTEgQEAgRjoJcGFja2FnZS9od2xvYy8KIEY6CXBhY2thZ2UvcG93ZXJ0b3AvCiAKIE46
CVN1bmllbCBNYWhlc2ggPHN1bmlsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgotRjoJYm9hcmQvZmly
ZWZseS8KIEY6CWJvYXJkL2ZyaWVuZGx5YXJtL25hbm9waS1tNAogRjoJYm9hcmQvcGluZTY0L3Jv
Y2twcm82NAogRjoJYm9hcmQvcmFkeGEvcm9ja3BpLTQKIEY6CWJvYXJkL3JhZHhhL3JvY2twaS1u
OAogRjoJYm9hcmQvcmFkeGEvcm9ja3BpLW4xMAotRjoJY29uZmlncy9yb2NfcGNfcmszMzk5X2Rl
ZmNvbmZpZwogRjoJY29uZmlncy9yb2NrX3BpXzRfZGVmY29uZmlnCiBGOgljb25maWdzL3JvY2tf
cGlfbjhfZGVmY29uZmlnCiBGOgljb25maWdzL3JvY2tfcGlfbjEwX2RlZmNvbmZpZwpkaWZmIC0t
Z2l0IGEvYm9hcmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL2V4dGxpbnV4LmNvbmYgYi9ib2FyZC9m
aXJlZmx5L3JvYy1yazMzOTktcGMvZXh0bGludXguY29uZgpkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggNTBhMzU4ZmFkYy4uMDAwMDAwMDAwMAotLS0gYS9ib2FyZC9maXJlZmx5L3JvYy1y
azMzOTktcGMvZXh0bGludXguY29uZgorKysgL2Rldi9udWxsCkBAIC0xLDQgKzAsMCBAQAotbGFi
ZWwgUkszMzk5Um9jUEMgbGludXgKLSAga2VybmVsIC9ib290L0ltYWdlCi0gIGRldmljZXRyZWUg
L2Jvb3QvcmszMzk5LXJvYy1wYy5kdGIKLSAgYXBwZW5kIGVhcmx5Y29uPXVhcnQ4MjUwLG1taW8z
MiwweGZmMWEwMDAwIHJvb3Q9L2Rldi9tbWNibGswcDEgcm9vdHdhaXQKZGlmZiAtLWdpdCBhL2Jv
YXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9nZW5pbWFnZS5jZmcgYi9ib2FyZC9maXJlZmx5L3Jv
Yy1yazMzOTktcGMvZ2VuaW1hZ2UuY2ZnCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA5
NjZjODY5MjczLi4wMDAwMDAwMDAwCi0tLSBhL2JvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9n
ZW5pbWFnZS5jZmcKKysrIC9kZXYvbnVsbApAQCAtMSwyMiArMCwwIEBACi1pbWFnZSBzZGNhcmQu
aW1nIHsKLQloZGltYWdlIHsKLQl9Ci0KLQlwYXJ0aXRpb24gdS1ib290LXRwbC1zcGwtZHRiIHsK
LQkJaW4tcGFydGl0aW9uLXRhYmxlID0gIm5vIgotCQlpbWFnZSA9ICJpZGJsb2FkZXIuaW1nIgot
CQlvZmZzZXQgPSAzMksKLQl9Ci0KLQlwYXJ0aXRpb24gdS1ib290LWR0YiB7Ci0JCWluLXBhcnRp
dGlvbi10YWJsZSA9ICJubyIKLQkJaW1hZ2UgPSAidS1ib290Lml0YiIKLQkJb2Zmc2V0ID0gOE0K
LQkJc2l6ZSA9IDMwTQotCX0KLQotCXBhcnRpdGlvbiByb290ZnMgewotCQlwYXJ0aXRpb24tdHlw
ZSA9IDB4ODMKLQkJaW1hZ2UgPSAicm9vdGZzLmV4dDQiCi0JfQotfQpkaWZmIC0tZ2l0IGEvYm9h
cmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL3Bvc3QtYnVpbGQuc2ggYi9ib2FyZC9maXJlZmx5L3Jv
Yy1yazMzOTktcGMvcG9zdC1idWlsZC5zaApkZWxldGVkIGZpbGUgbW9kZSAxMDA3NTUKaW5kZXgg
MWY1ZmY2YTYxMS4uMDAwMDAwMDAwMAotLS0gYS9ib2FyZC9maXJlZmx5L3JvYy1yazMzOTktcGMv
cG9zdC1idWlsZC5zaAorKysgL2Rldi9udWxsCkBAIC0xLDUgKzAsMCBAQAotIyEvYmluL3NoCi0K
LUJPQVJEX0RJUj0iJChkaXJuYW1lICQwKSIKLQotaW5zdGFsbCAtbSAwNjQ0IC1EICRCT0FSRF9E
SVIvZXh0bGludXguY29uZiAkVEFSR0VUX0RJUi9ib290L2V4dGxpbnV4L2V4dGxpbnV4LmNvbmYK
ZGlmZiAtLWdpdCBhL2JvYXJkL2ZpcmVmbHkvcm9jLXJrMzM5OS1wYy9yZWFkbWUudHh0IGIvYm9h
cmQvZmlyZWZseS9yb2MtcmszMzk5LXBjL3JlYWRtZS50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDhhNmYxY2RlZTYuLjAwMDAwMDAwMDAKLS0tIGEvYm9hcmQvZmlyZWZseS9yb2Mt
cmszMzk5LXBjL3JlYWRtZS50eHQKKysrIC9kZXYvbnVsbApAQCAtMSw0MCArMCwwIEBACi1MaWJy
ZSBDb21wdXRlciBCb2FyZCBST0MtUkszMzk5LVBDCi09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQotCi1CdWlsZDoKLQotICAkIG1ha2Ugcm9jX3BjX3JrMzM5OV9kZWZjb25maWcK
LSAgJCBtYWtlCi0KLUZpbGVzIGNyZWF0ZWQgaW4gb3V0cHV0IGRpcmVjdG9yeQotPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09Ci0KLW91dHB1dC9pbWFnZXMKLQot4pSc4pSA4pSAIGJs
MzEuZWxmCi3ilJzilIDilIAgaWRibG9hZGVyLmltZwot4pSc4pSA4pSAIEltYWdlCi3ilJzilIDi
lIAgcmszMzk5LXJvYy1wYy5kdGIKLeKUnOKUgOKUgCByb290ZnMuZXh0Mgot4pSc4pSA4pSAIHJv
b3Rmcy5leHQ0IC0+IHJvb3Rmcy5leHQyCi3ilJzilIDilIAgcm9vdGZzLnRhcgot4pSc4pSA4pSA
IHNkY2FyZC5pbWcKLeKUnOKUgOKUgCB1LWJvb3QuYmluCi3ilJTilIDilIAgdS1ib290Lml0Ygot
Ci1DcmVhdGluZyBib290YWJsZSBTRCBjYXJkOgotPT09PT09PT09PT09PT09PT09PT09PT09PT0K
LQotU2ltcGx5IGludm9rZSAoYXMgcm9vdCkKLQotc3VkbyBkZCBpZj1vdXRwdXQvaW1hZ2VzL3Nk
Y2FyZC5pbWcgb2Y9L2Rldi9zZFggJiYgc3luYwotCi1XaGVyZSBYIGlzIHlvdXIgU0QgY2FyZCBk
ZXZpY2UKLQotU2VyaWFsIGNvbnNvbGUKLS0tLS0tLS0tLS0tLS0tCi0KLUJhdWRyYXRlIGZvciB0
aGlzIGJvYXJkIGlzIDE1MDAwMDAKLQotV2lraSBsaW5rOgotaHR0cHM6Ly93aWtpLmFtYXJ1bGFz
b2x1dGlvbnMuY29tL2JzcC9yb2NrY2hpcC9yazMzOTkvcm9jLXJrMzM5OS1wYy5odG1sCi0tIAoy
LjM4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
