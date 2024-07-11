Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35293C3DA4E
	for <buildroot@archiver.kernel.org>; Thu, 11 Jul 2024 18:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3DE44021C;
	Thu, 11 Jul 2024 18:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bbhwbGdFiaH3; Thu, 11 Jul 2024 18:49:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4DF7409D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4DF7409D7;
	Thu, 11 Jul 2024 18:49:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D17B1BF59E
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEF7560899
 for <buildroot@lists.busybox.net>; Thu, 11 Jul 2024 18:49:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CYi7_BycXN4p for <buildroot@lists.busybox.net>;
 Thu, 11 Jul 2024 18:49:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E966460615
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E966460615
 for <buildroot@buildroot.org>; Thu, 11 Jul 2024 18:49:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D816884F30; Thu, 11 Jul 2024 18:49:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jul 2024 20:28:03 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 7b3d3e52ac51acd774bd9d7ae189a56cda131e5c
X-Git-Newrev: 2598a0cffcc6c1c607720d436337bafc68a2dac0
X-Patchwork-Hint: ignore
Message-Id: <20240711184941.D816884F30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] {linux,
 linux-headers}: bump 4.19.x / 5.{4, 10, 15}.x / 6.{1, 6, 9}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=2598a0cffcc6c1c607720d436337bafc68a2dac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2389fb5bbb1adfe37c4b21c4127006dee1dba25a)
[Peter: drop 6.9.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 9374af71b0..37e1a59032 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
-sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
-sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
+sha256  f3976e77708694fe4a1f8d1307c315c8a36cbc58f038a38e006b91e29a1f3214  linux-6.6.37.tar.xz
+sha256  890b845f36452328716e62dd893b634584f607cdd44b4e685392d302d3be41af  linux-6.1.97.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
-sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
-sha256  7e1f5b28588e49ddfd18e7772476e4e8b52bdc9c3e19beafcbb7c103e6c01f51  linux-5.4.277.tar.xz
+sha256  91bfc0ea152ce7b102a0b79d35a7c92843874ebf085c99d2ba8b4d85e62b1a7c  linux-5.15.162.tar.xz
+sha256  da1dd47febac4f7856654038a47703666da3afba348b8e96e39584e0972e2725  linux-5.10.221.tar.xz
+sha256  b298436b26395b5c3ace6963836ba70d57cd61e01cff254b0e5443636c324a5e  linux-5.4.279.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
+sha256  062b70cc132378e1c685df44ddf7e05bab4752b690ada17b080655a63f993581  linux-4.19.317.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 487d941a16..9eff2fec9c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -415,12 +415,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.315"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
+	default "4.19.317"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.279"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.221"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.162"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.97"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.37"	if BR2_KERNEL_HEADERS_6_6
 	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
