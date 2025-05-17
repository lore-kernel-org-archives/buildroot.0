Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F70DC3ABDA
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDECB83C40;
	Sat, 17 May 2025 10:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NyxkvmGXCmJ0; Sat, 17 May 2025 10:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC63E83C7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC63E83C7D;
	Sat, 17 May 2025 10:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 159F91DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D625460717
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:40:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy6w5yFCXSPq for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C90C607E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C90C607E9
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:40:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29A1A8039D; Sat, 17 May 2025 10:40:09 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:39:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 58f9c7b83c86b06e1a086dbe884e216799410118
X-Git-Newrev: b08bc5b9e94269adb4a1c5771c8c26c8c87e5b5a
X-Patchwork-Hint: ignore
Message-Id: <20250517104009.29A1A8039D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-tools: add host variant
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b08bc5b9e94269adb4a1c5771c8c26c8c87e5b5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for mesa3d bump to 24.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-tools/spirv-tools.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index e863911b03..51b1c9f22a 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -10,6 +10,7 @@ SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,sdk-$(SPIRV_TOOLS_VERS
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
 SPIRV_TOOLS_DEPENDENCIES = spirv-headers
+HOST_SPIRV_TOOLS_DEPENDENCIES = host-spirv-headers
 SPIRV_TOOLS_INSTALL_STAGING = YES
 
 SPIRV_TOOLS_CONF_OPTS = \
@@ -18,4 +19,11 @@ SPIRV_TOOLS_CONF_OPTS = \
 	-DSPIRV_SKIP_TESTS=ON \
 	-DSPIRV_WERROR=OFF
 
+HOST_SPIRV_TOOLS_CONF_OPTS = \
+	-DSPIRV-Headers_SOURCE_DIR=$(HOST_DIR) \
+	-DSPIRV_TOOLS_BUILD_STATIC=OFF \
+	-DSPIRV_SKIP_TESTS=ON \
+	-DSPIRV_WERROR=OFF
+
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
