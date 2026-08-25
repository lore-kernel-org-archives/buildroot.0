Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E763FC61DBE
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 11:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 905D4605FF;
	Tue, 25 Aug 2026 11:55:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPDO8hz3d3l1; Tue, 25 Aug 2026 11:55:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787658924;
	bh=BzhQ8gBSI2usC12biY0tCABmuTIizB6/d4vXwiR4Ouc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=faclHqHfh3fOC1CEDcTV2YsiD8AxSdnbH+hjAZjhA+F22zCsYMysEBtqyxtyJZggZ
	 2jwlPl+yvFWKIlPLU9szv2ORtigxF8ZU3wLcWeORA5V+73eY0C5hEHQlN64rOQPDxr
	 OUX6ZZfr98xCgeLrnni5G84GK8DLO/jz/cEBcVrND1Bqx3kd5oq8ZIZ9h0X50BuNv/
	 y2MKATf4GOsennNbkZtIxJdumAFKX5ofOBeJhuQlNvHnQEXkcD+B5mypUw0xq2vWMr
	 5l+PFxABqdQ1Sn+l6mWhpE2U3MX98Swpax22SJ2n3IpaLXyB/r3RypgaC+G2Ge1fn0
	 PZAqFNn9RUNsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A658060606;
	Tue, 25 Aug 2026 11:55:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0394930E0
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D94CE60606
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9jLwO0f--Va for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 332A7605FF
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9E12918AE; Tue, 25 Aug 2026 11:54:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 13:52:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3adba81d1dc20b2d030bfad45ae6e440947e117
X-Git-Newrev: 9dc567aa78e6381ff7100b696535f1ffdd8447f7
X-Patchwork-Hint: ignore
Message-Id: <20260825115426.A9E12918AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: handle xxhash optional
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9dc567aa78e6381ff7100b696535f1ffdd8447f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since gdb 9.x, gdb can optionally use the xxhash library. Since we
currently don't do anything about it, it's a potential "silent"
dependency.

In particular, for host-gdb, this means host-gdb might end up being
linked with the system-provided xxhash library if available.

This patch handles this dependency:

- For the target package, by looking at the value of
  BR2_PACKAGE_XXHASH

- For the host package, by looking at the value of a newly introduced
  BR2_PACKAGE_HOST_GDB_XXHASH

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host |  5 +++++
 package/gdb/gdb.mk         | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 823c2e9966..61fe32d8ff 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -49,6 +49,11 @@ config BR2_PACKAGE_HOST_GDB_LZMA
 	help
 	  This option enables lzma support in the cross gdb.
 
+config BR2_PACKAGE_HOST_GDB_XXHASH
+	bool "xxhash support"
+	help
+	  This option enables xxhash support in the cross gdb.
+
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index ebb80072cf..cfec0585da 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -217,6 +217,14 @@ else
 GDB_CONF_OPTS += --without-expat
 endif
 
+ifeq ($(BR2_PACKAGE_XXHASH),y)
+GDB_CONF_OPTS += --with-xxhash
+GDB_CONF_OPTS += --with-xxhash-prefix=$(STAGING_DIR)/usr
+GDB_DEPENDENCIES += xxhash
+else
+GDB_CONF_OPTS += --without-xxhash
+endif
+
 ifeq ($(BR2_PACKAGE_XZ),y)
 GDB_CONF_OPTS += --with-lzma
 GDB_CONF_OPTS += --with-liblzma-prefix=$(STAGING_DIR)/usr
@@ -301,6 +309,14 @@ else
 HOST_GDB_CONF_OPTS += --without-lzma
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_XXHASH),y)
+HOST_GDB_CONF_OPTS += --with-xxhash
+HOST_GDB_CONF_OPTS += --with-xxhash-prefix=$(HOST_DIR)
+HOST_GDB_DEPENDENCIES += host-xxhash
+else
+HOST_GDB_CONF_OPTS += --without-xxhash
+endif
+
 # Since gdb 9, in-tree builds for GDB are not allowed anymore,
 # so we create a 'build' subdirectory in the gdb sources, and
 # build from there.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
