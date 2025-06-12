Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455D3C61CE8
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16A6140B1D;
	Thu, 12 Jun 2025 20:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYgU5WFs0T6o; Thu, 12 Jun 2025 20:13:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A62DC40ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62DC40ADA;
	Thu, 12 Jun 2025 20:13:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 100DA27A
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0574083BE8
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFjnklswWEEI for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BFA83BD4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BFA83BD4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 190B383564; Thu, 12 Jun 2025 20:12:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Jun 2025 14:40:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 243add1034def091d875244d6a47a0ea6947436c
X-Git-Newrev: dc537f767bb045e0dce5ffc7668fcc5b77c5e596
X-Patchwork-Hint: ignore
Message-Id: <20250612201229.190B383564@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=dc537f767bb045e0dce5ffc7668fcc5b77c5e596
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 079a66f107bc53f1d6e9c39eec3ada0dee51831f)
[thomas: don't pick 6.14 bump]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 822bed8b31..bdd14e16fa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -137,7 +137,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.28" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.30" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 4bb0e27c90..48e60987a6 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,9 +1,9 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  e8a099182562aecff781de72ce769461e706d97af42d740dff20eb450dd5771e  linux-6.12.28.tar.xz
-sha256  ff856748671629c1fefef219099e0b4b81131c2d325e768cb0806e204157014e  linux-6.6.90.tar.xz
-sha256  e319a5bb9049ba9fb8cbc08cba4874716e8985bd10f7971f2573ea802c257911  linux-6.1.138.tar.xz
+sha256  df046a48971e40ce0b2e003e7e55b6b1e7da2912120eb216d5d6c8450c9cf82e  linux-6.12.30.tar.xz
+sha256  1d82a82642d281c31d86f7301bc55e12a8a9f9c04532e249ef8ae6fe7dc237ec  linux-6.6.92.tar.xz
+sha256  5779f9caca77f7bfe3c3923b4d760041318db0303de93b2d4691d60e4d41eb74  linux-6.1.140.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  b6abfa53315a04e459070b927c58beb41f085433117d58756504d68b67f6a31e  linux-5.15.182.tar.xz
+sha256  9c3e98c6dcc7dca7c2e9dd51423eaf0581f5e100d0f04c23bc29f21913dac1d9  linux-5.15.184.tar.xz
 sha256  1fc82737e0e4f0ae0b40f91a00c68f3cb75362e6ae54623ec64b41a51cde0f25  linux-5.10.237.tar.xz
 sha256  34589340c7d76c0de91965e5242f61e9f9f3bacd03e8e34239e5d4660d45372d  linux-5.4.293.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index b05ca6facd..b087f3d64c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -430,10 +430,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.293"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.237"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.182"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.138"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.90"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.28"	if BR2_KERNEL_HEADERS_6_12
+	default "5.15.184"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.140"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.92"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.30"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
