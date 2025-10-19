Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B64CCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 20:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78C4E6120D;
	Sun, 19 Oct 2025 20:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19OF_ce2qsjW; Sun, 19 Oct 2025 20:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C87611F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C87611F6;
	Sun, 19 Oct 2025 20:09:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A55AC43F
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 20:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 970A54138E
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 20:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kLA4T5l-Jovu for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 20:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D1D4138D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5D1D4138D
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 20:09:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B440A87680; Sun, 19 Oct 2025 20:09:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 21:56:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a0a221d57db01e67ebcf651c9d644dd490432d0
X-Git-Newrev: 7095e120a29624dd763bd3cab2fa884a28745bfb
X-Patchwork-Hint: ignore
Message-Id: <20251019200905.B440A87680@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.15.x / 6.{1,
 6, 12, 17}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7095e120a29624dd763bd3cab2fa884a28745bfb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 90a0ccd0c5..7fb0e2aa64 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 3bdc4cd9b2..5ea815260d 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3ecc8619d8a5b5f675224d2f52c71d1fc09bc3f9c019d8bd82d0581e03689499  linux-6.17.3.tar.xz
-sha256  663507accae673afcf4e210b4ae8d4352e61d926202e5da3f04bf71ca1d2c0b5  linux-6.12.53.tar.xz
-sha256  6c7d92bf316a56e91de41cb60da1f63d94a4f8aafaef6a13055df0c291138a22  linux-6.6.112.tar.xz
-sha256  d4bb148b204e5aed38690489736961cdaf925fe7b35cf1f56c47ad7a09a0228e  linux-6.1.156.tar.xz
+sha256  010a12296e6fba7597ff36681be2485fd3b1780ac8fd9e6a9f3cfe193f0491db  linux-6.17.4.tar.xz
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
index 3fbad38e6e..fd59e0c056 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -460,11 +460,11 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.156"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.112"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.53"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.3"	if BR2_KERNEL_HEADERS_6_17
+	default "5.15.195"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.157"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.113"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.54"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.4"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
