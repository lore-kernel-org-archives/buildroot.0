Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37ACE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 09:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F52681FC7;
	Fri,  6 Dec 2024 09:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZgeLT9jVFjO; Fri,  6 Dec 2024 09:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A9B840D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A9B840D9;
	Fri,  6 Dec 2024 09:29:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4C5ECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A1E42F4D
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHmKU_CJaLOn for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B574B41377
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B574B41377
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0EFC86A33; Fri,  6 Dec 2024 09:28:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 10:23:22 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 4d1a8585527506c4ff3281aab05dd86364ffc114
X-Git-Newrev: 5f79065db562251d329f5c1e5fd9d6dd1575513f
X-Patchwork-Hint: ignore
Message-Id: <20241206092846.B0EFC86A33@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] {linux,
 linux-headers}: bump 6.{1, 6, 11}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f79065db562251d329f5c1e5fd9d6dd1575513f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5d49bc51e032b0d512741618dbec6596eac9d452)
[Peter: drop 6.11.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ed473b0d05..65c535e937 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  55e5bcbc68d66776fc46896291f0a24844beb57817345a854d65e3d055fa423e  linux-6.10.14.tar.xz
-sha256  e2c35611775534941b9d4dd871f3ae5b988b6594dc9033b5ca784366e07d9336  linux-6.6.62.tar.xz
-sha256  010784bd7161c32c4cd68a423d4dcb14e4587677d238b2825a31fe012869224c  linux-6.1.118.tar.xz
+sha256  d1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835  linux-6.6.63.tar.xz
+sha256  aecdaf39d0a844a81ce4c67d9daff8979e938bb690df4f679fbbb494fe423278  linux-6.1.119.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  8a4b2a47ccc9b208b2b6ed9a216ea1a5eb12852c723bec1a04de9e671a1d7da8  linux-5.15.173.tar.xz
 sha256  cd1850ef3b771886df4e0b4c4eb07033864abab2bb553a20fd9e3cdc23584b47  linux-5.10.230.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a4db815791..ce44b5ee97 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -427,8 +427,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.286"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.230"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.173"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.118"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.62"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.119"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.63"	if BR2_KERNEL_HEADERS_6_6
 	default "6.10.14"	if BR2_KERNEL_HEADERS_6_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
