Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64BA2CE8D7A
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 11:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EC8F412BE;
	Thu, 19 Sep 2024 11:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ehgLaTtWiYB; Thu, 19 Sep 2024 11:30:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4433641331
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4433641331;
	Thu, 19 Sep 2024 11:30:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 84F5B1BF97E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7372B4129C
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 11:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GvqyYgJcmXoE for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 11:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B12D41273
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B12D41273
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 11:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 483C383CEE; Thu, 19 Sep 2024 11:30:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 13:24:55 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 79b102c0f1614e7490b7bbdf52acef72417e7a4c
X-Git-Newrev: 681c821e81a8dec16cf04f935eb152973b116688
X-Patchwork-Hint: ignore
Message-Id: <20240919113031.483C383CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 6.{1, 6, 10}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=681c821e81a8dec16cf04f935eb152973b116688
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ee67e4baffc8bb0577a265ad4ffe814acfad5397)
[Peter: drop 6.10.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 340bf5c590..c520cccfda 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.49" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.50" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b65249c7bb..4bebf4cc50 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  2c56dac2b70859c16b4ef651befb0d28c227498bd3eee08e8a45a357f22dd3b7  linux-6.6.49.tar.xz
-sha256  3f4e4e89a00e221a6dd1174779e0028794f44f4624ad6a31c79f3b7796688ca2  linux-6.1.108.tar.xz
+sha256  c065e36daf28210060c91a37ef3e92ac5814784e634577e04e406297ead2e86e  linux-6.6.50.tar.xz
+sha256  732ff40ac63642c5ddbb7d65c24c90ed08b95af0e8c92df4739e9703eec01ac1  linux-6.1.109.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  e56caae259b85b7685ee589075d58bb7b227024497a60fa27a7b43e0b48839cf  linux-5.15.166.tar.xz
 sha256  85d7bf3a807538b9032e3f798ab978da9b77352bcb526534038c351a4f39e01c  linux-5.10.225.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 6d7f77a88e..7bb49eb43d 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -407,8 +407,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.283"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.225"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.166"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.108"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.49"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.109"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.50"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
