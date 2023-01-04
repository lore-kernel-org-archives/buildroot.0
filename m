Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69118C4332F
	for <buildroot@archiver.kernel.org>; Wed,  4 Jan 2023 13:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC16408E3;
	Wed,  4 Jan 2023 13:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEC16408E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2IwU5wbRs9h; Wed,  4 Jan 2023 13:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA62B40910;
	Wed,  4 Jan 2023 13:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA62B40910
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A15E1BF8C7
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 13:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1704E404A8
 for <buildroot@lists.busybox.net>; Wed,  4 Jan 2023 13:21:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1704E404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-0B8X__dl2M for <buildroot@lists.busybox.net>;
 Wed,  4 Jan 2023 13:21:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BE5C4031F
 for <buildroot@buildroot.org>; Wed,  4 Jan 2023 13:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BE5C4031F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 181C9874C1; Wed,  4 Jan 2023 13:21:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 4 Jan 2023 14:16:35 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 5a4ea7079fae490b6eb089f56ab1a8e55a9350d1
X-Git-Newrev: 684ffd8e2083db9b5da6549d1b4ea76dc1d4b395
X-Patchwork-Hint: ignore
Message-Id: <20230104132109.181C9874C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] {linux,
 linux-headers}: bump 5.15.x / 6.{0, 1}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=684ffd8e2083db9b5da6549d1b4ea76dc1d4b395
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a94567b4b5481c14352be3e293672572a326836c)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 2d5f710e73..cce67eeee6 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.0.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.0.16" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 87a51e432d..b7869d06e9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  d484eb3d4f88be14b42507a85ad4b0932e92e7a742acbce74e8be007124a6820  linux-6.0.15.tar.xz
+sha256  842071bca611c1f080cbc39c7ab3a6b58d7951f4f41e553b3db4fbe3e0705ce4  linux-6.0.16.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
-sha256  2c0bae29fac98e0a9408914a4551b2971365ac0000351cb255d6bd9aa0849808  linux-5.15.85.tar.xz
+sha256  80fcd9efa443502de9e2750f6dfb59e8de43a5d87a6d2be09dca748d79b5f2ee  linux-5.15.86.tar.xz
 sha256  7aaaf6d0bcd8a2cfa14ad75f02ca62bb2de08aad3bee3eff198de49ea5254079  linux-5.10.161.tar.xz
 sha256  80253b2cac54c256dfdfd1061800aef907f88432090f7aef74c0ddf50f6e6524  linux-5.4.228.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6012a0dc52..e57a6d74dd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -397,9 +397,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.228"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.161"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.85"	if BR2_KERNEL_HEADERS_5_15
+	default "5.15.86"	if BR2_KERNEL_HEADERS_5_15
 	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
-	default "6.0.15"	if BR2_KERNEL_HEADERS_6_0
+	default "6.0.16"	if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
