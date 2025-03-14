Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6029C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD3CB820B9;
	Mon, 19 May 2025 10:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wtg4UvYo6k_y; Mon, 19 May 2025 10:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C117F8215C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C117F8215C;
	Mon, 19 May 2025 10:40:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 062E2E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBAA540664
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4imbdOiQIAqF for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988A640C46
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 988A640C46
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9677C83A2E; Mon, 19 May 2025 10:39:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 19:15:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f60aa973d1fb3905eb3f655b32ec368419e2bf6
X-Git-Newrev: a79c862fa193d4f0685a1619f391fe228346d8ea
X-Patchwork-Hint: ignore
Message-Id: <20250519103942.9677C83A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] {linux,
 linux-headers}: bump 5.{4, 10, 15}.x / 6.{1, 6, 12}.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a79c862fa193d4f0685a1619f391fe228346d8ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ac7b054d0b..dc6c5d384f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.18" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.19" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 8d24138c9f..8d1f3700e2 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  beb902a5f69d9e57710112203db38111dad6d30556ea8ce389284c8077fe944d  linux-6.12.18.tar.xz
-sha256  af483828e67f1b9918bc438d789cdbb06c13a4d43a41d5f35d44c9a6d620318f  linux-6.6.81.tar.xz
-sha256  9416b2c2d448ec7f54bb0ce5713fb34c32dae4a4edf1abd8cf7a8995cbac66fd  linux-6.1.130.tar.xz
+sha256  d73bf057bec04434b169d1b61641936f7d0c97ceb923a281f32e35dd4dcc6531  linux-6.12.19.tar.xz
+sha256  894bbbe63b7484a0bc576a1e11a8dbc090fbd476d6424431bdc8435e03c2c208  linux-6.6.83.tar.xz
+sha256  44caf510603b4cbbe78ef828620099d200536d666e909ddb73bb2938c7de5b16  linux-6.1.131.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  efe9f7eb5ea4d26cec6290689343e1804eb3b4a88ff5a60497a696fc08157c42  linux-5.15.178.tar.xz
-sha256  9597c4fee2f1ce452acfec516f4325ad342155872052fd5f0d9ce2ddcc26ebe5  linux-5.10.234.tar.xz
-sha256  6cc73cf2a7f50580f7d8c7e99d2f2e8ada8b7d2f4e76f5896f0daf691cc2a456  linux-5.4.290.tar.xz
+sha256  9319a47b1e9b5d344ff6015431856d0c9640e4faedc527c87f9129061a27136f  linux-5.15.179.tar.xz
+sha256  953be3931101a94a93a644c1283ca41a7e567447ca87d3069ed4dd712dc1f1cc  linux-5.10.235.tar.xz
+sha256  b3ad64a4476a7c5450b92eab9a888b84ecb64dc613fcb0128f653f58e958ef6e  linux-5.4.291.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2fb661a59b..432d5d1749 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -428,12 +428,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.290"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.234"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.178"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.130"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.81"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.18"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.291"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.235"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.179"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.131"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.83"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.19"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
