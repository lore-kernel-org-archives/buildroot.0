Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B36FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 17:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBEF041821;
	Thu,  3 Nov 2022 17:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBEF041821
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bf-MdbrxCvJl; Thu,  3 Nov 2022 17:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B07774181C;
	Thu,  3 Nov 2022 17:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B07774181C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0C901BF3B5
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 17:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C0F84047C
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 17:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C0F84047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VaNTAZVd5XP8 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 17:23:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8DE2403B7
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8DE2403B7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 17:23:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CD8E1FB;
 Thu,  3 Nov 2022 10:23:05 -0700 (PDT)
Received: from localhost.localdomain (X72Y076X74.nice.arm.com [10.34.129.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id
 C55D03F5A1; Thu,  3 Nov 2022 10:22:58 -0700 (PDT)
From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 18:22:47 +0100
Message-Id: <20221103172247.1629518-1-vincent.stehle@arm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/qemu_aarch64_ebbr: bump u-boot and
 linux versions
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

LSBCdW1wIFUtQm9vdCB2ZXJzaW9uIHRvIHYyMDIyLjEwLgotIEJ1bXAgTGludXgga2VybmVsIHZl
cnNpb24gdG8gdjYuMC4wLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50
LnN0ZWhsZUBhcm0uY29tPgpDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29t
PgotLS0KIGNvbmZpZ3MvcWVtdV9hYXJjaDY0X2ViYnJfZGVmY29uZmlnIHwgNiArKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZjb25maWcgYi9jb25maWdzL3FlbXVfYWFy
Y2g2NF9lYmJyX2RlZmNvbmZpZwppbmRleCAxNTgyMmUxN2EzLi5hMGQ4MTA1YzQzIDEwMDY0NAot
LS0gYS9jb25maWdzL3FlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZworKysgYi9jb25maWdzL3Fl
bXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZwpAQCAtNiwxMiArNiwxMiBAQCBCUjJfUk9PVEZTX1BP
U1RfSU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2ggYm9hcmQvcWVtdS9hYXJj
aDY0LWViYnIvcAogQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSIkKEJSMl9ERUZDT05GSUcp
IC1jIGJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL2dlbmltYWdlLmNmZyIKIAogIyBMaW51eCBoZWFk
ZXJzCi1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTc9eQorQlIyX1BB
Q0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzA9eQogCiAjIEtlcm5lbAogQlIyX0xJ
TlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKLUJSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTkuOCIKK0JSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMC42IgogQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9E
RUZBVUxUX0NPTkZJRz15CiBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiAK
QEAgLTM5LDcgKzM5LDcgQEAgQlIyX1RBUkdFVF9PUFRFRV9PU19QTEFURk9STT0idmV4cHJlc3Mt
cWVtdV9hcm12OGEiCiBCUjJfVEFSR0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERf
U1lTVEVNX0tDT05GSUc9eQogQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Ci1CUjJf
VEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIyMDIyLjA3IgorQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyMi4xMCIKIEJSMl9UQVJHRVRfVUJPT1RfQk9B
UkRfREVGQ09ORklHPSJxZW11X2FybTY0IgogQlIyX1RBUkdFVF9VQk9PVF9DT05GSUdfRlJBR01F
TlRfRklMRVM9ImJvYXJkL3FlbXUvYWFyY2g2NC1lYmJyL3UtYm9vdC5jb25maWciCiBCUjJfVEFS
R0VUX1VCT09UX05FRURTX09QRU5TU0w9eQotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
