Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B55FCC065
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EED42613A7;
	Fri,  6 Mar 2026 19:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kaLpnX-cWEc; Fri,  6 Mar 2026 19:07:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDFD61251
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772824059;
	bh=wXrlWddKi9Qi6kQjqoQc+OZS9vBNF1g1B8aIdBw63Ew=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LEbl5ZMDO5SEpbi7vxxO4rf+GghYDoXsP6gIBvj1CurCHPj4EB3jFEeTjkvy8appS
	 /9oTZDvqwew9DCX2wchdFu6S29lSFwA6XnVj7MyboTKLvsoot21D+NN3sDWyp1B1lN
	 1qa1p44Yr70V6KjmY9PDpiafYLnsMrgOrBXBrephCZOrWrCpshwkufCiNhVCFHPI6m
	 oZTlVQoUzcQSdyX2wdburVOHQGSHNcK+Kbm8XafGs9P2xFu1HB6LhgC3p4AoH/PbEt
	 Fdx9P0gOSHwKLHnRvIicLWiQ3t00OxJmbZ4nhJDvW1aE65OsLhLaQ664wiTpRVIdvI
	 H57lIED2k6rpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDFD61251;
	Fri,  6 Mar 2026 19:07:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B7F223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E2AA61251
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:07:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1BCmILVy5z6n for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:07:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74A2E6119F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74A2E6119F
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:07:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69F56867B0; Fri,  6 Mar 2026 19:07:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 20:00:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ed1707ba559103f0aa298d40b5017b6bad0394c
X-Git-Newrev: b9a88acd9b1257965e091ac9ae04a210eb7260f7
X-Patchwork-Hint: ignore
Message-Id: <20260306190736.69F56867B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplacebo: bump version to 7.360.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9a88acd9b1257965e091ac9ae04a210eb7260f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.0

Removed patch 0003 which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0003-vulkan-utils_gen-fix-for-python-3.14.patch | 31 ----------------------
 package/libplacebo/libplacebo.hash                 |  2 +-
 package/libplacebo/libplacebo.mk                   |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch b/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
deleted file mode 100644
index 86f7c00856..0000000000
--- a/package/libplacebo/0003-vulkan-utils_gen-fix-for-python-3.14.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a22f0dff5fe89385155743a1735b146babfdb131 Mon Sep 17 00:00:00 2001
-From: Nicolas Chauvet <kwizart@gmail.com>
-Date: Tue, 29 Jul 2025 11:42:35 +0200
-Subject: [PATCH] vulkan/utils_gen: fix for python 3.14
-
-Python 3.14+ has added more type checking. This patch fixes usage
-
-Fixes: https://github.com/haasn/libplacebo/issues/335
-
-Upstream: https://code.videolan.org/videolan/libplacebo/-/commit/12509c0f1ee8c22ae163017f0a5e7b8a9d983a17
-
-Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/vulkan/utils_gen.py | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/vulkan/utils_gen.py b/src/vulkan/utils_gen.py
-index 9a97d35f..9b803d82 100644
---- a/src/vulkan/utils_gen.py
-+++ b/src/vulkan/utils_gen.py
-@@ -202,7 +202,8 @@ def find_registry_xml(datadir):
-     if not xmlfile or xmlfile == '':
-         xmlfile = find_registry_xml(datadir)
- 
--    registry = VkXML(ET.parse(xmlfile))
-+    tree = ET.parse(xmlfile)
-+    registry = VkXML(tree.getroot())
-     with open(outfile, 'w') as f:
-         f.write(TEMPLATE.render(
-             vkresults = get_vkenum(registry, 'VkResult'),
diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
index 302afcca16..a8d34c3fd2 100644
--- a/package/libplacebo/libplacebo.hash
+++ b/package/libplacebo/libplacebo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  46b501842e5b18867c6b7dd5c901e65ad6396608ad76309c366d8ace8be0d0d7  libplacebo-v7.351.0-git4.tar.gz
+sha256  0d4adc5cbe7b3691c2c77fed1b9e94a00fcd2c2637a301aa2b522c093139e5c0  libplacebo-v7.360.0-git4.tar.gz
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index ee5a4cc2c2..cb53248624 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLACEBO_VERSION = v7.351.0
+LIBPLACEBO_VERSION = v7.360.0
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
