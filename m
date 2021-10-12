Return-Path: <SRS0=Fi0H=PA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAEF4C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 13:52:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F133C60F92
	for <buildroot@archiver.kernel.org>; Tue, 12 Oct 2021 13:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F133C60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0787606DA;
	Tue, 12 Oct 2021 13:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e-Q62cmJVOAB; Tue, 12 Oct 2021 13:51:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CA260797;
	Tue, 12 Oct 2021 13:51:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ACC411BF5B3
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 13:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79E640344
 for <buildroot@lists.busybox.net>; Tue, 12 Oct 2021 13:51:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P9nuYYb7Z13D for <buildroot@lists.busybox.net>;
 Tue, 12 Oct 2021 13:51:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3688A403BB
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 13:51:52 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 61F071C0007;
 Tue, 12 Oct 2021 13:51:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1maIC4-0001tW-5h; Tue, 12 Oct 2021 15:51:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Oct 2021 15:51:46 +0200
Message-Id: <20211012135147.7233-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 13, 14}.x series
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index ec4e4c5154..ea8244c484 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.14.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.14.11" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index b98c2e4163..7848cd4f33 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c6c340be69e22021d9406c51467d03e2e28fb7221939b2ef114cac3d3602a8d8  linux-5.14.3.tar.xz
-sha256  495989174c16ae15817798f9e0722dfd782d7d2c78283b519ecc60f2d87e51d2  linux-5.13.16.tar.xz
-sha256  3eb84bd24a2de2b4749314e34597c02401c5d6831b055ed5224adb405c35e30a  linux-5.10.64.tar.xz
-sha256  5cf7782ec2e91417edf0d5e6555da6d556962c8985e33ba9e7dadba5cbdc68f9  linux-5.4.145.tar.xz
+sha256  93830a24df5342fb8fb857b7ca58d637f99d84b0ac54610fbf49743e3e8d5731  linux-5.14.11.tar.xz
+sha256  e877ec724e917c967603225c7e5dc21b6e0f34998c7d086cab8c50324363ab7b  linux-5.13.19.tar.xz
+sha256  b4d635afe7646ac6a6617c738e747ba0a6006675cd9735d18f672f8b1fba4c7c  linux-5.10.72.tar.xz
+sha256  8044c7134c5eed21af9662f1c5399a5d8781b5bc2d8979e9ad06b4435a0a5ed5  linux-5.4.152.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  02252f0002e65306f6765089e8bb51f621f4eaea974348c31991b0c508243bb5  linux-4.4.283.tar.xz
-sha256  67727389771a858406f773b4db62d7d3248209e26120df47507ea4a8898d2e15  linux-4.9.282.tar.xz
-sha256  9c5612ef428441b7c85cf211a455c06ce695b81a9a40c064d0ea424dd08bef3a  linux-4.14.246.tar.xz
-sha256  b7eb776f408b3ea71c97dde4888cc4549edf925a18cd158e7c9681d6ffa684c0  linux-4.19.206.tar.xz
+sha256  870952aad348bed600a07ec24b23890e96f496bbc10e67033dbefa5fbf1f1c09  linux-4.4.288.tar.xz
+sha256  e2a2fdfca4eadf10716260779a510bf5e0f19c6ee0a223724c74d636c815a645  linux-4.9.286.tar.xz
+sha256  a4b43db9fd94a7c50d4f7e42d5264b1449ff41730f84a1323b8e4754fb336e7d  linux-4.14.250.tar.xz
+sha256  9ba722594a5a5444df19510925df7b6b76cbf20ab4dc54e57f1c3e4da4116133  linux-4.19.210.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index bc4296d084..0536476cc2 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -370,14 +370,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.283"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.282"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.246"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.206"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.145"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.64"	if BR2_KERNEL_HEADERS_5_10
-	default "5.13.16"	if BR2_KERNEL_HEADERS_5_13
-	default "5.14.3"	if BR2_KERNEL_HEADERS_5_14
+	default "4.4.288"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.286"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.250"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.210"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.152"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.72"	if BR2_KERNEL_HEADERS_5_10
+	default "5.13.19"	if BR2_KERNEL_HEADERS_5_13
+	default "5.14.11"	if BR2_KERNEL_HEADERS_5_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
