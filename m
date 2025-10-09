Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E45CCD188
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 10:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDAA561215;
	Thu,  9 Oct 2025 10:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XYE6WY_232fi; Thu,  9 Oct 2025 10:07:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 374E6612D1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 374E6612D1;
	Thu,  9 Oct 2025 10:07:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F80821B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF38F611DD
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OSqsbdFcTMH5 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 10:06:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CB2861202
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CB2861202
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B1DC86D26; Thu,  9 Oct 2025 10:06:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 10:05:25 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: f81caf3f310872d72e9891e639c0be38113b0d50
X-Git-Newrev: 3ac7c958133d10e84a09161446432ea4c48d57f9
X-Patchwork-Hint: ignore
Message-Id: <20251009100624.3B1DC86D26@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 5.4.x series
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ac7c958133d10e84a09161446432ea4c48d57f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Update the latest kernel releases to:
 - 6.12.49 -> 6.12.51
 - 6.6.108 -> 6.6.110
 - 6.1.154 -> 6.1.155
 - 5.15.193 -> 5.15.194
 - 5.10.244 -> 5.10.245
 - 5.4.299 -> 5.4.300

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/linux.hash                     | 12 ++++++------
 package/linux-headers/Config.in.host | 12 ++++++------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 3d8e28303e..c8c40a6e0b 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,12 +1,12 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
-sha256  234621e146dacce2241049555d550e4f7a6bde67ccd7ef232d47ac8145425526  linux-6.12.49.tar.xz
-sha256  601cd332aa695d16607b353feff369b4a0b36d111be077e8af54bdd41e1968a6  linux-6.6.108.tar.xz
-sha256  6f1aba92c3d0d21299eebb73161a2056c7c78c6ee77462a7cb705bd8cca8b198  linux-6.1.154.tar.xz
+sha256  2d55ad149ca7d9ef82595c669430650030cbf9afbbeb42e5cd9b4ba3cc1a7221  linux-6.12.51.tar.xz
+sha256  1bf20daf5543b8759f325e55fb0da4913715e68741627a13380e66aaf219fb1d  linux-6.6.110.tar.xz
+sha256  c29387aeee085fbcbd91236224b9df805063bac43615e75cea2c6b29604a5c73  linux-6.1.155.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  c70262d2f902710b773ef2f35c04b3ff2111e5186c8a97da351454180aac1e99  linux-5.15.193.tar.xz
-sha256  210a37cc09f5c2b3d6f011aa1c65d2484d6f4ec17cf90df473f917abb2c26dc0  linux-5.10.244.tar.xz
-sha256  88de95aeeb8d941fe61497f5e2e886bed25a79d509aa71ba25a2727fd7f0bf2d  linux-5.4.299.tar.xz
+sha256  348d6faada05fd4684450cd7c4e666c3c98cdb96f2309b1520c9a92a378c267e  linux-5.15.194.tar.xz
+sha256  131e75eb14da6fd683b3882bcd856085cfca47cc1aa89cd2deb1b48d22d29d9f  linux-5.10.245.tar.xz
+sha256  9949210093ca924d7b41162bb4772becd3f28ff726a09d061558929690a1815a  linux-5.4.300.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 83855a0396..df02ad9576 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -440,12 +440,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.4.299"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.244"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.193"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.154"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.108"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.49"	if BR2_KERNEL_HEADERS_6_12
+	default "5.4.300"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.245"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.194"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.155"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.110"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.51"	if BR2_KERNEL_HEADERS_6_12
 	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
