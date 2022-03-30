Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376ECC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 07:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7F1B41C0A;
	Wed, 30 Mar 2022 07:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hgQCXqJLwwFt; Wed, 30 Mar 2022 07:29:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C2541B4C;
	Wed, 30 Mar 2022 07:29:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05F6F1BF5E0
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8446417C6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 07:29:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7eup6zgWEboU for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 07:29:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C575C417BA
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:29:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 72AA485FC0; Wed, 30 Mar 2022 07:20:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 09:28:24 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 7a1c2492d29b7b51e1ce4b563e9ec09b109d2802
X-Git-Newrev: 0e94e0515f22b99f142206c8006c91e3f8b0f8c3
X-Patchwork-Hint: ignore
Message-Id: <20220330072006.72AA485FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] {linux,
 linux-headers}: bump 4.{9, 14, 19}.x / 5.{4, 10, 15, 16}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e94e0515f22b99f142206c8006c91e3f8b0f8c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

4.4.x is now EOL, so no more updates for that series.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 607c5986a9b3bde0cacdbe38eeaea2ab456a6e80)
[Peter: drop 5.15.x / 5.16.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index da50a2ced5..8276d1f737 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.10.103" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.10.107" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 2589f43b1d..fb96894977 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  4fb8ad55e6430342e4fbc94d54e594e9be8eb6a8bea1d71eccf835948d08580a  linux-5.10.103.tar.xz
-sha256  b2f1201f64f010e9e3c85d6f303a559a7944a80a0244a86b8f5035bd23f1f40d  linux-5.4.182.tar.xz
+sha256  c467c3077946370fb26c9277313b601d6c48bb557abc889f4892caf627fcdfea  linux-5.10.107.tar.xz
+sha256  61f7cd24cb8a38d41891d9066c1dfd14a688a9dff7f485922e385654ea8b39b9  linux-5.4.186.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
-sha256  295e4bb3ba3244a9f4c48139ad13f78145f3e6402e11aa25b20aadb9ae9f2b25  linux-4.9.304.tar.xz
-sha256  03a65f405c3acae4dd8cd952444b7cd931f972c01a42e20a471319a2f6c018d2  linux-4.14.269.tar.xz
-sha256  4fcfe814780d63dc56e907bf41596ff162e9601978bdc1a60eab64cc3903a22c  linux-4.19.232.tar.xz
+sha256  47470f83aa64e0098830a53176c959740742973663fead7ca7cc7b84e1f9d0f7  linux-4.9.307.tar.xz
+sha256  9b6178099cf33c534c971f3f065c0debe92788f0f504d54badb2f8c2ee089d69  linux-4.14.272.tar.xz
+sha256  530c5ac848111bbf7d1ad407a4ce8173ef8f9a4554477a32c695c5a4eaf02598  linux-4.19.235.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2554d4aace..f1b031a46e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -347,11 +347,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.304"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.269"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.232"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.182"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.103"	if BR2_KERNEL_HEADERS_5_10
+	default "4.9.307"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.272"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.235"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.186"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.107"	if BR2_KERNEL_HEADERS_5_10
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
