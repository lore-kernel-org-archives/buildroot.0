Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C7ECD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 976B2614A1;
	Fri, 29 May 2026 08:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwIUEvV2HfWE; Fri, 29 May 2026 08:47:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2AA76146A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780044465;
	bh=RbIsrXBzpOeKeZIS9Mdi6Wa3ikAwlS6T4TVZxUmHuK8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NdnTw9XUhuitYlplbMeDGiX9Ub9izOD+SjJWRGzjuttj65ETvBEpzb2whOYd7FthY
	 Bzl95a+oPed55gWtgzF6bZ+t0rM/OhZp7iAnEnayjvtv9fl3DxZ6qM9ohwUqwcJbIe
	 WTkigX5glMYYsUZKrxGAqNPMDqNnqsk5p0E+nY1ymLUAvm/g4Ulvy6BjGdI8I5Nxf6
	 moaT2vdVvJa8bKCixoSssK/FsOATJePSCDpK+SVdKsmRig/cWGBYPMgK5UvAoBtiFv
	 FVi8VYL6JefOsAU+StRvRVhEdGU2hhIM8MWtywHotvtfKQybzZtvSQk8tLY1W7drSB
	 XLE+2yctAnzvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2AA76146A;
	Fri, 29 May 2026 08:47:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED94228E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC97084175
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVrJey4rB7ju for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:47:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E5BC8291C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E5BC8291C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9360E873AC; Fri, 29 May 2026 08:47:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:37:25 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6547d32302c74fdcb587a8b956dfe9b964958d8c
X-Git-Newrev: 85eb42f33df96d44cc1fe40555fa77c88a14ef7b
X-Patchwork-Hint: ignore
Message-Id: <20260529084730.9360E873AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: add static build
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85eb42f33df96d44cc1fe40555fa77c88a14ef7b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Add static build support for device mapper

Lvm2 standard install still requires dynamic library

Signed-off-by: Andreas Mohr <and@gmx.li>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/lvm2/Config.in | 9 ++++++---
 package/lvm2/lvm2.mk   | 9 +++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/lvm2/Config.in b/package/lvm2/Config.in
index ddb398d160..4f15504e37 100644
--- a/package/lvm2/Config.in
+++ b/package/lvm2/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_LVM2
 	bool "lvm2 & device mapper"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # needs fork()
-	depends on !BR2_STATIC_LIBS # It fails to build statically
 	help
 	  This is LVM2, the rewrite of The Linux Logical Volume Manager.
 	  LVM supports enterprise level volume management of disk and
@@ -26,13 +25,17 @@ if BR2_PACKAGE_LVM2
 config BR2_PACKAGE_LVM2_STANDARD_INSTALL
 	bool "standard install instead of only dmsetup"
 	default y
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBAIO
 	help
 	  Install the standard suite of lvm2 programs. When this option
 	  is not set, only dmsetup is installed.
 
+comment "lvm2 standard install needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
+
 endif
 
-comment "lvm2 needs a toolchain w/ threads, dynamic library"
+comment "lvm2 needs a toolchain w/ threads"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 3a1dded55f..8db1899ed4 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -48,6 +48,15 @@ else
 LVM2_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+# configure: error: --enable-cmdlib requires dynamic linking.
+LVM2_CONF_OPTS += --disable-cmdlib
+# configure: error: --enable-dmeventd requires --enable-cmdlib to be used as well
+LVM2_CONF_OPTS += --disable-dmeventd
+# install static version of the devmapper library
+LVM2_CONF_OPTS += --enable-static_link
+endif
+
 ifeq ($(BR2_PACKAGE_LVM2_STANDARD_INSTALL),y)
 LVM2_DEPENDENCIES += libaio
 LVM2_INSTALL_STAGING_OPTS += install
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
