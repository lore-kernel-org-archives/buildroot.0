Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDEEC433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 11:54:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C26C8610F9
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 11:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C26C8610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83665403BF;
	Sun, 12 Sep 2021 11:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id exA1HZCmZtoy; Sun, 12 Sep 2021 11:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7831403C6;
	Sun, 12 Sep 2021 11:54:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C2FAD1BF299
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 11:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC6CE80EA0
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 11:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0wT2UYDgOdj for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 11:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED36580E5E
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 11:53:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B492C8A3DA; Sun, 12 Sep 2021 11:52:18 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 13:43:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b1b24ce84ae4c20273a1c5ac2bd98889c0b8d73
X-Git-Newrev: a7864c4ff43e4cd1a4186d102b9ab3e608504793
X-Patchwork-Hint: ignore
Message-Id: <20210912115218.B492C8A3DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 13, 14}.x series
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7864c4ff43e4cd1a4186d102b9ab3e608504793
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 270b825e22..ec4e4c5154 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.14" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.14.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 76bb9fe001..b98c2e4163 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2  linux-5.14.tar.xz
-sha256  72fe7cc1f0363523061659a21e24754697b27f405cb88a41a63038629636159a  linux-5.13.9.tar.xz
-sha256  00bbaeaac17f82d9a6d93cbc42cafd39d3b2fa3a6087333503d2344fa5e3142d  linux-5.10.57.tar.xz
-sha256  0471d0ccb7953cdae7d235192588ac5d72344851969962676d1703e69084a37f  linux-5.4.139.tar.xz
+sha256  c6c340be69e22021d9406c51467d03e2e28fb7221939b2ef114cac3d3602a8d8  linux-5.14.3.tar.xz
+sha256  495989174c16ae15817798f9e0722dfd782d7d2c78283b519ecc60f2d87e51d2  linux-5.13.16.tar.xz
+sha256  3eb84bd24a2de2b4749314e34597c02401c5d6831b055ed5224adb405c35e30a  linux-5.10.64.tar.xz
+sha256  5cf7782ec2e91417edf0d5e6555da6d556962c8985e33ba9e7dadba5cbdc68f9  linux-5.4.145.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  4bdf66494be66a1da857f09b40b95026a0388e373fb01a206c60f67834746cb4  linux-4.4.279.tar.xz
-sha256  21edb57dea0fe04a51fcfb6d4e8c0c052787a20015bc74a0a0e63329601f2e07  linux-4.9.279.tar.xz
-sha256  7f235d454d703112e86574150652807f42abead92f3837da32ea86b4f148b371  linux-4.14.243.tar.xz
-sha256  f2827d0506622fcae0dae0bc72b2f016469210f50c2d3dd1bdd1211a813dca27  linux-4.19.202.tar.xz
+sha256  02252f0002e65306f6765089e8bb51f621f4eaea974348c31991b0c508243bb5  linux-4.4.283.tar.xz
+sha256  67727389771a858406f773b4db62d7d3248209e26120df47507ea4a8898d2e15  linux-4.9.282.tar.xz
+sha256  9c5612ef428441b7c85cf211a455c06ce695b81a9a40c064d0ea424dd08bef3a  linux-4.14.246.tar.xz
+sha256  b7eb776f408b3ea71c97dde4888cc4549edf925a18cd158e7c9681d6ffa684c0  linux-4.19.206.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7123caf65f..bc4296d084 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -370,14 +370,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.279"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.279"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.243"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.202"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.139"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.57"	if BR2_KERNEL_HEADERS_5_10
-	default "5.13.9"	if BR2_KERNEL_HEADERS_5_13
-	default "5.14"		if BR2_KERNEL_HEADERS_5_14
+	default "4.4.283"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.282"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.246"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.206"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.145"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.64"	if BR2_KERNEL_HEADERS_5_10
+	default "5.13.16"	if BR2_KERNEL_HEADERS_5_13
+	default "5.14.3"	if BR2_KERNEL_HEADERS_5_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
