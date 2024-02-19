Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C3C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 21:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E647D40359;
	Mon, 19 Feb 2024 21:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qr_px0Sztlil; Mon, 19 Feb 2024 21:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 696AC403A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 696AC403A5;
	Mon, 19 Feb 2024 21:55:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9A0F1BF3A3
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96617403A5
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 21:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R4m26cTuheQ9 for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 21:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36F2D40359
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F2D40359
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36F2D40359
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 21:55:03 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1d7393de183so38031115ad.3
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 13:55:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708379702; x=1708984502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqnyWs2OfWhJqidDlTNDza6//lTlxLGQBMeNpOXpQQE=;
 b=QcG4k2i+AV4UCL9EvDkYX8GUBigTIs69Xl3bk2JxEAevXZtjsH5cUaD1OO81cATny2
 kSlPWPgbd0NNADrTr2N7NewrQH+HdDqYu2FZ0bQ/UfuZtiZaq4d+sstRS/TUyCpURQxy
 BCB2QfuSjVW0vNe5Mp5g5VS41fp/SlBSxk+bzhQH8e45afp4Rj98S7lP8s+syxOBFe4n
 TGR5XiynVQh3Ag+LE6h2F/RQnmAKhW19yTHyX8M0IjQAfUUwmHoRm3HWJl2NnDFYphrZ
 tPQWLAw/uSc44wQw9y7A2NMToCdNn6prw4H49vdeaZfctb7gAyC6ObCTpGTsfoPL8F+r
 h1QA==
X-Gm-Message-State: AOJu0Yy80+815rYeDrCe5ApcKBcBxgzDchZaoZt/Nl70mFuipcBqkJGf
 b4wYcYoBMrG/iD7H8wC9wHFMz8dRe2mFyNTbgzfYTawupXYhBro57TskWPgwL1w=
X-Google-Smtp-Source: AGHT+IFtdNP7gwFfkpaT+RHsMpxOU7aE01LvA0XyWOnMZxopUnbSHtgPkjy3JU1HkjyZecDKIXQrtw==
X-Received: by 2002:a17:902:d486:b0:1dc:687:26d6 with SMTP id
 c6-20020a170902d48600b001dc068726d6mr2683206plg.18.1708379701576; 
 Mon, 19 Feb 2024 13:55:01 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 iw11-20020a170903044b00b001db5e807cd2sm4863554plb.82.2024.02.19.13.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 13:55:01 -0800 (PST)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Feb 2024 13:54:58 -0800
Message-Id: <20240219215458.187716-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZdJ2KOazjyVO-_tM@landeda>
References: <ZdJ2KOazjyVO-_tM@landeda>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708379702; x=1708984502; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqnyWs2OfWhJqidDlTNDza6//lTlxLGQBMeNpOXpQQE=;
 b=iVyUISwqbTtIItNwTyaz8i0sKrmOwIlD4YTD1QFDTI2UClFeA9Y2Rq+LDlNVyT39uX
 9dliw1lAlzmJ653XfONIYOlrnLYsbo9HYdBA+aCnfTSrZs7LBf4FzJ6DilYBZH/EHf4l
 bITH6g1XtP4K1bQdNxwZAgczNrVNqPqgjYJWyhJbwBtL2hScQSDu+YGxBg2pmv8lYXxx
 z+vRQV8aOi/1lb0gAWAlAsfZoR7lQQFrsq9loZvR9vgkKq5lCfjm/2RM0buYIDYwLXF/
 +Si3x0lHAbbfja7FwRVyyCJRMhzc140Ul6tvA99kon/7Q0/DydCkeItLDGZG3H8/2kGN
 DX5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iVyUISwq
Subject: [Buildroot] [PATCH 1/1] package dhcpdump: bump to version 1.9
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Change the site to a well maintained fork - https://github.com/bbonev/dhcpdump

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
- Build test results
  ./utils/test-pkg -d br_test -k -c dhcpdump.config  -p dhcpdump
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: OK
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 0 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 ...Fix-build-with-gcc4.8-use-br-fortify.patch | 12 ++++++++++
 .../0001-use-non-bsd-structures.patch         | 23 -------------------
 package/dhcpdump/Config.in                    |  2 +-
 package/dhcpdump/dhcpdump.hash                |  2 +-
 package/dhcpdump/dhcpdump.mk                  |  5 ++--
 5 files changed, 17 insertions(+), 27 deletions(-)
 create mode 100644 package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
 delete mode 100644 package/dhcpdump/0001-use-non-bsd-structures.patch

diff --git a/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
new file mode 100644
index 0000000000..c48d28c23d
--- /dev/null
+++ b/package/dhcpdump/0001-Fix-build-with-gcc4.8-use-br-fortify.patch
@@ -0,0 +1,12 @@
+Upstream: None
+Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
+diff -Naur a/Makefile b/Makefile
+--- a/Makefile	2024-02-17 13:57:08.166161973 -0800
++++ b/Makefile	2024-02-17 13:57:45.055153969 -0800
+@@ -1,5 +1,5 @@
+ CFLAGS+=${CPPFLAGS}
+-CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -Wdate-time -D_FORTIFY_SOURCE=2 -g -O3 -fPIE
++CFLAGS+=-Wall -Wextra -Wformat -Werror=format-security -g -O3 -fPIE
+ LDFLAGS+=-g -Wl,-z,relro -Wl,-z,now -fPIE -pie
+ LIBS+=-lpcap
+ 
diff --git a/package/dhcpdump/0001-use-non-bsd-structures.patch b/package/dhcpdump/0001-use-non-bsd-structures.patch
deleted file mode 100644
index 40115fb640..0000000000
--- a/package/dhcpdump/0001-use-non-bsd-structures.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-The udphdr structure has uh_* fields when _FAVOR_BSD is
-defined. Otherwise, the fields are just named source, dest, len and
-check. See <netinet/udp.h>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: dhcpdump-1.8/dhcpdump.c
-===================================================================
---- dhcpdump-1.8.orig/dhcpdump.c	2011-05-17 20:20:46.506980003 +0200
-+++ dhcpdump-1.8/dhcpdump.c	2011-05-17 20:20:59.338979999 +0200
-@@ -163,10 +163,10 @@
- 	strcpy(ip_origin, (u_char *)inet_ntoa(ip->ip_src));
- 	strcpy(ip_destination, (u_char *)inet_ntoa(ip->ip_dst));
- 
--	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->uh_ulen)))
-+	if (hmask && check_ch((u_char *)(sp + offset), ntohs(udp->len)))
- 		return;
- 
--	printdata((u_char *)(sp + offset), ntohs(udp->uh_ulen));
-+	printdata((u_char *)(sp + offset), ntohs(udp->len));
- }
- 
- // check for matching CHADDR (Peter Apian-Bennewitz <apian@ise.fhg.de>)
diff --git a/package/dhcpdump/Config.in b/package/dhcpdump/Config.in
index e0abe040fc..30e42928e4 100644
--- a/package/dhcpdump/Config.in
+++ b/package/dhcpdump/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_DHCPDUMP
 	help
 	  A tool for monitoring dhcp requests using tcpdump.
 
-	  http://www.mavetju.org/unix/general.php
+	  https://github.com/bbonev/dhcpdump
diff --git a/package/dhcpdump/dhcpdump.hash b/package/dhcpdump/dhcpdump.hash
index a24db5b275..fdf3243ad1 100644
--- a/package/dhcpdump/dhcpdump.hash
+++ b/package/dhcpdump/dhcpdump.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d5eb9418162fb738bc56e4c1682ce7f7392dd96e568cc996e44c28de7f77190  dhcpdump-1.8.tar.gz
+sha256  3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1  dhcpdump-1.9.tar.xz
 sha256  bab6ca76b7e93885396513689b1248dfb0e8fd662695b8bd1b26784ef71a0192  LICENSE
diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index ec9571c0af..4ce5047b2e 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DHCPDUMP_VERSION = 1.8
-DHCPDUMP_SITE = http://www.mavetju.org/download
+DHCPDUMP_VERSION = 1.9
+DHCPDUMP_SITE = https://github.com/bbonev/dhcpdump/releases/download/v$(DHCPDUMP_VERSION)
+DHCPDUMP_SOURCE = dhcpdump-$(DHCPDUMP_VERSION).tar.xz
 DHCPDUMP_DEPENDENCIES = libpcap
 DHCPDUMP_LICENSE = BSD-2-Clause
 DHCPDUMP_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
