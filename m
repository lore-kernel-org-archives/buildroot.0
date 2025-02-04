Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B1CC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59D81810CE;
	Tue,  4 Feb 2025 15:16:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gr2CVzEUJc7R; Tue,  4 Feb 2025 15:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73DE281EB9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73DE281EB9;
	Tue,  4 Feb 2025 15:16:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23C1E185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 112626089A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:16:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FiU4Ox-GzTrq for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:16:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2911560BCC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2911560BCC
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:16:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 266BA86E0F; Tue,  4 Feb 2025 15:16:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:16:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 39949b201954a37efc345acebf49187ad89c982b
X-Git-Newrev: 32be09b48e6e355c054d7e308aa5d3e2b58f8c40
X-Patchwork-Hint: ignore
Message-Id: <20250204151631.266BA86E0F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gobject: allow build with
 musl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=32be09b48e6e355c054d7e308aa5d3e2b58f8c40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current gobject-introspection releases (>= 1.80.1) work with musl, so
relax the C library requirement for python-gobject to match.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-gobject/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
index 3354535637..f5d4cebe31 100644
--- a/package/python-gobject/Config.in
+++ b/package/python-gobject/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS # gobject-introspection
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # gobject-introspection
 	depends on BR2_HOST_GCC_AT_LEAST_8 # gobject-introspection -> host-qemu
-	depends on BR2_TOOLCHAIN_USES_GLIBC # gobject-introspection
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # gobject-introspection
 	select BR2_PACKAGE_GOBJECT_INTROSPECTION
 	select BR2_PACKAGE_LIBGLIB2
 	help
@@ -12,9 +12,9 @@ config BR2_PACKAGE_PYTHON_GOBJECT
 
 	  https://wiki.gnome.org/action/show/Projects/PyGObject
 
-comment "python-gobject needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
+comment "python-gobject needs a glibc or musl toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_HOST_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
