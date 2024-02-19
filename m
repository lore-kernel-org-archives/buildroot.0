Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6424EC48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F67B40BA3;
	Mon, 19 Feb 2024 21:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg8dorc9mgnZ; Mon, 19 Feb 2024 21:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8ED340BB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8ED340BB5;
	Mon, 19 Feb 2024 21:34:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D1F641BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE2DF40BB5
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:34:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lE9C0SHi4eRG for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:34:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B14C40BA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B14C40BA3
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B14C40BA3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:34:06 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1d71cb97937so46549745ad.3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 13:34:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708378445; x=1708983245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWgRbt7JWHm374sZibHGLENU86NG/lAcvrEt1l7h4bk=;
 b=idA3/4RydyMY+ZpyrrUv75yXUvqxawMVOrApoRltDI5e/pwbTHjmuLZ20/+YGRloZw
 Q5MQ+4Bc3Xn+2NyTV3RObpImsOVfqA7l0WE8J5R8IYOIhiu2oJwrTQARlDzGJ93syfiw
 ddRHGuGFCFmGejyViIQmiZLX76bWM5zWLhCyqv6Pmm5/DnzqS8JMVL9kaICt1UGDhBP2
 6OZkK/Se+mClgnksOLU+xD3TVBU3ZDBaFKt1vO6CskMK2e1GF6z7OLMH6EL20pWPZrg9
 KQixiAlqTE6XTLTPg8ScrJ3HStGPmOC6XcOznmpEogoQQDMH071U1Hxz7YsBFlpEWqgX
 TlHA==
X-Gm-Message-State: AOJu0YxXyo343mCypeBrrqclLRa+dOycFG+k95AgEeqzCxh39qhmuAg9
 Ui8Y6Es4HEtYa0xROA+/kAktgbhAvc00EbNz59NW3KZoJ8Mzj+htIJhVZyH45lw=
X-Google-Smtp-Source: AGHT+IELSCVzjf/z6nBsGACtBiCiXLdS9kH2eG/rQmtzy5NbR91zBi1D9PjUEM7tytCNPUvuKtzBoQ==
X-Received: by 2002:a17:903:1c2:b0:1db:ea2b:d2b4 with SMTP id
 e2-20020a17090301c200b001dbea2bd2b4mr4426223plh.15.1708378445125; 
 Mon, 19 Feb 2024 13:34:05 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 ja12-20020a170902efcc00b001d8cde39e8bsm4906190plb.194.2024.02.19.13.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 13:34:04 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 13:34:02 -0800
Message-Id: <20240219213402.186876-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240212002607.12158-1-kadambini.nema@gmail.com>
References: <20240212002607.12158-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708378445; x=1708983245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWgRbt7JWHm374sZibHGLENU86NG/lAcvrEt1l7h4bk=;
 b=DPCJwiOQAyDu22I8mF33AuYu6tOUMGuf/XFt3fM2HVQsRq/kgrLQqwkihjO+6yZIJA
 VZVR3DDSzZ7j8Yb+rvdiQG+YIjRWNGm6yR7O6HmrZpjzBLxeeet3ZBTuU5A8KOoGdUcK
 HaNPX3SBQsMUXbxX85M1iHQCCZGOT4NCqBqqqDQLiXJPIs0ice6Dy3RxWJiyW9KTBBD0
 34j+mHs+wIBdPQEYxAjhmOmRtZSe7+ruiWasNnNcSdt2Uuc0ZRtn1k5KiaiW6G+ai17d
 gAh9MVQRFavd+AjrXv6LhEYOg2h6R/8ye9owH7MSaSUM7/JWyIFI82zKuCTj88Dy1cQe
 1ZPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DPCJwiOQ
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: new package
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Lightweight and fast MJPEG-HTTP streamer
(https://github.com/pikvm/ustreamer/tree/master#%C2%B5streamer)

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
Changes v1 -> v2:
  - Fix 'make legal-info' with ustreamer package enabled.
Changes v2 -> v3:
  - Fix a build failure with uclibc. (https://github.com/pikvm/ustreamer/commit/13af11a3a64cf9f08014e89f35e52e001fb10cad)
  - Upgrade to the latest version - 5.51
---
$ ./utils/test-pkg -k -c ustreamer.config  -p ustreamer
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: SKIPPED
                            sourcery-arm [6/6]: SKIPPED
6 builds, 3 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 DEVELOPERS                       |  3 +++
 package/Config.in                |  1 +
 package/ustreamer/Config.in      | 17 +++++++++++++++++
 package/ustreamer/ustreamer.hash |  3 +++
 package/ustreamer/ustreamer.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 49 insertions(+)
 create mode 100644 package/ustreamer/Config.in
 create mode 100644 package/ustreamer/ustreamer.hash
 create mode 100644 package/ustreamer/ustreamer.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0d12c3abcb..a6182777c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1875,6 +1875,9 @@ F:	package/easy-rsa/
 N:	Justin Maggard <jmaggard@netgear.com>
 F:	package/dtach/
 
+N:	Kadambini Nema <kadambini.nema@gmail.com>
+F:	package/ustreamer/
+
 N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
diff --git a/package/Config.in b/package/Config.in
index bf0fe078b9..479c8b6657 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2595,6 +2595,7 @@ endif
 	source "package/uredir/Config.in"
 	source "package/ushare/Config.in"
 	source "package/ussp-push/Config.in"
+	source "package/ustreamer/Config.in"
 	source "package/vde2/Config.in"
 	source "package/vdr/Config.in"
 	source "package/vdr-plugin-vnsiserver/Config.in"
diff --git a/package/ustreamer/Config.in b/package/ustreamer/Config.in
new file mode 100644
index 0000000000..52c511e22d
--- /dev/null
+++ b/package/ustreamer/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_USTREAMER
+	bool "ustreamer"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # V4L2_EVENT_SOURCE_CHANGE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	select BR2_PACKAGE_JPEG
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_LIBGPIOD
+	help
+	  Lightweight and fast MJPEG-HTTP streamer
+
+	  https://github.com/pikvm/ustreamer
+
+comment "ustreamer needs a toolchain w/ threads, headers >= 3.16, dynamic library"
diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
new file mode 100644
index 0000000000..a8cb1695e5
--- /dev/null
+++ b/package/ustreamer/ustreamer.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  88f107e02a0b5c6493d55ed1bce0c85f66ce83d2bc0271ff6319ad593c6584bc  v5.51.tar.gz
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
new file mode 100644
index 0000000000..71de097a22
--- /dev/null
+++ b/package/ustreamer/ustreamer.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# ustreamer
+#
+################################################################################
+
+USTREAMER_VERSION = 5.51
+USTREAMER_SITE = $(call github,pikvm,ustreamer,refs/tags)
+USTREAMER_SOURCE = v$(USTREAMER_VERSION).tar.gz
+USTREAMER_SUBDIR = ustreamer
+USTREAMER_LICENSE = GPL-3.0-or-later
+USTREAMER_LICENSE_FILES = LICENSE
+USTREAMER_DEPENDENCIES = jpeg libevent libbsd libgpiod
+USTREAMER_CONF_ENV = "CFLAGS=$(TARGET_CFLAGS)"
+
+define USTREAMER_BUILD_CMDS
+	$(MAKE)  $(if $(BR2_PACKAGE_SYSTEMD),WITH_SYSTEMD=1, ) WITH_PTHREAD_NP=1  WITH_SETPROCTITLE=1 HAS_PDEATHSIG=1 $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define USTREAMER_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/ustreamer $(TARGET_DIR)/usr/bin/ustreamer
+	$(INSTALL) -D -m 0755 $(@D)/ustreamer-dump $(TARGET_DIR)/usr/bin/ustreamer-dump
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
