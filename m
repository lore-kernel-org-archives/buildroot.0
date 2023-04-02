Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E787C7619A
	for <buildroot@archiver.kernel.org>; Sun,  2 Apr 2023 12:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C774C60EB3;
	Sun,  2 Apr 2023 12:34:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C774C60EB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5jncwLeDJ14U; Sun,  2 Apr 2023 12:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11A460C2A;
	Sun,  2 Apr 2023 12:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11A460C2A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5BD201BF8C7
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:34:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3586D400EC
 for <buildroot@lists.busybox.net>; Sun,  2 Apr 2023 12:34:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3586D400EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id adwPMLI4zRFD for <buildroot@lists.busybox.net>;
 Sun,  2 Apr 2023 12:34:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1346D400EF
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1346D400EF
 for <buildroot@buildroot.org>; Sun,  2 Apr 2023 12:34:23 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j24so26711774wrd.0
 for <buildroot@buildroot.org>; Sun, 02 Apr 2023 05:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680438861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1MMjSKnJ+BJF0QWCmxJxedYbA5DaFooV42s4KYVMQjc=;
 b=kUHMDiSlUUtNhmcS7yZgGQqeQFeXDNcivyCHKmutE2/aaNVvO/ewi1dBcRG8SjE4Zn
 FwNg50mGWmjkPyLJkEv36B6YgtPJ49thKfoozR79tWhIMEeZYE5P/5f5CaUPWpo8N6ow
 2BgP7xNeYkm4ATNhQ4cEBmOGOHO+oGf70mNJSoKiyVhe6Do4oIX25FQe7RtFhy9drWiM
 /UoKeXQHaWj6KRcQUO7b4UZDO15JFDzKdxUQgBIbKytIDaX5vkyP2ejsVqbVa+II6C3k
 oTQUGU0LcULRjsZk1i9rnJTxH9H18ktSrKghEy15HG1mM+i4eAwSA7Y/sftdBGezdhpa
 cVrw==
X-Gm-Message-State: AAQBX9fBQursTqCfUUJ58cAwan16H+EXgjqBxAWVZ3JOm1Qm5KSWUx3J
 tVDakE6DYlLB6gQ27YFbpl3OMsleMiI=
X-Google-Smtp-Source: AKy350YC3hFwDpdYw771hoZ28nh2B+o6LuuZOJRFaNtrv81WSBRA078X8aaZ5SR/jzlhthU7XXmoXQ==
X-Received: by 2002:adf:f3cf:0:b0:2ce:abff:7156 with SMTP id
 g15-20020adff3cf000000b002ceabff7156mr27857900wrp.48.1680438861462; 
 Sun, 02 Apr 2023 05:34:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r5-20020adfe685000000b002e61e002943sm6438254wrm.116.2023.04.02.05.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Apr 2023 05:34:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  2 Apr 2023 14:33:48 +0200
Message-Id: <20230402123348.1037857-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680438861;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1MMjSKnJ+BJF0QWCmxJxedYbA5DaFooV42s4KYVMQjc=;
 b=acis4/Z5nbKfGuy/bonBy9rVQ03WN4Vid//19S/GFsmBoafWB1AFS3xg9k+zAA6Gm0
 P7fkGvyNCFSb72t39o8h1ef2MOIa/wTHVfbRupsbIZMHV0IbslYaMufeSA615QTm14h0
 krC0EuHxEFIgHq/AVOAWShKFKIDc1vzeWHYV+ePZrDyH3tPkKnNva3b451n7Es8s2OTE
 gdFGyOSeFmt06NnCt96bYx82aG+zGu8ewEdWWbMQF9iRvbyXz2IfWPvtAATh/ck7at8y
 1eeMFVJG53FDQWfkVtDM8fPt8WvIHsjnEVqw95rmACqjN7bQqR/UDoHwHEV+Mc1ho3EA
 JIpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=acis4/Z5
Subject: [Buildroot] [PATCH 1/1] package/irrlicht: bump to version 1.8.5
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop second patch (not needed since
https://sourceforge.net/p/irrlicht/code/5349/)

https://irrlicht.sourceforge.io/forum/viewtopic.php?f=2&t=52775

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-LDFLAGS-and-remove-obsolete-X11R6-.patch} |  0
 .../irrlicht/0002-remove-sys-sysctl.h.patch   | 38 -------------------
 package/irrlicht/irrlicht.hash                |  8 ++--
 package/irrlicht/irrlicht.mk                  |  2 +-
 4 files changed, 5 insertions(+), 43 deletions(-)
 rename package/irrlicht/{0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch => 0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch} (100%)
 delete mode 100644 package/irrlicht/0002-remove-sys-sysctl.h.patch

diff --git a/package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch b/package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
similarity index 100%
rename from package/irrlicht/0003-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
rename to package/irrlicht/0002-makefile-override-LDFLAGS-and-remove-obsolete-X11R6-.patch
diff --git a/package/irrlicht/0002-remove-sys-sysctl.h.patch b/package/irrlicht/0002-remove-sys-sysctl.h.patch
deleted file mode 100644
index d9142a9a22..0000000000
--- a/package/irrlicht/0002-remove-sys-sysctl.h.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5382142d37730f6758753b758c91e257ffd5892c Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@gmail.com>
-Date: Sun, 9 Apr 2017 22:20:19 +0200
-Subject: [PATCH] remove sys/sysctl.h
-
-With musl irrlicht doesn't build due to missing sys/sysctl.h
-
-fatal error: sys/sysctl.h: No such file or directory
-
-From [1]
-"sysctl does not work, and NEVER worked. using it is bogus.
-it was a bogus experimental syscall that was deprecated before
-it was ever used (basically, a broken binary version of
-/proc/sys, without any stability between kernel versions for
-what the binary constants meant)."
-
-[1] https://devsonacid.wordpress.com/tag/musl/
-
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- source/Irrlicht/COSOperator.cpp | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/source/Irrlicht/COSOperator.cpp b/source/Irrlicht/COSOperator.cpp
-index 0899d1d..ccf5ef5 100644
---- a/source/Irrlicht/COSOperator.cpp
-+++ b/source/Irrlicht/COSOperator.cpp
-@@ -13,7 +13,6 @@
- #include <unistd.h>
- #ifndef _IRR_SOLARIS_PLATFORM_
- #include <sys/types.h>
--#include <sys/sysctl.h>
- #endif
- #endif
- 
--- 
-2.9.3
-
diff --git a/package/irrlicht/irrlicht.hash b/package/irrlicht/irrlicht.hash
index e7cd3ec918..7f9bceb0c1 100644
--- a/package/irrlicht/irrlicht.hash
+++ b/package/irrlicht/irrlicht.hash
@@ -1,8 +1,8 @@
-# From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.4
-md5  9401cfff801395010b0912211f3cbb4f  irrlicht-1.8.4.zip
-sha1  38bf0223fe868d243d6a39d0dc191c8df6e03b3b  irrlicht-1.8.4.zip
+# From https://sourceforge.net/projects/irrlicht/files/Irrlicht%20SDK/1.8/1.8.5
+md5  1fcf67c2906eb84b531af512de8481b1  irrlicht-1.8.5.zip
+sha1  96908ebc379e0172261c240dc018416ce6a3e4e3  irrlicht-1.8.5.zip
 # Locally calculated
-sha256  f42b280bc608e545b820206fe2a999c55f290de5c7509a02bdbeeccc1bf9e433  irrlicht-1.8.4.zip
+sha256  effb7beed3985099ce2315a959c639b4973aac8210f61e354475a84105944f3d  irrlicht-1.8.5.zip
 sha256  cc86e0b830f9d48933feb198f2741a7d9bb7c34fe8a35302d8ce36b8e2ecb27b  doc/aesGladman.txt
 sha256  e8a6b63336018eec09ac3a7cdfe5a80bda635641bc0397a77b8baa25bed03800  doc/bzip2-license.txt
 sha256  ca38f1ba4ab901111f6eee50009bd46dbd866e6beb98d592d843f7c162d73409  doc/irrlicht-license.txt
diff --git a/package/irrlicht/irrlicht.mk b/package/irrlicht/irrlicht.mk
index bd82815cde..c1da50a53c 100644
--- a/package/irrlicht/irrlicht.mk
+++ b/package/irrlicht/irrlicht.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IRRLICHT_VERSION_MAJOR = 1.8
-IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).4
+IRRLICHT_VERSION = $(IRRLICHT_VERSION_MAJOR).5
 IRRLICHT_SOURCE = irrlicht-$(IRRLICHT_VERSION).zip
 IRRLICHT_SITE = https://downloads.sourceforge.net/project/irrlicht/Irrlicht%20SDK/$(IRRLICHT_VERSION_MAJOR)/$(IRRLICHT_VERSION)
 IRRLICHT_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
