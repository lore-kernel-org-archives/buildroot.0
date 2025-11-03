Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A22ECCFA03
	for <buildroot@archiver.kernel.org>; Mon,  3 Nov 2025 21:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3669481107;
	Mon,  3 Nov 2025 21:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9DKSV1DSA6Cz; Mon,  3 Nov 2025 21:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DD781108
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DD781108;
	Mon,  3 Nov 2025 21:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD7AC278
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1B33406F6
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_YA5MmngPAV for <buildroot@buildroot.org>;
 Mon,  3 Nov 2025 21:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1879F40546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1879F40546
 for <buildroot@buildroot.org>; Mon,  3 Nov 2025 21:13:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 043A383B37; Mon,  3 Nov 2025 21:13:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Nov 2025 22:03:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14a0169714cd5c35be40faadc066412f144bc1a6
X-Git-Newrev: 6b7e87f4e174553832052cbbb3c01e17f9f605b3
X-Patchwork-Hint: ignore
Message-Id: <20251103211346.043A383B37@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12,
 17}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=6b7e87f4e174553832052cbbb3c01e17f9f605b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 7f1426c991..ffbd99a26c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.6" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 5b1d18e7cd..952802b339 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  8ecfbc6b693448abb46144a8d04d1e1631639c7661c1088425a2e5406f13c69c  linux-6.17.6.tar.xz
-sha256  55432b2af352f7bf3053c348d8549df2f2deeaa4a361c65d638c2f3b2ca7ec96  linux-6.12.56.tar.xz
-sha256  0a98c05e8d0f6b49fad71b8d779410a0811ea5ae17d81744fe30718633fd9047  linux-6.6.115.tar.xz
+sha256  ddf2ea0d4439e1d57136be3623102af9458f601f5b1cb77e83246e88aea09d0e  linux-6.17.7.tar.xz
+sha256  165ca1c37c4607b90e731996b7c1e3311285167d13deeedf08f3f1f0b9d2541a  linux-6.12.57.tar.xz
+sha256  a9a59742c29be284c205dc87cbe9b065f9688488132c8f5a6057a5539230a51d  linux-6.6.116.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 71ac9d5b89..9a23bb03f2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,9 +462,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.115"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.56"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.6"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.116"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.57"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.7"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
