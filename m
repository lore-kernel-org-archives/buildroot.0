Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5712C54F4C
	for <buildroot@archiver.kernel.org>; Tue, 28 Jul 2026 14:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D420409A5;
	Tue, 28 Jul 2026 14:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YcHqO6RTj6ka; Tue, 28 Jul 2026 14:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CA3B1409A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785247271;
	bh=OM1QtPU4jdF5EddDZ5slEbIF3Le546zFGO22w5GwWIw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IjCoqcdoy1Hwoyhgg+CNRRik3oXhrUWic0bL8JthVY+HlILLhzf5T6EazaBhDh/S/
	 LbZG5VBbXgRdZoskRB7I78MkAL2jEXW7e9qKl/mo5IVRsyl6ZN4tuuYF81JidHFTYC
	 AJfLmXLl4kFvi7mCEBwhN/Gn5p6UK065dBqLXrtv4tastUFRsaL51mn4qCwxZU93Po
	 J0ie1X8+2KkHcCzxAEfQykO6pBs0iQxGAnAID0C9Zh5iuqQw6MgvjaFXhNBXLuodj4
	 Fb68YRYo/xvtUJy3b5nXShAYrtXhvqHGW/5DYr65mNu2j+JC/ChXYOGY45Gxiejyu3
	 UMnI1yd/9VxCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA3B1409A7;
	Tue, 28 Jul 2026 14:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D20C7788
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C177B408E0
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UJcrTflcD-w for <buildroot@buildroot.org>;
 Tue, 28 Jul 2026 14:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F11240A8F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F11240A8F
 for <buildroot@buildroot.org>; Tue, 28 Jul 2026 14:00:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D705C8B411; Tue, 28 Jul 2026 14:00:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 15:57:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3aa6774563d20901fd1370f51ef105180665b54
X-Git-Newrev: 766d3a6e87003bda9ae7ff3f92e17b7fdced82aa
X-Patchwork-Hint: ignore
Message-Id: <20260728140016.D705C8B411@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdisplay-info: bump version to
 0.4.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/766d3a6e87003bda9ae7ff3f92e17b7fdced82aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lore.freedesktop.org/wayland-devel/m8VW4lhPjVf_0WLHD9BxrcFL67zweO2GpHqTEWBsrK4SQzFV1iuVJ9I3I_hAASg9hNA5hWmQxxEFetyGsNOtM7Z5Cwefi66h-FzVKMGKkIs=@emersion.fr/T/#u

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-cta-include-sys-types.h.patch             | 35 ----------------------
 package/libdisplay-info/libdisplay-info.hash       |  7 ++---
 package/libdisplay-info/libdisplay-info.mk         |  2 +-
 3 files changed, 4 insertions(+), 40 deletions(-)

diff --git a/package/libdisplay-info/0001-cta-include-sys-types.h.patch b/package/libdisplay-info/0001-cta-include-sys-types.h.patch
deleted file mode 100644
index 59049b0a94..0000000000
--- a/package/libdisplay-info/0001-cta-include-sys-types.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From e569a92539c96acd2a618729827c8fbf3659d803 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Tue, 7 Oct 2025 22:44:01 +0200
-Subject: [PATCH] cta: include sys/types.h
-
-Fixes build error with uClibc-based toolchain and gcc 15.2.0 found by
-Buildroot autobuilders[1]:
-
-../cta.c: In function 'parse_vendor_hdmi_block':
-../cta.c:168:15: error: unknown type name 'ssize_t'; did you mean 'size_t'?
-
-[1] https://autobuild.buildroot.org/results/2d72feabdd0c9e1c9aa89e6d683d5f5ae0bb942d/
-
-Upstream: https://gitlab.freedesktop.org/emersion/libdisplay-info/-/commit/84e8da3de9a89a95c4305abf6f578feae66dfa69
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cta.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cta.c b/cta.c
-index 12187cc..53edfca 100644
---- a/cta.c
-+++ b/cta.c
-@@ -4,6 +4,7 @@
- #include <math.h>
- #include <stdlib.h>
- #include <string.h>
-+#include <sys/types.h>
- 
- #include "bits.h"
- #include "cta.h"
--- 
-2.47.3
-
diff --git a/package/libdisplay-info/libdisplay-info.hash b/package/libdisplay-info/libdisplay-info.hash
index 8c6f077679..c748a92b65 100644
--- a/package/libdisplay-info/libdisplay-info.hash
+++ b/package/libdisplay-info/libdisplay-info.hash
@@ -1,6 +1,5 @@
-# From https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/0.3.0/downloads/libdisplay-info-0.3.0.tar.xz.sha256sum
-sha256  6ae77cd937f9cf7d1321d35c116062c4911e8447010a6a713ac4286f7a9d5987  libdisplay-info-0.3.0.tar.xz
-# From https://lore.freedesktop.org/wayland-devel/47m6wyRq0q-sgX6zWXuZfexFdml2vTqsHKkdCBXBWywBql7gG9F9or9JsCm690MBXEmnnUEML0JnCIbUNma_a7tFKUPZ6bHPYa86b0gjYB0=@emersion.fr/
-sha512  3266633d75ccd345dda5a8aad75f310e55a77654b48f17a247b35e18060b6db1047a69083cd286b43ec893125a36c4c43659af8f74a04da3278eea9fdd91efe9  libdisplay-info-0.3.0.tar.xz
+# From https://lore.freedesktop.org/wayland-devel/m8VW4lhPjVf_0WLHD9BxrcFL67zweO2GpHqTEWBsrK4SQzFV1iuVJ9I3I_hAASg9hNA5hWmQxxEFetyGsNOtM7Z5Cwefi66h-FzVKMGKkIs=@emersion.fr/T/#u
+sha256  43b180baa143e2035654759d84e2b2f5ee77d5fe817c423838c7fe59c0d68459  libdisplay-info-0.4.0.tar.xz
+sha512  3f237788b1b2c6154f81e7a905eae778e21fa1e94e6a2e025ad6ad4971146cf312e2e663aae46f4808a180c77e650d9ab627abee0e352c327dc7d6798887af24  libdisplay-info-0.4.0.tar.xz
 # Locally computed
 sha256  15b396244e58830c5614b9394f4deccfe684970cd507f299383ab57ad339eedd  LICENSE
diff --git a/package/libdisplay-info/libdisplay-info.mk b/package/libdisplay-info/libdisplay-info.mk
index ea5cf1af2d..64ed5f2e5d 100644
--- a/package/libdisplay-info/libdisplay-info.mk
+++ b/package/libdisplay-info/libdisplay-info.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDISPLAY_INFO_VERSION = 0.3.0
+LIBDISPLAY_INFO_VERSION = 0.4.0
 LIBDISPLAY_INFO_SOURCE = libdisplay-info-$(LIBDISPLAY_INFO_VERSION).tar.xz
 LIBDISPLAY_INFO_SITE = https://gitlab.freedesktop.org/emersion/libdisplay-info/-/releases/$(LIBDISPLAY_INFO_VERSION)/downloads
 LIBDISPLAY_INFO_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
