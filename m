Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D253EEB57C
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27B7381098;
	Thu,  1 Jan 2026 17:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JvOPcUglWokx; Thu,  1 Jan 2026 17:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20C148109E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767288799;
	bh=Lkm+shmlSrQHSq/N2p77J/35pC3j9swjgj2/LWMsALU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N2/ST0coEPB8DpPOxr4RmSG6R8/8cYg6P5a7h6hx+f6wxstQuoqlsO3oZyV1Q/cLk
	 v/O0z3HZsr+nLLn/XC0WUUYi8WQuT8yZxiOh0a4Pp2imUzfBiA7DMq2CGQNf8hCnI3
	 hbzIRxH3rvHfquXHDFsPJi8sAPmxNor1zJql5SvvurciTemNHsfScxEyw3puI6mJJ4
	 13GSmPsqOptwOdZMwltIbxazLkQJPV3+hFq2YrJdMwPoyvYZa2oiexpk11B6YUxmFz
	 YTeh2CSI2Aqkd+0Ex5jac6JQDLrbddqdNpILB65BcIOS1D5yd+qVBzC2fzqDXpThkf
	 CQbcQJRRrwh0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C148109E;
	Thu,  1 Jan 2026 17:33:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 587C5206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 494668109E
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XN40FG_r5qwk for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:33:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CE6E81098
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CE6E81098
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:33:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65A5F87E4B; Thu,  1 Jan 2026 17:33:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 18:32:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 04ca5dc2cd3844b24a75d382c9374c27fc136415
X-Git-Newrev: 68cc4d296e9f08275152d128f3de6cd6d45ba922
X-Patchwork-Hint: ignore
Message-Id: <20260101173317.65A5F87E4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zellij: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=68cc4d296e9f08275152d128f3de6cd6d45ba922
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

An advanced terminal multiplexer with batteries included. Supports
layouts, floating and stacked panes, plugins, and customization.
Provides rich functionality out of the box.

Zellij is aimed at developers, operations-oriented users, and anyone who
loves the terminal.

https://github.com/zellij-org/zellij

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zellij/Config.in   | 17 +++++++++++++++++
 package/zellij/zellij.hash |  3 +++
 package/zellij/zellij.mk   | 12 ++++++++++++
 5 files changed, 34 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 75ade2965f..718bb7ecf2 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -89,6 +89,7 @@ F:	package/cpp-httplib/
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
 F:	package/broot/
 F:	package/nnn/
+F:	package/zellij/
 
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
 F:	package/oatpp/
diff --git a/package/Config.in b/package/Config.in
index b88ae859fb..28d8bf2ca0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2792,6 +2792,7 @@ comment "Utilities"
 	source "package/xmlstarlet/Config.in"
 	source "package/xxhash/Config.in"
 	source "package/ytree/Config.in"
+	source "package/zellij/Config.in"
 	source "package/zoxide/Config.in"
 endmenu
 
diff --git a/package/zellij/Config.in b/package/zellij/Config.in
new file mode 100644
index 0000000000..7de6074435
--- /dev/null
+++ b/package/zellij/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_ZELLIJ
+	bool "zellij"
+	# Zellij uses the cranelift crate which has architecure
+	# dependencies. Specify them explicitly. See details here:
+	# https://docs.rs/cranelift-codegen/0.122.0/cranelift_codegen/
+	depends on BR2_x86_64 || BR2_x86_i686 || BR2_aarch64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  An advanced terminal multiplexer with batteries included.
+	  Supports layouts, floating and stacked panes, plugins, and
+	  customization. Provides rich functionality out of the box.
+
+	  Zellij is aimed at developers, operations-oriented users,
+	  and anyone who loves the terminal.
+
+	  https://github.com/zellij-org/zellij
diff --git a/package/zellij/zellij.hash b/package/zellij/zellij.hash
new file mode 100644
index 0000000000..6a8c5a5857
--- /dev/null
+++ b/package/zellij/zellij.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  248cb15f4853079dbc02962f2d41db8e1108c5b7b369bbf6feb484d8b1a5be5d  zellij-0.43.1-cargo4.tar.gz
+sha256  9aa6c363b18a48eeecbffe13ff390c76ede2c90eb37ba17dfbbaffc42892d87d  LICENSE.md
diff --git a/package/zellij/zellij.mk b/package/zellij/zellij.mk
new file mode 100644
index 0000000000..2ddefc6049
--- /dev/null
+++ b/package/zellij/zellij.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# zellij
+#
+################################################################################
+
+ZELLIJ_VERSION = 0.43.1
+ZELLIJ_SITE = $(call github,zellij-org,zellij,v$(ZELLIJ_VERSION))
+ZELLIJ_LICENSE = MIT
+ZELLIJ_LICENSE_FILES = LICENSE.md
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
