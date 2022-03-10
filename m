Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C7EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 16:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C19061219;
	Thu, 10 Mar 2022 16:59:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iQf6cWEAAwCg; Thu, 10 Mar 2022 16:59:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BCA260E05;
	Thu, 10 Mar 2022 16:59:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0D41BF2F3
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A3574154A
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8cOneRP5dZ5o for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46AA04156C
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F3E86000B;
 Thu, 10 Mar 2022 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HwC+PnspRoojsMCLRi/72zjLpxmp1A4m2DTs4mAmeG8=;
 b=VokRUrzxH/G3hdeZnEbYQ0yOYXAmbowV/VsQ9AQKVoiA/YpAgUO2GnSmJH13jVRGYbq8/X
 YQCCVX1gpNPH32BYhW+s5R8P/FC6hEnO/WFxbDb/kVB80c0EnClRkE6XiMo9N+Jj5oUQOL
 kZ/qelazBpbufxROvx6cVPwxtYNyOLWzsVv3Tc98OxozxpHwEkrnjFScU4PsieNSyS/hT7
 frvxTwxmASPgsIAkMGTPcqMi4Y8YX1lMtJC83l3QxQ+K7MasSy9dWGKU5VRHgUP9qoqQw/
 auoedsgVNvu/rbmKCUlYDiq+K0rH5OEQNPuVIAsNu8WoWmGZwfGF5Y0psPTOFg==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:31 +0100
Message-Id: <20220310165735.1102802-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220310165735.1102802-1-clement.leger@bootlin.com>
References: <20220310165735.1102802-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/7] boot/optee-os: bump to version 3.16.0
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
LQogYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1v
cy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgppbmRleCBmODQyNmY5YWIyLi42
ZmUyYWU5NWFjIDEwMDY0NAotLS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgorKysgYi9ib290
L29wdGVlLW9zL0NvbmZpZy5pbgpAQCAtMTgsNyArMTgsNyBAQCBjaG9pY2UKIAkgIFNlbGVjdCB0
aGUgdmVyc2lvbiBvZiBPUC1URUUgT1MgeW91IHdhbnQgdG8gdXNlCiAKIGNvbmZpZyBCUjJfVEFS
R0VUX09QVEVFX09TX0xBVEVTVAotCWJvb2wgIjMuMTUuMCIKKwlib29sICIzLjE2LjAiCiAJaGVs
cAogCSAgVXNlIHRoZSBsYXRlc3QgcmVsZWFzZSB0YWcgZnJvbSB0aGUgT1AtVEVFIE9TIG9mZmlj
aWFsIEdpdAogCSAgcmVwb3NpdG9yeS4KQEAgLTUwLDYgKzUwLDcgQEAgZW5kaWYKIAogY29uZmln
IEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQogCWJvb2wgIm9w
dGVlLW9zIG5lZWRzIGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSB0byBidWlsZCIKKwlkZWZhdWx0
IHkKIAloZWxwCiAJICBPUC1URUUgdmVyc2lvbiBiZWxvdyAzLjE2IHVzZWQgcHl0aG9uLXB5Y3J5
cHRvZG9tZXggcGFja2FnZQogCSAgaW4gcHl0aG9uIHNjcmlwdHMuIE5ld2VyIHZlcnNpb24gdXNl
cyBweXRob24tY3J5cHRvZ3JhcGh5LgpAQCAtNTgsNyArNTksNyBAQCBjb25maWcgQlIyX1RBUkdF
VF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZCiAKIGNvbmZpZyBCUjJfVEFSR0VU
X09QVEVFX09TX1ZFUlNJT04KIAlzdHJpbmcKLQlkZWZhdWx0ICIzLjE1LjAiCWlmIEJSMl9UQVJH
RVRfT1BURUVfT1NfTEFURVNUCisJZGVmYXVsdCAiMy4xNi4wIglpZiBCUjJfVEFSR0VUX09QVEVF
X09TX0xBVEVTVAogCWRlZmF1bHQgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fUkVQT19WRVJT
SU9OIFwKIAkJCQlpZiBCUjJfVEFSR0VUX09QVEVFX09TX0NVU1RPTV9HSVQKIApkaWZmIC0tZ2l0
IGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5o
YXNoCmluZGV4IDNjMzJlMjViMzYuLmQwNTMwOWUwZGIgMTAwNjQ0Ci0tLSBhL2Jvb3Qvb3B0ZWUt
b3Mvb3B0ZWUtb3MuaGFzaAorKysgYi9ib290L29wdGVlLW9zL29wdGVlLW9zLmhhc2gKQEAgLTEs
NCArMSw0IEBACiAjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy9hcmNo
aXZlLzMuMTUuMC9vcHRlZS1vcy0zLjE1LjAudGFyLmd6Ci1zaGEyNTYgZTViYjNkOWVlZGFmNzc4
NWFmMDkxNjAyYWRkYWM1YjUyMTE4ZjRjZGMxMDhhZjljZDZmNmM5NmIyMTUwM2FiOCAgb3B0ZWUt
b3MtMy4xNS4wLnRhci5negorc2hhMjU2IGViYzhlMThhZDIwMzllZTk3YzM0Zjc0YTc1NDZkZTkx
MTllMjZmMDRjMzY4YjZjN2ZkMGM1NWY5M2QzM2QyZDYgIG9wdGVlLW9zLTMuMTYuMC50YXIuZ3oK
ICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2IDEyNDdlZTkwODU4ZjQwMzdiNmNhYzYzY2JmZmRk
ZmVkNDM1ZDBkNzNjNjMxYjM3ZDc4YzFlNmU2YWIzZTVkMWEgIExJQ0VOU0UKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
