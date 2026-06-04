Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EC0CD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E83E419A5;
	Fri,  5 Jun 2026 12:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bv-ohwwlVPTT; Fri,  5 Jun 2026 12:40:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02EDC419B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663233;
	bh=twmEyh1/qonYUcPCZyX7+/+kkWRGG5bfJjqPOGerGaM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=idlii+ImoYJBdBf1gdRiP/6HIYr4OlpGygRX1Es/FxVJ+2mAdCc9IqrFV4ElyaXs5
	 7+WpaxXe16oaxhdHzJHXMLjXqHwFZnYxgxoP/viUALiqn8hzC06bgnL4PuK/UuUJd6
	 470yANpOQOiVYYH26RhcqMTcIOcU/2EDg4n71hIxPl0e1QSjFD8ltLDkrl5lJ3EXsM
	 8tSJBhJsJ15uRzTuouEsL5LZsxyRjM22pB6edqUxqu9E4N7zqeFpxcuSIh2EW813OL
	 6H3fTGRHSQ+AsGfb3/wFuuXV0kgO7ItPThmNsURZRzY7GnHChuUt8h8Vu+jVYFsWdK
	 RFj6zDZn2WNmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02EDC419B7;
	Fri,  5 Jun 2026 12:40:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 122103B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DDAC82044
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OQa2woR3ID2r for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E119814DE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E119814DE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8870487B2F; Fri,  5 Jun 2026 12:38:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:03:03 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 8dcd9797d2c99c9b39809f7df474cb880a2ed321
X-Git-Newrev: d874ecf8d0c88aad740f17541cf7862360a841d1
X-Patchwork-Hint: ignore
Message-Id: <20260605123837.8870487B2F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/util-linux:
 optionally add libpthread to uuid.pc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d874ecf8d0c88aad740f17541cf7862360a841d1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Buildroot commit 31af509b4f4fe52f67bd9109b8732a55b8f9cd2d bumped
util-linux from version 2.40.2 to 2.41.1.

Upstream release 2.40.3 contains
https://github.com/util-linux/util-linux/commit/e143539d30fd18afb3ba6d3c6e50a260d4219895
which unconditionally adds -lpthread to uuid.pc causing build errors for
other packages using non-threaded toolchains like erofs-utils.

Fixes:
https://autobuild.buildroot.net/results/582/5827995db2a805e0c8a04fde8498eff6f28aa6d8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dd4161c39d97c7a651625dca18fa2aaab9298fa6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ools-optionally-add-libpthread-to-uuid.pc.patch | 42 ++++++++++++++++++++++
 ...ools-optionally-add-libpthread-to-uuid.pc.patch | 42 ++++++++++++++++++++++
 package/util-linux/util-linux.mk                   |  3 ++
 3 files changed, 87 insertions(+)

diff --git a/package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch b/package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
new file mode 100644
index 0000000000..ef59e458e1
--- /dev/null
+++ b/package/util-linux/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
@@ -0,0 +1,42 @@
+From a06adacd1009174b7ca35f529a2db165f6c1f3aa Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 16 Jan 2026 23:33:34 +0100
+Subject: [PATCH] autotools: optionally add libpthread to uuid.pc
+
+Fixes https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
+
+Upstream: https://github.com/util-linux/util-linux/commit/d88a62e4cd385e07b3cb8fb309bbb03981ea2970
+
+[Bernd: backported to 2.41.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.am        | 1 +
+ libuuid/uuid.pc.in | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 01e99701d..cd1d157ce 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -189,6 +189,7 @@ edit_cmd = sed \
+ 	 -e 's|@usrbin_execdir[@]|$(usrbin_execdir)|g' \
+ 	 -e 's|@usrsbin_execdir[@]|$(usrsbin_execdir)|g' \
+ 	 -e 's|@SOCKET_LIBS[@]|$(SOCKET_LIBS)|g' \
++	 -e 's|@PTHREAD_LIBS[@]|$(PTHREAD_LIBS)|g' \
+ 	 -e 's|@VERSION[@]|$(VERSION)|g' \
+ 	 -e 's|@ADJTIME_PATH[@]|$(ADJTIME_PATH)|g' \
+ 	 -e 's|@LIBUUID_VERSION[@]|$(LIBUUID_VERSION)|g' \
+diff --git a/libuuid/uuid.pc.in b/libuuid/uuid.pc.in
+index 51929fe80..a40dc6644 100644
+--- a/libuuid/uuid.pc.in
++++ b/libuuid/uuid.pc.in
+@@ -7,5 +7,5 @@ Name: uuid
+ Description: Universally unique id library
+ Version: @LIBUUID_VERSION@
+ Cflags: -I${includedir}/uuid
+-Libs.private: @SOCKET_LIBS@ -lpthread
++Libs.private: @SOCKET_LIBS@ @PTHREAD_LIBS@
+ Libs: -L${libdir} -luuid
+-- 
+2.47.3
+
diff --git a/package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch b/package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
new file mode 100644
index 0000000000..ef59e458e1
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
@@ -0,0 +1,42 @@
+From a06adacd1009174b7ca35f529a2db165f6c1f3aa Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Fri, 16 Jan 2026 23:33:34 +0100
+Subject: [PATCH] autotools: optionally add libpthread to uuid.pc
+
+Fixes https://github.com/util-linux/util-linux/issues/3210#issuecomment-3477915953
+
+Upstream: https://github.com/util-linux/util-linux/commit/d88a62e4cd385e07b3cb8fb309bbb03981ea2970
+
+[Bernd: backported to 2.41.3]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Makefile.am        | 1 +
+ libuuid/uuid.pc.in | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 01e99701d..cd1d157ce 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -189,6 +189,7 @@ edit_cmd = sed \
+ 	 -e 's|@usrbin_execdir[@]|$(usrbin_execdir)|g' \
+ 	 -e 's|@usrsbin_execdir[@]|$(usrsbin_execdir)|g' \
+ 	 -e 's|@SOCKET_LIBS[@]|$(SOCKET_LIBS)|g' \
++	 -e 's|@PTHREAD_LIBS[@]|$(PTHREAD_LIBS)|g' \
+ 	 -e 's|@VERSION[@]|$(VERSION)|g' \
+ 	 -e 's|@ADJTIME_PATH[@]|$(ADJTIME_PATH)|g' \
+ 	 -e 's|@LIBUUID_VERSION[@]|$(LIBUUID_VERSION)|g' \
+diff --git a/libuuid/uuid.pc.in b/libuuid/uuid.pc.in
+index 51929fe80..a40dc6644 100644
+--- a/libuuid/uuid.pc.in
++++ b/libuuid/uuid.pc.in
+@@ -7,5 +7,5 @@ Name: uuid
+ Description: Universally unique id library
+ Version: @LIBUUID_VERSION@
+ Cflags: -I${includedir}/uuid
+-Libs.private: @SOCKET_LIBS@ -lpthread
++Libs.private: @SOCKET_LIBS@ @PTHREAD_LIBS@
+ Libs: -L${libdir} -luuid
+-- 
+2.47.3
+
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 1271bc7dc0..fcce9a7dc8 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,6 +37,9 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
+# 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
+UTIL_LINUX_AUTORECONF = YES
+
 UTIL_LINUX_INSTALL_STAGING = YES
 UTIL_LINUX_DEPENDENCIES = \
 	host-pkgconf \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
