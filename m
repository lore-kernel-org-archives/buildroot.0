Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22389C636CC
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 10:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0EF0611CE;
	Thu, 16 Feb 2023 10:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0EF0611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U0iOZCPgHF1X; Thu, 16 Feb 2023 10:08:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6206611D0;
	Thu, 16 Feb 2023 10:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6206611D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 810B21BF333
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 10:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A31941883
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 10:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A31941883
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JyDF0TYxz1-W for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 10:08:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7133941882
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7133941882
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 10:08:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 369F8165C;
 Thu, 16 Feb 2023 02:08:45 -0800 (PST)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.33])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 CB46C3F703; Thu, 16 Feb 2023 02:08:01 -0800 (PST)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 11:07:51 +0100
Message-Id: <20230216100751.446662-2-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230216100751.446662-1-vincent.stehle@arm.com>
References: <20230216100751.446662-1-vincent.stehle@arm.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/qemu_aarch64_ebbr: bump linux to
 6.1.12 and u-boot to 2023.01
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB2ZXJzaW9uIHRvIDYuMS4xMi4KLSBCdW1wIFUtQm9vdCB2ZXJz
aW9uIHRvIDIwMjMuMDEgYW5kIHJlbmFtZSBjb25maWcgZnJhZ21lbnQgdG8gbWFrZSBpdAogIGNs
ZWFyZXIgdGhhdCBpdCBpcyBub3QgYSBjb21wbGV0ZSBjb25maWcgZmlsZS4KClNpZ25lZC1vZmYt
Ynk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KQ2M6IFJvbWFpbiBO
YW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KLS0tCiAuLi4vcWVtdS9hYXJjaDY0LWViYnIv
e3UtYm9vdC5jb25maWcgPT4gdS1ib290LmZyYWdtZW50fSAgfCAwCiBjb25maWdzL3FlbXVfYWFy
Y2g2NF9lYmJyX2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBi
b2FyZC9xZW11L2FhcmNoNjQtZWJici97dS1ib290LmNvbmZpZyA9PiB1LWJvb3QuZnJhZ21lbnR9
ICgxMDAlKQoKZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3UtYm9vdC5jb25m
aWcgYi9ib2FyZC9xZW11L2FhcmNoNjQtZWJici91LWJvb3QuZnJhZ21lbnQKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIGJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3UtYm9vdC5jb25m
aWcKcmVuYW1lIHRvIGJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3UtYm9vdC5mcmFnbWVudApkaWZm
IC0tZ2l0IGEvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcgYi9jb25maWdzL3Fl
bXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZwppbmRleCBkMjkzYWQwZTYwLi5lMzE1NzA4OWE5IDEw
MDY0NAotLS0gYS9jb25maWdzL3FlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZworKysgYi9jb25m
aWdzL3FlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZwpAQCAtNiwxMiArNiwxMiBAQCBCUjJfUk9P
VEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2ggYm9hcmQvcWVt
dS9hYXJjaDY0LWViYnIvcAogQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSIkKEJSMl9ERUZD
T05GSUcpIC1jIGJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL2dlbmltYWdlLmNmZyIKIAogIyBMaW51
eCBoZWFkZXJzCi1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMD15CitC
UjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzZfMT15CiAKICMgS2VybmVsCiBC
UjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIy
X0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4wLjYiCitCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjEuMTIiCiBCUjJfTElOVVhfS0VSTkVMX1VTRV9B
UkNIX0RFRkFVTFRfQ09ORklHPXkKIEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9PUEVOU1NM
PXkKIApAQCAtMzksOSArMzksOSBAQCBCUjJfVEFSR0VUX09QVEVFX09TX1BMQVRGT1JNPSJ2ZXhw
cmVzcy1xZW11X2FybXY4YSIKIEJSMl9UQVJHRVRfVUJPT1Q9eQogQlIyX1RBUkdFVF9VQk9PVF9C
VUlMRF9TWVNURU1fS0NPTkZJRz15CiBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OPXkK
LUJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjIuMTAiCitCUjJfVEFS
R0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIzLjAxIgogQlIyX1RBUkdFVF9VQk9P
VF9CT0FSRF9ERUZDT05GSUc9InFlbXVfYXJtNjQiCi1CUjJfVEFSR0VUX1VCT09UX0NPTkZJR19G
UkFHTUVOVF9GSUxFUz0iYm9hcmQvcWVtdS9hYXJjaDY0LWViYnIvdS1ib290LmNvbmZpZyIKK0JS
Ml9UQVJHRVRfVUJPT1RfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTPSJib2FyZC9xZW11L2FhcmNoNjQt
ZWJici91LWJvb3QuZnJhZ21lbnQiCiBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQog
CiAjIEhvc3QgdG9vbHMKLS0gCjIuMzkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
