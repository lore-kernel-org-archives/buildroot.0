Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF017C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF5B041A1A;
	Fri, 18 Mar 2022 13:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAebwG1wwFHz; Fri, 18 Mar 2022 13:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8C8841A17;
	Fri, 18 Mar 2022 13:36:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0431BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06055419F6
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nF7yXgaxt1sz for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E85D0419F4
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0BD1940011;
 Fri, 18 Mar 2022 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DumR4QPHuQv0e4hf4JwvB8++TFj0vuegiC0sZkGI/SU=;
 b=jnMZ6jHFO33q/WrMagRK9OZyTPFjQHE+suyE8LABs2/cMpFQ6CTxtKeGALIy/JXcBF+c8g
 CzwaDV/cFvSr7wA21ZOOaOt3PKaZkRc8g/uXiP4rfCe/TnTnHVnX24f0wKbNUdIFfhL7q6
 i5Y9u/JD7hj5oOJZVYShheWpC3lOurR5r0y+gcql23nMSMH+yRnUCFfBhO8C6iU5c8qTke
 EgpUP+DLTxnZmhMexY7qAHwucNWCpl5gddUliQavXl8VdSp5GzYH/xUvuOct8MtsvQCNGm
 1RLqLbOk9qzJNNKqWaM6rPCc2HWyyIoI+MgJgNkbITK+rjJZHxPmndDyztwXfw==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:23 +0100
Message-Id: <20220318132427.48737-5-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 4/8] boot/optee-os: bump to version 3.16.0
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QnVtcCBPUC1URUUgT1MgcGFja2FnZSB2ZXJzaW9uIHRvIE9QLVRFRSByZWxlYXNlIDMuMTYuMCBh
bmQgc2V0CkJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUIHRvIHNlbGVjdApCUjJfVEFSR0VUX09Q
VEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkgc2luY2UKcHl0aG9uLWNyeXB0b2dyYXBo
eSBpcyBub3cgbmVlZGVkIHRvIGJ1aWxkIG9wdGVlLW9zLgoKQWNrZWQtYnk6IEV0aWVubmUgQ2Fy
cmllcmUgPGV0aWVubmUuY2FycmllcmVAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogQ2zDqW1l
bnQgTMOpZ2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPgotLS0KIGJvb3Qvb3B0ZWUtb3Mv
Q29uZmlnLmluICAgICB8IDUgKysrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCB8IDQg
KystLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZp
Zy5pbgppbmRleCAwMmI1ZDdjODZmLi44MTE5MzdlMDI1IDEwMDY0NAotLS0gYS9ib290L29wdGVl
LW9zL0NvbmZpZy5pbgorKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgpAQCAtMTksNyArMTks
OCBAQCBjaG9pY2UKIAkgIFNlbGVjdCB0aGUgdmVyc2lvbiBvZiBPUC1URUUgT1MgeW91IHdhbnQg
dG8gdXNlCiAKIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVAotCWJvb2wgIjMuMTUu
MCIKKwlzZWxlY3QgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZ
CisJYm9vbCAiMy4xNi4wIgogCWhlbHAKIAkgIFVzZSB0aGUgbGF0ZXN0IHJlbGVhc2UgdGFnIGZy
b20gdGhlIE9QLVRFRSBPUyBvZmZpY2lhbCBHaXQKIAkgIHJlcG9zaXRvcnkuCkBAIC01MSw3ICs1
Miw3IEBAIGVuZGlmCiAKIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX1ZFUlNJT04KIAlzdHJp
bmcKLQlkZWZhdWx0ICIzLjE1LjAiCWlmIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCisJZGVm
YXVsdCAiMy4xNi4wIglpZiBCUjJfVEFSR0VUX09QVEVFX09TX0xBVEVTVAogCWRlZmF1bHQgQlIy
X1RBUkdFVF9PUFRFRV9PU19DVVNUT01fUkVQT19WRVJTSU9OIFwKIAkJCQlpZiBCUjJfVEFSR0VU
X09QVEVFX09TX0NVU1RPTV9HSVQKIApkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1v
cy5oYXNoIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5oYXNoCmluZGV4IDNjMzJlMjViMzYuLmI5
YjBlNWI0M2YgMTAwNjQ0Ci0tLSBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaAorKysgYi9i
b290L29wdGVlLW9zL29wdGVlLW9zLmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20gaHR0cHM6
Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy9hcmNoaXZlLzMuMTUuMC9vcHRlZS1vcy0zLjE1
LjAudGFyLmd6Ci1zaGEyNTYgZTViYjNkOWVlZGFmNzc4NWFmMDkxNjAyYWRkYWM1YjUyMTE4ZjRj
ZGMxMDhhZjljZDZmNmM5NmIyMTUwM2FiOCAgb3B0ZWUtb3MtMy4xNS4wLnRhci5negorIyBGcm9t
IGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYXJjaGl2ZS8zLjE2LjAvb3B0ZWUt
b3MtMy4xNi4wLnRhci5negorc2hhMjU2IGViYzhlMThhZDIwMzllZTk3YzM0Zjc0YTc1NDZkZTkx
MTllMjZmMDRjMzY4YjZjN2ZkMGM1NWY5M2QzM2QyZDYgIG9wdGVlLW9zLTMuMTYuMC50YXIuZ3oK
ICMgTG9jYWxseSBjb21wdXRlZAogc2hhMjU2IDEyNDdlZTkwODU4ZjQwMzdiNmNhYzYzY2JmZmRk
ZmVkNDM1ZDBkNzNjNjMxYjM3ZDc4YzFlNmU2YWIzZTVkMWEgIExJQ0VOU0UKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
