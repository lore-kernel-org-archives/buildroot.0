Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D77C02194
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 11:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28DAD4EF17;
	Sat,  1 Feb 2025 11:30:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oqog5yhUEOpQ; Sat,  1 Feb 2025 11:30:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6C4F4EF05
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6C4F4EF05;
	Sat,  1 Feb 2025 11:30:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C632016E
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5B374026C
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:30:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAoY7pAx2-Lv for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 11:29:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 82A68400B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82A68400B9
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 11:29:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B86F866E2; Sat,  1 Feb 2025 11:29:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 11:58:17 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: a6b1d9fd66cc4cae558b4149878cb27ab6b3178f
X-Git-Newrev: 00118db48c35e40c801380279f88445ba5600ab1
X-Patchwork-Hint: ignore
Message-Id: <20250201112959.6B86F866E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 6, 12}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=00118db48c35e40c801380279f88445ba5600ab1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 27ee14ca4f37cb78b4ad2856b4653a8f0ee470e1)
[Peter: drop 6.12.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index fd17ea5399..bfb0e66740 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  62148e7e17f54c4a5ab5e75ad4882682c54bee818948be61a5963234fc0849fc  linux-6.11.11.tar.xz
-sha256  feb9e514930d5968daa0b8b5486d3295d1fb2b34accf876207641884d4baef39  linux-6.6.72.tar.xz
-sha256  ff4ef6d5cc626faa81fc6da7b5270de064924c919be460f114e6ad8cb9589827  linux-6.1.124.tar.xz
+sha256  f15e2b1a8bab0eba494b07858a5abc88d8f788e25f6fe4a572a77840bbd5494d  linux-6.6.74.tar.xz
+sha256  18b0d41d1a7fbad56045cde0d7fc176bfb18361d29c9f07e57109bbf21bf7876  linux-6.1.127.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a84ab5328c8a5a0e5c4a39a06b07479a7769c73af49a4c9ce59eeb644829d3b1  linux-5.15.176.tar.xz
+sha256  ea9eb8088d4231f8a01b191ceef5f4d92238f6c7519f6fbcb57e448ee9e0a6e0  linux-5.15.177.tar.xz
 sha256  239e57280f8c9159187e383d7b730d29f5cc8e1b30be218f004e0c90d1137f52  linux-5.10.233.tar.xz
 sha256  1e3e5fc052c8e15f8eaa37d30bf4f0b3eef7430dd234d9fed0d0005852a06d10  linux-5.4.289.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 487248f1ef..02a8272573 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -431,9 +431,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.325"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.289"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.233"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.176"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.124"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.72"	if BR2_KERNEL_HEADERS_6_6
+	default "5.15.177"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.127"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.74"	if BR2_KERNEL_HEADERS_6_6
 	default "6.11.11"	if BR2_KERNEL_HEADERS_6_11
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
