Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B171ACCD1BC
	for <buildroot@archiver.kernel.org>; Wed, 22 Oct 2025 16:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8942D6135A;
	Wed, 22 Oct 2025 16:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uggwxoe7O0K; Wed, 22 Oct 2025 16:41:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AEC36131F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AEC36131F;
	Wed, 22 Oct 2025 16:41:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1FC143F
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 072BB40FA9
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYCmKTFa52jd for <buildroot@buildroot.org>;
 Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01D9140FF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D9140FF5
 for <buildroot@buildroot.org>; Wed, 22 Oct 2025 16:41:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F410987038; Wed, 22 Oct 2025 16:41:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Oct 2025 18:39:13 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 7541d46e15c8c2f4e35fbe85d687477018265ad9
X-Git-Newrev: 88bf12270a1ecdc0b6b64532ce3557cfcba0778a
X-Patchwork-Hint: ignore
Message-Id: <20251022164130.F410987038@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x series
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=88bf12270a1ecdc0b6b64532ce3557cfcba0778a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Update the latest kernel releases to:
 - 6.12.53 -> 6.12.54
 - 6.6.112 -> 6.6.113
 - 6.1.156 -> 6.1.157
 - 5.15.194 -> 5.15.195

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/linux.hash                     | 8 ++++----
 package/linux-headers/Config.in.host | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 268ce36a33..a901813f1f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  7ca4debc5ca912ebb8a76944a5c118afd5d09e31ef43c494adb14273da29a26e  linux-6.16.12.tar.xz
-sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
-sha256  6c7d92bf316a56e91de41cb60da1f63d94a4f8aafaef6a13055df0c291138a22  linux-6.6.112.tar.xz
-sha256  d4bb148b204e5aed38690489736961cdaf925fe7b35cf1f56c47ad7a09a0228e  linux-6.1.156.tar.xz
+sha256  1b0dcd3390efeec44e528748609bafcf36eae895bb68c8f62ac5e5940943de62  linux-6.12.54.tar.xz
+sha256  1f95cfd2e461d192dd9c6130e47aefc9856529a74ace4191ad8e56ba1849c41e  linux-6.6.113.tar.xz
+sha256  a0a184e10221afcce4e87fcbec6af2ae9f63f64ad1985aa61e80c9596696f66e  linux-6.1.157.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  23d080dc32f99d3939c3d1bd65a68ed85b8f934f92cc1841a63f898dcdb9a441  linux-5.15.195.tar.xz
 sha256  131e75eb14da6fd683b3882bcd856085cfca47cc1aa89cd2deb1b48d22d29d9f  linux-5.10.245.tar.xz
 sha256  9949210093ca924d7b41162bb4772becd3f28ff726a09d061558929690a1815a  linux-5.4.300.tar.xz
 # Locally computed
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4cd860d004..52260d9a0b 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -456,10 +456,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.156"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.112"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.53"	if BR2_KERNEL_HEADERS_6_12
+	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.113"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.54"	if BR2_KERNEL_HEADERS_6_12
 	default "6.16.12"	if BR2_KERNEL_HEADERS_6_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
