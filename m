Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A484AC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E8F060619;
	Sun, 26 Jan 2025 10:27:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZXDb-gOk4G5U; Sun, 26 Jan 2025 10:27:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31A136081C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31A136081C;
	Sun, 26 Jan 2025 10:27:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A38941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1BD40147
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:27:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VJn6J5oldkU4 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:27:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9C3A4067A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9C3A4067A
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:27:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3AEA86490; Sun, 26 Jan 2025 10:27:43 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 26 Jan 2025 11:23:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b04e77b900bfa89d538b6071b59de3dcf39e413c
X-Git-Newrev: e90a6b91036fd0e841bb8d5cc30586e4825c33ae
X-Patchwork-Hint: ignore
Message-Id: <20250126102743.D3AEA86490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fontconfig: drop the util-linux
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e90a6b91036fd0e841bb8d5cc30586e4825c33ae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 67089f8c11d05147e3def29e226c13a10e913f76
"package/fontconfig: add util-linux mandatory dependency"
added the dependency on util-linux because of uuid [1].
This dependency was later replaced [2], so drop the util-linux
dependency.

[1] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/7b48fd3dd406b926f0e5240b211f72197ed538a9
[2] https://gitlab.freedesktop.org/fontconfig/fontconfig/-/commit/c4324f54ee16e648ba91f3e9c66af13ab3b1754c

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fontconfig/Config.in     | 2 --
 package/fontconfig/fontconfig.mk | 6 ++----
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/fontconfig/Config.in b/package/fontconfig/Config.in
index d274b06350..218fdb2e7a 100644
--- a/package/fontconfig/Config.in
+++ b/package/fontconfig/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_FONTCONFIG
 	bool "fontconfig"
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_UTIL_LINUX
-	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	help
 	  Fontconfig is a library for configuring and customizing font
 	  access.
diff --git a/package/fontconfig/fontconfig.mk b/package/fontconfig/fontconfig.mk
index b60086c9c8..cc6ca88585 100644
--- a/package/fontconfig/fontconfig.mk
+++ b/package/fontconfig/fontconfig.mk
@@ -9,11 +9,9 @@ FONTCONFIG_SITE = https://www.freedesktop.org/software/fontconfig/release
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.xz
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_DEPENDENCIES = freetype expat host-pkgconf host-gperf \
-	$(if $(BR2_PACKAGE_UTIL_LINUX_LIBS),util-linux-libs,util-linux) \
 	$(TARGET_NLS_DEPENDENCIES)
-HOST_FONTCONFIG_DEPENDENCIES = \
-	host-freetype host-expat host-pkgconf host-gperf host-util-linux \
-	host-gettext
+HOST_FONTCONFIG_DEPENDENCIES = host-freetype host-expat host-pkgconf \
+	host-gperf host-gettext
 FONTCONFIG_LICENSE = fontconfig license
 FONTCONFIG_LICENSE_FILES = COPYING
 FONTCONFIG_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
