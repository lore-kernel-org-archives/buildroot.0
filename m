Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F21C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 17:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E29CA40B7F;
	Tue, 14 Feb 2023 17:09:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E29CA40B7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SWuCIHc6cCm6; Tue, 14 Feb 2023 17:09:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1419340B9A;
	Tue, 14 Feb 2023 17:09:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1419340B9A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 367001BF94D
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10878402EC
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 17:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10878402EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4y0JMaS7gXB for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38FC440673
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38FC440673
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2631F85E16; Tue, 14 Feb 2023 17:08:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 17:14:56 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ef65baf8e20c3830e632e13fe99f84aeb9d0211e
X-Git-Newrev: b712193b425d5bc36b621af43f4c667fdab62004
X-Patchwork-Hint: ignore
Message-Id: <20230214170848.2631F85E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.1.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=b712193b425d5bc36b621af43f4c667fdab62004
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

4.9.x / 6.0.x is now EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit def789059af78cd65294cafa4288cb41691e86c7)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ed4e305aa7..b8f93f0eaa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.87" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.91" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c10164a030..c97e90a43f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
-sha256  e7359bd2935b54fe8bb821cf748591c36a95bed019e752d3e4d5803d9da1ccb4  linux-5.15.87.tar.xz
-sha256  2ec400fc50ffdfe4c836a3c02bf6e7aebcd7963dd2ac1425e6d41545c37dd217  linux-5.10.162.tar.xz
-sha256  80253b2cac54c256dfdfd1061800aef907f88432090f7aef74c0ddf50f6e6524  linux-5.4.228.tar.xz
+sha256  a63c2bb1beb15f1aea9c63cf80559f5b7ab58afd2da2fa5e7670c515ebe1fe80  linux-5.15.91.tar.xz
+sha256  0051a1780e5bda0efc68dafab7c728b8283d2b028fedb439418f478be7d3e1af  linux-5.10.166.tar.xz
+sha256  a74fd32ccc1025b72f3ba7183208761f7c6190fb96e8f484f6d543a5a183e62f  linux-5.4.230.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  e32a230d71072a4ee50bd4386aa23ca4e617b8ad07b6f9fb223b65bf004c4c80  linux-4.14.302.tar.xz
-sha256  6e0ba5d224ab216b7b938cc9ff2478be7882a884bbdf15374149bade4d58b20a  linux-4.19.269.tar.xz
+sha256  64cbb234e46c196bc12bde74b233c7d3cb3b68d9c8ed48bf06715bd0f5c549d5  linux-4.14.304.tar.xz
+sha256  636d3f9cb48eaf06df14e56bd9d57bfc7c1b5952a75b9f841d41a43b75829d1a  linux-4.19.271.tar.xz
 # Locally computed
 sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
 sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index e082423b86..f6654f8578 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -383,11 +383,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
 	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.302"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.269"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.228"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.162"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.87"	if BR2_KERNEL_HEADERS_5_15
+	default "4.14.304"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.271"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.230"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.166"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.91"	if BR2_KERNEL_HEADERS_5_15
 	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
