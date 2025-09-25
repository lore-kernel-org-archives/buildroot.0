Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9198CAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0361415D6;
	Thu, 25 Sep 2025 20:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6M4JWo96s9zI; Thu, 25 Sep 2025 20:20:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61FC41847
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D61FC41847;
	Thu, 25 Sep 2025 20:20:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 288BA12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 159EF40066
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RdrdOj7s7Niv for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4ECF412A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4ECF412A7
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E209886443; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:39 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a017d534d901b32d472d3131dc2c360da46013b5
X-Git-Newrev: af3e9238c70d2a3ff0886b2ea48f9436bb75da00
X-Patchwork-Hint: ignore
Message-Id: <20250925201942.E209886443@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/x11r7/xapp_xdm:
 needs libxcrypt
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af3e9238c70d2a3ff0886b2ea48f9436bb75da00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

While doing a per-package build the package is failing to
compile with this error (gcc 13.x glibc toochain):
make[3]: Entering directory
'/home/wbx/buildroot-2025.02.3/output/build/xapp_xdm-1.1.14/xdm'   CC
session.o session.c:146:11: fatal error: crypt.h: No such file or
directory   146 | # include <crypt.h>       |           ^~~~~~~~~
compilation terminated.

Fix this error by providing the needed glibc dependencies.

Fixes:
 https://autobuild.buildroot.org/results/b75/b75ad8f1159613656dce482992c800545d60ae69/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2d076a1b7660d696d2b2f4eb7b25d8d9bc555ddc)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/x11r7/xapp_xdm/Config.in   | 1 +
 package/x11r7/xapp_xdm/xapp_xdm.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/x11r7/xapp_xdm/Config.in b/package/x11r7/xapp_xdm/Config.in
index 1ac15ce368..adeb3ce0c0 100644
--- a/package/x11r7/xapp_xdm/Config.in
+++ b/package/x11r7/xapp_xdm/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XAPP_XDM
 	depends on BR2_USE_MMU # fork()
 	# Runtime dependency: can't start an X server unless there is one
 	depends on BR2_PACKAGE_XSERVER_XORG_SERVER
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_XAPP_SESSREG
 	select BR2_PACKAGE_XAPP_XRDB
 	select BR2_PACKAGE_XLIB_LIBX11
diff --git a/package/x11r7/xapp_xdm/xapp_xdm.mk b/package/x11r7/xapp_xdm/xapp_xdm.mk
index 035f2e9484..2a343b55e2 100644
--- a/package/x11r7/xapp_xdm/xapp_xdm.mk
+++ b/package/x11r7/xapp_xdm/xapp_xdm.mk
@@ -30,6 +30,10 @@ else
 XAPP_XDM_CONF_OPTS += --without-xinerama
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+XAPP_XDM_DEPENDENCIES += libxcrypt
+endif
+
 define XAPP_XDM_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/x11r7/xapp_xdm/S99xdm \
 		$(TARGET_DIR)/etc/init.d/S99xdm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
