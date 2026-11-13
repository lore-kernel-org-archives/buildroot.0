Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731D4606A323
	for <buildroot@archiver.kernel.org>; Fri, 13 Nov 2026 14:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NXjGiupZ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5171840938;
	Fri, 13 Nov 2026 14:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsTTELj_MS7c; Fri, 13 Nov 2026 14:54:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5BC7F40854
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794581685;
	b=Hb4Jt7ZLtO2ldBLIsClS8/YUL6L4gPi7XpKiy5ViONKjIusI9b2dy5uMpKmCCho3MYlN
	 H8DlBjs4/O8vNBgHhhGWR1QCwxKroz0+dTNTMwTsopo3UCWgvvFpqDb6DivHlZ2SEsGQj
	 XKNvbUmbC4m1mTcmdg9qwqKdRAHOVZtW8AxzSbhQJF8Jq441GyH2cqqocOZD6KKDr4Pe7
	 qiKq7JejkNLcX6GrWErT+2RNWAliJIFY3eTaCFybkafaBxRkfwMxwWtKpqmoFmyogMU2z
	 renWbqYQbOUb9/go4PQymx3agVxjLd5M6966uYoqRNSdFF4kv3f2WtaK27TgfoaOLNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794581685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:From:
	 To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jk7abftKqe4ZzIgvCZKPVbWKO/e+5AYWe1yX/1r9wA4=;
	b=QuAj6hrMDHjbHy6K8X/iT8yQLH7DG/cKfhsIOpoUwROpIvbewqJnSw91my6hmLSCr7VR
	 8G3/VjTARF9YPVF1CfyhHp0Edxb5NxpGwQtFRFAQWQTHXohxFgCBnSHL3k7uZG6XCQ4Qu
	 HlCfM6exOst+8C8C42EzX79hUBPViWH6TcNoPpXs78XeS3MREXidM1iqPtMp5OGC0GLvr
	 nzYQO0yc2q7Ve7TkHVS3YA6kTyMTKQgn3duaVZAdiA77fl/YeeA7VyYcBQZThLqGKEBAA
	 xiwqC+x3MuM+sxCSDzDKkjJ4h9ZhWQ8VS1pCAsocEO/cT6fBkTAoLGoUftdqFU5hglg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794581685;
	bh=jk7abftKqe4ZzIgvCZKPVbWKO/e+5AYWe1yX/1r9wA4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXjGiupZQHxXV9eyspoWJo/7RRu+QLTc7+HMgclH2g43vyAknxF/cs+Nn+zOhwxVc
	 pEr7HhHh20r7u/fTJ/0LZEN3WC+J1YeS3KtkdwxWOBZqBIB50FwxC/+kk1ObMjx1c9
	 HzaO1OESOcn8cQBWaPsgEQS8L3IMpSUpT5r5KbbJ1A/ES1UQxaOSml846aIdqhTuY2
	 ZdNM7bBNJ0cGz0Ukv3QKhpLaOG50tHkftZafJIgv/Jb8hgeqWuAi18Ckdhca7/UdGQ
	 cv4SDjUAQ6Gf25pSk1qk3j+1TLNZ3svhKmMO0VV7NOkKnTBwEwPG6uacfMe3cJ4A0l
	 U7mL1DwxAla9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC7F40854;
	Fri, 13 Nov 2026 14:54:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E09BAAF8
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C4FF760D96
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBbF3Ez9cTvA for <buildroot@buildroot.org>;
 Fri, 13 Nov 2026 14:54:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8BB0A606A3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=77.87.242.242
Received-SPF: Softfail (mailfrom) identity=mailfrom; client-ip=77.87.242.242;
 helo=harvie.cz; envelope-from=tomas.mudrunka@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from harvie.cz (harvie.cz [77.87.242.242])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BB0A606A3
 for <buildroot@buildroot.org>; Fri, 13 Nov 2026 14:54:42 +0000 (UTC)
Received: from anemophobia.amit.cz (unknown [193.179.247.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by harvie.cz (Postfix) with ESMTPSA id 28D1F18403D;
 Fri, 13 Nov 2026 15:52:29 +0100 (CET)
From: Tomas Mudrunka <tomas.mudrunka@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>
Date: Fri, 13 Nov 2026 15:52:00 +0100
Message-ID: <20261113145201.2357363-5-tomas.mudrunka@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
References: <20260324130037.1411867-1-tomas.mudrunka@gmail.com>
 <20261113145201.2357363-1-tomas.mudrunka@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/5] package/hidapi: make the hidraw backend
 optional
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_SOFTFAIL,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The hidraw backend is the only part of hidapi that needs udev (for
libudev); the libusb backend only needs libusb. Make the hidraw backend
optional through a new BR2_PACKAGE_HIDAPI_HIDRAW option, available
when a udev provider is enabled and enabled by default, so existing
configurations are unchanged.

This allows hidapi (libhidapi-libusb) to be used on small systems
without udev. The BR2_USE_MMU dependency, which was only needed for
udev, is dropped from hidapi.

All in-tree users of hidapi, except libmanette, can use either backend
(they look up hidapi-hidraw and hidapi-libusb, or load either library
at runtime). libmanette only looks up hidapi-hidraw.pc, so make it
select BR2_PACKAGE_HIDAPI_HIDRAW.

Signed-off-by: Tomas Mudrunka <tomas.mudrunka@gmail.com>
---
 package/hidapi/Config.in     | 23 ++++++++++++++++++-----
 package/hidapi/hidapi.mk     | 10 ++++++++--
 package/libmanette/Config.in |  3 ++-
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/package/hidapi/Config.in b/package/hidapi/Config.in
index 72ae32a6d8..aec90e9501 100644
--- a/package/hidapi/Config.in
+++ b/package/hidapi/Config.in
@@ -1,9 +1,7 @@
 config BR2_PACKAGE_HIDAPI
 	bool "hidapi"
-	depends on BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	depends on BR2_USE_MMU # udev
 	depends on BR2_USE_WCHAR # wcsdup()
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
@@ -14,11 +12,26 @@ config BR2_PACKAGE_HIDAPI
 	  to interface with USB and Bluetooth HID-Class devices on
 	  Windows, Linux, and Mac OS X.
 
+	  The libusb backend (libhidapi-libusb) is always built.
+
 	  http://github.com/libusb/hidapi/
 
-comment "hidapi needs udev /dev management and a toolchain w/ NPTL, gcc >= 4.9, wchar"
-	depends on BR2_USE_MMU
+if BR2_PACKAGE_HIDAPI
+
+config BR2_PACKAGE_HIDAPI_HIDRAW
+	bool "hidraw backend"
+	default y
+	depends on BR2_PACKAGE_HAS_UDEV
+	help
+	  Build the hidraw backend (libhidapi-hidraw), which uses the
+	  kernel hidraw interface and needs libudev.
+
+comment "hidraw backend needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
+endif
+
+comment "hidapi needs a toolchain w/ NPTL, gcc >= 4.9, wchar"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
-		!BR2_PACKAGE_HAS_UDEV || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_USE_WCHAR
diff --git a/package/hidapi/hidapi.mk b/package/hidapi/hidapi.mk
index 5f0c482a95..884912f175 100644
--- a/package/hidapi/hidapi.mk
+++ b/package/hidapi/hidapi.mk
@@ -10,14 +10,20 @@ HIDAPI_INSTALL_STAGING = YES
 HIDAPI_LICENSE = GPL-3.0 or BSD-3-Clause or HIDAPI license
 HIDAPI_LICENSE_FILES = LICENSE.txt LICENSE-gpl3.txt LICENSE-bsd.txt LICENSE-orig.txt
 
-HIDAPI_DEPENDENCIES = libusb udev
+HIDAPI_DEPENDENCIES = libusb
 
 HIDAPI_CONF_OPTS = \
-	-DHIDAPI_WITH_HIDRAW=ON \
 	-DHIDAPI_WITH_LIBUSB=ON \
 	-DHIDAPI_WITH_TESTS=OFF \
 	-DHIDAPI_BUILD_HIDTEST=OFF
 
+ifeq ($(BR2_PACKAGE_HIDAPI_HIDRAW),y)
+HIDAPI_CONF_OPTS += -DHIDAPI_WITH_HIDRAW=ON
+HIDAPI_DEPENDENCIES += udev
+else
+HIDAPI_CONF_OPTS += -DHIDAPI_WITH_HIDRAW=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 HIDAPI_DEPENDENCIES += libiconv
 endif
diff --git a/package/libmanette/Config.in b/package/libmanette/Config.in
index 0f3a5a7bb0..9377f35a42 100644
--- a/package/libmanette/Config.in
+++ b/package/libmanette/Config.in
@@ -2,11 +2,12 @@ config BR2_PACKAGE_LIBMANETTE
 	bool "libmanette"
 	depends on BR2_USE_MMU # libglib2, hidapi
 	depends on BR2_USE_WCHAR # libglib2, hidapi
-	depends on BR2_PACKAGE_HAS_UDEV # hidapi
+	depends on BR2_PACKAGE_HAS_UDEV # hidapi-hidraw
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # hidapi
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # hidapi -> libusb
 	select BR2_PACKAGE_HIDAPI
+	select BR2_PACKAGE_HIDAPI_HIDRAW # needs hidapi-hidraw.pc
 	select BR2_PACKAGE_LIBEVDEV
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGUDEV
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
