Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08827C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F2860FA0
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3F2860FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E72560AEE;
	Wed,  4 Aug 2021 00:12:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGYvymW_T2_G; Wed,  4 Aug 2021 00:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD86360ADE;
	Wed,  4 Aug 2021 00:12:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1C4991BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A417140EEF
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3PZxijf41fB for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 169B740E45
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6D477868A0; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Jul 2021 10:03:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d2ef0058c94f8eab59ed799aaea8e9ce83e91069
X-Git-Newrev: 7bd57831e991ea1239687b83cc94b306f21b9031
X-Patchwork-Hint: ignore
Message-Id: <20210803211005.6D477868A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/qt5/qt5base: fix build
 with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=7bd57831e991ea1239687b83cc94b306f21b9031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

text/qbytearraymatcher.h:103:38: error: 'numeric_limits' is not a member of 'std'
  103 |         const auto uchar_max = (std::numeric_limits<uchar>::max)();
      |                                      ^~~~~~~~~~~~~~

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Tested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../qt5/qt5base/0007-Build-fixes-for-GCC-11.patch  | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
new file mode 100644
index 0000000000..d20600c6ce
--- /dev/null
+++ b/package/qt5/qt5base/0007-Build-fixes-for-GCC-11.patch
@@ -0,0 +1,61 @@
+From 86494659b2ab14edc653cd2d9260561ad4c4e4e8 Mon Sep 17 00:00:00 2001
+From: Ville Voutilainen <ville.voutilainen@qt.io>
+Date: Mon, 18 Jan 2021 09:58:17 +0200
+Subject: [PATCH] Build fixes for GCC 11
+
+Task-number: QTBUG-89977
+Change-Id: Ic1b7ddbffb8a0a00f8c621d09a868f1d94a52c21
+Reviewed-by: Lars Knoll <lars.knoll@qt.io>
+Reviewed-by: Thiago Macieira <thiago.macieira@intel.com>
+[Retrieved (and backported) from:
+https://github.com/qt/qtbase/commit/813a928c7c3cf98670b6043149880ed5c955efb9]
+Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
+---
+ src/corelib/text/qbytearraymatcher.h     | 2 ++
+ src/corelib/tools/qsharedpointer_impl.h  | 3 ---
+ src/plugins/platforms/xcb/qxcbwindow.cpp | 2 +-
+ 3 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/corelib/text/qbytearraymatcher.h b/src/corelib/text/qbytearraymatcher.h
+index 0eedfc1d20..f5f9bef7b8 100644
+--- a/src/corelib/text/qbytearraymatcher.h
++++ b/src/corelib/text/qbytearraymatcher.h
+@@ -42,6 +42,8 @@
+ 
+ #include <QtCore/qbytearray.h>
+ 
++#include <limits>
++
+ QT_BEGIN_NAMESPACE
+ 
+ 
+diff --git a/src/corelib/tools/qsharedpointer_impl.h b/src/corelib/tools/qsharedpointer_impl.h
+index 790c187cb9..4aee98af53 100644
+--- a/src/corelib/tools/qsharedpointer_impl.h
++++ b/src/corelib/tools/qsharedpointer_impl.h
+@@ -155,9 +155,6 @@ namespace QtSharedPointer {
+ #endif
+         inline void checkQObjectShared(...) { }
+         inline void setQObjectShared(...) { }
+-
+-        inline void operator delete(void *ptr) { ::operator delete(ptr); }
+-        inline void operator delete(void *, void *) { }
+     };
+     // sizeof(ExternalRefCountData) = 12 (32-bit) / 16 (64-bit)
+ 
+diff --git a/src/plugins/platforms/xcb/qxcbwindow.cpp b/src/plugins/platforms/xcb/qxcbwindow.cpp
+index 9e7e1a5572..f0866a90ac 100644
+--- a/src/plugins/platforms/xcb/qxcbwindow.cpp
++++ b/src/plugins/platforms/xcb/qxcbwindow.cpp
+@@ -698,7 +698,7 @@ void QXcbWindow::show()
+         if (isTransient(window())) {
+             const QWindow *tp = window()->transientParent();
+             if (tp && tp->handle())
+-                transientXcbParent = static_cast<const QXcbWindow *>(tp->handle())->winId();
++                transientXcbParent = tp->handle()->winId();
+             // Default to client leader if there is no transient parent, else modal dialogs can
+             // be hidden by their parents.
+             if (!transientXcbParent)
+-- 
+2.31.1
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
