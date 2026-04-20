Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28646F5A8A3
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 17:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7BFD80E36;
	Mon, 20 Apr 2026 17:26:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Dy4aZ07Q9rS; Mon, 20 Apr 2026 17:26:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57F1A80E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776705960;
	bh=H5Js1b61tDL+ntn04MxVTXa8H6gRmfg2LVtK1c8ZWbc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qrXenb68tYuK8i6GggQEW3RNnPOwq5XtnL+p0a8HXrq08H/t6nUlFjRosilKoOwqF
	 hE7kffzzj9MMTTDGZ+yv9XMux6g7MGbQ09FNtJn93dJZpXJNO/dTasVT+I8sjHRX/k
	 aQwQka5KvX0c/L+iMMQmyTfHCIXl+kvBzoQEwFhLn36SeLxn/Q6ZIjuOaucNNjyNaA
	 KJnVTMthMAX67v+IH4zA79shxlbg+saoOlXcKNzGaszrbC7Hn2zL25NuajP9Hay62q
	 aCyYZ0W/2MX5AFTbkbLXIFw2ZuSXDfteQRz+BAaVKMaNBNtbrgvcn0LlypIpYq3iW4
	 5xbeqEjpp3LhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57F1A80E0A;
	Mon, 20 Apr 2026 17:26:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D7D324D
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FBC84085F
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:25:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id adtWmfbD1SjA for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 17:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D0C240839
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D0C240839
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 17:25:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47EB781F78; Mon, 20 Apr 2026 17:25:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 20 Apr 2026 19:25:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ca0fdb48d09858e2fb3704473519aa07f6d876d
X-Git-Newrev: 8f2228d6c9e2cc1e8447c3555d89495d0f9ba53e
X-Patchwork-Hint: ignore
Message-Id: <20260420172557.47EB781F78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libftdi1: bump to version
 v1.6rc1-2-g92d657b
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f2228d6c9e2cc1e8447c3555d89495d0f9ba53e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libftdi1's commit 2a992306c0acf938b29fa0cd5fbc160e24424209 introduced
support for independent static/shared library building. But the proper
building of the ftid_eeprom tool was introduced later in commit
eaf42c00bfab5d6bbd8106b11a697ff4f2d7659f. So let's update to the latest
commit that also includes other fixes:

92d657bcb543a9622947d984d4a8e725fb680e8c ChangeLog: Add license clarifications
06fa7fa342a6976a3745894b46babfa5fde841f7 ftdipp: Add wrapper for ftdi_set_module_detach_mode()
120c3495ba82ae9c35a7518248b2e45dfbc36ea7 Merge branch 'prepare-release'
c4b7675a43dcd8fa7c1c42708d5665a2a02e86e4 Set version number to 1.6rc1
c0c8c923829e1c391d7ca951e12b50092d6435f1 Prepare changelog for 1.6rc1
9341a7e8efc07c213c872ced62fc03c03a270b44 Increase copyright year to 2026
f9301536f4004d42cec4dd36f2505679459aae4e Update AUTHORS with contributors since v1.5
ed9d31e41a6ec695fd610e4d718ccc8bb6aefa4b Merge branch 'clarify-license'
84497180578f481758042c73eee9ec0eb60bace3 COPYING.LIB: Update to LGPL v2.1
4ec5bc584c27c333f74eca524de5a0839c983935 LICENSE: Clarify the main ftdi lib is LGPL v2.1 only
61ad454af3e0a886a665659b73729872cfb564a0 LICENSE: Clarify ftdi_eeprom is GPL v2 only
630a27f240fd784c7c3f5d75e7c880eca3a66cf8 Replace tabs in fall-through comments
4f600d690ee0dcbecef4b02edb5700fe84c4a9b3 Modernize Boost detection for CMake 3.30+
f7ed9dd371f9387ed5b715a4f316eea9f85de48d python/CMakeLists.txt: rework Python development files detection
eaf42c00bfab5d6bbd8106b11a697ff4f2d7659f ftdi_eeprom: fix static build
f554d7cd432d3056b1ca62bf09cc4003bf307912 Ignore JetBrains IDE files
019f48462836c9f3a0a1f113a351395ddcf99640 CMake: auto-format all CMake files

Licence files changed due to copyright year change as also some licence
clarifications described in patches:

84497180578f481758042c73eee9ec0eb60bace3
4ec5bc584c27c333f74eca524de5a0839c983935
61ad454af3e0a886a665659b73729872cfb564a0

Fixes:

  https://autobuild.buildroot.org/results/8e1299b9ce28df2a848310c5bfb968f59cd8794c/

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libftdi1/libftdi1.hash | 6 +++---
 package/libftdi1/libftdi1.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libftdi1/libftdi1.hash b/package/libftdi1/libftdi1.hash
index e110da6b5b..3740e5b454 100644
--- a/package/libftdi1/libftdi1.hash
+++ b/package/libftdi1/libftdi1.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha256  e85f1161d19f60b570751f3c8be334d309c710e5f77ef9afdc0eaa2c4fa73c95  libftdi1-v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b-git4.tar.gz
+sha256  1b0f06a2f99c97b66fd89a00b7dad6bba21d53de7c5a5bc2c3ef4393b32d4228  libftdi1-v1.6rc1-2-g92d657bcb543a9622947d984d4a8e725fb680e8c-git4.tar.gz
 
 # Hash for license files:
-sha256  524f46428bf72bb8c6acfeca4909551fd2e0bdbb5305406d38382f4056095c56  LICENSE
+sha256  483d3d73b7cc56f3db406ec6e60d5e9fa737dd8794c36cfb7795a37030682d63  LICENSE
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.GPL
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING.LIB
+sha256  20e50fe7aae3e56378ebf0417d9de904f55a0e61e4df315333e632a4d3555d95  COPYING.LIB
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 4fac8d2e39..04ed3de562 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFTDI1_VERSION = v1.5-62-g5e67403c4fb5536a2effe2e91181dd73a2cff91b
+LIBFTDI1_VERSION = v1.6rc1-2-g92d657bcb543a9622947d984d4a8e725fb680e8c
 LIBFTDI1_SITE = git://developer.intra2net.com/libftdi
 LIBFTDI1_INSTALL_STAGING = YES
 LIBFTDI1_DEPENDENCIES = host-pkgconf libusb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
