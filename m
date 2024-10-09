Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952A8CEE357
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 22:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50C0B81133;
	Wed,  9 Oct 2024 22:02:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYVNYupo35ub; Wed,  9 Oct 2024 22:02:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6230A81220
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6230A81220;
	Wed,  9 Oct 2024 22:02:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 600791BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 22:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E92E403EB
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 22:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYCIZqNUVPQk for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 22:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=bb@ti.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 149954011A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 149954011A
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 149954011A
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 22:02:05 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499M24KF043117
 for <buildroot@buildroot.org>; Wed, 9 Oct 2024 17:02:04 -0500
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 499M24QM011931
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <buildroot@buildroot.org>; Wed, 9 Oct 2024 17:02:04 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 17:02:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 17:02:04 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 499M24Zu065146;
 Wed, 9 Oct 2024 17:02:04 -0500
Date: Wed, 9 Oct 2024 17:02:01 -0500
MIME-Version: 1.0
Message-ID: <20241009-am62ax-linux-headers-fix-v1-1-d46a03ce66bc@ti.com>
X-B4-Tracking: v=1; b=H4sIAFj9BmcC/x2MSQqAMAwAvyI5G+giin5FPARNNaBVWpSC9O8Wj
 zMw80LkIBxhqF4I/EiU0xfQdQXzRn5llKUwGGUarVSPdLSGEu7i74Qb08IhopOE1jpuFdnO6Q5
 KfgUu+l+PU84fhZ5yxGoAAAA=
To: <buildroot@buildroot.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=976; i=bb@ti.com;
 h=from:subject:message-id; bh=tCXY9pI04dsej7Q/C5VkulGgVbFQ1hLtJ5TSSNnv4ng=;
 b=owNCWmg5MUFZJlNZKt/wyQAAYn///77723c4LnL7KP/K+c73nad/fo97Dut5d/t/8//17M+wA
 RsYyHqaADQ0HqAMgPSMgAA0ADQDQANAAAAGgeobUPSAGI9Q09QaMnpDTyaelDkyANGgAyDQBpoD
 QxqeoB6mg9RoD0gAAaD1PU0NAxB+pGgPKA0000A0BoGJiGInqaBkZA000DE0DJpphMQ9QGmgaGQ
 GmmEZGmmRgmBNAAAxAGg0GgAAAIKqja+AKVBSEdqDqEMmKq1FoBjwhddKDQKPjBXlCiub7/naSd
 YKK2pfich33Lz1Rzt+HRwT9jElGAK+DwfGgZqChDc8lmrk20k0Y3QZJjr1kqTrB3aBgM5T/i+Iy
 CGqjzTUIBSQ1YzQVcz01VWYh+q6doSzxYAKfM3+HDYAx6/UTL2LIUxS7lQMguB6RbhLtUSVF12v
 e/MZ0hC35FhN+fkkv046/DpWlAddlEZlCD7kJXDa32TbsBNXwI5WGU6CjWWIuQk3Ri+JaIGZQvE
 EeMIhhkMoTqOYD48g/kGdHn3reR9LeVqUZOkaCFHlBoE8yusWRKSpDWYYkc5Kg2Twllnxnlj9uQ
 EVpUpTEkIyNat2IdMpagL+lhZ9HNAC/NFE2RqdNX7Dojm6hWBsbFm6BypeL1gmEBw4GISVgAel/
 i7kinChIFW/4ZI=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1728511324;
 bh=ELpZZAOS/jOk+EXQHDMg6bLQhu+EqBbYTYzvsxdpvjk=;
 h=From:Date:Subject:To:CC;
 b=b0AxI82vFNWMweSyBFZc/63b2ZRFSm6CVkXHoDkkrCqECjRTW00P84IdrjyvF6fKI
 0GkcpPOEPtGoxsTWdZgzLeepRwOmPif9ahPHfiKuwfxHwug/Iro/F99nXwfDFzktGi
 y1GPVckHwY7oIBI7J9s+spXKPaVEdKIiG3EduYvk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=b0AxI82v
Subject: [Buildroot] [PATCH] configs/ti_am62ax_sk_defconfig: add
 linux-headers version
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
From: Bryan Brattlof via buildroot <buildroot@buildroot.org>
Reply-To: Bryan Brattlof <bb@ti.com>
Cc: Bryan Brattlof <bb@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When bumping the Linux kernel version I inadvertently removed the pinned
linux-headers version from the defconfig which can break the build if
the default kernel version is not v6.10. Pin linux-headers to the
current am62ax-sk kernel version.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 configs/ti_am62ax_sk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ti_am62ax_sk_defconfig b/configs/ti_am62ax_sk_defconfig
index 77aa4a88e8ccd..1144577942b86 100644
--- a/configs/ti_am62ax_sk_defconfig
+++ b/configs/ti_am62ax_sk_defconfig
@@ -1,4 +1,5 @@
 BR2_aarch64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 BR2_GLOBAL_PATCH_DIR="board/ti/am62ax-sk/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"

---
base-commit: 449d72426bf78c744b8aa0aaec029ba926c70337
change-id: 20241009-am62ax-linux-headers-fix-33fe60a37f17

Best regards,
-- 
Bryan Brattlof <bb@ti.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
