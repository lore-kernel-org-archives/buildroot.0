Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9392C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 18:57:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 705EC40AFA;
	Thu, 17 Mar 2022 18:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5ev7rnSCZwn; Thu, 17 Mar 2022 18:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F5D440497;
	Thu, 17 Mar 2022 18:57:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3DD21BF349
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A193540497
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 18:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XWXLr4muu3VW for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 18:57:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DD89402A8
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 18:57:24 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t11so8658732wrm.5
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 11:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L/irEfvFSROsfeQTvOsOrYKxTHnIli3OsxXo1I8imD0=;
 b=ZM7+lGVWdSu2ACTaNSdVRKLrYzcv6dSrcQmQlvOI7yxE+IxMMj7pdTjhmZOw628toR
 dj5ZqIlHTh48Rl15WSAw/qbIx+MHaht2H7xC+v7/l0AsOeoqN5bpfuK2zVMbeIMme75W
 qWtL0vojlfGHUgw51vqm8m9tfJg5wClhSy8jmjkvpKqYPh7wjUA8zwngNGKxLCks2icR
 FFgAe8DMk2p14vixJFHbjkXa0ZSS6J/dCPUe6BznHIMo7wiMK4dNdaSEUWst1qnpwvoX
 V0MuTgXUmm9H13BRLIq0PyXptEXtyc7Ipof0qQIXUBgf1JhB89nz1IdiIiJFxyfNy3bs
 p1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L/irEfvFSROsfeQTvOsOrYKxTHnIli3OsxXo1I8imD0=;
 b=nunmTprW/34ezbHnIyO4uqcexfCPa2ymccWZjGpzFI/3qwcTijjlcTeuaa4I+BiWyV
 ifquRIieq0hE/TJOfIHMhA0NKHGrWmUyw8pemzrmgklL4vLQ5420xgkLYjHZDTF6hK7k
 Z1YO5sp9rQ+fVuKOEb5xbdyyNu76ejmMCtPZqvZdGq7MXTITTJDZWt4v4uf9iW5rTm7S
 py/oYhh0XVGCHeUu0o134lPgrITJXOooA0JOXXh0YVKBTqVTgcBrgDorXYU+BsLsGXu5
 o+/Xab5bXapqhCxQUpELrgHxUEaswRpMMhPWzM5ajaUS/08V936PUxWe6QHdDkC48YX1
 NHCA==
X-Gm-Message-State: AOAM533Y+6RtHiH9qso0g/2XXlwyGHMhGq79PVWYw1N6GiiDYOIAsCYp
 23KIRek04ZCiCrbOY7iWgKqpT3RAHmY=
X-Google-Smtp-Source: ABdhPJz3MfPyjQjWPb98F0auP1b2wdeRu90ovWCn1InCqEMJc2KofQcKmcTuWyMl/pNo6vGNUQSvdA==
X-Received: by 2002:a5d:55d0:0:b0:1ed:bda2:4e11 with SMTP id
 i16-20020a5d55d0000000b001edbda24e11mr5289432wrw.6.1647543442124; 
 Thu, 17 Mar 2022 11:57:22 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a056000144a00b00203df06cf9bsm4552130wrx.106.2022.03.17.11.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 11:57:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 19:56:15 +0100
Message-Id: <20220317185615.179351-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2, 1/1] package/libminiupnpc: drop dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libminiupnpc can be statically built with or without binfmt flat since
version 1.7 and
https://github.com/miniupnp/miniupnp/commit/c183a72c46cae9e37ddf635318dfb0bdcd56ed9d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Rebase patch on current master

 package/libminiupnpc/Config.in       | 6 ------
 package/libminiupnpc/libminiupnpc.mk | 8 ++++++++
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libminiupnpc/Config.in b/package/libminiupnpc/Config.in
index a3410a0225..51f4b43bbb 100644
--- a/package/libminiupnpc/Config.in
+++ b/package/libminiupnpc/Config.in
@@ -1,7 +1,5 @@
 config BR2_PACKAGE_LIBMINIUPNPC
 	bool "libminiupnpc"
-	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_STATIC_LIBS
 	help
 	  The UPnP protocol is supported by most home adsl/cable routers
 	  and Microsoft Windows 2K/XP. The aim of the MiniUPnP project
@@ -14,7 +12,3 @@ config BR2_PACKAGE_LIBMINIUPNPC
 	  ANSI C.
 
 	  http://miniupnp.free.fr
-
-comment "libminiupnpc needs a toolchain w/ dynamic library"
-	depends on BR2_STATIC_LIBS
-	depends on !BR2_BINFMT_FLAT
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 0633ccd234..52fe9849f2 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -18,4 +18,12 @@ LIBMINIUPNPC_CPE_ID_VERSION = $(LIBMINIUPNPC_VERSION_MAJOR)
 LIBMINIUPNPC_CPE_ID_UPDATE = $(LIBMINIUPNPC_VERSION_MINOR)
 LIBMINIUPNPC_CONF_OPTS = -DUPNPC_BUILD_SAMPLE=OFF -DUPNPC_BUILD_TESTS=OFF
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=OFF -DUPNPC_BUILD_STATIC=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=OFF
+else
+LIBMINIUPNPC_CONF_OPTS += -DUPNPC_BUILD_SHARED=ON -DUPNPC_BUILD_STATIC=ON
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
