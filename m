Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A59C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4A14416C5;
	Tue, 12 Apr 2022 18:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l885oDhg7mjP; Tue, 12 Apr 2022 18:29:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9854C40357;
	Tue, 12 Apr 2022 18:29:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16E971BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13AAE40357
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l0yE7QNntY0a for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FF6240303
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:29:36 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e21so12471116wrc.8
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbKNC8FqqpEciMcyUlTR4+YcNSya58Ngdqag1Q6aY7E=;
 b=FXGIuIVgL8fmu81crLQcXKz//5KsxR4Iv4efkM2Yw99ebCp3Bt9LbK69S2uiXKcc0v
 FvW3UPj0RlPX0eQBOa7LuljByZTDxxD8fQ0Yaa/+rxklYBbGLsoZdmHNQj6CN9s/ljh2
 bJU4GCk8y7juzjwqtPpphddGIEIZDBe+Jvd4nHgAeYTrm+66WxCBFMwiJCLjki3/wsS6
 7e6lEvp5WDvC3NinGN5i4B8BM0F6K0YStOpTPmqRvbx71PjjLC2azdoN7ECeKUGB/Iz0
 OFoh5q4S+y5A/VMnhGZBf7vvjTqEKyIVAHYoNVkptqaj18gJ0wabiYtuxH9Bk5s65gZF
 0hyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qbKNC8FqqpEciMcyUlTR4+YcNSya58Ngdqag1Q6aY7E=;
 b=dtmJxCsYR2f9KI5OEd6yiN9nHEE4P+b+y3oB4KQILUQHu++CXIRN3erIZmd/RyxEgU
 vpSlzBxW20cOUySZ7eHSDGrr56k0Q+DlhwMjyTRYCxKMlH0HVhWGBbd/ZBOGNXQ8XXtD
 wqrpxn66XdTQ8XVTT/k0br3KZJjkRjsH6I4OYIS8JxdMRR56+Rnm7xXah3bIJFwLKn8F
 zW9tI4aLLtyesScB/HwL8PrSePORMi4txGcZyIjQBRMO1iri4FArIF2tIZSraVn9KzIT
 FCA1/J5LAZMvISK7Z0eqR2hg3+vgjCc+27uC06Mn82O51ks+QOyqQYYjq/zJIZ4a2L0w
 UcHg==
X-Gm-Message-State: AOAM530tYUNW3QL9fzZUYkIhqv4xmYygr0+sMjxPkcMLO0rgzAJzlOPz
 Zab1tpBZVLbnTnCJOoBq6mh5jCmWyGM=
X-Google-Smtp-Source: ABdhPJy65lDJ1rAbBZVTJY9yyI/C+UEEJjKrPu+7kCc2Xh6/3hSMeqrsj0dev4caV/T9ICFDfB52Gg==
X-Received: by 2002:adf:e541:0:b0:207:adb8:aab2 with SMTP id
 z1-20020adfe541000000b00207adb8aab2mr3986790wrm.67.1649788174659; 
 Tue, 12 Apr 2022 11:29:34 -0700 (PDT)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm202961wmc.28.2022.04.12.11.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:29:34 -0700 (PDT)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 20:29:27 +0200
Message-Id: <20220412182927.142740-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 5.17.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove patch from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

 ...0001-lib-fix-ax25-h-include-for-musl.patch | 37 -------------------
 package/iproute2/iproute2.hash                |  2 +-
 package/iproute2/iproute2.mk                  |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch

diff --git a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch b/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
deleted file mode 100644
index 1f8860c5d8..0000000000
--- a/package/iproute2/0001-lib-fix-ax25-h-include-for-musl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8bced38a941a181f1468fa39541e872e51b6022f Mon Sep 17 00:00:00 2001
-From: Sam James <sam@gentoo.org>
-Date: Thu, 13 Jan 2022 08:14:13 +0000
-Subject: [PATCH] lib: fix ax25.h include for musl
-
-ax25.h isn't guaranteed to be avilable in netax25/*;
-it's dependent on our choice of libc (it's not available
-on musl at least) [0].
-
-Let's use the version from linux-headers.
-
-[0] https://sourceware.org/glibc/wiki/Synchronizing_Headers
-Bug: https://bugs.gentoo.org/831102
-
-Signed-off-by: Sam James <sam@gentoo.org>
-Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
-
-[Retrieved from:
-https://github.com/shemminger/iproute2/commit/8bced38a941a181f1468fa39541e872e51b6022f]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/ax25_ntop.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/ax25_ntop.c b/lib/ax25_ntop.c
-index cfd0e04b0..3a72a43e9 100644
---- a/lib/ax25_ntop.c
-+++ b/lib/ax25_ntop.c
-@@ -2,7 +2,7 @@
- 
- #include <errno.h>
- #include <sys/socket.h>
--#include <netax25/ax25.h>
-+#include <linux/ax25.h>
- 
- #include "utils.h"
- 
diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index f7e7f682a9..eafe7a6c9a 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f  iproute2-5.16.0.tar.xz
+sha256  6e384f1b42c75e1a9daac57866da37dcff909090ba86eb25a6e764da7893660e  iproute2-5.17.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a51b5b2996..8ecde069f5 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.16.0
+IPROUTE2_VERSION = 5.17.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
