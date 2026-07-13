Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C507EC43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 10:33:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70211408C1;
	Mon, 13 Jul 2026 10:33:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PwiU0ZUChPLF; Mon, 13 Jul 2026 10:33:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87C75408C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783938794;
	bh=ezniuqmAtZHt3zxX2M175PYcrL3nKxD0EpYmlaXiySw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jSsV+g559rMTwzTe+qa7QUGUgvsohRgyPra375oQwtW2hz6bC2yjwdxdfvhAyV9vC
	 sVBzP44D9oG6zVr8FxK10cD/DIIxt9W7fVuOQLMUg2S95wG+TXk3cBzuohXqFTeYow
	 2uxeeRirRNA/I5UioDmHpelkFAkCY1rtE1df5yNmYYjko4jX+x70h6YkNG0oBKfhuw
	 lJKrZNnfht9ZlV93EIqWb93bLFtXi0dthGv7dy4NQLQuAxXHjxGanWdonH/IzUE2qV
	 0aoDR4nBg/i1WG0il3ZMDa9VucZq4HWOxLOhYpBSouPUxUGgHzmC54W/fpJPcBrcy3
	 wnqISIUe0TOYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C75408C3;
	Mon, 13 Jul 2026 10:33:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B5DCC28D
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B37A760744
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hl2lAw9n-oFx for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 10:33:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E19F260749
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E19F260749
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 10:33:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8F4F887B7; Mon, 13 Jul 2026 10:32:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 12:26:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14dd079336703b28364568c817a8e7486958fc53
X-Git-Newrev: 4325c62d419f4223cfabed43a6d77c25f240e340
X-Patchwork-Hint: ignore
Message-Id: <20260713103238.A8F4F887B7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xwayland: fix uClibc build
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4325c62d419f4223cfabed43a6d77c25f240e340
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Copy patch from xserver_xorg-server to fix build errors with uClibc.

Fixes:
https://autobuild.buildroot.net/results/c03/c03d57ad7ed3feac008091a38ea50bfccfa62b08/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 +
 .../0001-include-misc.h-fix-uClibc-build.patch     | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/.checkpackageignore b/.checkpackageignore
index 6147f35b03..4ec39f9f36 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -971,6 +971,7 @@ package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch lib_patch.Upstr
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck lib_sysv.Variables
+package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch lib_patch.Upstream
 package/xl2tp/xl2tpd lib_shellscript.TrailingSpace
 package/yajl/0001-Let-the-shared-and-the-static-library-have-the-same-.patch lib_patch.Upstream
 package/yajl/0002-cmake-disable-shared-library-build-when-BUILD_SHARED.patch lib_patch.Upstream
diff --git a/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
new file mode 100644
index 0000000000..562aa79fbb
--- /dev/null
+++ b/package/x11r7/xwayland/0001-include-misc.h-fix-uClibc-build.patch
@@ -0,0 +1,31 @@
+From 2e8fca00f5bdb02f2f59aaa428d1e9d808ab0e86 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 16 Jun 2018 19:20:16 +0200
+Subject: [PATCH] include/misc.h: fix uClibc build
+
+A similar fix was used for Dovecot:
+https://www.dovecot.org/list/dovecot/2017-November/110019.html
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ include/misc.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/misc.h b/include/misc.h
+index 14920c3c3..390e52b60 100644
+--- a/include/misc.h
++++ b/include/misc.h
+@@ -185,6 +185,10 @@ typedef struct _xReq *xReqPtr;
+ #endif
+ #endif
+ 
++#undef bswap_16
++#undef bswap_32
++#undef bswap_64
++
+ /**
+  * Calculate the number of bytes needed to hold bits.
+  * @param bits The minimum number of bits needed.
+-- 
+2.17.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
