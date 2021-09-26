Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A78C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 578C66103B
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 578C66103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27CDC82423;
	Sun, 26 Sep 2021 21:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XH0SHLm3LYn8; Sun, 26 Sep 2021 21:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 797B98102D;
	Sun, 26 Sep 2021 21:45:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 031F31BF95D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3B5440246
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMVzAVMs12mM for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 36251402E0
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 82D628D309; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:37:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60add404db424e2652673a7b6a3ba2bc80380b42
X-Git-Newrev: c7feecad61771bda1497a56a613ae03f2b51b682
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.82D628D309@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mstpd: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c7feecad61771bda1497a56a613ae03f2b51b682
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Arnout: add RSA license for hmac_md5.c]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/mstpd/Config.in  |  9 +++++++++
 package/mstpd/mstpd.hash |  4 ++++
 package/mstpd/mstpd.mk   | 13 +++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 56e129d4f2..1f977190ab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -969,6 +969,7 @@ F:	package/lsqlite3/
 F:	package/lua*
 F:	package/lzlib/
 F:	package/moarvm/
+F:	package/mstpd/
 F:	package/netsurf/
 F:	package/perl*
 F:	package/pkg-perl.mk
diff --git a/package/Config.in b/package/Config.in
index 3136fcc65f..2f83c87582 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2218,6 +2218,7 @@ menu "Networking applications"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
 	source "package/mrp/Config.in"
+	source "package/mstpd/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
 	source "package/ncftp/Config.in"
diff --git a/package/mstpd/Config.in b/package/mstpd/Config.in
new file mode 100644
index 0000000000..5fe5859779
--- /dev/null
+++ b/package/mstpd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_MSTPD
+	bool "mstpd"
+	help
+	  Multiple Spanning Tree Protocol Daemon.
+	  This package provides a user-space daemon which replaces
+	  the STP handling that is built into the Linux kernel Ethernet
+	  bridge and adds support for RSTP and PVST+.
+
+	  https://github.com/mstpd/mstpd
diff --git a/package/mstpd/mstpd.hash b/package/mstpd/mstpd.hash
new file mode 100644
index 0000000000..fd76b959db
--- /dev/null
+++ b/package/mstpd/mstpd.hash
@@ -0,0 +1,4 @@
+# locally computed
+sha256  91a1862548b5b509caa2e96e5fb9912bc98d4d58cc98e99a577824735756c14d  mstpd-0.0.9.tar.gz
+sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  LICENSE
+sha256  c5cfd44652276184374adf454150d436ce958ce50acc4ef9ccb3605a5ca7a9d3  hmac_md5.c
diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
new file mode 100644
index 0000000000..a870352869
--- /dev/null
+++ b/package/mstpd/mstpd.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# mstpd
+#
+################################################################################
+
+MSTPD_VERSION = 0.0.9
+MSTPD_SITE = $(call github,mstpd,mstpd,$(MSTPD_VERSION))
+MSTPD_AUTORECONF = YES
+MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
+MSTPD_LICENSE_FILES = LICENSE hmac_md5.c
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
