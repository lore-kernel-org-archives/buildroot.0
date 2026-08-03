Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0840C55196
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3C7E606FA;
	Mon,  3 Aug 2026 19:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-Yd8PEzvmYx; Mon,  3 Aug 2026 19:35:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BC860736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785785735;
	bh=90RTjxxs+zix1LAsJ7r+DdG1x7XoCpyQvNqv5rZDwv0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vjykrl221BEvTwR7C3hv7G/spdPxzZZ7X7hTJ+wIYGCqN6iGdjx/q6lbhbvkNAybL
	 Z1GLNPfDeWO/yGRoXNRLnNzWJTjzXKR1BN6BUPYHHlAKPgxFPlmnhgklsWQRKK1smM
	 aRVBwIH5SNnyslJKbTKrq0rSau0H/uQFD7rH9tGayW6yDzG16kO2bIeuDXnfLec0Q5
	 db7sqoz2voEHumZ0RYuJUjpTPzZcNSqvpdaphixk4zeKX8UwowGAlu9+IWK1Le7zl1
	 tZDES2P1gDHNzr/0KUqEXWQEGOY0bHUj7ceDWXgdlCai8FDyD9bMc+bAykdc5kRUec
	 Jx2vQzPitweWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BC860736;
	Mon,  3 Aug 2026 19:35:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 020C2296
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3B576069D
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qu239NZS-4jn for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71736606AE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71736606AE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 19:35:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB5178B856; Mon,  3 Aug 2026 19:34:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Aug 2026 21:15:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d5b1b7b1b63dcaf8c8b4fea164255567d821d19c
X-Git-Newrev: 95cdea9bddf322b94970a61f129c4b75fed94c27
X-Patchwork-Hint: ignore
Message-Id: <20260803193439.BB5178B856@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hare-dbus: new package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/95cdea9bddf322b94970a61f129c4b75fed94c27
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                         |  1 +
 package/hare-dbus/0001-fix-Makefile.patch | 27 +++++++++++++++++++++++++++
 package/hare-dbus/Config.in               | 10 ++++++++++
 package/hare-dbus/hare-dbus.hash          |  3 +++
 package/hare-dbus/hare-dbus.mk            | 15 +++++++++++++++
 5 files changed, 56 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 2a749f9415..67e88d3721 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -513,6 +513,7 @@ endmenu
 	source "package/gpsd/Config.in"
 	source "package/gptfdisk/Config.in"
 	source "package/gvfs/Config.in"
+	source "package/hare-dbus/Config.in"
 	source "package/hddtemp/Config.in"
 	source "package/hdparm/Config.in"
 	source "package/hwdata/Config.in"
diff --git a/package/hare-dbus/0001-fix-Makefile.patch b/package/hare-dbus/0001-fix-Makefile.patch
new file mode 100644
index 0000000000..0f106e27fd
--- /dev/null
+++ b/package/hare-dbus/0001-fix-Makefile.patch
@@ -0,0 +1,27 @@
+From 93abfa5970937253ae73bc8bcd9e243d890484a9 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Fri, 15 May 2026 11:56:39 +0200
+Subject: [PATCH] fix Makefile
+
+Upstream: N/A specific for Buildroot build
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index a738e6a..8c4fe78 100644
+--- a/Makefile
++++ b/Makefile
+@@ -18,7 +18,7 @@ dbus-introspector:
+ dbus-scanner:
+ 	$(HARE) build $(HAREFLAGS) cmd/dbus-scanner/
+ 
+-install: build
++install:
+ 	install -Dm755 dbus-introspector	${DESTDIR}${BINDIR}/dbus-introspector
+ 	install -Dm755 dbus-scanner		${DESTDIR}${BINDIR}/dbus-scanner
+ 	install -Dm644 dbus/protocol/*.ha -t	$(DESTDIR)$(THIRDPARTYDIR)/dbus/protocol
+-- 
+2.43.0
+
diff --git a/package/hare-dbus/Config.in b/package/hare-dbus/Config.in
new file mode 100644
index 0000000000..63f332cbf8
--- /dev/null
+++ b/package/hare-dbus/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HARE_DBUS
+	bool "hare-dbus"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	select BR2_PACKAGE_HARE_EV
+	select BR2_PACKAGE_HARE_XML
+	help
+	  D-Bus client implementation for Hare.
+
+	  https://git.sr.ht/~whynothugo/hare-dbus
diff --git a/package/hare-dbus/hare-dbus.hash b/package/hare-dbus/hare-dbus.hash
new file mode 100644
index 0000000000..e8abc40e43
--- /dev/null
+++ b/package/hare-dbus/hare-dbus.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  67a3041126f7745e667d570904504a58475ca398acdd679b548d9e0e513092f8  hare-dbus-e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2-git4.tar.gz
+sha256  7c77ea8fa77851b9ee52d715ec6a3c5f15604bdab5148dd13dbd1dd345752017  LICENCE
diff --git a/package/hare-dbus/hare-dbus.mk b/package/hare-dbus/hare-dbus.mk
new file mode 100644
index 0000000000..93d2a688f4
--- /dev/null
+++ b/package/hare-dbus/hare-dbus.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# hare-dbus
+#
+################################################################################
+
+HARE_DBUS_VERSION = e9a89f8bc5ce783fa25f0eb67d7d8932db90bcc2
+HARE_DBUS_SITE_METHOD = git
+HARE_DBUS_SITE = https://git.sr.ht/~whynothugo/hare-dbus
+HARE_DBUS_LICENSE = MIT
+HARE_DBUS_LICENSE_FILES = LICENCE
+HARE_DBUS_INSTALL_STAGING = YES
+HARE_DBUS_DEPENDENCIES = hare-ev hare-xml
+
+$(eval $(hare-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
