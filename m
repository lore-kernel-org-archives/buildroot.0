Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1D1CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C47026140E;
	Fri, 29 May 2026 13:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aa_w48Lo0yss; Fri, 29 May 2026 13:44:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2EB661456
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780062248;
	bh=fnZXEX03+V6L+Jrl5U0zqPe56xq4TOYmSbktP5PDfIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hR7p1ZBv45lv596SlnYw8Z7Jjbyf6lJrDbL8sRpSokHYnx3jPdfnfPctutDnp83ij
	 O47l/gKA8fXfceGztEIkGn4O8aO6gk3P/AOsARIgK2ensJStNyfYqbt69PzxHm8/u9
	 XTq2smYMDgarWIo0lRPu6vHghkA8H7WxTmeh13LSG8PKPUGb5kEFBjwOm7cfdrxl+i
	 wJxO0F0f1VV1EN5hx3LoHQFOVFODSsumx6kNfCFaTbRRU5r0MoBS765f1sfnzLf7nW
	 sQHEIXaauGW5czA8YdLMgT2fQSqUqj2e2RjZAWarpncNn9yLJIzDRPSMK3rxxl/Uxo
	 0jxtZv53DsYFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2EB661456;
	Fri, 29 May 2026 13:44:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A9C3288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A6F642121
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lNxoFi9oaww2 for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0921942122
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0921942122
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:43:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 71F16873DE; Fri, 29 May 2026 13:43:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 15:36:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a397689ee1256d1dcf8451f0ddf467f93dd2c0f8
X-Git-Newrev: 03108175ce3b1067709b1235a9703f7abedf50d2
X-Patchwork-Hint: ignore
Message-Id: <20260529134346.71F16873DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/eudev: provides libudev
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03108175ce3b1067709b1235a9703f7abedf50d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/eudev/Config.in | 4 ++++
 package/eudev/eudev.mk  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/eudev/Config.in b/package/eudev/Config.in
index 65cfc1d2de..5eefed71dc 100644
--- a/package/eudev/Config.in
+++ b/package/eudev/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_EUDEV
 	depends on BR2_USE_MMU # uses fork()
 	depends on BR2_USE_WCHAR # needs C99 compiler
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_UDEV_GENTOO_SCRIPTS if BR2_INIT_OPENRC
 	select BR2_PACKAGE_UTIL_LINUX
@@ -19,6 +20,9 @@ config BR2_PACKAGE_EUDEV
 
 if BR2_PACKAGE_EUDEV
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "eudev"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "eudev"
 
diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
index 3c22b13d86..a060e8f0d8 100644
--- a/package/eudev/eudev.mk
+++ b/package/eudev/eudev.mk
@@ -18,7 +18,7 @@ EUDEV_CONF_OPTS = \
 
 # eudev requires only the util-linux libraries at build time
 EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux-libs
-EUDEV_PROVIDES = udev
+EUDEV_PROVIDES = libudev udev
 
 ifeq ($(BR2_ROOTFS_MERGED_USR),y)
 ifeq ($(BR2_ROOTFS_MERGED_BIN),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
