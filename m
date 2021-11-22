Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36889C433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 21:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA54E607A3;
	Mon, 22 Nov 2021 21:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7oXRRCfHB2E; Mon, 22 Nov 2021 21:53:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0666560646;
	Mon, 22 Nov 2021 21:53:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C59531BF82C
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B52EA40483
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 21:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEBkUqAZ-HOB for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 21:53:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46749402B8
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 21:53:53 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D5B07E0005;
 Mon, 22 Nov 2021 21:53:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1mpHG0-0000Zh-So; Mon, 22 Nov 2021 22:53:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 22:53:38 +0100
Message-Id: <20211122215339.2157-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] {linux, linux-headers}: bump 4.{4, 9, 14,
 19}.x / 5.{4, 10, 14, 15}.x series
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
index 0f677d1e4e..42724c7d3c 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -125,7 +125,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "5.15" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "5.15.4" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "4.19.198-cip54" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "4.19.198-cip54-rt21" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index dca42d33aa..8a6f77be36 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8  linux-5.15.tar.xz
-sha256  c30dcbb1f884b94c80eab001339a6df5de46651f976460cdd213b6e2858ebc00  linux-5.14.16.tar.xz
-sha256  d3b64edfc1dd7212e62ed733aeeb73d64ffd6d9658d322d44cddf1b41d5b8fc3  linux-5.10.77.tar.xz
-sha256  9f3fbbbcb3c8a53e1cbed9ae6b06991ba618c1deeaef0a125ba9e82d8414864a  linux-5.4.157.tar.xz
+sha256  549d0fb75e65f6158e6f4becc648f249d386843da0e1211460bde8b1ea99cbca  linux-5.15.4.tar.xz
+sha256  f41a259cb2002dd2e3286524b2bb4e803f4f982992d092706ecea613584023b3  linux-5.14.21.tar.xz
+sha256  a2e1686132c4598c0adfdf52acbf1ab4bb327b2398badef346a0eff849da5adb  linux-5.10.81.tar.xz
+sha256  3149c6b52a3079218a60bd369a80d18275b574d84908ffee32a0a8f9ddf939a7  linux-5.4.161.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  70a7f59ab5755d746dd35d5bc09fe122348f15986d21283fb7a81105c7de6b51  linux-4.4.291.tar.xz
-sha256  a5c2d0fdd5b34aca1fb2d7bdce48a6a5a0fa85ad926e6d6d74df17fe30397fa6  linux-4.9.289.tar.xz
-sha256  dfd95c1bc3af5b0e57e53608f8356037510b19cb55cac520e43c3d499ea60d46  linux-4.14.254.tar.xz
-sha256  9e2064f9cb942999a76737d510f08a85bcd8164e9762ce0f7dbfeac58bc2f2b3  linux-4.19.215.tar.xz
+sha256  2729aa644e174418764eaf60f9f1ee1bd6505290a327c2f24385b4a02cfab96c  linux-4.4.292.tar.xz
+sha256  cdde5aa24633fcac929b15f2c2fe0c43053dc7439ab3d9c7223d82fdd8ea40db  linux-4.9.290.tar.xz
+sha256  f00b8001424e3f185990f6ee24a7a393b7f0996f739cd4ee6a79532b23e6b2d7  linux-4.14.255.tar.xz
+sha256  8551110cc7184b1402a21b42e498088c5b0bb824a658c5fab173c12d9904a004  linux-4.19.217.tar.xz
 # Locally computed
 sha256  e6fc0a999a180ad272b08ff71cbc67f2d3fdc6773d4a8069aefb8781b8e07821  linux-cip-4.19.198-cip54.tar.gz
 sha256  449668d678e458ddaf30f944b7ca7f5ce6ea6664f57d43ea4eb90b176e03b9cb  linux-cip-4.19.198-cip54-rt21.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 38cb274066..fb9086d0a9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -374,14 +374,14 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.4.291"	if BR2_KERNEL_HEADERS_4_4
-	default "4.9.289"	if BR2_KERNEL_HEADERS_4_9
-	default "4.14.254"	if BR2_KERNEL_HEADERS_4_14
-	default "4.19.215"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.157"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.77"	if BR2_KERNEL_HEADERS_5_10
-	default "5.14.16"	if BR2_KERNEL_HEADERS_5_14
-	default "5.15"		if BR2_KERNEL_HEADERS_5_15
+	default "4.4.292"	if BR2_KERNEL_HEADERS_4_4
+	default "4.9.290"	if BR2_KERNEL_HEADERS_4_9
+	default "4.14.255"	if BR2_KERNEL_HEADERS_4_14
+	default "4.19.217"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.161"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.81"	if BR2_KERNEL_HEADERS_5_10
+	default "5.14.21"	if BR2_KERNEL_HEADERS_5_14
+	default "5.15.4"	if BR2_KERNEL_HEADERS_5_15
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
