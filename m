Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB16C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 15:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12C3C83AFA;
	Fri, 25 Aug 2023 15:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C3C83AFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-tu0IqMwFWg; Fri, 25 Aug 2023 15:33:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC79783B36;
	Fri, 25 Aug 2023 15:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC79783B36
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37E1C1BF271
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10ECD83B36
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 15:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10ECD83B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUO8rWNDZTcV for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 15:32:59 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6BD183AFA
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 15:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6BD183AFA
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 66D87A4C0432
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 17:32:54 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57958)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qZYnt-00056P-3B
 for buildroot@buildroot.org; Fri, 25 Aug 2023 17:32:54 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 17:32:53 +0200
Message-Id: <20230825153253.34281-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692977574;
 bh=QpYPsl16PhrYtVz814N625m7LhU17Sa2cxYYeMbiD84=;
 h=From:To:Subject:Date:From;
 b=yca87GtyAxXAgjpMHMMhXVMGMxzxbZ4EPofQVAIGAWKx4p7JuDo2t07Ly70PgzT8p
 nJQesjYPdaRi9sFq/n2EyLSBdPqvp6wp0wsuw0Ueu1W0nm1AWzB8ezQRenleflIBK8
 t8mK2kOMZoUM3m83k4/eSldFHTk3LpO+sGr3GuL9qN0/TKvikQLQqwwKYXXdyePSCO
 kBUwS7Lhw4BGdT/PBv81TzyxjapyuIDz0i2uowXn3TUnycSzM7a2pUF0VRYBnj6fj6
 yzmax+bx1/21P7v/PGempzpdx6K0Watsa8MDrgXVdNPaonLFwvYVrLoIFN+H5GuC+2
 i9Bk2yD58Gz2g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=yca87Gty
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{1,
 4}.x series
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
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d3448ba744..dcfc31ac8b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.11" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0177988c45..246820827d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  546b68b5097d3c0d74722de62aae217729d98e45fbb6bd458b490ac21ea40918  linux-6.4.11.tar.xz
-sha256  f5f67bcfccd47f8d9db2d5ba24e33af7778f40a777577d1fba424f4a1712a296  linux-6.1.46.tar.xz
+sha256  cca91be956fe081f8f6da72034cded96fe35a50be4bfb7e103e354aa2159a674  linux-6.4.12.tar.xz
+sha256  93d58b6af007a5f44dd26831ff310707deb1ab9380c5136a534287eb3fddfcab  linux-6.1.47.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  add0a575341b263a06e93599fc220a5dd34cb4ca5b9d05097a5db2a061928f26  linux-5.15.127.tar.xz
 sha256  cb54660ed4917cc4f9a9ab93d117defefd8bcbe745ec6082d909bbfd5ae962c2  linux-5.10.191.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8a25067003..df22bfc1c1 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -405,8 +405,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.254"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.191"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.127"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.46"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.11"	if BR2_KERNEL_HEADERS_6_4
+	default "6.1.47"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.12"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
