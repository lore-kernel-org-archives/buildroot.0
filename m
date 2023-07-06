Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16133EB64DC
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 15:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B16E860E71;
	Thu,  6 Jul 2023 15:44:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B16E860E71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id omHe9QWzSCtg; Thu,  6 Jul 2023 15:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D058E60BE6;
	Thu,  6 Jul 2023 15:44:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D058E60BE6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 951031BF39F
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 15:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D99F40591
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 15:44:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D99F40591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cR3DklNWRjfZ for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 15:44:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3877C40590
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 15:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3877C40590
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 254E38692B; Thu,  6 Jul 2023 15:44:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 17:44:06 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d24a21ff539b4c4bcec6bfe8bc169ab25fd02998
X-Git-Newrev: aa50601298b349b4c6d2aed9e7734a835cf1d564
X-Patchwork-Hint: ignore
Message-Id: <20230706154441.254E38692B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] {linux,
 linux-headers}: bump 4.{14, 19}.x / 5.{4, 10, 15}.x / 6.{1, 3}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=aa50601298b349b4c6d2aed9e7734a835cf1d564
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 11ca48bc4bb6f1be7fb22bb87507a99bd1e446f4)
[Peter: drop 6.3.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 1af36ee2f4..0e92e6446a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.1.34" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.1.35" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0abaef4856..f18592d0a0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  b26f7cbcbf8031efc49f11f236f372fc34a4fd5fc6ad3151b893d1aa038ed603  linux-6.1.34.tar.xz
+sha256  be368143bc5d0dc73dd3e8c6191630c1620520379baf6f47c16116b2c0bc26ac  linux-6.1.35.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  a9a8331f3c0e004b40a41f30d688b53bf85405597ac41c2c89be7f4fbcf7239f  linux-5.15.117.tar.xz
-sha256  77a9bebc1d1fa057212a3ac62c2a0784aafcdef149032df8898ebc9ed3c62908  linux-5.10.184.tar.xz
-sha256  33010d4f02314dd4eb51ab5d09f49ce970f2cfefe9f2133a2e085cac5dfffed7  linux-5.4.247.tar.xz
+sha256  4e6bf4dadb04d5d11d1d4cc37c0eabcf33bc333b7dd3dc2143c3099a823eb5b3  linux-5.15.118.tar.xz
+sha256  280662ec8dc8738cf947ad66e748141abd58cbe3b5ed66b7f2b153222b7c7090  linux-5.10.185.tar.xz
+sha256  3abed132e76c6575733acba39eaa54f6d8f4b1dc951b0e601a33959743b13e35  linux-5.4.248.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  47841504f334b24fe411270954423202ed84e21251edf5a61d40bde59051089d  linux-4.19.286.tar.xz
-sha256  c63a327e799b8a30ca96167f66100d4d7788338ac0a8cf5fc492c97e303211bc  linux-4.14.318.tar.xz
+sha256  286a9b8c75bff7bdf66985e12a3a650b2bd638a776a5a6e93415930855662a73  linux-4.19.287.tar.xz
+sha256  aca4750f02f4090b753c1445db44dfa90de535eca73a7b0a7aa4453f65ba1ff9  linux-4.14.319.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a23e97f5fa..e05a9e12b7 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -384,12 +384,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.14.318"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.286"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.247"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.184"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.117"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.34"	if BR2_KERNEL_HEADERS_6_1
+	default "4.14.319"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.287"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.248"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.185"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.118"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.35"	if BR2_KERNEL_HEADERS_6_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
