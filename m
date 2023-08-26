Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2766AC83F15
	for <buildroot@archiver.kernel.org>; Sat, 26 Aug 2023 18:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757A7418EE;
	Sat, 26 Aug 2023 18:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 757A7418EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zn4Qc34K5tN; Sat, 26 Aug 2023 18:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CE1F418F7;
	Sat, 26 Aug 2023 18:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CE1F418F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DAD8B1BF589
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B33BC60BA6
 for <buildroot@lists.busybox.net>; Sat, 26 Aug 2023 18:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B33BC60BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jH5qZlaZSsIS for <buildroot@lists.busybox.net>;
 Sat, 26 Aug 2023 18:02:53 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5344460ABE
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 18:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5344460ABE
Received: from fli4l.lan.fli4l (p54a1bff9.dip0.t-ipconnect.de [84.161.191.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 16DF2A4C0845
 for <buildroot@buildroot.org>; Sat, 26 Aug 2023 20:02:50 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42090)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZxcX-0006u5-2Z
 for buildroot@buildroot.org; Sat, 26 Aug 2023 20:02:49 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 26 Aug 2023 20:02:49 +0200
Message-Id: <20230826180249.5467-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1693072970;
 bh=n1KKL0MQtwkZL67DKZboZVEY4ckc/UEoCVvz4qyqUgM=;
 h=From:To:Subject:Date:From;
 b=Tk1ASba5DrvPOGyq5sAH3IGSZM2agqHv47LdB7lcPTuXE1HCP6QVmdZAJRZufFE6E
 iNZT8o9JXQLoGuLu4Od9NVjBPLiVqrO2t8J84CS3UBHPYTEMFi6y1TV30DupHJtFGW
 6Zr/N6WTmAaF24iLVJai6vLiVxBPU9JVrNnfF3y1AbatvPD9Dm3BGNVMixY//FbGcm
 XH1HdmGD/O24bOKYJLxKL/pdDCjXjWbgTjuv+n7Ep6gVfFpugPKhwUkj579MrBpXLz
 01W8eP+dimgSUfhN2Npc1SZLlCQ3+HONRPGdfFrCKTcwo5eUVPVuEt65cvaKyKE7sk
 U4jWZLZbkDoVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Tk1ASba5
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.1.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 246820827d..d236dadad8 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  cca91be956fe081f8f6da72034cded96fe35a50be4bfb7e103e354aa2159a674  linux-6.4.12.tar.xz
-sha256  93d58b6af007a5f44dd26831ff310707deb1ab9380c5136a534287eb3fddfcab  linux-6.1.47.tar.xz
+sha256  c606cbd0353e677df6fae73cc16ba3c9244b98372ed7771d551024016f55ac31  linux-6.1.48.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
-sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
+sha256  0f2eca845183fd76f53b0c867c97f12b9ace2d7e8ee2cdeec7eb2897651b80de  linux-5.15.128.tar.xz
+sha256  c40d11ee56e50a132429badbd1ba1c53e42b3312590b2a39be34c241d1b0b5b9  linux-5.10.192.tar.xz
 sha256  51608da961b5e34d6a9452a7b302699e109633f769a4253c74b1048abba8d9c7  linux-5.4.254.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  349728d3d143fcee484b34e34e536fe48dfb8bb71263f81a66fd572cc9162137  linux-4.19.292.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index df22bfc1c1..ba8d0f897c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -403,9 +403,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.14.323"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.292"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.47"	if BR2_KERNEL_HEADERS_6_1
+	default "5.10.192"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.128"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.48"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.12"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
