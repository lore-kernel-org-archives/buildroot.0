Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1165CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 20:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 980F34161A;
	Mon, 16 Oct 2023 20:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 980F34161A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFWTi-upGU-D; Mon, 16 Oct 2023 20:51:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB16E40860;
	Mon, 16 Oct 2023 20:51:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB16E40860
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73DFE1BF34A
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C45540860
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 20:51:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C45540860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSAksuKwzqev for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 20:50:59 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AC994062E
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:50:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AC994062E
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d9d8284abso3040000f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 13:50:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697489457; x=1698094257;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wwxKAHLyy8XSvQMtcAkXmp4hdJL98SydTfplaoMg1KU=;
 b=CVXMODStq2sFtNY9pAgAAPDba5HMIQ7s2rBazrGmInAD7aKH+/JMM7gffuWtoEPJPk
 LkjYG2YvNl+ZshdmvOcwCAHBt0975L8Mwl4pTd97F5+eej8Hh2mmRQnjf28gUWQgUvxq
 3oE1nil3hoTnpuRB/LAIeG2zb+nl7jL589DWOe5w4VpV+qU/fLKN5R+SvfyEGnPXj0vV
 E385ZAj7pVg2QyZERS/XdlTavqulU/0xt35wYwh2wSQcn8LogPKN3kjb9AOG8NY2M/br
 sMWvLwyNH7HcJpuZxd8pBOkbs25yRlhukApXSyqpcqOfzG5DHnUdZNU3jzFyVaxqqGUB
 jKJQ==
X-Gm-Message-State: AOJu0YyoMNx0H3S/E+HwruOsrPjV2XJ7pFaelt7xGc4qw/A78JuZjFvW
 CWn5SYoNRoeP6Ag7LDMoBQlHkmTGe6w=
X-Google-Smtp-Source: AGHT+IFO3GpRn/UsndwFCumAHAlBxvL1SAWMnYuBgehv3m0iqLj79VEEscUW0lEYpjS2FRcg2Zrw1g==
X-Received: by 2002:a5d:5226:0:b0:31f:f65f:74ac with SMTP id
 i6-20020a5d5226000000b0031ff65f74acmr372673wra.70.1697489456526; 
 Mon, 16 Oct 2023 13:50:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 b10-20020adff24a000000b0032da46648dasm129979wrp.8.2023.10.16.13.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 13:50:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 22:50:50 +0200
Message-ID: <20231016205050.13725-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697489457; x=1698094257; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wwxKAHLyy8XSvQMtcAkXmp4hdJL98SydTfplaoMg1KU=;
 b=Qg/yvJJm/KM3blVD1MVlX5pL6aqFvvnyJiJw2RncHLPg3n+TB17ZWaCBTfiru9HVyN
 7559Ys+9NPf7iLDu2jfa9BXi2YdS+GSRTmGSjfpxcFQfHsSTPlH+59dNtYuYBcdeAncs
 uU8hIJ85uIehicXpfHhnpqz5TXMZjZY9lpP3SWM5efV5nqYckxWQ5V3ra5pcqMUjFTiW
 rWgQIGgF2/cT0U8hXJb0HKZwu9v+9oboprqtvfGF8ev+IDJ1eh+LntUec6EhMHek50Od
 W/s6w6VRYZXve975IlG2qSn43zxVgJlpErYV0mU4+iQ/0ee+I+7eh1kbxEbnChGjDikX
 AkDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qg/yvJJm
Subject: [Buildroot] [PATCH 1/1] package/sslh: bump to version 2.0.1
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
Cc: David Bachelart <david.bachelart@bbright.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libev is an optional dependency since version 2.0 and
https://github.com/yrutschle/sslh/commit/711c11c820f8be4f1399024bcaa1d7072de33217

https://github.com/yrutschle/sslh/blob/v2.0.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../sslh/0001-Makefile-add-USE_LIBEV.patch    | 59 +++++++++++++++++++
 package/sslh/sslh.hash                        |  2 +-
 package/sslh/sslh.mk                          |  9 ++-
 3 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100644 package/sslh/0001-Makefile-add-USE_LIBEV.patch

diff --git a/package/sslh/0001-Makefile-add-USE_LIBEV.patch b/package/sslh/0001-Makefile-add-USE_LIBEV.patch
new file mode 100644
index 0000000000..858d30fa15
--- /dev/null
+++ b/package/sslh/0001-Makefile-add-USE_LIBEV.patch
@@ -0,0 +1,59 @@
+From 3e93c1d43de8a662e402127462f28ef0bebf8997 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Oct 2023 18:45:53 +0200
+Subject: [PATCH] Makefile: add USE_LIBEV
+
+Add USE_LIBEV to avoid the following build failure without libev raised
+since version 2.0 and
+https://github.com/yrutschle/sslh/commit/711c11c820f8be4f1399024bcaa1d7072de33217:
+
+sslh-ev.c:24:10: fatal error: ev.h: Aucun fichier ou dossier de ce type
+   24 | #include <ev.h>
+      |          ^~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/yrutschle/sslh/commit/3e93c1d43de8a662e402127462f28ef0bebf8997
+---
+ Makefile | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a4425c3..aa2689e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -6,6 +6,7 @@ VERSION=$(shell ./genver.sh -r)
+ ENABLE_SANITIZER= # Enable ASAN/LSAN/UBSAN
+ ENABLE_REGEX=1  # Enable regex probes
+ USELIBCONFIG=1	# Use libconfig? (necessary to use configuration files)
++USELIBEV=1	# Use libev?
+ USELIBWRAP?=	# Use libwrap?
+ USELIBCAP=	# Use libcap?
+ USESYSTEMD=     # Make use of systemd socket activation
+@@ -72,6 +73,9 @@ ifneq ($(strip $(USELIBBSD)),)
+         CPPFLAGS+=-DLIBBSD
+ endif
+ 
++ifneq ($(strip $(USELIBEV)),)
++        CONDITIONAL_TARGETS+=sslh-ev
++endif
+ 
+ all: sslh $(MAN) echosrv $(CONDITIONAL_TARGETS)
+ 
+@@ -84,7 +88,7 @@ $(OBJS_A): $(OBJS)
+ version.h:
+ 	./genver.sh >version.h
+ 
+-sslh: sslh-fork sslh-select sslh-ev
++sslh: sslh-fork sslh-select
+ 
+ $(OBJS) $(FORK_OBJS) $(SELECT_OBJS) $(EV_OBJS): argtable3.h collection.h common.h gap.h hash.h log.h probe.h processes.h sslh-conf.h tcp-listener.h tcp-probe.h tls.h udp-listener.h version.h
+ 
+@@ -153,7 +157,7 @@ distclean: clean
+ 	rm -f tags sslh-conf.[ch] echosrv-conf.[ch] cscope.*
+ 
+ clean:
+-	rm -f sslh-fork sslh-select sslh-ev echosrv version.h $(MAN) systemd-sslh-generator *.o *.gcov *.gcno *.gcda *.png *.html *.css *.info
++	rm -f sslh-fork sslh-select $(CONDITIONAL_TARGETS) echosrv version.h $(MAN) systemd-sslh-generator *.o *.gcov *.gcno *.gcda *.png *.html *.css *.info
+ 
+ tags:
+ 	ctags --globals -T *.[ch]
diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
index ae678563da..839e7b7f1c 100644
--- a/package/sslh/sslh.hash
+++ b/package/sslh/sslh.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e3742d14edf4119350cfdc7bb96b89134d9218eb6d2a6e1f70891ca18a649b1  sslh-v1.22c.tar.gz
+sha256  d88d43ee11cf1324983c196c894b41766c33d957b6af53b62c8479703bbbd26c  sslh-v2.0.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 6ef7cda1a9..5dad6aafc2 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSLH_VERSION = 1.22c
+SSLH_VERSION = 2.0.1
 SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
@@ -35,6 +35,13 @@ else
 SSLH_MAKE_OPTS += USELIBCONFIG=
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEV),y)
+SSLH_DEPENDENCIES += libev
+SSLH_MAKE_OPTS += USELIBEV=1
+else
+SSLH_MAKE_OPTS += USELIBEV=
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SSLH_DEPENDENCIES += systemd
 SSLH_MAKE_OPTS += USESYSTEMD=1
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
