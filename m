Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851F4C48BF6
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 20:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DD3960842;
	Sat, 16 Mar 2024 20:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8vJcDDH7SvXv; Sat, 16 Mar 2024 20:47:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3DF960868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3DF960868;
	Sat, 16 Mar 2024 20:47:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 674F71BF85D
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 548F981EF1
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 20:47:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VovcUQ4Vmmdh for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD2C81EDF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BD2C81EDF
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E6BF87B53; Sat, 16 Mar 2024 20:47:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 Mar 2024 21:14:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30af227f9bac1e568c1208cfc392748a8ddbbf0d
X-Git-Newrev: 945b9f8d8e9704fd3d2dbd2579ebf9178ed49d89
X-Patchwork-Hint: ignore
Message-Id: <20240316204705.3E6BF87B53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/targetcli-fb: needs python-gobject
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=945b9f8d8e9704fd3d2dbd2579ebf9178ed49d89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without python-gobject, we get the following runtime error:

   ModuleNotFoundError: No module named 'gi'

Add python-gobject and propagate its dependencies.

While we're at it, split the DEPENDENCIES over several line and sort
them alphabetically.

Signed-off-by: Jeremy J. Peper <jeremy@jeremypeper.com>
Reviewed-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[Arnout: reorder everything alphabeticall, split DEPENDENCIES over
several lines.]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/targetcli-fb/Config.in       | 13 ++++++++++++-
 package/targetcli-fb/targetcli-fb.mk |  6 +++++-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 04c6a1ac09..eb7528fbea 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -1,12 +1,23 @@
-comment "targetcli-fb depends on Python"
+comment "targetcli-fb needs Python, a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on !BR2_PACKAGE_PYTHON3
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_TARGETCLI_FB
 	bool "targetcli-fb"
 	depends on BR2_PACKAGE_PYTHON3 # python-configshell-fb
+	depends on BR2_USE_MMU # python-gobject -> gobject-introspection
+	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # python-gobject -> gobject-introspection
+	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
 	select BR2_PACKAGE_PYTHON_SIX
+	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  targetcli-fb is a command-line interface for configuring the
 	  LIO generic SCSI target, present in 3.x Linux kernel
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index d2cbf79e26..56ed7c6174 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -12,7 +12,11 @@ TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_CPE_ID_VALID = YES
 TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = python-configshell-fb python-rtslib-fb python-six
+TARGETCLI_FB_DEPENDENCIES = \
+	python-configshell-fb \
+	python-gobject \
+	python-rtslib-fb \
+	python-six
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
