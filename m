Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C6FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 23:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A97CE40179;
	Tue, 14 Dec 2021 23:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMvcYyFXgZuK; Tue, 14 Dec 2021 23:15:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94D6D4027A;
	Tue, 14 Dec 2021 23:15:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A5B091BF397
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0BD74027A
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 23:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 99fqT5Jw4VDc for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 23:15:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BAA140179
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 23:15:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e5so1620020wrc.5
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 15:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mU4XBquw8Zki8OEHPR8c/nVVL4ElXw7D7v6oXRZrDTs=;
 b=NKcYBZSAJf7+Yj60ieNTUy+l8ZAdkIfCNh5RcHbMjSi56EAwgunAnelusHL359K3Wu
 ASm5IEWDmIIUoLu8G8/1j2ZNVwyEIvXwwl/PWznazu0h0b2Y6qL8GRdyhj1CJdKYk4Hf
 uQeWHvfjyzojC0VBclIChvqpfkknEZweoKFfXGEYuqzFFd46dB98HB+WI+GEu6pxpg8A
 uS+Y7ZfWMO+2I8ga2JId1BbJI2E+XDorJ9/ZNyFnG9wfzXvB85MHt1I385Pv289tPVdZ
 b4aFqvDUXMajI1Waz2bHQSjLke4p2g6UIK+mf0MUKnYUmUBHB0cnVxie24Uh3FnY7GmJ
 SMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mU4XBquw8Zki8OEHPR8c/nVVL4ElXw7D7v6oXRZrDTs=;
 b=mE2qyRMuXQ1q6QsLZo7yVTxwB9e/m43F1fj9QyKSSN3+If9uiAVj+Y7K+/PyK8MNFg
 yVtdupNFYLBp5koXraejhDjup9G+oxtBouaRW3czTOKxF/qjFXiEBuZxEy0lTL+FUbmi
 3PrWKM41NoWO6RYLoWBlC8mB5zdd4qLWy4py5YjR9rsg7SmOIYcRe+NQnL0CgF3e8Whh
 ASVqDfbkBugtNNnJCM91FcMKTk1ykPAofHzIj8wa3BLz7wXqqsCtriom7ErU6n0zTjgs
 qczLCDluBI9BvDLCve8gOScbJJoG6/nnQzq7Ye2SFy0orKJ5kKbyPldyNSckxUH2zw39
 5DuA==
X-Gm-Message-State: AOAM531NMw2T4gltLoWa57fC6aYtU6BpkDoonZFv3Md3/tNH4AmzXpnb
 KPz6SKb9V7Oj3216Swk8igCCTKk+ebWsEw==
X-Google-Smtp-Source: ABdhPJy2tMfeJGC32rfy+cfqVsrkUuTfcwZh5bBw/CGJX5CK513Lk33vMYzwl1ZS7lNpALESX/giBg==
X-Received: by 2002:a5d:46d0:: with SMTP id g16mr1929319wrs.624.1639523719070; 
 Tue, 14 Dec 2021 15:15:19 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id j18sm4507082wmq.44.2021.12.14.15.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 15:15:18 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 00:14:57 +0100
Message-Id: <20211214231457.3281409-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/haveged: bump to version 1.9.15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version) and so autoreconf

https://github.com/jirka-h/haveged/releases/tag/v1.9.15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...Check-for-sys-auxv.h-before-using-it.patch | 60 -------------------
 package/haveged/haveged.hash                  |  2 +-
 package/haveged/haveged.mk                    |  4 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch

diff --git a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
deleted file mode 100644
index 042135f127..0000000000
--- a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 676abde95bab10e1d26e91682772514010143343 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Sun, 21 Mar 2021 17:00:08 +0100
-Subject: [PATCH] Check for sys/auxv.h before using it.
-
-- fixes uclibc-ng compile (does not provide sys/auxv.h header file)
-
-Fixes:
-
-  haveged.c:22:10: fatal error: sys/auxv.h: No such file or directory
-     22 | #include <sys/auxv.h>
-        |          ^~~~~~~~~~~~
-
-[Upstream: https://github.com/jirka-h/haveged/pull/59]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- configure.ac  | 1 +
- src/haveged.c | 4 ++++
- 2 files changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index c172a10..a0263f5 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -125,6 +125,7 @@ AC_CHECK_HEADERS(stdio.h)
- AC_CHECK_HEADERS(stdlib.h)
- AC_CHECK_HEADERS(string.h)
- AC_CHECK_HEADERS(sys/ioctl.h)
-+AC_CHECK_HEADERS(sys/auxv.h)
- AC_CHECK_HEADERS(sys/mman.h)
- AC_CHECK_HEADERS(sys/types.h)
- AC_CHECK_HEADERS(sys/socket.h)
-diff --git a/src/haveged.c b/src/haveged.c
-index b9cb77b..dad3072 100644
---- a/src/haveged.c
-+++ b/src/haveged.c
-@@ -19,7 +19,9 @@
-  ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
-  */
- #include "config.h"
-+#if defined(HAVE_SYS_AUXV_H)
- #include <sys/auxv.h>
-+#endif
- #include <stdlib.h>
- #include <stdio.h>
- #include <getopt.h>
-@@ -135,8 +137,10 @@ int main(int argc, char **argv)
- {
-    volatile char *path = strdup(argv[0]);
-    volatile char *arg0 = argv[0];
-+#if defined(HAVE_SYS_AUXV_H)
-    if (path[0] != '/')
-       path = (char*)getauxval(AT_EXECFN);
-+#endif
-    static const char* cmds[] = {
-       "b", "buffer",      "1", SETTINGR("Buffer size [KW], default: ",COLLECT_BUFSIZE),
-       "d", "data",        "1", SETTINGR("Data cache size [KB], with fallback to: ", GENERIC_DCACHE ),
--- 
-2.30.2
-
diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index f55e004923..8c62ead7c3 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  938cb494bcad7e4f24e61eb50fab4aa0acbc3240c80f3ad5c6cf7e6e922618c3  haveged-1.9.14.tar.gz
+sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 5d76bdc3c9..7035142aee 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.14
+HAVEGED_VERSION = 1.9.15
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
 HAVEGED_SELINUX_MODULES = entropyd
-# patch touching configure.ac
-HAVEGED_AUTORECONF = YES
 
 # '--disable-init' as buildroot ships its own sysv/systemd init files
 HAVEGED_CONF_OPTS = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
