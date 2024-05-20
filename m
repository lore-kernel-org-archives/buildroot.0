Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23C0C04FFE
	for <buildroot@archiver.kernel.org>; Mon, 20 May 2024 11:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8366A40106;
	Mon, 20 May 2024 11:17:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3zeseCHpRbAi; Mon, 20 May 2024 11:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8CA5A40173
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8CA5A40173;
	Mon, 20 May 2024 11:17:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15AB31BF41B
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 11:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F3A640173
 for <buildroot@lists.busybox.net>; Mon, 20 May 2024 11:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lh5R6flYwDGL for <buildroot@lists.busybox.net>;
 Mon, 20 May 2024 11:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::223;
 helo=relay3-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A938D4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A938D4000B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A938D4000B
 for <buildroot@buildroot.org>; Mon, 20 May 2024 11:17:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44A2E60002;
 Mon, 20 May 2024 11:17:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s911H-005ATk-1P;
 Mon, 20 May 2024 13:17:31 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 13:17:26 +0200
Message-Id: <20240520111730.1231889-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240520111730.1231889-1-peter@korsgaard.com>
References: <20240520111730.1231889-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/5] configs/orangepi_pc_defconfig: bump Linux
 to 5.10.217 to fix gcc 13.x build
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIDUuMTAuOSBrZXJuZWwgZmFpbHMgdG8gYnVpbGQgd2l0aCBHQ0MgMTMueDoKCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjoKZHJpdmVycy9hdGEvbGliYWhjaS5jOiBJbiBm
dW5jdGlvbiDigJhhaGNpX2xlZF9zdG9yZeKAmToKLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJf
dHlwZXMuaDozMTU6NDU6IGVycm9yOiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMy
MeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJvcjogQlVJTERfQlVHX09OIGZhaWxlZDog
c2l6ZW9mKF9zKSA+IHNpemVvZihsb25nKQogIDMxNSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fz
c2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykK
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KLi8u
L2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDoyOTY6MjU6IG5vdGU6IGluIGRlZmluaXRp
b24gb2YgbWFjcm8g4oCYX19jb21waWxldGltZV9hc3NlcnTigJkKICAyOTYgfCAgICAgICAgICAg
ICAgICAgICAgICAgICBwcmVmaXggIyMgc3VmZml4KCk7ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+Ci4vLi9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MzE1Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNy
byDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZCiAgMzE1IHwgICAgICAgICBfY29tcGlsZXRpbWVf
YXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fQ09VTlRFUl9f
KQogICAgICB8ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvYnVp
bGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhjb21waWxldGlt
ZV9hc3NlcnTigJkKICAgMzkgfCAjZGVmaW5lIEJVSUxEX0JVR19PTl9NU0coY29uZCwgbXNnKSBj
b21waWxldGltZV9hc3NlcnQoIShjb25kKSwgbXNnKQogICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvYnVp
bGRfYnVnLmg6NTA6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19P
Tl9NU0figJkKICAgNTAgfCAgICAgICAgIEJVSUxEX0JVR19PTl9NU0coY29uZGl0aW9uLCAiQlVJ
TERfQlVHX09OIGZhaWxlZDogIiAjY29uZGl0aW9uKQogICAgICB8ICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fgouL2luY2x1ZGUvbGludXgvbm9zcGVjLmg6NTg6OTogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTuKAmQogICA1OCB8ICAgICAgICAgQlVJTERfQlVHX09O
KHNpemVvZihfcykgPiBzaXplb2YobG9uZykpOyAgICAgICAgICAgICAgICAgICAgICAgIFwKICAg
ICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fgpkcml2ZXJzL2F0YS9saWJhaGNpLmM6MTEzNzoyMzog
bm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGFycmF5X2luZGV4X25vc3BlY+KAmQogMTEz
NyB8ICAgICAgICAgICAgICAgICBwbXAgPSBhcnJheV9pbmRleF9ub3NwZWMocG1wLCBFTV9NQVhf
U0xPVFMpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn4K
ClRoaXMgaXMgZml4ZWQgdXBzdHJlYW0gYnkgY29tbWl0IGYwNzc4ODA3OWY1MTVjYSAoYXRhOiBh
aGNpOiBmaXggZW51bQpjb25zdGFudHMgZm9yIGdjYy0xMyksIHdoaWNoIGhhcyBiZWVuIGJhY2tw
b3J0ZWQgdG8gNS4xMC54IGFzIG9mIDUuMTAuMTg0LApzbyBidW1wIHRvIHY1LjEwLjIxNyB0byBm
aXggdGhlIGJ1aWxkLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgS29yc2dhYXJkIDxwZXRlckBrb3Jz
Z2FhcmQuY29tPgotLS0KIGNvbmZpZ3Mvb3JhbmdlcGlfcGNfZGVmY29uZmlnIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
Y29uZmlncy9vcmFuZ2VwaV9wY19kZWZjb25maWcgYi9jb25maWdzL29yYW5nZXBpX3BjX2RlZmNv
bmZpZwppbmRleCAwNDY0ZGU1NjE5Li5iMTRjZjU2MTU1IDEwMDY0NAotLS0gYS9jb25maWdzL29y
YW5nZXBpX3BjX2RlZmNvbmZpZworKysgYi9jb25maWdzL29yYW5nZXBpX3BjX2RlZmNvbmZpZwpA
QCAtMTAsNyArMTAsNyBAQCBCUjJfUk9PVEZTX1BPU1RfSU1BR0VfU0NSSVBUPSJzdXBwb3J0L3Nj
cmlwdHMvZ2VuaW1hZ2Uuc2giCiBCUjJfUk9PVEZTX1BPU1RfU0NSSVBUX0FSR1M9Ii1jICQoQklO
QVJJRVNfRElSKS9nZW5pbWFnZS5jZmciCiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iNS4xMC45IgorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNS4x
MC4yMTciCiBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0ic3VueGkiCiBCUjJfTElOVVhfS0VS
TkVMX0NPTkZJR19GUkFHTUVOVF9GSUxFUz0iYm9hcmQvb3JhbmdlcGkvb3JhbmdlcGktcGMvbGlu
dXguZnJhZ21lbnQiCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLS0gCjIuMzkuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
