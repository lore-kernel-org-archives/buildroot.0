Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774FCCD98F0
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 11:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 030136F7A5;
	Wed, 17 Jun 2026 11:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7m1gh7ZBV9Kz; Wed, 17 Jun 2026 11:40:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFE6960EB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781696453;
	bh=86CFhMSuffKdiCHO+KMvOLdCiyEd79cD8JIKyVzXIiA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pEvjVGtU4tyIWCCzE3AvvTyA6Ygf6mshULZyZujTOwd9f5uLgoIZ2c5ddFMj8Tfd4
	 Sa0nTPBEbByfG/dbfPiMz1+9/gHvAQS8yGZUtRkKlGWmk8YZgR65Y7lsxWmKQJiRjH
	 fOhc/UtPdhXIdLT0efE7mnZHXviI8cGsEP+yyzZLguDWjBwKHvqejytYGhRGgGtxzS
	 Z8jBLyQrAyuDs7nS6WU8ZRNl91CWiBFF+3G2Ml9zJE/cWoeJ/5+PV7aTu0QacG6qxg
	 a4in9DTezaWXEegCO02AsP1v/TENAUzVd9sTB9bjjca+hFBDFRD+iZUcUpvDP5xrji
	 KY4My7gs04PNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DFE6960EB2;
	Wed, 17 Jun 2026 11:40:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CC7FB347
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 11:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEB3285AE7
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 11:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqs54e1eWFAO for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 11:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F33885AA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F33885AA8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 11:40:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EBDBD811FA; Wed, 17 Jun 2026 11:40:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 13:39:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3dd9f989787864b9a5ed280f9a6b5d48d9cc6906
X-Git-Newrev: b94ada76083824475e92c51b14042dc8f2a66717
X-Patchwork-Hint: ignore
Message-Id: <20260617114028.EBDBD811FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbutils: only needs libudev,
 not udev daemon
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b94ada76083824475e92c51b14042dc8f2a66717
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libudev-zero version 1.0.4 added support for usb.ids with commit
https://github.com/illiliti/libudev-zero/commit/2bebebc9e0444ec53afd7f1f37aa80ff6b95f5f7

Also select hwdata when libudev-zero implementation for udev is used to
more useful output from usbutils. This is strictly speaking an optional
dependency but would be confusing if it weren't working.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Marcus: add note about selecting hwdata]
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/usbutils/Config.in   | 8 +++++---
 package/usbutils/usbutils.mk | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 7e7029bbfe..fb37b8a9e3 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on BR2_PACKAGE_HAS_UDEV # needs hwdb
+	depends on BR2_PACKAGE_HAS_LIBUDEV
+	select BR2_PACKAGE_HWDATA if BR2_PACKAGE_LIBUDEV_ZERO
+	select BR2_PACKAGE_HWDATA_USB_IDS if BR2_PACKAGE_LIBUDEV_ZERO
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBUSB
 	help
@@ -10,7 +12,7 @@ config BR2_PACKAGE_USBUTILS
 
 	  http://linux-usb.sourceforge.net/
 
-comment "usbutils needs udev /dev management and toolchain w/ threads, gcc >= 4.9"
+comment "usbutils needs libudev and a toolchain w/ threads, wchar, dynamic library, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV || \
+		!BR2_PACKAGE_HAS_LIBUDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 5b6037afa2..afeb7ded2a 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -7,7 +7,7 @@
 USBUTILS_VERSION = 019
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
-USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
+USBUTILS_DEPENDENCIES = host-pkgconf libudev libusb
 USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
 USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
