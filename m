Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2211E8FDB2
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752F54075F;
	Fri, 26 Dec 2025 18:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuZPAQp0w15R; Fri, 26 Dec 2025 18:21:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 813744032E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766773260;
	bh=WZ/M3Q35K2zfMRMJgUsK4QGPRmijgmQ7ZFpxrbCbr/4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TTMgD4GPU9EvTWXkGar1Z1GHxRnDmFFpZyHyrJDtpfr+Xax1hDb/sq24rChPwTwZ/
	 +jOKRRJ78Af0NGfr1rDf/ySVgN/hjuu7RM7cLCs+hUauFEfRf2MSP5r/6QeijhC4FQ
	 kooDd+CL81xMfDcpogaH9cjZ2AwDJo8ZIgLWUIKsW7tnjho/sgb66Os9KLXxVgNofu
	 89Ua2HwBTo8Ssts0g9yfcv5GGAb3o88hwSKfmhoBxSzhkwpcSGrY+5WhGRITfDZ2n1
	 AxlYxEUOKBZ33y1ENTV6lkcvUNPRkYPB/Ebl0VPR+HsxCqXVDYYPQhrVirlixzOGxe
	 tJXV68WYBttJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 813744032E;
	Fri, 26 Dec 2025 18:21:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF6B471
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CF37605F5
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyO0NKvwZKIr for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 707EF6059B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 707EF6059B
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A3348768F; Fri, 26 Dec 2025 18:20:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 17:39:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61ca67a5b202c3b81089abc30f67aa88edf73dd2
X-Git-Newrev: d80031c7ee38e060e1465800e2269bb3e705fd25
X-Patchwork-Hint: ignore
Message-Id: <20251226182054.5A3348768F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libstrophe: bump version to 0.14.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d80031c7ee38e060e1465800e2269bb3e705fd25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added upstream patch to fix build with gcc-15.x.

Fixes:
https://autobuild.buildroot.net/results/6e1/6e176c77a6cb7508b0502c77d78df78ae4602ef9/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-store-function-pointer-when-compiled-as-.patch | 60 ++++++++++++++++++++++
 package/libstrophe/libstrophe.hash                 |  2 +-
 package/libstrophe/libstrophe.mk                   |  2 +-
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch b/package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch
new file mode 100644
index 0000000000..f61e2d8193
--- /dev/null
+++ b/package/libstrophe/0001-Use-void-to-store-function-pointer-when-compiled-as-.patch
@@ -0,0 +1,60 @@
+From dfb3e868248d86fc0f5553dffbb6f7c367c3c383 Mon Sep 17 00:00:00 2001
+From: Steffen Jaeckel <s@jaeckel.eu>
+Date: Wed, 26 Mar 2025 14:14:19 +0100
+Subject: [PATCH] Use `void*` to store function pointer when compiled as C23.
+
+[0] decided that `rettype (*foo)();` must now be interpreted as
+`rettype (*foo)(void);`. Luckily it also allows now to store function
+pointers in a `void*` (c.f. Ch. J.5.7).
+
+[0]: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3096.pdf
+
+Signed-off-by: Steffen Jaeckel <s@jaeckel.eu>
+
+Upstream: https://github.com/strophe/libstrophe/commit/dfb3e868248d86fc0f5553dffbb6f7c367c3c383
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/common.h  | 7 ++++++-
+ src/handler.c | 2 --
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index 75134be..c387c0f 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -30,12 +30,17 @@
+ #include "snprintf.h"
+ 
+ /** handlers **/
++#if (__STDC_VERSION__ >= 202000L)
++typedef void* xmpp_void_handler;
++#else
++typedef int (*xmpp_void_handler)();
++#endif
+ 
+ typedef struct _xmpp_handlist_t xmpp_handlist_t;
+ struct _xmpp_handlist_t {
+     /* common members */
+     int user_handler;
+-    int (*handler)();
++    xmpp_void_handler handler;
+     void *userdata;
+     int enabled; /* handlers are added disabled and enabled after the
+                   * handler chain is processed to prevent stanzas from
+diff --git a/src/handler.c b/src/handler.c
+index 1c9bf9f..0577252 100644
+--- a/src/handler.c
++++ b/src/handler.c
+@@ -25,8 +25,6 @@
+ #include "common.h"
+ #include "ostypes.h"
+ 
+-typedef int (*xmpp_void_handler)();
+-
+ /* Remove item from the list pointed by head, but don't free it.
+  * There can be a situation when user's handler deletes another handler which
+  * is the previous in the list. handler_fire_stanza() and handler_fire_timed()
+-- 
+2.47.3
+
diff --git a/package/libstrophe/libstrophe.hash b/package/libstrophe/libstrophe.hash
index ec5a55985a..a4951e608d 100644
--- a/package/libstrophe/libstrophe.hash
+++ b/package/libstrophe/libstrophe.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  86c0abd348ae66feb40b6886f2c7f04525f1d5b20a48c10d4db4ed532dc63f22  libstrophe-0.13.1.tar.xz
+sha256  8a7ebc274bd79fa4e5dfcfbf06123adbc9f70abd8bebf2843c2940e9086aeee0  libstrophe-0.14.0.tar.xz
 sha256  82476f36ffd5e895a176013c0812166ba7b7d99f3d536fc7f5ed2e33e9f74a08  MIT-LICENSE.txt
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  GPL-LICENSE.txt
diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index 42d582fe9c..85e8753f2b 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSTROPHE_VERSION = 0.13.1
+LIBSTROPHE_VERSION = 0.14.0
 LIBSTROPHE_SOURCE = libstrophe-$(LIBSTROPHE_VERSION).tar.xz
 LIBSTROPHE_SITE = https://github.com/strophe/libstrophe/releases/download/$(LIBSTROPHE_VERSION)
 LIBSTROPHE_DEPENDENCIES = host-pkgconf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
