Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF51AC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62039616A8;
	Thu,  4 May 2023 20:12:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62039616A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g3aiR1n3VEMB; Thu,  4 May 2023 20:12:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 854F16167A;
	Thu,  4 May 2023 20:12:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 854F16167A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C4EB1BF863
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 34F6D41C6A
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:12:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34F6D41C6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-yRIzBG26lW for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:12:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45F84410B7
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45F84410B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D7DF85D69; Thu,  4 May 2023 20:12:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 22:05:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3816471496036661b2032d5424d0496231b04ca7
X-Git-Newrev: a4233a59494b5af4b4cca41f11a14ed64fc7cf43
X-Patchwork-Hint: ignore
Message-Id: <20230504201217.2D7DF85D69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4233a59494b5af4b4cca41f11a14ed64fc7cf43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not need to add a hash for 6.3, as it was already added in
eadff4efe9d4 ({toolchain, linux-headers}: add support for 6.3 headers).

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998@free.fr: explain why no hash update]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 690ee9c339..f6b50a4b58 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -28,8 +28,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (6.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (6.3)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_3 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.26" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
