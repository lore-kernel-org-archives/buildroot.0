Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196D6C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 16:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2B7A4055F;
	Sat,  5 Mar 2022 16:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_a7zSKt3jUk; Sat,  5 Mar 2022 16:32:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A483140526;
	Sat,  5 Mar 2022 16:32:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EE80A1BF5B3
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 16:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBF3860A80
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROml7QWU50O6 for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 16:31:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5309606E7
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 16:31:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E8286827CC; Sat,  5 Mar 2022 16:23:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 17:26:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b677a7bedb1a4c862944beeda53b104bd91cb2c2
X-Git-Newrev: 949aee637738341690b3a29a7dc2eb7572c164f1
X-Patchwork-Hint: ignore
Message-Id: <20220305162319.E8286827CC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 15, 16}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=949aee637738341690b3a29a7dc2eb7572c164f1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 16 ++++++++--------
 package/linux-headers/Config.in.host | 16 ++++++++--------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 13d99bd09d..df5261e5ff 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.26" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.83-cip1" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.83-cip1-rt1" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index d0813e5db4..01325348ef 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb  linux-5.16.tar.xz
-sha256  0a131b6a2f9f5ee37ecb332b5459ab35a87f0bf2d4ec923988d0663646cf156a  linux-5.15.13.tar.xz
-sha256  945e4264c014a3d9dfc0a4639309dd1ec2fb545416556421f931b95da78c2725  linux-5.10.90.tar.xz
-sha256  b09f74e0cf5fc7cf5de6aa932fe654c962cb10118bdbbdddb397022c6e6d382c  linux-5.4.170.tar.xz
+sha256  bb5a1df15a10a715807a44872ff4fe775337aae445285181f1d1ba0c78b1d7f2  linux-5.16.12.tar.xz
+sha256  58122134f2613fcbb200bb2399ef2117852166a8e11eed4b632a86b20b6bbe3a  linux-5.15.26.tar.xz
+sha256  4fb8ad55e6430342e4fbc94d54e594e9be8eb6a8bea1d71eccf835948d08580a  linux-5.10.103.tar.xz
+sha256  b2f1201f64f010e9e3c85d6f303a559a7944a80a0244a86b8f5035bd23f1f40d  linux-5.4.182.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  86c9ed59b120fad14d207470446086ac46099cd7bb9e58682e368e721164a6e0  linux-4.4.298.tar.xz
-sha256  fd4bdbc8be3472d6324fa0f5f57a17f5c3f509d5f5b4fa4f1a9797d982d0bca8  linux-4.9.296.tar.xz
-sha256  bffaaa4c93ab4ed1de61f804c26c92b82dd80f92793e20194b62497d7b8b4723  linux-4.14.261.tar.xz
-sha256  01ccfc3413c3bb305653ceb0aa528aba0caa61b326e43709bf1f8b624f211031  linux-4.19.224.tar.xz
+sha256  35017bb40b604e0b577fc2b87e727632b46608a2ba3a4f5858b9177f58f376b3  linux-4.4.302.tar.xz
+sha256  295e4bb3ba3244a9f4c48139ad13f78145f3e6402e11aa25b20aadb9ae9f2b25  linux-4.9.304.tar.xz
+sha256  03a65f405c3acae4dd8cd952444b7cd931f972c01a42e20a471319a2f6c018d2  linux-4.14.269.tar.xz
+sha256  4fcfe814780d63dc56e907bf41596ff162e9601978bdc1a60eab64cc3903a22c  linux-4.19.232.tar.xz
 # Locally computed
 sha256  5738dcf020ff75fb6e43d6d1a8b572d2f1fe58c08b31f822eb42fb91d6bdc98f  linux-cip-5.10.83-cip1.tar.gz
 sha256  2395443c5f960e5c6343f70480209d2530da27aa6f0299412e0f4b7128fccb7c  linux-cip-5.10.83-cip1-rt1.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 8543f1cd21..8cfbd41831 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -380,14 +380,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.298"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.296"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.261"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.224"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.170"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.90"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.13"	if BR2_KERNEL_HEADERS_5_15
-	default "5.16"		if BR2_KERNEL_HEADERS_5_16
+	default "4.4.302"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.304"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.269"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.232"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.182"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.103"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.26"	if BR2_KERNEL_HEADERS_5_15
+	default "5.16.12"	if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
