Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CB9E67485
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF55660E14;
	Sat, 20 Dec 2025 21:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7rm-NzWKiQG; Sat, 20 Dec 2025 21:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBF9860DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266760;
	bh=a1yhobwHYHoSDtMKco/l/feXcgFISHio5T0zaoDxMec=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K1XhfNsbB2UFHXolppgrT5+5trgYK7xfSstMUVrbFkf6CTASujlMSQMI7u2pLthyz
	 V6T5KmwBw2QBeAO58EKzbvYzEKfWrm9FvB4I9WcT2POoOJyK/C+bJdwkU05Z+rc/zP
	 /aewLMlW+/TRPWQBusOHBqH6JjvL0wm/kyqvIp2SvNGyXR2tuszLdxYOLtEyTGZ6Fc
	 KAbVJdL/KwX450O08aokN50XevNoAezNEAoYjbrfESpQ4d4xC+6v3LGvfYuvoGTKv4
	 o+BBF7IMzrarOwYP+bdnLSrQXLpDpCQwtM/ZiWQMvGtDY8G0r7xvHSRmWdEDs6u88Y
	 mpLaYA9wWyarA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBF9860DFA;
	Sat, 20 Dec 2025 21:39:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ED85293
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05A7E4079A
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VrUUPMqfaz3T for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BD19404A4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD19404A4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C40E87585; Sat, 20 Dec 2025 21:39:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 21:32:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f2547021d1370849f053fa1b08097b76021f7a2
X-Git-Newrev: 519272ba14eadd43a6e4075a8991847fe4b96966
X-Patchwork-Hint: ignore
Message-Id: <20251220213917.3C40E87585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-{headers,
 tools}: bump to version 1.4.335.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=519272ba14eadd43a6e4075a8991847fe4b96966
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.335.0/CHANGES
https://github.com/KhronosGroup/SPIRV-Headers/releases/tag/vulkan-sdk-1.4.335.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index c62d12a79a..019145f959 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  602364ab7bf404a7f352df7da5c645f1c4558a9c92616f8ee33422b04d5e35b7  spirv-headers-1.4.328.1.tar.gz
+sha256  1c47ca6342ebe86f57b46b8dbeb266fa655a1ca8e10d07e45370ff2d9c36312e  spirv-headers-1.4.335.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 9312e96d41..0d0ee949bd 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.328.1
+SPIRV_HEADERS_VERSION = 1.4.335.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index e3652a48cd..cba67d7d8d 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d00dc47df7163c2bacd70f090441e8fad96234f0e3b96c54ee9091a49e627adb  spirv-tools-1.4.328.1.tar.gz
+sha256  8b3d5637061b52675e506ffa1100740031e38bdd96b8177978acfd898a705da2  spirv-tools-1.4.335.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index c71a0f8299..f0e76bb9ad 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.328.1
+SPIRV_TOOLS_VERSION = 1.4.335.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
