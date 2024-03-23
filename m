Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5E4C54E58
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 21:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E070814C1;
	Sat, 23 Mar 2024 21:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPrvYKS3qDIL; Sat, 23 Mar 2024 21:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 569758232E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 569758232E;
	Sat, 23 Mar 2024 21:08:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E60B11BF2FA
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 21:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2B0B60626
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 21:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHcP2IfGyROD for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 21:08:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE20E6061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE20E6061A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE20E6061A
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 21:08:03 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1D66CB0053E;
 Sat, 23 Mar 2024 22:07:57 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 22:07:53 +0100
Message-ID: <20240323210753.139567-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711228080;
 bh=9E2IAnZyxld7+tO0jyAvC54z20BratZDbMkAcZO/gs0=;
 h=From:To:Cc:Subject:Date:From;
 b=C5MmmmWawlpTdPQBlPylnAbhc5LRxFdRRgmR7UKPa4DGdJqZEMBboFCQxNKV/Dunn
 8gN1rg5sqsL0biXbPcSGsHyyFf5LhkaCYUN0iFkaR3ZPvRdqYCXVmVjLYTTUNF28Zn
 i35Dvt+6EG5L+SL42uI/fg7qNa0LosE/eEodpAf8hCyBsGS7NyQhTKbhzJusf9Kmv+
 NfHNBHOQ6n8TggVUnp7jXAnskXqTqDwTPViNvX3s3edNzSAgK7gCQpQWBGE9y3Q7Z5
 ECcJIhXtK8Sf4ecwzRxZWlx0hhs4fU49jwQqTao2PiC5+Pre2mILj/KtpGGoPTBQ4N
 kzO6X2Fk3BWfg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=C5MmmmWa
Subject: [Buildroot] [PATCH 1/1] package/gnu-efi: bump to version 3.0.18
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For commit logs, see:
https://sourceforge.net/p/gnu-efi/code/ci/3.0.18/log/

This bump is motivated by riscv64 improvements.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested on branch master at commit f2846f8 with commands:

    utils/docker-run make check-package
    ...
    0 warnings generated

    support/testing/run-tests \
        -d dl -o output_folder \
        tests.boot.test_syslinux.TestSysLinuxX86_64EFI
    ...
    OK
---
 package/gnu-efi/gnu-efi.hash | 6 +++---
 package/gnu-efi/gnu-efi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gnu-efi/gnu-efi.hash b/package/gnu-efi/gnu-efi.hash
index 7d986509917..e059da867e0 100644
--- a/package/gnu-efi/gnu-efi.hash
+++ b/package/gnu-efi/gnu-efi.hash
@@ -1,6 +1,6 @@
 # From http://sourceforge.net/projects/gnu-efi/files
-md5  832496719182e7d6a4b12bc7c0b534d2  gnu-efi-3.0.17.tar.bz2
-sha1  9715285022124b231520d58b26709f5ab338e981  gnu-efi-3.0.17.tar.bz2
+md5  0b93ad70dff96991dd87978fc4275bd1  gnu-efi-3.0.18.tar.bz2
+sha1  4f12dc4ab3e7940070c87affea17bf8a6209957a  gnu-efi-3.0.18.tar.bz2
 # Locally computed
-sha256  7807e903349343a7a142ebb934703a2872235e89688cf586c032b0a1087bcaf4  gnu-efi-3.0.17.tar.bz2
+sha256  7f212c96ee66547eeefb531267b641e5473d7d8529f0bd8ccdefd33cf7413f5c  gnu-efi-3.0.18.tar.bz2
 sha256  42d352e9c28dd446fd0209cd6f75588c8e41f0934540bb382bbd61c752360265  README.efilib
diff --git a/package/gnu-efi/gnu-efi.mk b/package/gnu-efi/gnu-efi.mk
index 8b9a6aa4c66..96caaeb9336 100644
--- a/package/gnu-efi/gnu-efi.mk
+++ b/package/gnu-efi/gnu-efi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNU_EFI_VERSION = 3.0.17
+GNU_EFI_VERSION = 3.0.18
 GNU_EFI_SOURCE = gnu-efi-$(GNU_EFI_VERSION).tar.bz2
 GNU_EFI_SITE = http://downloads.sourceforge.net/project/gnu-efi
 GNU_EFI_INSTALL_STAGING = YES
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
