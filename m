Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4A08C433F5
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:37:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020FC6103C
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 07:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 020FC6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B62980E87;
	Wed,  3 Nov 2021 07:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ICharFuSPqiw; Wed,  3 Nov 2021 07:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B8880E40;
	Wed,  3 Nov 2021 07:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EA2DD1BF2C6
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6097608EE
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 07:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cw4dLIOTgBAO for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 07:37:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86242608EC
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 07:37:10 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id EA3B5240006;
 Wed,  3 Nov 2021 07:37:06 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  3 Nov 2021 08:36:51 +0100
Message-Id: <20211103073656.1689919-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] Add Alchemy build system and some related
 libs
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
cnJlY3RseSBidWlsdC4KCkJlc3QgcmVnYXJkcywKSGVydsOpIENvZGluYQoKSGVydmUgQ29kaW5h
ICg1KToKICBwYWNrYWdlL2FsY2hlbXk6IG5ldyBob3N0IHBhY2thZ2UKICBwYWNrYWdlL3Vsb2c6
IG5ldyBwYWNrYWdlCiAgcGFja2FnZS9saWJmdXRpbHM6IG5ldyBwYWNrYWdlCiAgcGFja2FnZS9s
aWJzaGRhdGE6IG5ldyBwYWNrYWdlCiAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9saWJzaGRhdGE6IG5ldyB0ZXN0CgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUgKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsKIC4uLmxjaGFpbnMtcmVtb3ZlLWhhc2gtc3R5bGUtbWFuYWdlbWVu
dC5wYXRjaCB8IDM2ICsrKysrKysrKwogcGFja2FnZS9hbGNoZW15L2FsY2hlbXkuaGFzaCAgICAg
ICAgICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9hbGNoZW15L2FsY2hlbXkubWsgICAgICAgICAg
ICAgICAgICAgIHwgNzMgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9saWJmdXRpbHMvQ29u
ZmlnLmluICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKwogcGFja2FnZS9saWJmdXRpbHMvbGli
ZnV0aWxzLmhhc2ggICAgICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9saWJmdXRpbHMvbGliZnV0
aWxzLm1rICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKwogLi4uMDEtYmFja2VuZC1B
ZGQtbWlzc2luZy1pbmNsdWRlLWZpbGVzLnBhdGNoIHwgNDQgKysrKysrKysrKysKIHBhY2thZ2Uv
bGlic2hkYXRhL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8IDIzICsrKysrKwogcGFja2Fn
ZS9saWJzaGRhdGEvbGlic2hkYXRhLmhhc2ggICAgICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9s
aWJzaGRhdGEvbGlic2hkYXRhLm1rICAgICAgICAgICAgICAgIHwgNTkgKysrKysrKysrKysrKysr
CiBwYWNrYWdlL3Vsb2cvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgfCAxMiArKysK
IHBhY2thZ2UvdWxvZy91bG9nLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICB8ICAzICsKIHBh
Y2thZ2UvdWxvZy91bG9nLm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQ0ICsrKysrKysr
KysrCiAuLi4vdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfbGlic2hkYXRhLnB5ICAgfCAyNSAr
KysrKysrCiAxNiBmaWxlcyBjaGFuZ2VkLCA0MDAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvYWxjaGVteS8wMDAxLXRvb2xjaGFpbnMtcmVtb3ZlLWhhc2gtc3R5bGUt
bWFuYWdlbWVudC5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYWxjaGVteS9hbGNo
ZW15Lmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2FsY2hlbXkvYWxjaGVteS5tawog
Y3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnV0aWxzL0NvbmZpZy5pbgogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnV0aWxzL2xpYmZ1dGlscy5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9saWJmdXRpbHMvbGliZnV0aWxzLm1rCiBjcmVhdGUgbW9kZSAxMDA2NDQg
cGFja2FnZS9saWJzaGRhdGEvMDAwMS1iYWNrZW5kLUFkZC1taXNzaW5nLWluY2x1ZGUtZmlsZXMu
cGF0Y2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnNoZGF0YS9Db25maWcuaW4KIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnNoZGF0YS9saWJzaGRhdGEuaGFzaAogY3JlYXRl
IG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlic2hkYXRhL2xpYnNoZGF0YS5tawogY3JlYXRlIG1vZGUg
MTAwNjQ0IHBhY2thZ2UvdWxvZy9Db25maWcuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdl
L3Vsb2cvdWxvZy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS91bG9nL3Vsb2cubWsK
IGNyZWF0ZSBtb2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xp
YnNoZGF0YS5weQoKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
