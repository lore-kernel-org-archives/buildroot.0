Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC1FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1456760E5A;
	Mon, 10 Jan 2022 22:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oQIwUJ1t0WiL; Mon, 10 Jan 2022 22:57:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5067B607DE;
	Mon, 10 Jan 2022 22:57:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 748731BF97F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63B7D60C18
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-IXv35sPqWq for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:57:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B2A607DE
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:57:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CF3A982984; Mon, 10 Jan 2022 22:50:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 23:54:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb104bc0777926528e1e3a29bea7d32320ef2173
X-Git-Newrev: 85459426d9f4f5909b359d9456f71bdeac3c46ff
X-Patchwork-Hint: ignore
Message-Id: <20220110225049.CF3A982984@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: add version 5.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=85459426d9f4f5909b359d9456f71bdeac3c46ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Michael Walle <michael@walle.cc>
[Peter: Keep default at 5.15.x for 2022.02]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                                              |  1 +
 package/linux-headers/Config.in.host                          | 11 ++++++++++-
 toolchain/Config.in                                           |  5 +++++
 .../toolchain-external-custom/Config.in.options               |  6 +++++-
 4 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 2f144427f4..86dc8d7af9 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,4 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
+sha256  027d7e8988bb69ac12ee92406c3be1fe13f990b1ca2249e226225cd1573308bb  linux-5.16.tar.xz
 sha256  b3e9ba06a299a3e2ead4a15753bc46a3e0c90d3b92ffeed1034ccc9f13a717f0  linux-5.15.6.tar.xz
 sha256  f41a259cb2002dd2e3286524b2bb4e803f4f982992d092706ecea613584023b3  linux-5.14.21.tar.xz
 sha256  ef259a43f33ddb56001283f4f4e50af29b8a48fa066aed7371a90ebf38c29b70  linux-5.10.83.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9bc3c873c5..8ee86e09af 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -65,6 +65,10 @@ config BR2_KERNEL_HEADERS_5_14
 config BR2_KERNEL_HEADERS_5_15
 	bool "Linux 5.15.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
+
+config BR2_KERNEL_HEADERS_5_16
+	bool "Linux 5.16.x kernel headers"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	select BR2_KERNEL_HEADERS_LATEST
 
 config BR2_KERNEL_HEADERS_VERSION
@@ -139,8 +143,12 @@ choice
 	  If your kernel headers are more recent than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16
+	bool "5.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15
-	bool "5.15.x or later"
+	bool "5.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14
@@ -382,6 +390,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.83"	if BR2_KERNEL_HEADERS_5_10
 	default "5.14.21"	if BR2_KERNEL_HEADERS_5_14
 	default "5.15.6"	if BR2_KERNEL_HEADERS_5_15
+	default "5.16"		if BR2_KERNEL_HEADERS_5_16
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
diff --git a/toolchain/Config.in b/toolchain/Config.in
index fd005f4740..adc93ab725 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -566,6 +566,10 @@ config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	bool
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
+
+config BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+	bool
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	select BR2_TOOLCHAIN_HEADERS_LATEST
 
 # This should be selected by the latest version, above, to indicate that
@@ -579,6 +583,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	default "5.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	default "5.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
 	default "5.13" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_13
diff --git a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
index 1cea64d105..9346fa3feb 100644
--- a/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-custom/Config.in.options
@@ -123,8 +123,12 @@ choice
 	  If your toolchain uses headers newer than the latest version
 	  in the choice, then select the latest version.
 
+config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_16
+	bool "5.16.x or later"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
+
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_15
-	bool "5.15.x or later"
+	bool "5.15.x"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 
 config BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_14
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
