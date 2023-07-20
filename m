Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE3CEB64DA
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 21:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B83AF6128E;
	Thu, 20 Jul 2023 21:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B83AF6128E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WJSvByoEm0UJ; Thu, 20 Jul 2023 21:30:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC65A60812;
	Thu, 20 Jul 2023 21:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC65A60812
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C13581BF4D8
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A475404DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 21:30:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A475404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9wPJnxow-39I for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 21:30:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9E564049D
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 21:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9E564049D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B84EE874F2; Thu, 20 Jul 2023 21:30:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 23:30:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 566e00adea17196dff8e041e36c9349ab6075e0f
X-Git-Newrev: 5037426d2bd12b78f52270164158f423e20ccc85
X-Patchwork-Hint: ignore
Message-Id: <20230720213037.B84EE874F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{1,
 4}.x series
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5037426d2bd12b78f52270164158f423e20ccc85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index cd0a6a38f6..1ab65cf266 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.4.3" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.4.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index c8e72d31a8..1d63d4226b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  7134ed29360df6f37a26410630283f0592c91a6d2178a9648226d30ddf8c88a1  linux-6.4.3.tar.xz
+sha256  9cbc4a2be714a4d154e1312c9f33ded91174907c8b15ee936ad27002ac75ff2a  linux-6.4.4.tar.xz
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  f9a4f91b609f7d332a5f2be01ab86336fa00149fae6bdc19f16fa19f78802d43  linux-6.1.38.tar.xz
+sha256  4cddee22fdf657138a06af653492f67cd3a4762c04a34725534bd200d99085b8  linux-6.1.39.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
 sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d886a4659b..9c8bbbe2c0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -409,9 +409,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.38"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.39"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
-	default "6.4.3"		if BR2_KERNEL_HEADERS_6_4
+	default "6.4.4"		if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
