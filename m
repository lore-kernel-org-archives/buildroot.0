Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66167C001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 17:54:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C328140003;
	Sat, 12 Aug 2023 17:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C328140003
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uAcFsnoQhYxI; Sat, 12 Aug 2023 17:54:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01254403B8;
	Sat, 12 Aug 2023 17:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01254403B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 266761BF574
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 17:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05AB68186B
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 17:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 05AB68186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHEWH9KFe34r for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 17:53:58 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4ACB6813B6
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 17:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ACB6813B6
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 341D11065
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:53:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out002.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPmFiIWgJf9G for <buildroot@buildroot.org>;
 Sat, 12 Aug 2023 19:53:53 +0200 (CEST)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by mx.kolabnow.com (Postfix) with ESMTPS id 26DF9829
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 19:53:51 +0200 (CEST)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id 7FD69246C;
 Sat, 12 Aug 2023 19:53:51 +0200 (CEST)
From: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 19:53:48 +0200
Message-Id: <20230812175348.1449808-1-zgyarmati@zgyarmati.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kolabnow.com; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received:received:received; s=
 dkim20160331; t=1691862833; x=1693677234; bh=dxQ3dDZtdY8ei+hzFja
 td0FFMy52EtN9JxnIBMBklo8=; b=xIJFlNPeX8NSLSm6cde5MGhz6IYoFyNogyr
 uDKpO+yQg+QstzmxD0L69lo9caUSRMBjHoZ7APPXqk2hdjiK05kFBLSFqDH9tnor
 Jbwys5rr5Dxirng58u48m9fvkI86wmm5aCN9O3LWsY0vkfSJ5C9NC41Qttj3tWNc
 U1hKvc9n+yVBAaZRhdCbGKAuRootllBEzXTOr2Y2bVOW93KnmxUxoucZfIW/E0Qi
 m7SjP74ZYjXDRGZ36P40IIfurWkaKjDYN+/5la2DXw5uICuQfhT66lVE5j/zF0B9
 X2gzpKqi5hQD1oYGM8jNM3r5+kksJ3/BQ39Cv+kGuxoDT5QW+c4/a2TYmadfotor
 9f+gdkfYoUiQQARxiYrTqvZ9GXxYkkCnhy3ByO3KDq3dhs0siOBTehnJbb07IlG2
 OCY2XFSJakl9+0C2kZhlH8qg+8hXXIgTV9zcu0sqtJHq6QvK2TJR5oOqnEVnRTmk
 PJ3FONk5nGp2Jf9YXLWZhxdjnG+JIieFKoZnhqS6FEsXsTxPToYoYoInNauxHHnl
 qI3HGcyvLfx6QFM5ymjcAIwamsoE5bhi5IKORbnSx/bK7aKfF/r+s6THVS6AukOp
 KsKaH1ZL9Dtk720uoI+frnbRV+LvF85t9wK3yUcuuqsHvXtoW4yU1Vnuf5ZJekGE
 cmBIRsaY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com
 header.a=rsa-sha256 header.s=dkim20160331 header.b=xIJFlNPe
X-Mailman-Original-Authentication-Results: ext-mx-out002.mykolab.com
 (amavisd-new); 
 dkim=pass (4096-bit key) reason="pass (just generated, assumed good)"
 header.d=kolabnow.com
Subject: [Buildroot] [PATCH 1/1] package/libusb-compat: bump to 0.1.8
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removing upstreamed patch and force autoreconf

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
---
 .../0001-fix-a-build-issue-on-linux.patch     | 32 -------------------
 package/libusb-compat/libusb-compat.hash      |  2 +-
 package/libusb-compat/libusb-compat.mk        |  3 +-
 3 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 package/libusb-compat/0001-fix-a-build-issue-on-linux.patch

diff --git a/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch b/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch
deleted file mode 100644
index d2e26b321c..0000000000
--- a/package/libusb-compat/0001-fix-a-build-issue-on-linux.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From af07587e8775c25450cda8ba9e9a8b1a58072634 Mon Sep 17 00:00:00 2001
-From: Bartosz Golaszewski <brgl@bgdev.pl>
-Date: Mon, 3 Jul 2017 15:55:00 +0200
-Subject: [PATCH] fix a build issue on linux
-
-On linux PATH_MAX is defined in linux/limits.h. If we include usb.h
-without previously having indirectly included it, the build fails.
-
-Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
----
- libusb/usb.h | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/libusb/usb.h b/libusb/usb.h
-index d2c30aa..7ad9a66 100644
---- a/libusb/usb.h
-+++ b/libusb/usb.h
-@@ -41,6 +41,11 @@ typedef unsigned __int32  uint32_t;
- #include <stdint.h>
- #endif
- 
-+/* On linux PATH_MAX is defined in linux/limits.h. */
-+#if defined(__linux__)
-+#include <linux/limits.h>
-+#endif
-+
- /*
-  * USB spec information
-  *
--- 
-2.9.3
-
diff --git a/package/libusb-compat/libusb-compat.hash b/package/libusb-compat/libusb-compat.hash
index 3acf3c3408..a198e76058 100644
--- a/package/libusb-compat/libusb-compat.hash
+++ b/package/libusb-compat/libusb-compat.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  8259f8d5b084fe43c47823a939e955e0ba21942b8d112266c39d228cc14764d6  libusb-compat-0.1.7.tar.bz2
+sha256  698c76484f3dec1e0175067cbd1556c3021e94e7f2313ae3ea6a66d900e00827  libusb-compat-0.1.8.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb-compat/libusb-compat.mk b/package/libusb-compat/libusb-compat.mk
index 7c87b3c9d8..a0b71d9802 100644
--- a/package/libusb-compat/libusb-compat.mk
+++ b/package/libusb-compat/libusb-compat.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_COMPAT_VERSION_MAJOR = 0.1
-LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).7
+LIBUSB_COMPAT_VERSION = $(LIBUSB_COMPAT_VERSION_MAJOR).8
 LIBUSB_COMPAT_SOURCE = libusb-compat-$(LIBUSB_COMPAT_VERSION).tar.bz2
 LIBUSB_COMPAT_SITE = https://github.com/libusb/libusb-compat-0.1/releases/download/v$(LIBUSB_COMPAT_VERSION)
 LIBUSB_COMPAT_DEPENDENCIES = host-pkgconf libusb
@@ -14,6 +14,7 @@ LIBUSB_COMPAT_INSTALL_STAGING = YES
 LIBUSB_COMPAT_CONFIG_SCRIPTS = libusb-config
 LIBUSB_COMPAT_LICENSE = LGPL-2.1+
 LIBUSB_COMPAT_LICENSE_FILES = COPYING
+LIBUSB_COMPAT_AUTORECONF = YES
 
 ifeq ($(BR2_STATIC_LIBS),)
 LIBUSB_COMPAT_CONF_ENV += \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
