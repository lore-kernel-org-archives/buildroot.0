Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0E1C433EF
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 08:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7DC840A04;
	Thu, 10 Mar 2022 08:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rwb-_yEZpaL; Thu, 10 Mar 2022 08:18:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3854140260;
	Thu, 10 Mar 2022 08:18:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60DAB1BF38D
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 08:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 489C68133B
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 08:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P39k244LIuFP for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 08:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA65880E42
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 08:18:30 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [217.70.183.195])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id B8AC1CEE76
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 08:09:47 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 574F96000B;
 Thu, 10 Mar 2022 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646899782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5SzVCFQSC0+nNUTHxaOt3Qw5Bne82U12jogwb/DFmGM=;
 b=nOH950SiB7CosC+DbPZudjG7dWN0cv55+s9XKOMLzZE7YXJb2TYsCclxyaAH32ULiaB49+
 K2zpY6TvMeu//LwWMC8MTwzyDgeFNoGjk+jgdehHKneJc49VUE+nf6IrurAWLHif/PbJmc
 Ma7g71G3ATkGZH/gEkC8NM7rz9Go4ETOdFwgQFcrPMsXPH+qmV9IsXG9Q1tu+RjjsO/DjI
 IHJVZ2UeFLZW7Bc/6p9660C/ab7oVt1/8WMyX+lCpCAI0cfLMHemhkqj0tVAd0ImZWxfBM
 Z6aKNPXyyjDCN2ou8q5lT62ac3ab5JOL1OHjhNx47fW28MBYiPgLwZojGA/R0g==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 09:07:45 +0100
Message-Id: <20220310080745.16903-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310080745.16903-1-clement.leger@bootlin.com>
References: <20220310080745.16903-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] boot/optee-os: bump to version 3.16.0
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBPUC1URUUgT1MgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMuMTYuMCBh
bmQgc2V0CkJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSBkZWZh
dWx0IHRvICd5JyBzaW5jZQpweXRob24tY3J5cHRvZ3JhcGh5IGlzIG5vdyBuZWVkZWQgdG8gYnVp
bGQgb3B0ZWUtb3MuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVn
ZXJAYm9vdGxpbi5jb20+Ci0tLQogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAgIHwgNSArKyst
LQogYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoIHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUt
b3MvQ29uZmlnLmluIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KaW5kZXggZjg0MjZmOWFiMi4u
NmZlMmFlOTVhYyAxMDA2NDQKLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KKysrIGIvYm9v
dC9vcHRlZS1vcy9Db25maWcuaW4KQEAgLTE4LDcgKzE4LDcgQEAgY2hvaWNlCiAJICBTZWxlY3Qg
dGhlIHZlcnNpb24gb2YgT1AtVEVFIE9TIHlvdSB3YW50IHRvIHVzZQogCiBjb25maWcgQlIyX1RB
UkdFVF9PUFRFRV9PU19MQVRFU1QKLQlib29sICIzLjE1LjAiCisJYm9vbCAiMy4xNi4wIgogCWhl
bHAKIAkgIFVzZSB0aGUgbGF0ZXN0IHJlbGVhc2UgdGFnIGZyb20gdGhlIE9QLVRFRSBPUyBvZmZp
Y2lhbCBHaXQKIAkgIHJlcG9zaXRvcnkuCkBAIC01MCw2ICs1MCw3IEBAIGVuZGlmCiAKIGNvbmZp
ZyBCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkKIAlib29sICJv
cHRlZS1vcyBuZWVkcyBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkgdG8gYnVpbGQiCisJZGVmYXVs
dCB5CiAJaGVscAogCSAgT1AtVEVFIHZlcnNpb24gYmVsb3cgMy4xNiB1c2VkIHB5dGhvbi1weWNy
eXB0b2RvbWV4IHBhY2thZ2UKIAkgIGluIHB5dGhvbiBzY3JpcHRzLiBOZXdlciB2ZXJzaW9uIHVz
ZXMgcHl0aG9uLWNyeXB0b2dyYXBoeS4KQEAgLTU4LDcgKzU5LDcgQEAgY29uZmlnIEJSMl9UQVJH
RVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQogCiBjb25maWcgQlIyX1RBUkdF
VF9PUFRFRV9PU19WRVJTSU9OCiAJc3RyaW5nCi0JZGVmYXVsdCAiMy4xNS4wIglpZiBCUjJfVEFS
R0VUX09QVEVFX09TX0xBVEVTVAorCWRlZmF1bHQgIjMuMTYuMCIJaWYgQlIyX1RBUkdFVF9PUFRF
RV9PU19MQVRFU1QKIAlkZWZhdWx0IEJSMl9UQVJHRVRfT1BURUVfT1NfQ1VTVE9NX1JFUE9fVkVS
U0lPTiBcCiAJCQkJaWYgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fR0lUCiAKZGlmZiAtLWdp
dCBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3Mu
aGFzaAppbmRleCAzYzMyZTI1YjM2Li5iMzI3NmQ3MDJhIDEwMDY0NAotLS0gYS9ib290L29wdGVl
LW9zL29wdGVlLW9zLmhhc2gKKysrIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCkBAIC0x
LDQgKzEsMyBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYXJj
aGl2ZS8zLjE1LjAvb3B0ZWUtb3MtMy4xNS4wLnRhci5negotc2hhMjU2IGU1YmIzZDllZWRhZjc3
ODVhZjA5MTYwMmFkZGFjNWI1MjExOGY0Y2RjMTA4YWY5Y2Q2ZjZjOTZiMjE1MDNhYjggIG9wdGVl
LW9zLTMuMTUuMC50YXIuZ3oKICMgTG9jYWxseSBjb21wdXRlZAorc2hhMjU2IGViYzhlMThhZDIw
MzllZTk3YzM0Zjc0YTc1NDZkZTkxMTllMjZmMDRjMzY4YjZjN2ZkMGM1NWY5M2QzM2QyZDYgIG9w
dGVlLW9zLTMuMTYuMC50YXIuZ3oKIHNoYTI1NiAxMjQ3ZWU5MDg1OGY0MDM3YjZjYWM2M2NiZmZk
ZGZlZDQzNWQwZDczYzYzMWIzN2Q3OGMxZTZlNmFiM2U1ZDFhICBMSUNFTlNFCi0tIAoyLjM0LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
