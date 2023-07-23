Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE121C001DF
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB35409EA;
	Sun, 23 Jul 2023 17:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB35409EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GyFC3v-WJSpv; Sun, 23 Jul 2023 17:16:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24A7A409EB;
	Sun, 23 Jul 2023 17:16:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24A7A409EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3E61BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2337060A8D
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2337060A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gdzNt5XIqH4 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 17:16:06 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C56460A66
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 17:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C56460A66
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6BB21A4C077F
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 19:16:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37134)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qNcgd-0000WV-0b
 for buildroot@buildroot.org; Sun, 23 Jul 2023 19:16:03 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 23 Jul 2023 19:16:03 +0200
Message-Id: <20230723171603.1123429-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690132563;
 bh=rxYoMn1OkQGgOVPNovEgdFcXUFAtr/ojHKZmVd+eHrc=;
 h=From:To:Subject:Date:From;
 b=SWHdiTHphkWyi8SaY3rLPG1AfFXVHt8L7SEZjMBZmlyvKZw30SldHgo4FZ53bhI38
 +yOicJr4BRo1BC9HouYMHPali61dQ9QMxMvYFokDcL5UVyDuTeYlvG+qsbzvxLExtA
 w+6MgNnedOIC5oE+d4Q2fdTiiwKI979SirzXET23e3h5bAfPHbzMpCjgvUPp15TWUO
 i+9XqCZ6jkJWWBpmaunpiVndi/fTtl4kGbH9o0tE5O6y4+UWctya/Lq3yks1yoJAug
 NwhhzgcRYcZ9I6Fet0pIWJElrs4ikKvcv0lTvGMD0MBVFSJXlXUzbVVtef3fzlXAll
 j6NU7z+0oON0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=SWHdiTHp
Subject: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 5.15.x / 6.{1,
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
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1ab65cf266..87d1a81915 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.4" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.5" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 7541ae9123..c80fcf5eff 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  9cbc4a2be714a4d154e1312c9f33ded91174907c8b15ee936ad27002ac75ff2a  linux-6.4.4.tar.xz
-sha256  4cddee22fdf657138a06af653492f67cd3a4762c04a34725534bd200d99085b8  linux-6.1.39.tar.xz
+sha256  374e2c07463c51dfd71204b7fac3b73c7f973550ae019b74e9f2b815b28de9b7  linux-6.4.5.tar.xz
+sha256  43eafc2197a07dcdcff7a7ef79ac7502061f7c564744e51626bf5fa2e22587f0  linux-6.1.40.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
+sha256  07e0cebdb00d25459683e9c330a0576349b8c5e5f2abf053b864f9909151c31d  linux-5.15.121.tar.xz
 sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
 sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6eb7b3577b..ca841d6114 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -404,9 +404,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.39"	if BR2_KERNEL_HEADERS_6_1
-	default "6.4.4"		if BR2_KERNEL_HEADERS_6_4
+	default "5.15.121"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.40"	if BR2_KERNEL_HEADERS_6_1
+	default "6.4.5"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
