Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A62D3B7E7
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 12:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7303140813;
	Sun,  7 Dec 2025 12:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1idFqIn40dl6; Sun,  7 Dec 2025 12:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F87540831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765111796;
	bh=1SYvKZN85g4HEtKZn2hnvnZqgDTznjqynzSWFCae2Vo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXDq4Gqf+K1myMcLYgcuzSPB1GJbXA6jnwwFEubARQHDEejQsF2VHRyogosav9J0B
	 hsMH82xTD5bHXh8dYz6LbWa987d/6TCf7rdaK5LSXPVt/k332lUMmfq7Uz5E7ShiH+
	 w7arFN1SiUhTWZ132TehNkTiM6zge3YZRbrTB/SYJNRgjV2DSzbd+veFo4YSn6Uszo
	 KvJAMdgkG1XsVtuX0uHfu7to8TOlqjZ2HZHHElp9Y/2MsxQmdkDGKx5FcBlV4v/RTs
	 WfKln5oKvbnTX8NDaeUKrkP1kjgNstCTowMfozkM+K8kXk2ZUyVXferBTyHOaKyEUY
	 QumR4xFgRd24A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F87540831;
	Sun,  7 Dec 2025 12:49:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 459212F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 28F9560723
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bLlbEZR_zSbP for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65B53606F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65B53606F0
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5415386623; Sun,  7 Dec 2025 12:49:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 12:41:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1f691fb020067031dd020d6c844a4be43061e42
X-Git-Newrev: eb1d45388f1392fee4c5410faac714e81b6dad93
X-Patchwork-Hint: ignore
Message-Id: <20251207124952.5415386623@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 5.{10,
 15}.x / 6.{1, 6, 12, 17}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb1d45388f1392fee4c5410faac714e81b6dad93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 305cc34968..bd18cece91 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.10" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index bca5756926..fcb5bdb113 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,11 +1,11 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  fa7f344f3a50dad0af2e0066d51bd3b9183fd24587861042343ded3d1fd5c8cd  linux-6.17.10.tar.xz
-sha256  a63096b2147411d683cecbf87622bb2ff4885bac2b3641d3d4f10250c89cdcf8  linux-6.12.60.tar.xz
-sha256  4bdddce35474afc8d26f74ebfbcd0e1045ecd15f69e60f53529dba143374b17d  linux-6.6.118.tar.xz
-sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
+sha256  934b18af0125f114907bad482d7c5a97d58038970b9dce6162318e920caf257e  linux-6.17.11.tar.xz
+sha256  1a69745105528676f12f29dc2494945d96cb23666dcc5223794abc22415f1735  linux-6.12.61.tar.xz
+sha256  3da09b980bb404cc28793479bb2d6c636522679215ffa65a04c893575253e5e8  linux-6.6.119.tar.xz
+sha256  1f207ebe93980829ecc0a18b694816f22b715e9893767731651969a168342b9e  linux-6.1.159.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
-sha256  eb6b76c269d2dc09791638b10b9dcb9d79fd2abd45113a31fc03f68731caa875  linux-5.10.246.tar.xz
+sha256  fd218df8e2107a4443b6c29fef7f95aad167031e0fbdbc7a858ae8471360668a  linux-5.15.197.tar.xz
+sha256  70c8b87ba1fcd8bfa663661934dc9bda92d0b5f3c0fc3197bb56399f69d9fe0c  linux-5.10.247.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 79e73dab3f..a53f1a36bd 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -459,12 +459,12 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.118"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.60"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.10"	if BR2_KERNEL_HEADERS_6_17
+	default "5.10.247"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.197"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.159"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.119"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.61"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.11"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
