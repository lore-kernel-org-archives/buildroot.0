Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37521C4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 19:35:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98AC6405E1;
	Mon, 15 Apr 2024 19:35:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YG3s3ZXTC0kv; Mon, 15 Apr 2024 19:35:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 475AE406A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 475AE406A2;
	Mon, 15 Apr 2024 19:35:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D79F1BF39E
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 19:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A6ED605EE
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 19:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1zpnZchHEcEA for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 19:35:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A78A605E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A78A605E2
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A78A605E2
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 19:35:32 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B5D75B00563;
 Mon, 15 Apr 2024 21:35:28 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 21:35:22 +0200
Message-ID: <20240415193522.7719-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713209729;
 bh=NR9GH6xqLNbe4I6BfYdz3sFrGrMk2TKsjkqCOlyHOkA=;
 h=From:To:Cc:Subject:Date:From;
 b=TFlBqE1DAExNu+g949IlmJL0D1gEwSQh+fhgDSKxDHZGHXPlPZufBBqpCr59+nC5E
 xLxAabQzefi+EV/dEY8GCdx20zWfOHP8JQ/eCisPsJphGDrwp5ohbh5zX6yH9XhuzI
 PITVozpogsMeBLej5NxE8p2/MkEUW5dVj/rJYlqhhI1G4P/dbawEcUNKswJqjZbG27
 5yiVioMQW8OQW8W5GvtDd/hmVsYEPL13cgJOA+tewY9mdr594z2pxArPZuyWj24LJF
 wfWajKUYNMyp8LFzRfNQjZgH71o4NBJqeJXXIDAHSsG7jBM8M1z92YHO7mds7fpG5Q
 DrtvmYXg0DEHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TFlBqE1D
Subject: [Buildroot] [PATCH 1/1] support/testing: fs: f2fs: bump test Kernel
 to 6.6.27
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the toolchain Bootlin update to 2023.11-1 [1], the arm Linux
kernel build is broken with binutils >= 2.41 with:

    arch/arm/mm/proc-v7.S: Assembler messages:
    arch/arm/mm/proc-v7.S:640: Error: junk at end of line, first unrecognized character is '#'

This commit fixes the issue by bumping the test Kernel version to the
latest LTS version 6.6.27. We bump to the 6.6.x series to refresh the
test, as the 4.19.x series is planned to be end-of-life soon, in
December 2024.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/6623401447

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/7e0e6e3b8618ab942f25b11ee72fbc5a4deefdf1

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/fs/test_f2fs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/fs/test_f2fs.py b/support/testing/tests/fs/test_f2fs.py
index 425fbe31cac..5918fe8ca8c 100644
--- a/support/testing/tests/fs/test_f2fs.py
+++ b/support/testing/tests/fs/test_f2fs.py
@@ -20,7 +20,7 @@ class TestF2FS(infra.basetest.BRTest):
         # BR2_TARGET_ROOTFS_TAR is not set
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
         BR2_LINUX_KERNEL_USE_DEFCONFIG=y
         BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
         BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
