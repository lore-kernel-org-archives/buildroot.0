Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED40EEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 22:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D26FC80FA2;
	Thu,  1 Jan 2026 22:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCtF8WUKOkLJ; Thu,  1 Jan 2026 22:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D930180FA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767306558;
	bh=FNCjoGtEK0kxFTGJXpr1/c9Ambs/8/gK/YDF9FTAJgU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mq862b0C/5/AvNjHWmqntSf3U0WaxXttFK098ghT0FJAJGidk4gW1u4CK0CIXLV9j
	 F2OqSKdhUYl3aFrL1siMfZ4Dsyi/xNNpYPeqVUrggF6PWInUW4J8WhE7FWPsL5juwA
	 A0YM5JrO+mwv+h335QSPkeN1K4QoLchY5Sj/VSGQ7219WXa9isLYT9sG9SWbloRe8y
	 QT4tXQk/e/z7drlLM0wHKFqb5cJar0jNiMJ1tbSeMz+OcqpNojewt97kUP2BkwSVe8
	 VPp4+a6r53OxT7mD5QpwopsF3oLD5RvlspENiN6pZ9L9GzuKsfDNjPKvuM4Cf0MGPj
	 S+GMCCFqLFimQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D930180FA7;
	Thu,  1 Jan 2026 22:29:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 29FA019D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C29780FA7
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:29:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kyTmd-d-O2gA for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 22:29:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 526D680FA2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 526D680FA2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 22:29:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4255187E7C; Thu,  1 Jan 2026 22:29:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 23:28:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21a8136fb3e55e38015b3b16fb03b4b15e6cbf9c
X-Git-Newrev: 1f319f8b312a31b998b8d087dbe20fdc476ddff5
X-Patchwork-Hint: ignore
Message-Id: <20260101222916.4255187E7C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kibi: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1f319f8b312a31b998b8d087dbe20fdc476ddff5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds "kibi" a configurable text editor with UTF-8 support,
incremental search, syntax highlighting, line numbers and more, written
in less than 1024 lines of Rust with minimal dependencies.

https://github.com/ilai-deutel/kibi

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/kibi/Config.in | 21 +++++++++++++++++++++
 package/kibi/kibi.hash |  4 ++++
 package/kibi/kibi.mk   | 21 +++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 14ebccc611..a21d443482 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -88,6 +88,7 @@ F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
 F:	package/broot/
+F:	package/kibi/
 F:	package/nnn/
 F:	package/zellij/
 
diff --git a/package/Config.in b/package/Config.in
index 5a19ef6016..af0760536b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2894,6 +2894,7 @@ menu "Text editors and viewers"
 	source "package/bvi/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
+	source "package/kibi/Config.in"
 	source "package/less/Config.in"
 	source "package/mc/Config.in"
 	source "package/mg/Config.in"
diff --git a/package/kibi/Config.in b/package/kibi/Config.in
new file mode 100644
index 0000000000..6ebb48dda4
--- /dev/null
+++ b/package/kibi/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_KIBI
+	bool "kibi"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  A configurable text editor with UTF-8 support, incremental
+	  search, syntax highlighting, line numbers and more, written
+	  in less than 1024 lines of Rust with minimal dependencies.
+
+	  https://github.com/ilai-deutel/kibi
+
+if BR2_PACKAGE_KIBI
+
+config BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING
+	bool "syntax highlighting"
+	default y
+	help
+	  Install files to enable syntax highlighting. This option adds
+	  200 KB of data to /usr/share/
+
+endif
diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
new file mode 100644
index 0000000000..a805f75f91
--- /dev/null
+++ b/package/kibi/kibi.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  0a2cdd264fadf455ed919e5d4c12ab25614735dfe0b30895004ce4f3919d7eff  kibi-0.3.1-cargo4.tar.gz
+sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
+sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE-APACHE
diff --git a/package/kibi/kibi.mk b/package/kibi/kibi.mk
new file mode 100644
index 0000000000..24f466ec30
--- /dev/null
+++ b/package/kibi/kibi.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# kibi
+#
+################################################################################
+
+KIBI_VERSION = 0.3.1
+KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
+KIBI_LICENSE = MIT or Apache-2.0
+KIBI_LICENSE_FILES = LICENSE-MIT LICENSE-APACHE
+
+ifeq ($(BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING),y)
+define KIBI_INSTALL_SYNTAX_HIGHLIGHTING
+	mkdir -p $(TARGET_DIR)/usr/share/kibi/syntax.d
+	cp -dpfr $(@D)/syntax.d/*.ini $(TARGET_DIR)/usr/share/kibi/syntax.d/
+endef
+
+KIBI_POST_INSTALL_TARGET_HOOKS += KIBI_INSTALL_SYNTAX_HIGHLIGHTING
+endif
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
