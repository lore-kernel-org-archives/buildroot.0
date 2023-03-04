Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61006C678DB
	for <buildroot@archiver.kernel.org>; Sat,  4 Mar 2023 10:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E23D641A40;
	Sat,  4 Mar 2023 10:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E23D641A40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZxnKx0-CL9ij; Sat,  4 Mar 2023 10:46:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCBA3418F6;
	Sat,  4 Mar 2023 10:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCBA3418F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3471BF831
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 10:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E88E4820E7
 for <buildroot@lists.busybox.net>; Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E88E4820E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Dn8hEv1_zCq for <buildroot@lists.busybox.net>;
 Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C30A820E0
 for <buildroot@buildroot.org>; Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C30A820E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A0C3860B9; Sat,  4 Mar 2023 10:46:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 4 Mar 2023 09:59:54 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 71ddf1a0848e7b17c220b759ffae30ea2b13e1a8
X-Git-Newrev: 0ec207bed529f815779597d07aed823f1a62a5c2
X-Patchwork-Hint: ignore
Message-Id: <20230304104624.0A0C3860B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] {linux,
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ec207bed529f815779597d07aed823f1a62a5c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

4.9.x / 6.0.x is now EOL.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 36a8be4770d93c0a4346008c56f6ab6862b9b509)
[Peter: drop 6.1.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 858b12e0cb..e496164444 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -2,13 +2,13 @@
 sha256  abe37eb0e2e331bdc7c4110115664e180e7d43b7336de6b4cd2bd1b123d30207  linux-6.0.19.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  c93bb384a97ad1f0a4f18e442ce0291242722f78023eca658b22344541f09489  linux-5.19.17.tar.xz
-sha256  a63c2bb1beb15f1aea9c63cf80559f5b7ab58afd2da2fa5e7670c515ebe1fe80  linux-5.15.91.tar.xz
-sha256  0051a1780e5bda0efc68dafab7c728b8283d2b028fedb439418f478be7d3e1af  linux-5.10.166.tar.xz
-sha256  a74fd32ccc1025b72f3ba7183208761f7c6190fb96e8f484f6d543a5a183e62f  linux-5.4.230.tar.xz
+sha256  e7ed24f2690bf0e11158ccfa8ddc5c0e8a4816d83c4055d205218853da9c5dad  linux-5.15.93.tar.xz
+sha256  d807f97812e566410cd13b3170009e0d7552748d4f22d608ffd4dbd7f85bf9c6  linux-5.10.167.tar.xz
+sha256  8dd0ea7f1db4c1e89d485255798e3c3dfb9be63c0f2af369912a1a37b75f36a8  linux-5.4.231.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
 sha256  5385aaec55c766e3f462511453f5c63d7898b2d0e9ea74f22a23ebbedab0b3c6  linux-4.9.337.tar.xz
-sha256  64cbb234e46c196bc12bde74b233c7d3cb3b68d9c8ed48bf06715bd0f5c549d5  linux-4.14.304.tar.xz
-sha256  636d3f9cb48eaf06df14e56bd9d57bfc7c1b5952a75b9f841d41a43b75829d1a  linux-4.19.271.tar.xz
+sha256  a35bcde16b13aa423a1822675775a1b0abf17f5392454febabd8c3757187959a  linux-4.14.305.tar.xz
+sha256  489fb9368bd7ab808264dea1a4acdf607f057bf1ba19f647a17aa18d08f313f9  linux-4.19.272.tar.xz
 # Locally computed
 sha256  4594c147bdc493c7c286688542bbe65e550fb7bd58e0649ec587a2fe893ec0ee  linux-cip-5.10.145-cip17.tar.gz
 sha256  a5598f7f673b3ef819d6ed24f08d539eecb6febd11673a1d4752a1c05d4ee289  linux-cip-5.10.145-cip17-rt7.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 7ce514a5fa..bbd798f029 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -390,11 +390,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "4.9.337"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.304"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.271"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.230"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.166"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.91"	if BR2_KERNEL_HEADERS_5_15
+	default "4.14.305"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.272"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.231"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.167"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.93"	if BR2_KERNEL_HEADERS_5_15
 	default "5.19.17"	if BR2_KERNEL_HEADERS_5_19
 	default "6.0.19"	if BR2_KERNEL_HEADERS_6_0
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
