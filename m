Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE843C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 11:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 816EC80BCF;
	Tue, 25 Aug 2026 11:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQobiPe1dE_3; Tue, 25 Aug 2026 11:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787658923;
	bh=kaJDaY/UPzCIJpbOVx44Swt2C1BAKVgFIwue6chBGGA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eUA7TWYA7UKNr8O8OMMwvhAbZiFtxu/gP8+fOxpd1G4eDNO/+xvQnkMrNMXmGNGzN
	 mVdcgbjkvgwCPd5o5CN2zZliUN2fWfobNnMrDby9YUVBPnXGyUv7aUtEnx7QQUUTZA
	 dawhrEvbGAfkghBHgWt2DWmL27GEpk9l+NSTBhoVu++4mw0peERT7hGpfBD8Mb649t
	 /VaMtnCHraUDsfRz6SDocaqNg8JtXk1qyt0SJT92QDbppsHM0PJKuWoF7XIxY4UAh/
	 N8G1sxihOdPMguItNNOP16gamWEzcWkKTUpXNQRZclTu1pnbXgrQm4jdxGRJoxVzMr
	 daGO0sB2JGEfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5CC480BE0;
	Tue, 25 Aug 2026 11:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6F5D35E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8FF2400D1
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kSujKVcHh2zI for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23FA34005B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 11:55:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4206918AB; Tue, 25 Aug 2026 11:54:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 13:48:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7072372c62c81be39136cc10e600b73021d8a0f
X-Git-Newrev: c3adba81d1dc20b2d030bfad45ae6e440947e117
X-Patchwork-Hint: ignore
Message-Id: <20260825115426.A4206918AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdb: handle lzma option for
 host-gdb
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3adba81d1dc20b2d030bfad45ae6e440947e117
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For target gdb, we properly enable/disable lzma support depending on
BR2_PACKAGE_XZ.

However, for host-gdb we don't do anything, which can lead the gdb
configure script to detect and use a system-provided xz library, which
is not desired.

Instead, add an explicit option BR2_PACKAGE_HOST_GDB_LZMA, which when
enabled pulls in host-xz, but also when disabled ensures gdb doesn't
try to use a system-provided xz library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gdb/Config.in.host | 5 +++++
 package/gdb/gdb.mk         | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
index 2e1eed6f50..823c2e9966 100644
--- a/package/gdb/Config.in.host
+++ b/package/gdb/Config.in.host
@@ -44,6 +44,11 @@ config BR2_PACKAGE_HOST_GDB_SIM
 	help
 	  This option enables the simulator support in the cross gdb.
 
+config BR2_PACKAGE_HOST_GDB_LZMA
+	bool "lzma support"
+	help
+	  This option enables lzma support in the cross gdb.
+
 choice
 	prompt "GDB debugger Version"
 	default BR2_GDB_VERSION_16
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 685d1fe992..ebb80072cf 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -293,6 +293,14 @@ else
 HOST_GDB_CONF_OPTS += --disable-sim
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_GDB_LZMA),y)
+HOST_GDB_CONF_OPTS += --with-lzma
+HOST_GDB_CONF_OPTS += --with-liblzma-prefix=$(HOST_DIR)
+HOST_GDB_DEPENDENCIES += host-xz
+else
+HOST_GDB_CONF_OPTS += --without-lzma
+endif
+
 # Since gdb 9, in-tree builds for GDB are not allowed anymore,
 # so we create a 'build' subdirectory in the gdb sources, and
 # build from there.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
