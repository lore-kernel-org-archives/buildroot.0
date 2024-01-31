Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519FFC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 21:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E190D614EA;
	Wed, 31 Jan 2024 21:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E190D614EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0cxdgo8o5ua; Wed, 31 Jan 2024 21:06:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE08614E4;
	Wed, 31 Jan 2024 21:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE08614E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44D6F1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D283614E4
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 21:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D283614E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n16O-TPjBQ4v for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 21:06:50 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CAA71614E2
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 21:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CAA71614E2
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e913e3f03so2190965e9.3
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 13:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706735207; x=1707340007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qnLSzwO5DP3u/TGC9rlbr/AS33FNquCTCXFcXsiagR0=;
 b=N+jbL9oXQJWeObEWZZgU7o5HCWe1cdKgE8yIVYhvkQUu6OGFuU4MPX+EzE7fuwEw0h
 WB53tNEkRAuaIZDHbbBf7rZbxqdqgPIwJvNEVEbyXIAaGR/AIBlj0d8piSJVXS8w+Vk3
 C+5jLXtaN+aLkSUA9y8aErTxN1DLws0VDFMaJ+iN/UNIDzdfX1YekJOOIB7cCRsFRQ1Q
 WJYBW0a85KAW/xd1rxYCXuQSMiLJzCixWQ77dBd7V/Z0hYTowpq/GhXz15jYJTJSEXIc
 OpvR3BPFlm9FJgbFRseXLDDBrwV1u6RSFbSRQHStCgANF72VvNpNkosprTlqBjR0NEY7
 /YGA==
X-Gm-Message-State: AOJu0YzGOjV9JIdRz7v2rAgFrUZJrcxZMtORsghDLpmNdwuiNzBcH431
 c/kLGD4JG8kJdy1OA146AyuP9gJYD7jXiqTiyWAURTt9AHNy91oNr+OhBytb8ws=
X-Google-Smtp-Source: AGHT+IFUw4mB2EZYTW/MSYhQiRvYyH7vgOXj9YNT1K5gUU50fHMECIamYFpjo8xfP2/jgNg6efUnSg==
X-Received: by 2002:a5d:6c6c:0:b0:33b:bcf:404d with SMTP id
 r12-20020a5d6c6c000000b0033b0bcf404dmr1507143wrz.61.1706735206885; 
 Wed, 31 Jan 2024 13:06:46 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b0040d8ff79fd8sm2559355wmq.7.2024.01.31.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 13:06:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 22:06:45 +0100
Message-ID: <20240131210645.2212414-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706735207; x=1707340007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qnLSzwO5DP3u/TGC9rlbr/AS33FNquCTCXFcXsiagR0=;
 b=LcWbD/wlUXaCL9alN/1JCDOp8gl1Rj4iN+bGvLPCv9LHmdKktenwW25CKA00nwA4Ri
 OoLT64fcvnwmU0RCygjASwBrxw4eSo7wYC3X209XEcOlVdr6RI+pt5E/jhp6eJkrzJJ1
 6u8YqmDIJvlkUG5DrD+UUXbGDEsh3il9goam5GLYqepM/AqwGd+MIs4/QfRtluZwx/rv
 ci1YXimFLHN+geeUF8/2U5bsHe2UwGQEXmeEDoGeY4wq8DTpgo5pBTqPE35KTKB8HUra
 irtZv9LsYcoUGFcKKwaaKOA9w1qyOfcmlaJTQw5/O6srFJNP/doUQUrFwdHIHcpzkW0M
 zS0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LcWbD/wl
Subject: [Buildroot] [PATCH 1/1] package/freerdp: security bump to version
 2.11.5
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fix CVE-2024-22211
- Update Upstream tag in patches

https://github.com/FreeRDP/FreeRDP/blob/2.11.5/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                                           | 3 ---
 package/freerdp/0001-Fix-variable-declaration-in-loop.patch   | 3 +--
 package/freerdp/0002-Fixed-variable-declaration-in-loop.patch | 3 +--
 .../0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch | 2 +-
 package/freerdp/freerdp.hash                                  | 4 ++--
 package/freerdp/freerdp.mk                                    | 2 +-
 6 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 10745368d7..54caf6c891 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -413,9 +413,6 @@ package/flite/0001-fix-alsa-static.patch Upstream
 package/fltk/0001-disable-tests.patch Upstream
 package/fluxbox/0001-fixes-bug-1138.patch Upstream
 package/freeradius-client/0001-fix-for-nettle.patch Upstream
-package/freerdp/0001-Fix-variable-declaration-in-loop.patch Upstream
-package/freerdp/0002-Fixed-variable-declaration-in-loop.patch Upstream
-package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch Upstream
 package/freescale-imx/imx-kobs/0001-Fix-musl-build.patch Upstream
 package/freescale-imx/imx-kobs/0002-Fix-build-for-recent-toolchains.patch Upstream
 package/freescale-imx/imx-uuc/S80imx-uuc Indent Shellcheck Variables
diff --git a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
index a391e42ee6..799a92734b 100644
--- a/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
+++ b/package/freerdp/0001-Fix-variable-declaration-in-loop.patch
@@ -3,8 +3,7 @@ From: Armin Novak <armin.novak@thincast.com>
 Date: Wed, 16 Sep 2020 09:30:37 +0200
 Subject: [PATCH] Fix variable declaration in loop
 
-[Retrieved from:
-https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed]
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/ddde652460350b962d32036981ff8ed77ed2f1ed
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  client/X11/xf_graphics.c | 3 ++-
diff --git a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
index 14e1d6c8f4..1a4e899430 100644
--- a/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
+++ b/package/freerdp/0002-Fixed-variable-declaration-in-loop.patch
@@ -3,8 +3,7 @@ From: akallabeth <akallabeth@posteo.net>
 Date: Tue, 22 Sep 2020 07:43:56 +0200
 Subject: [PATCH] Fixed variable declaration in loop
 
-[Retrieved from:
-https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa]
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/4f8a48d96e472e43a5f856c449f61669792ce9fa
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  client/X11/xf_graphics.c | 4 ++--
diff --git a/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
index d8dfe13d1b..63434e58f7 100644
--- a/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
+++ b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
@@ -16,7 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/7205]
+Upstream: https://github.com/FreeRDP/FreeRDP/commit/0976cce458f2281cef6e8c417daf4bbd22bcc087
 ---
  winpr/include/winpr/file.h | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 02268f55ea..daf933e0af 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.11.0.tar.gz.sha256
-sha256  8d08e638df21e67c3761462b4efb9e596576f58bd6886f902e6021cdd17d396e  freerdp-2.11.0.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.11.5.tar.gz.sha256
+sha256  70785ad9934d75aed1734f8918a05aff95788e58e53081e84651106b24303dc2  freerdp-2.11.5.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 6f71ef796f..29b33f61c3 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.11.0
+FREERDP_VERSION = 2.11.5
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
