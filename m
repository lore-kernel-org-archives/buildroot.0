Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1C8C83F01
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE58341919;
	Wed, 30 Aug 2023 06:29:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE58341919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cn8QB6-cU3Yk; Wed, 30 Aug 2023 06:29:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97E0C41927;
	Wed, 30 Aug 2023 06:29:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97E0C41927
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13B981BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE91B418B9
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:29:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE91B418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OReY4ubhxpIo for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:29:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D650B418B7
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D650B418B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C56458652C; Wed, 30 Aug 2023 06:29:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 08:24:23 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 531c8b75aca3243ca1006080144fa11f9c3ce6a5
X-Git-Newrev: a56e07c512ee5e21e4b9d14a2099bfa4eb785274
X-Patchwork-Hint: ignore
Message-Id: <20230830062912.C56458652C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
 linux-headers}: security bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 4}.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a56e07c512ee5e21e4b9d14a2099bfa4eb785274
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fixes Zenbleed (CVE-2023-20593): https://lwn.net/Articles/939101/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 8af2c5ab83bab001853b23acf0356bbbc1bcf164)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 736557f651..882d2c93f0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  43eafc2197a07dcdcff7a7ef79ac7502061f7c564744e51626bf5fa2e22587f0  linux-6.1.40.tar.xz
+sha256  312809a78eea052a08a6580f47b2ed8dd28e5633461d6731febaf3cb1e570bb7  linux-6.1.41.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  07e0cebdb00d25459683e9c330a0576349b8c5e5f2abf053b864f9909151c31d  linux-5.15.121.tar.xz
-sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
-sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
+sha256  38755801cd1ce229a8c0a0536d29aa37acea8a8aa13fa438e19fbf9d6293342d  linux-5.15.122.tar.xz
+sha256  f69454210b3e9e00e8b8368aaa897d4ca59f8be3b85399a2fcaecbf17af98bbb  linux-5.10.187.tar.xz
+sha256  0f5b8876526062bf5e346f6b9dde88be873761ee33cf3b8a1586d7d109a091fb  linux-5.4.250.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  33ebd0c445b58c814428558496b65a192410f000096b0e2e6f5d813ecd95e3eb  linux-4.19.288.tar.xz
+sha256  118f7411793868db8dcb043cdc82e9ac6f722fbec8dcdde30b07889d941aa3b3  linux-4.19.289.tar.xz
 sha256  ed82679c0c6e600db80050d09e2294fb28b61cf27dc98657296c7eb5250a7625  linux-4.14.320.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a36ddf02b3..c5a4f880c7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -397,11 +397,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.14.320"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.121"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.40"	if BR2_KERNEL_HEADERS_6_1
+	default "4.19.289"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.250"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.187"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.122"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.41"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
