Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6411CC3DA7D
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 14:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0571540598;
	Sun,  1 Jan 2023 14:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0571540598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 07CREPplZ4M2; Sun,  1 Jan 2023 14:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 13142405DB;
	Sun,  1 Jan 2023 14:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13142405DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDED21BF867
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A820960BE8
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 14:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A820960BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9Z2vXtal-jR for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 14:32:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF7F460BE0
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 14:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF7F460BE0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AFC6686C07; Sun,  1 Jan 2023 14:32:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Jan 2023 14:31:31 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 82ef64a9be1047b372ab3f6353f1be7e377f5cdc
X-Git-Newrev: dcf8d650bc4427e5754ee165606895b9c7886702
X-Patchwork-Hint: ignore
Message-Id: <20230101143248.AFC6686C07@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] {linux,
 linux-headers}: 5.{4, 10, 15}.x / 6.{0, 1}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcf8d650bc4427e5754ee165606895b9c7886702
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0245d30e569cc88875f7ed5b162029064128e89e)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fba3d90e6b..2d5f710e73 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.0.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.0.15" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.145-cip17" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.145-cip17-rt7" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index dd211c7f1b..87a51e432d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  08d3118d6b755769f166de6babed54964393a7c0928029bef11bf55559a72da4  linux-6.0.13.tar.xz
+sha256  d484eb3d4f88be14b42507a85ad4b0932e92e7a742acbce74e8be007124a6820  linux-6.0.15.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
-sha256  40590843c04c85789105157f69efbd71a4efe87ae2568e40d1b7258c3f747ff3  linux-5.15.83.tar.xz
-sha256  1ba9bf57b6bf36d76447d5044b80b746cb5fd61d981c811603dc763b7789cea7  linux-5.10.159.tar.xz
-sha256  5eefc5037415f31c942d3cfa430b96c2a273246cf7e51db1e51b1d89887f0593  linux-5.4.227.tar.xz
+sha256  2c0bae29fac98e0a9408914a4551b2971365ac0000351cb255d6bd9aa0849808  linux-5.15.85.tar.xz
+sha256  7aaaf6d0bcd8a2cfa14ad75f02ca62bb2de08aad3bee3eff198de49ea5254079  linux-5.10.161.tar.xz
+sha256  80253b2cac54c256dfdfd1061800aef907f88432090f7aef74c0ddf50f6e6524  linux-5.4.228.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  1f6de11306cc9f82fe1d4dd03565cdf43906fa6f77302913d942fd63b77b500c  linux-4.9.336.tar.xz
 sha256  e32a230d71072a4ee50bd4386aa23ca4e617b8ad07b6f9fb223b65bf004c4c80  linux-4.14.302.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 86cce61bc8..6012a0dc52 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -395,11 +395,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.9.336"	if BR2_KERNEL_HEADERS_4_9
 	default "4.14.302"	if BR2_KERNEL_HEADERS_4_14
 	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.227"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.159"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.83"	if BR2_KERNEL_HEADERS_5_15
+	default "5.4.228"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.161"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.85"	if BR2_KERNEL_HEADERS_5_15
 	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
-	default "6.0.13"	if BR2_KERNEL_HEADERS_6_0
+	default "6.0.15"	if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
