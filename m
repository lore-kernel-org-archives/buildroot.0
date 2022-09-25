Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B37C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 13:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318EC83267;
	Sun, 25 Sep 2022 13:32:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318EC83267
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1RhfGp6wbYDU; Sun, 25 Sep 2022 13:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D3B483224;
	Sun, 25 Sep 2022 13:32:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D3B483224
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E45EC1BF2AA
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD7C0404D8
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 13:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD7C0404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NOVPWQl80T3A for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 13:32:36 +0000 (UTC)
X-Greylist: delayed 00:10:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3003404C1
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3003404C1
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 13:32:35 +0000 (UTC)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Mb64c4dxXz4xG7;
 Sun, 25 Sep 2022 23:22:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mb64b1ssHz4xFv;
 Sun, 25 Sep 2022 23:22:22 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Date: Sun, 25 Sep 2022 15:22:18 +0200
Message-Id: <20220925132218.3848758-1-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/aspeed_ast2600evb: Set
 BR2_ARM_FPU_VFPV4D16
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
Cc: Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGZlYXR1cmVzIG9mIHRoZSBDb3J0ZXggQTcgQ1BVIG9uIHRoZSBBc3BlZWQgQVNUMjYwMCBB
MyBTb0MgYXJlIDoKCiAgaGFsZiB0aHVtYiBmYXN0bXVsdCB2ZnAgZWRzcCB2ZnB2MyB2ZnB2M2Qx
NiB0bHMgdmZwdjQgaWRpdmEgaWRpdnQgbHBhZSBldnRzdHJtCgp0aGUgdmZwdjNkMTYgZmVhdHVy
ZSBiaXQgaXMgY29tbW9uIHRvIGJvdGggdmZwdjMgYW5kIHZmcHY0LgoKRHJvcCBCUjJfQVJNX0ZQ
VV9WRlBWNCB3aGljaCBhY3RpdmF0ZXMgdGhlIHVzZSBvZiB2cGZkMzIgKGFuZCBicmVha3MKdXNl
ciBzcGFjZSkuIFNldCBCUjJfQVJNX0ZQVV9WRlBWNEQxNiBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1i
eTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBjb25maWdzL2FzcGVlZF9h
c3QyNjAwZXZiX2RlZmNvbmZpZyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJf
ZGVmY29uZmlnIGIvY29uZmlncy9hc3BlZWRfYXN0MjYwMGV2Yl9kZWZjb25maWcKaW5kZXggY2Qw
NThhZDBhYzI4Li4wNDIzOTU2NmM4MzggMTAwNjQ0Ci0tLSBhL2NvbmZpZ3MvYXNwZWVkX2FzdDI2
MDBldmJfZGVmY29uZmlnCisrKyBiL2NvbmZpZ3MvYXNwZWVkX2FzdDI2MDBldmJfZGVmY29uZmln
CkBAIC0xLDcgKzEsNyBAQAogIyBBcmNoaXRlY3R1cmUKIEJSMl9hcm09eQogQlIyX2NvcnRleF9h
Nz15Ci1CUjJfQVJNX0ZQVV9WRlBWND15CitCUjJfQVJNX0ZQVV9WRlBWNEQxNj15CiAKICMgU3lz
dGVtCiBCUjJfVEFSR0VUX0dFTkVSSUNfSE9TVE5BTUU9ImFzcGVlZC1ldmIiCi0tIAoyLjM3LjMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
