Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36088CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 14:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED15C8424F;
	Sun, 24 Aug 2025 14:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hpGpKOZI9nXg; Sun, 24 Aug 2025 14:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EC8B84281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC8B84281;
	Sun, 24 Aug 2025 14:37:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10779CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA8408424F
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoYm6rgMg1Hz for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 335C083FB6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 335C083FB6
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2379A87A55; Sun, 24 Aug 2025 14:37:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Aug 2025 16:36:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ce896b28b3c165f46fdaba01e1b25f3a3c223cd
X-Git-Newrev: 522b56cd50c3635bc751a0855f92a1ae6adee2cc
X-Patchwork-Hint: ignore
Message-Id: <20250824143703.2379A87A55@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1, 6, 12,
 16}.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=522b56cd50c3635bc751a0855f92a1ae6adee2cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1d2334dde1..4cab438250 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.16" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.16.2" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 80181fd78e..6aaa163eb2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab48516bcc1befbcd83  linux-6.16.tar.xz
-sha256  6b19a3ae99423de2416964d67251d745910277af258b4c4c63e88fd87dbf0e27  linux-6.12.41.tar.xz
-sha256  8c4ff2869736538b9b0d88ea8dbf0332b79c6ecc40a32066768a754df1fae1c0  linux-6.6.101.tar.xz
-sha256  218f25663a41e3d811e84fa1c4acec50684898b2f6d0c8c0deb531d937e466f7  linux-6.1.147.tar.xz
+sha256  b760a6fa793d774fbd3b7fa0bea3efd5c4f5294dfb98ef1bd5f6d5f7cef4f06d  linux-6.16.2.tar.xz
+sha256  0fcbbbbcd456e87bbbfc8bf37af541fda62ccfcce76903503424fd101ef7bdee  linux-6.12.43.tar.xz
+sha256  80d2feb7334c30bacbe1e7dafa9ea415efb2c0ea4f4740ecbd1467cf5d94de5c  linux-6.6.102.tar.xz
+sha256  d9a03d3a2771c60fc726c58d3bba61123e5fd22d45ed27f6cf7a308c171180a1  linux-6.1.148.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e3d0025b87278e14733cb326700f17c7cceb54d920622b0d5fcd58a88c6850c3  linux-5.15.189.tar.xz
 sha256  8d88c3977226d666554b75f480d1e6c5f4e4d2acdf2a3462840c6bac88634d13  linux-5.10.240.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 68f5504868..7ad66c33f0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -457,10 +457,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.296"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.240"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.189"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.147"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.101"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.41"	if BR2_KERNEL_HEADERS_6_12
-	default "6.16"		if BR2_KERNEL_HEADERS_6_16
+	default "6.1.148"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.102"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.43"	if BR2_KERNEL_HEADERS_6_12
+	default "6.16.2"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
