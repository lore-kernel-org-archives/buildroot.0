Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4C8C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 19:27:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7B5610B3;
	Wed,  1 Feb 2023 19:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7B5610B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMmZpGjWH025; Wed,  1 Feb 2023 19:27:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EB72610A3;
	Wed,  1 Feb 2023 19:27:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB72610A3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 089661BF31A
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D677A610A3
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 19:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D677A610A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bmW0CEEYD84Z for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 19:27:17 +0000 (UTC)
X-Greylist: delayed 00:05:12 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A798361076
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A798361076
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 19:27:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1675279634; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=YXs6tkRByGKiKYzhgWCb1LHYUmwbtMQV1LcXXWu+mJFL/O8YI5Nrkg+VbOrvOpNYOt
 reweqlk3IzLqbP71t5XKW4ObcO78IR/P2nlKlvoUXqu5VTcCv/KhNkTcpbJHhX+X7zHC
 /cZOyvmgbijkosVFwHpxVTffdzdSGpbNAo6WSqBYWmMoXYyctR0KpP0TjO/cb1JrBbiP
 nNSjrNgRyXXALp2vxZUw4JN0zdWl/i68xZPOL+MrNOPGwSh5vSiOLygeQa0JJTqTfTR5
 hHUEx7ypOPfxoPQcCRbYH+NGbRFDjLQv8+b+aI4CEFw81xAvSB8jpft/tyOz+koM4zk0
 SbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1675279634;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=B5ePxmuSoz262eVRTugeop1GcihQaHYg10YM8fJFecw=;
 b=jN9zI6/G/36mlshhpO0xHK4pCwh8Wod5E3ho3Xce7BvP3BhW8cB0vB8hqGAww9n6yn
 PbcMj9Vb9HwrdB7gj1pioECL2sk6NQSV0YaHbMCeWV7RdWrVVthIoRIUAf62+tC16wB4
 oOheVjBEevAW2EKn6XzveaguLuClJKR57wj+zsv5qmoaNlU2ujkmjttWIvtKcr9XsmLN
 E+Sw3MQaiQ8jUMY4fSgr+vf6Y8XZWjmvatkspZ37PJK8/rBEfZEQP2THOzrwydvogts3
 jZTpen8g2Cs9rz00Xq4TiCSsdnedrBN4p1mYiDmmqN5C1Y67CfmydydtF6VOmy+BvMFo
 tjPQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxl+SKU"
Received: from tesla.fritz.box by smtp.strato.de (RZmta 49.2.2 DYNA|AUTH)
 with ESMTPSA id xd73d3z11JREZcd
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Wed, 1 Feb 2023 20:27:14 +0100 (CET)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Wed,  1 Feb 2023 20:27:11 +0100
Message-Id: <20230201192711.1632095-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1675279634; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=B5ePxmuSoz262eVRTugeop1GcihQaHYg10YM8fJFecw=;
 b=L48qN5mQmWt/43uxKaro04veM4kWKla8yliJlJZkQAvoguP4rXHFE500VFaWUuMwlO
 CNbL0vNRE9tziDr0DujUVQk8ewRY7Hz33hUjHUpRzcEWdaTIIAH4YXXRmKsEvEBKqF7i
 wY8E6Fz5YGcAVL6DnWlrlizZ3Oyt8pkJCB/nYy1pBGLHItp71EcvcyUmW748zrTamVvA
 V7JsTAlGb30UKFM7/VWDdRfqaVKCyAsZFZFjNrE6BlcBnM2qlMzwTaS8cZPD079QL6nA
 M8LTXOdE5YESDsf7qJazzTye06nUiRkxX3lmmd6iSYg6ZKsF56J3xOvCre2r/2l7YL3i
 aQEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=dawncrow.de header.i=@dawncrow.de
 header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=L48qN5mQ
Subject: [Buildroot] [PATCH] DEVELOPERS: Remove openal from my list
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

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIERFVkVM
T1BFUlMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZTE5MDg3YzU3Ny4uZDUyNjQ1MWNhMyAxMDA2
NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xMzMsNyArMTMzLDYgQEAg
RjoJYm9vdC90aS1rMy1yNS1sb2FkZXIvCiAKIE46CUFuZHLDqSBad2luZyA8bmVydkBkYXduY3Jv
dy5kZT4KIEY6CXBhY2thZ2UvbGlia3JiNS8KLUY6CXBhY2thZ2Uvb3BlbmFsLwogRjoJcGFja2Fn
ZS9wN3ppcC8KIEY6CXBhY2thZ2Uvd2luZS8KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
