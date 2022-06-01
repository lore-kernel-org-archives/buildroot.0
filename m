Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122F2C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C041F40B4A;
	Tue,  7 Jun 2022 19:31:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pGWssgebgW82; Tue,  7 Jun 2022 19:31:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA81B405EC;
	Tue,  7 Jun 2022 19:30:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E04C1BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9870404B1
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AnyDsuS860Mr for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42B904055F
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2E46486E21; Tue,  7 Jun 2022 19:04:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Jun 2022 23:31:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ec71b97cf040a2a04901432fbdb379c61ebd2a0
X-Git-Newrev: a4db0560ac13aa7a927b8fb876a14c21cddf98d9
X-Patchwork-Hint: ignore
Message-Id: <20220607190458.2E46486E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/uboot: bump to 2022.04
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4db0560ac13aa7a927b8fb876a14c21cddf98d9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in  | 4 ++--
 boot/uboot/uboot.hash | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 953c36135e..d525faea1c 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -41,7 +41,7 @@ choice
 	  Select the specific U-Boot version you want to use
 
 config BR2_TARGET_UBOOT_LATEST_VERSION
-	bool "2022.01"
+	bool "2022.04"
 
 config BR2_TARGET_UBOOT_CUSTOM_VERSION
 	bool "Custom version"
@@ -85,7 +85,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
-	default "2022.01"	if BR2_TARGET_UBOOT_LATEST_VERSION
+	default "2022.04"	if BR2_TARGET_UBOOT_LATEST_VERSION
 	default BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_UBOOT_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_UBOOT_CUSTOM_TARBALL
diff --git a/boot/uboot/uboot.hash b/boot/uboot/uboot.hash
index 9171a794a1..a8bd817900 100644
--- a/boot/uboot/uboot.hash
+++ b/boot/uboot/uboot.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  81b4543227db228c03f8a1bf5ddbc813b0bb8f6555ce46064ef721a6fc680413  u-boot-2022.01.tar.bz2
+sha256  68e065413926778e276ec3abd28bb32fa82abaa4a6898d570c1f48fbdb08bcd0  u-boot-2022.04.tar.bz2
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
