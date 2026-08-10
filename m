Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F494C5AD4E
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 08:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 063726065A;
	Mon, 10 Aug 2026 08:45:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hddu2Pir-EW0; Mon, 10 Aug 2026 08:45:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DEB0606B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786351529;
	bh=81JzMsuVeTj0M8cUDWJBiyUyRNyUyVHUIVX/ker4JNM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U7y9JK68YRFemBksvSBkT4oK3+Bj33TUBWwaK1EaDm1hW5arFxoYB2IvLGVacu+u4
	 qBE7YkPWMup236Ysf5lDxIEwvh4vDQ3suBIuyV0WgLM9MU7qJHvtP8PB9GzZK5SV/o
	 LNfATHHvo/qQ0yD9/jLY5n/rSCQA8sPB0eNc0/g/eyFJJ4owgVOOvRYr4k+GnMMSBO
	 7lzUBShLecKrp1BXMP2WAlknso6mQIadTu4wwSbOXSVq88Xmb26wpAd89y+cCEOwxe
	 eawKrP7Rh/MYppbe9ZpdgZdaoGAKfMnsHPCvfqNDoHZ9k40KBNbClG20wIbM+vsxof
	 34r5LlBC/OuyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DEB0606B6;
	Mon, 10 Aug 2026 08:45:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FF7B2F5
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3248640106
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:45:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxgl1rtmq0Qh for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 08:45:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78276400EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78276400EF
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 08:45:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F9198D2B6; Mon, 10 Aug 2026 08:44:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Aug 2026 09:57:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa32b20b10a5e1b69e7ee99f54ac9145f846d625
X-Git-Newrev: d705d20506c2a30992810002c63a513982820ad0
X-Patchwork-Hint: ignore
Message-Id: <20260810084437.7F9198D2B6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.12.x, 6.6.x,
 7.1.x, 6.18.x series
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d705d20506c2a30992810002c63a513982820ad0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the latest kernel releases to:
 - 6.12.102 -> 6.12.103
 - 6.6.150 -> 6.6.151
 - 7.1.7 -> 7.1.8
 - 6.18.43 -> 6.18.44

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 linux/{7.1.7 => 7.1.8}                       | 0
 linux/Config.in                              | 2 +-
 linux/before-6.17/linux.hash                 | 4 ++--
 linux/from-6.17/linux.hash                   | 4 ++--
 package/linux-headers/{6.12.102 => 6.12.103} | 0
 package/linux-headers/{6.18.43 => 6.18.44}   | 0
 package/linux-headers/{6.6.150 => 6.6.151}   | 0
 package/linux-headers/{7.1.7 => 7.1.8}       | 0
 package/linux-headers/Config.in.host         | 8 ++++----
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/linux/7.1.7 b/linux/7.1.8
similarity index 100%
rename from linux/7.1.7
rename to linux/7.1.8
diff --git a/linux/Config.in b/linux/Config.in
index a5270857f6..35f8daddaa 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.7" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.1.8" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 7102a69377..c1e447e255 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  694bb5f49371323ab9c2b7040bd358ed81bffbe80b372d76507045828f655803  linux-6.12.102.tar.xz
-sha256  6eb823269151936c0af9e050678ed5c70ca515d6b20a09af741852b02d228979  linux-6.6.150.tar.xz
+sha256  f143aaade8877ba5616e788b4482576db28481bcf557ef537f4fcc3938fc3176  linux-6.12.103.tar.xz
+sha256  de01e5ae73412b70bceb41a6f97da6d0f29b6536f1f00f8b6a6fd40c729969f7  linux-6.6.151.tar.xz
 sha256  f38416bb6e8024a21ae868c7f29cd15293a73755e3484c7f2f4adea5b03c1f85  linux-6.1.182.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  d57f279da0813fa6d69fb2e59cf9a364be4faa1cd18cb76b0b64c074fd23b7a7  linux-5.15.215.tar.xz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index f527761764..bb9750191d 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v7.x/sha256sums.asc
-sha256  ca8f2a6884a4d62043e9ab93ac1ab15efc2b6630fe8f768b2ef2ffdf4b5e26df  linux-7.1.7.tar.xz
+sha256  ff01dcb449279d5b4cfccdb01fee639cf5ff1803f1749a77844dd33915422c49  linux-7.1.8.tar.xz
 
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a1aeb926c7c4a1564368200b1082e45bb958007682d804aff88abbc3a7a47b5d  linux-6.18.43.tar.xz
+sha256  0f72d938f06828e82c90405174fe572287db7bfe089e2fc46572a99a7f240d43  linux-6.18.44.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/6.12.102 b/package/linux-headers/6.12.103
similarity index 100%
rename from package/linux-headers/6.12.102
rename to package/linux-headers/6.12.103
diff --git a/package/linux-headers/6.18.43 b/package/linux-headers/6.18.44
similarity index 100%
rename from package/linux-headers/6.18.43
rename to package/linux-headers/6.18.44
diff --git a/package/linux-headers/6.6.150 b/package/linux-headers/6.6.151
similarity index 100%
rename from package/linux-headers/6.6.150
rename to package/linux-headers/6.6.151
diff --git a/package/linux-headers/7.1.7 b/package/linux-headers/7.1.8
similarity index 100%
rename from package/linux-headers/7.1.7
rename to package/linux-headers/7.1.8
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4fa0bc80f9..ad1a5bd70c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -475,10 +475,10 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.264"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.215"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.182"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.150"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.102"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.43"	if BR2_KERNEL_HEADERS_6_18
-	default "7.1.7"		if BR2_KERNEL_HEADERS_7_1
+	default "6.6.151"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.103"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.44"	if BR2_KERNEL_HEADERS_6_18
+	default "7.1.8"		if BR2_KERNEL_HEADERS_7_1
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
