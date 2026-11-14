Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4E606A329
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sOobUx4d;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=BngFDlsA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CB7340718;
	Sat, 14 Nov 2026 21:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOx5c9xtBOfF; Sat, 14 Nov 2026 21:41:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2027040746
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794692516;
	b=flyJMifsNXhik4Fe5eZ1d2UcKUCFs24tmD1c1gBqJFsEerujZbFDG9OPAyYcSfWSrRlc
	 pFnoRa6ycpNGnJWvXGIfJKFoxI5VXuey9zbTVrGXI30BI4U6SsCNUZMm4/BYN9xGK5Stf
	 BfCqPABRxfWr9Zp1H6XhRRs6SjfJi+lZHE4Gtz3naPq2HBYlAgWH3kUNwTHJJ/s/FYKhH
	 pqXDVJtH0UlAVfNtMh6G3nor3IML4GVrcbKK3uUcBdWddJY44v6aEmSfvX95Nm5k1wUPd
	 5wydNH9eL1kPG0Lv8fljXRtBukDfSLpEmMbgu0sU2k8FqfsHxkHj0KvHHsiyJDfMcdw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794692516;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=4X+I4i3/NnFKmHDKLRC5IJbBkHPhoOqCvVaeNBNG7mg=;
	b=Iw13kaeVIdhN3/yoKRUzzWDl3RewxBg5Mt5TWmKC3AK/DE78uhgQPRiCdGUy4sEEmvfn
	 DrLTTJFKqF5Syp1/iJFHy9TDYuhOdbI3kIEAz85GDlUz7dCqlg8nI9qnsUsKlk9rGVIA8
	 qxXp5beHCiD5biJtKyUWEaFS1tngHvqk+ull8p8giTDpRZYFyI/ojxr7Z4HfjkDyjNbMg
	 muHR0TgzJ6xOlZVz0rD1lzbCfmybsKS1fz5Oh3yxJSyi1tnFBGYNTpdeRSpGPXq5cM264
	 6ZLGT+Yw/Ht8AAhD7wuxUuMZOhzfMGOUXO7mdxvQEnoRqPgKXtrH9IUnDELxURMxqHQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=BngFDlsA;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794692516;
	bh=4X+I4i3/NnFKmHDKLRC5IJbBkHPhoOqCvVaeNBNG7mg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sOobUx4dC6CzeGDJlrBvmIpIm9vRgZWYiPkCo5P1VLcciP0EHU96EhlGzMzDrvXQt
	 tAJuyKAVQ6Xe+igAyBqcIU8QrswQjD71dcUaaBgPl+wy1bzG1vRY8FSRhk/O4/WR06
	 EAYAkRw7OXAVD+dJnTSBIo0ZELNAT5jpmlLqu6Hr/2mjKEY4sYPiBTGQkovPZJ1WXA
	 fWELMGzCDIOgabDiBChVyHqTy53OCJfg+n2FEJmhAwc4hhFrg/Y78oj5MyulxRzHoO
	 Yticr3Z97+F2TwnSlyCbc3td0MYEUYn8/zxwX4gm+4pUDeUhvNy3cF5RKLL42dNJ9P
	 0S0oZooyiAEeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2027040746;
	Sat, 14 Nov 2026 21:41:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3C70169
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D584040746
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dfa2AGSWDjFK for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 21:41:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3793440718
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.132
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.132;
 helo=smtpcmd04132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=BngFDlsA
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3793440718
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 21:41:48 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id SLVKxXrvEtleFSLVKxL6jT; Sat, 14 Nov 2026 22:41:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794692507; bh=jj3Hzqge50ON0rF0xLQrTImkOkq7aOmvElHS5G3GW8Q=;
 h=From:To:Subject:Date:MIME-Version;
 b=BngFDlsAJ14hPxfFicjeD/CN/KeWN9tr+ibGGnuUxGDKoHuo0D7+dfYPLt/+NMYXr
 HuQJA0w05yQJUaxfNr0jrPOHZfQLdnQyxMIKoBj3FCJaUcT+uuyNhJ/Bhl2Eog04AF
 35OMj/stsv6t1n8TLQJStYMsSRJIxa1bALSFXxXzWnwcNBq5nXq8Da3IkEg1As0iOO
 meGm0+0QnqM9P1dIJNcwhinSes8wmBkkMUy9m5VXwsXzoe0ZiySspGrNmhajF7+zmM
 FlAG8HMgQPLgRiK35OahRBO1EhWb66KbpXcQnsnBsxql9bna0kFLWUbe5wZ8P2TQil
 0jUC1ACCYM9sw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 14 Nov 2026 22:41:46 +0100
Message-ID: <20261114214146.1990545-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKs3/iN2XbXxl/vZEs8gZ38cNHEj4eiRpLM5dDgtP8clcuB80feqxHIgPlEWSC7CcTQMh9MNNuHWXtlTS0B2lNq0S16p4tE01XeAdQzqFKyPUrGinWdL
 SmUOkc/cmgSY7BL8a2kgmreEYLtG4/uMybDdQ+FKEn63apvts3ap/q1FKaChyJL7uD1U2JqV00e1l9UXYTxEvj8Y/y7jtiqg52ZvaidOiuEPG3Ia1iY+Q2Rq
 9s7+P3NoG99yIQQy8bDkh2g6SBoogdGJPGVHN6yBMng=
Subject: [Buildroot] [PATCH] package/rtl8812au-aircrack-ng: rename to
 rtl8812au and switch upstream
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
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rename the package to rtl8812au and switch to the 8812au-20210820
driver from https://github.com/cybersnow02/8812au-20210820, which is
based on a more recent Realtek release and supports Linux up to 7.3.

Bump to the latest release 8812au-Kernel-7.3.

All local patches are dropped since they are already handled upstream.

CONFIG_PLATFORM_AUTODETECT is disabled since it forces
CONFIG_LITTLE_ENDIAN and the host architecture; endianness and
cfg80211 options are passed through USER_EXTRA_CFLAGS as before.
The module is now named 8812au.ko instead of 88XXau.ko.

Add a legacy option that selects the new package.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 Config.in.legacy                              |    9 +
 DEVELOPERS                                    |    2 +-
 package/Config.in                             |    2 +-
 .../0001-fix-build-for-kernel-6.15.patch      | 1637 -----------------
 .../0002-fix-build-for-kernel-6.16.patch      |   34 -
 .../0003-Fix-build-for-kernel-6.17.patch      |   57 -
 .../0004-fix-build-for-kernel-6.19.patch      |   37 -
 package/rtl8812au-aircrack-ng/Config.in       |   12 -
 .../rtl8812au-aircrack-ng.hash                |    3 -
 package/rtl8812au/Config.in                   |   13 +
 package/rtl8812au/rtl8812au.hash              |    3 +
 .../rtl8812au.mk}                             |   21 +-
 12 files changed, 38 insertions(+), 1792 deletions(-)
 delete mode 100644 package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
 delete mode 100644 package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
 delete mode 100644 package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
 delete mode 100644 package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
 delete mode 100644 package/rtl8812au-aircrack-ng/Config.in
 delete mode 100644 package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
 create mode 100644 package/rtl8812au/Config.in
 create mode 100644 package/rtl8812au/rtl8812au.hash
 rename package/{rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk => rtl8812au/rtl8812au.mk} (57%)

diff --git a/Config.in.legacy b/Config.in.legacy
index 0ee4d04751..d347483829 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,15 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
+	bool "rtl8812au-aircrack-ng has been renamed to rtl8812au"
+	select BR2_LEGACY
+	select BR2_PACKAGE_RTL8812AU if BR2_LINUX_KERNEL && !BR2_s390x
+	help
+	  The rtl8812au-aircrack-ng package has been renamed to
+	  rtl8812au and now uses the 8812au-20210820 driver from
+	  https://github.com/cybersnow02/8812au-20210820.
+
 config BR2_KERNEL_HEADERS_7_2
 	bool "kernel headers version 7.2.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6b0bed5b84..a880627282 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1362,7 +1362,7 @@ F:	package/rtl8189es/
 F:	package/rtl8192eu/
 F:	package/rtl8723bu/
 F:	package/rtl8723ds/
-F:	package/rtl8812au-aircrack-ng/
+F:	package/rtl8812au/
 F:	package/rtl8821au/
 F:	package/rtl8821cu/
 F:	package/sunxi-mali-utgard/
diff --git a/package/Config.in b/package/Config.in
index 0fcd4589ad..9bf444bb93 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -607,7 +607,7 @@ endmenu
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8723ds/Config.in"
 	source "package/rtl8723ds-bt/Config.in"
-	source "package/rtl8812au-aircrack-ng/Config.in"
+	source "package/rtl8812au/Config.in"
 	source "package/rtl8821au/Config.in"
 	source "package/rtl8821cu/Config.in"
 	source "package/rtl8822cs/Config.in"
diff --git a/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch b/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
deleted file mode 100644
index a48214fea2..0000000000
--- a/package/rtl8812au-aircrack-ng/0001-fix-build-for-kernel-6.15.patch
+++ /dev/null
@@ -1,1637 +0,0 @@
-From bfb09454a243547bea3e02d6c6df2ffdc1218fea Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Dominik=20W=C3=B3jt?= <domin144@o2.pl>
-Date: Sat, 3 May 2025 19:18:54 +0200
-Subject: [PATCH] fix build for kernel 6.15
-
-Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1229
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile                        | 760 ++++++++++++++++----------------
- hal/phydm/phydm.mk              |   4 +-
- hal/phydm/sd4_phydm_2_kernel.mk |   2 +-
- include/osdep_service_linux.h   |   4 +
- 4 files changed, 389 insertions(+), 381 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 10acbd2..d6e5809 100755
---- a/Makefile
-+++ b/Makefile
-@@ -1,27 +1,27 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS) -fno-pie
--EXTRA_CFLAGS += -O3
--EXTRA_CFLAGS += -Wno-unused-variable
--#EXTRA_CFLAGS += -Wno-unused-value
--EXTRA_CFLAGS += -Wno-unused-label
--#EXTRA_CFLAGS += -Wno-unused-parameter
--EXTRA_CFLAGS += -Wno-unused-function
--EXTRA_CFLAGS += -Wno-implicit-fallthrough
--EXTRA_CFLAGS += -Wno-cast-function-type
--EXTRA_CFLAGS += -Wno-missing-declarations
--EXTRA_CFLAGS += -Wno-missing-prototypes
--#EXTRA_CFLAGS += -Wno-error=cast-function-type
--#EXTRA_CFLAGS += -Wno-parentheses-equality
--#EXTRA_CFLAGS += -Wno-error=incompatible-pointer-types
--EXTRA_CFLAGS += -Wno-stringop-overread
--#EXTRA_CFLAGS += -Wno-pointer-bool-conversion
--EXTRA_CFLAGS += -Wno-unknown-pragmas
--#EXTRA_CFLAGS += -Wno-unused
--EXTRA_CFLAGS += -Wno-address
--EXTRA_CFLAGS += -Wno-vla -g
--
--EXTRA_CFLAGS += -I$(src)/include -I$(srctree)/$(src)/include
--EXTRA_CFLAGS += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
--EXTRA_LDFLAGS += --strip-all -O3
-+ccflags-y += $(USER_EXTRA_CFLAGS) -fno-pie
-+ccflags-y += -O3
-+ccflags-y += -Wno-unused-variable
-+#ccflags-y += -Wno-unused-value
-+ccflags-y += -Wno-unused-label
-+#ccflags-y += -Wno-unused-parameter
-+ccflags-y += -Wno-unused-function
-+ccflags-y += -Wno-implicit-fallthrough
-+ccflags-y += -Wno-cast-function-type
-+ccflags-y += -Wno-missing-declarations
-+ccflags-y += -Wno-missing-prototypes
-+#ccflags-y += -Wno-error=cast-function-type
-+#ccflags-y += -Wno-parentheses-equality
-+#ccflags-y += -Wno-error=incompatible-pointer-types
-+ccflags-y += -Wno-stringop-overread
-+#ccflags-y += -Wno-pointer-bool-conversion
-+ccflags-y += -Wno-unknown-pragmas
-+#ccflags-y += -Wno-unused
-+ccflags-y += -Wno-address
-+ccflags-y += -Wno-vla -g
-+
-+ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
-+ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
-+ldflags-y += --strip-all -O3
- 
- ########################## WIFI IC ############################
- CONFIG_RTL8812A = y
-@@ -189,12 +189,12 @@ endif
- 
- ifeq ($(CONFIG_RTL8812A)_$(CONFIG_RTL8821A)_$(CONFIG_RTL8814A), y_y_y)
- 
--EXTRA_CFLAGS += -DDRV_NAME=\"rtl88XXau\"
-+ccflags-y += -DDRV_NAME=\"rtl88XXau\"
- ifeq ($(CONFIG_USB_HCI), y)
- USER_MODULE_NAME = 88XXau
- endif
- else
--EXTRA_CFLAGS += -DDRV_NAME=\"rtl8812au\"
-+ccflags-y += -DDRV_NAME=\"rtl8812au\"
- endif
- 
- _OS_INTFS_FILES :=	os_dep/osdep_service.o \
-@@ -230,10 +230,10 @@ _HAL_INTFS_FILES :=	hal/hal_intf.o \
- 			hal/led/hal_$(HCI_NAME)_led.o
- 
- 
--EXTRA_CFLAGS += -I$(src)/platform -I$(srctree)/$(src)/platform
-+ccflags-y += -I$(src)/platform -I$(srctree)/$(src)/platform
- _PLATFORM_FILES := platform/platform_ops.o
- 
--EXTRA_CFLAGS += -I$(src)/hal/btc -I$(srctree)/$(src)/hal/btc
-+ccflags-y += -I$(src)/hal/btc -I$(srctree)/$(src)/hal/btc
- 
- 
- ########### HAL_RTL8812A_RTL8821A #################################
-@@ -292,7 +292,7 @@ endif
- endif
- 
- ifeq ($(CONFIG_RTL8812A), y)
--EXTRA_CFLAGS += -DCONFIG_RTL8812A
-+ccflags-y += -DCONFIG_RTL8812A
- _HAL_INTFS_FILES +=	hal/rtl8812a/hal8812a_fw.o
- endif
- 
-@@ -310,7 +310,7 @@ endif
- endif
- endif
- 
--EXTRA_CFLAGS += -DCONFIG_RTL8821A
-+ccflags-y += -DCONFIG_RTL8821A
- 
- _HAL_INTFS_FILES +=	hal/rtl8812a/hal8821a_fw.o
- endif
-@@ -331,7 +331,7 @@ endif
- ########### HAL_RTL8814A #################################
- ifeq ($(CONFIG_RTL8814A), y)
- ## ADD NEW VHT MP HW TX MODE ##
--#EXTRA_CFLAGS += -DCONFIG_MP_VHT_HW_TX_MODE
-+#ccflags-y += -DCONFIG_MP_VHT_HW_TX_MODE
- CONFIG_MP_VHT_HW_TX_MODE = n
- ##########################################
- RTL871X = rtl8814a
-@@ -339,7 +339,7 @@ ifeq ($(CONFIG_USB_HCI), y)
- MODULE_NAME = 8814au
- endif
- 
--EXTRA_CFLAGS += -DCONFIG_RTL8814A
-+ccflags-y += -DCONFIG_RTL8814A
- 
- _HAL_INTFS_FILES +=  hal/HalPwrSeqCmd.o \
- 					hal/$(RTL871X)/Hal8814PwrSeq.o \
-@@ -390,274 +390,274 @@ endif
- 
- ifeq ($(CONFIG_USB_HCI), y)
- ifeq ($(CONFIG_USB_AUTOSUSPEND), y)
--EXTRA_CFLAGS += -DCONFIG_USB_AUTOSUSPEND
-+ccflags-y += -DCONFIG_USB_AUTOSUSPEND
- endif
- endif
- 
- ifeq ($(CONFIG_MP_INCLUDED), y)
- #MODULE_NAME := $(MODULE_NAME)_mp
--EXTRA_CFLAGS += -DCONFIG_MP_INCLUDED
-+ccflags-y += -DCONFIG_MP_INCLUDED
- endif
- 
- ifeq ($(CONFIG_POWER_SAVING), y)
--EXTRA_CFLAGS += -DCONFIG_POWER_SAVING
-+ccflags-y += -DCONFIG_POWER_SAVING
- endif
- 
- ifeq ($(CONFIG_HW_PWRP_DETECTION), y)
--EXTRA_CFLAGS += -DCONFIG_HW_PWRP_DETECTION
-+ccflags-y += -DCONFIG_HW_PWRP_DETECTION
- endif
- 
- ifeq ($(CONFIG_BT_COEXIST), y)
--EXTRA_CFLAGS += -DCONFIG_BT_COEXIST
-+ccflags-y += -DCONFIG_BT_COEXIST
- endif
- 
- ifeq ($(CONFIG_INTEL_WIDI), y)
--EXTRA_CFLAGS += -DCONFIG_INTEL_WIDI
-+ccflags-y += -DCONFIG_INTEL_WIDI
- endif
- 
- ifeq ($(CONFIG_WAPI_SUPPORT), y)
--EXTRA_CFLAGS += -DCONFIG_WAPI_SUPPORT
-+ccflags-y += -DCONFIG_WAPI_SUPPORT
- endif
- 
- ifeq ($(CONFIG_EFUSE_CONFIG_FILE), y)
--EXTRA_CFLAGS += -DCONFIG_EFUSE_CONFIG_FILE
-+ccflags-y += -DCONFIG_EFUSE_CONFIG_FILE
- 
- #EFUSE_MAP_PATH
- USER_EFUSE_MAP_PATH ?=
- ifneq ($(USER_EFUSE_MAP_PATH),)
--EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"$(USER_EFUSE_MAP_PATH)\"
-+ccflags-y += -DEFUSE_MAP_PATH=\"$(USER_EFUSE_MAP_PATH)\"
- else ifeq ($(MODULE_NAME), 8189es)
--EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8189e.map\"
-+ccflags-y += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8189e.map\"
- else ifeq ($(MODULE_NAME), 8723bs)
--EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8723bs.map\"
-+ccflags-y += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_8723bs.map\"
- else
--EXTRA_CFLAGS += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_$(MODULE_NAME).map\"
-+ccflags-y += -DEFUSE_MAP_PATH=\"/system/etc/wifi/wifi_efuse_$(MODULE_NAME).map\"
- endif
- 
- #WIFIMAC_PATH
- USER_WIFIMAC_PATH ?=
- ifneq ($(USER_WIFIMAC_PATH),)
--EXTRA_CFLAGS += -DWIFIMAC_PATH=\"$(USER_WIFIMAC_PATH)\"
-+ccflags-y += -DWIFIMAC_PATH=\"$(USER_WIFIMAC_PATH)\"
- else
--EXTRA_CFLAGS += -DWIFIMAC_PATH=\"/data/wifimac.txt\"
-+ccflags-y += -DWIFIMAC_PATH=\"/data/wifimac.txt\"
- endif
- 
- endif
- 
- ifeq ($(CONFIG_EXT_CLK), y)
--EXTRA_CFLAGS += -DCONFIG_EXT_CLK
-+ccflags-y += -DCONFIG_EXT_CLK
- endif
- 
- ifeq ($(CONFIG_TRAFFIC_PROTECT), y)
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- endif
- 
- ifeq ($(CONFIG_LOAD_PHY_PARA_FROM_FILE), y)
--EXTRA_CFLAGS += -DCONFIG_LOAD_PHY_PARA_FROM_FILE
--#EXTRA_CFLAGS += -DREALTEK_CONFIG_PATH_WITH_IC_NAME_FOLDER
--EXTRA_CFLAGS += -DREALTEK_CONFIG_PATH=\"/lib/firmware/\"
-+ccflags-y += -DCONFIG_LOAD_PHY_PARA_FROM_FILE
-+#ccflags-y += -DREALTEK_CONFIG_PATH_WITH_IC_NAME_FOLDER
-+ccflags-y += -DREALTEK_CONFIG_PATH=\"/lib/firmware/\"
- endif
- 
- ifeq ($(CONFIG_TXPWR_BY_RATE), n)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE=0
-+ccflags-y += -DCONFIG_TXPWR_BY_RATE=0
- else ifeq ($(CONFIG_TXPWR_BY_RATE), y)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE=1
-+ccflags-y += -DCONFIG_TXPWR_BY_RATE=1
- endif
- ifeq ($(CONFIG_TXPWR_BY_RATE_EN), n)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE_EN=0
-+ccflags-y += -DCONFIG_TXPWR_BY_RATE_EN=0
- else ifeq ($(CONFIG_TXPWR_BY_RATE_EN), y)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE_EN=1
-+ccflags-y += -DCONFIG_TXPWR_BY_RATE_EN=1
- else ifeq ($(CONFIG_TXPWR_BY_RATE_EN), auto)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_BY_RATE_EN=2
-+ccflags-y += -DCONFIG_TXPWR_BY_RATE_EN=2
- endif
- 
- ifeq ($(CONFIG_TXPWR_LIMIT), n)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT=0
-+ccflags-y += -DCONFIG_TXPWR_LIMIT=0
- else ifeq ($(CONFIG_TXPWR_LIMIT), y)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT=1
-+ccflags-y += -DCONFIG_TXPWR_LIMIT=1
- endif
- ifeq ($(CONFIG_TXPWR_LIMIT_EN), n)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT_EN=0
-+ccflags-y += -DCONFIG_TXPWR_LIMIT_EN=0
- else ifeq ($(CONFIG_TXPWR_LIMIT_EN), y)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT_EN=1
-+ccflags-y += -DCONFIG_TXPWR_LIMIT_EN=1
- else ifeq ($(CONFIG_TXPWR_LIMIT_EN), auto)
--EXTRA_CFLAGS += -DCONFIG_TXPWR_LIMIT_EN=2
-+ccflags-y += -DCONFIG_TXPWR_LIMIT_EN=2
- endif
- 
- ifneq ($(CONFIG_RTW_CHPLAN), 0xFF)
--EXTRA_CFLAGS += -DCONFIG_RTW_CHPLAN=$(CONFIG_RTW_CHPLAN)
-+ccflags-y += -DCONFIG_RTW_CHPLAN=$(CONFIG_RTW_CHPLAN)
- endif
- 
- ifeq ($(CONFIG_CALIBRATE_TX_POWER_BY_REGULATORY), y)
--EXTRA_CFLAGS += -DCONFIG_CALIBRATE_TX_POWER_BY_REGULATORY
-+ccflags-y += -DCONFIG_CALIBRATE_TX_POWER_BY_REGULATORY
- endif
- 
- ifeq ($(CONFIG_CALIBRATE_TX_POWER_TO_MAX), y)
--EXTRA_CFLAGS += -DCONFIG_CALIBRATE_TX_POWER_TO_MAX
-+ccflags-y += -DCONFIG_CALIBRATE_TX_POWER_TO_MAX
- endif
- 
- ifeq ($(CONFIG_RTW_ADAPTIVITY_EN), disable)
--EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_EN=0
-+ccflags-y += -DCONFIG_RTW_ADAPTIVITY_EN=0
- else ifeq ($(CONFIG_RTW_ADAPTIVITY_EN), enable)
--EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_EN=1
-+ccflags-y += -DCONFIG_RTW_ADAPTIVITY_EN=1
- endif
- 
- ifeq ($(CONFIG_RTW_ADAPTIVITY_MODE), normal)
--EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_MODE=0
-+ccflags-y += -DCONFIG_RTW_ADAPTIVITY_MODE=0
- else ifeq ($(CONFIG_RTW_ADAPTIVITY_MODE), carrier_sense)
--EXTRA_CFLAGS += -DCONFIG_RTW_ADAPTIVITY_MODE=1
-+ccflags-y += -DCONFIG_RTW_ADAPTIVITY_MODE=1
- endif
- 
- ifeq ($(CONFIG_SIGNAL_SCALE_MAPPING), y)
--EXTRA_CFLAGS += -DCONFIG_SIGNAL_SCALE_MAPPING
-+ccflags-y += -DCONFIG_SIGNAL_SCALE_MAPPING
- endif
- 
- ifeq ($(CONFIG_80211W), y)
--EXTRA_CFLAGS += -DCONFIG_IEEE80211W
-+ccflags-y += -DCONFIG_IEEE80211W
- endif
- 
- ifeq ($(CONFIG_WOWLAN), y)
--EXTRA_CFLAGS += -DCONFIG_WOWLAN -DRTW_WAKEUP_EVENT=$(CONFIG_WAKEUP_TYPE)
--EXTRA_CFLAGS += -DRTW_SUSPEND_TYPE=$(CONFIG_SUSPEND_TYPE)
-+ccflags-y += -DCONFIG_WOWLAN -DRTW_WAKEUP_EVENT=$(CONFIG_WAKEUP_TYPE)
-+ccflags-y += -DRTW_SUSPEND_TYPE=$(CONFIG_SUSPEND_TYPE)
- ifeq ($(CONFIG_WOW_STA_MIX), y)
--EXTRA_CFLAGS += -DRTW_WOW_STA_MIX
-+ccflags-y += -DRTW_WOW_STA_MIX
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
-+ccflags-y += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
- endif
- endif
- 
- ifeq ($(CONFIG_AP_WOWLAN), y)
--EXTRA_CFLAGS += -DCONFIG_AP_WOWLAN
-+ccflags-y += -DCONFIG_AP_WOWLAN
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
-+ccflags-y += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
- endif
- endif
- 
- ifeq ($(CONFIG_PNO_SUPPORT), y)
--EXTRA_CFLAGS += -DCONFIG_PNO_SUPPORT
-+ccflags-y += -DCONFIG_PNO_SUPPORT
- ifeq ($(CONFIG_PNO_SET_DEBUG), y)
--EXTRA_CFLAGS += -DCONFIG_PNO_SET_DEBUG
-+ccflags-y += -DCONFIG_PNO_SET_DEBUG
- endif
- endif
- 
- ifeq ($(CONFIG_GPIO_WAKEUP), y)
--EXTRA_CFLAGS += -DCONFIG_GPIO_WAKEUP
-+ccflags-y += -DCONFIG_GPIO_WAKEUP
- ifeq ($(CONFIG_ONE_PIN_GPIO), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_ONE_PIN_GPIO
-+ccflags-y += -DCONFIG_RTW_ONE_PIN_GPIO
- endif
- ifeq ($(CONFIG_HIGH_ACTIVE_DEV2HST), y)
--EXTRA_CFLAGS += -DHIGH_ACTIVE_DEV2HST=1
-+ccflags-y += -DHIGH_ACTIVE_DEV2HST=1
- else
--EXTRA_CFLAGS += -DHIGH_ACTIVE_DEV2HST=0
-+ccflags-y += -DHIGH_ACTIVE_DEV2HST=0
- endif
- endif
- 
- ifeq ($(CONFIG_HIGH_ACTIVE_HST2DEV), y)
--EXTRA_CFLAGS += -DHIGH_ACTIVE_HST2DEV=1
-+ccflags-y += -DHIGH_ACTIVE_HST2DEV=1
- else
--EXTRA_CFLAGS += -DHIGH_ACTIVE_HST2DEV=0
-+ccflags-y += -DHIGH_ACTIVE_HST2DEV=0
- endif
- 
- ifneq ($(CONFIG_WAKEUP_GPIO_IDX), default)
--EXTRA_CFLAGS += -DWAKEUP_GPIO_IDX=$(CONFIG_WAKEUP_GPIO_IDX)
-+ccflags-y += -DWAKEUP_GPIO_IDX=$(CONFIG_WAKEUP_GPIO_IDX)
- endif
- 
- ifeq ($(CONFIG_RTW_SDIO_PM_KEEP_POWER), y)
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
-+ccflags-y += -DCONFIG_RTW_SDIO_PM_KEEP_POWER
- endif
- endif
- 
- ifeq ($(CONFIG_REDUCE_TX_CPU_LOADING), y)
--EXTRA_CFLAGS += -DCONFIG_REDUCE_TX_CPU_LOADING
-+ccflags-y += -DCONFIG_REDUCE_TX_CPU_LOADING
- endif
- 
- ifeq ($(CONFIG_BR_EXT), y)
- BR_NAME = br0
--EXTRA_CFLAGS += -DCONFIG_BR_EXT
--EXTRA_CFLAGS += '-DCONFIG_BR_EXT_BRNAME="'$(BR_NAME)'"'
-+ccflags-y += -DCONFIG_BR_EXT
-+ccflags-y += '-DCONFIG_BR_EXT_BRNAME="'$(BR_NAME)'"'
- endif
- 
- 
- ifeq ($(CONFIG_TDLS), y)
--EXTRA_CFLAGS += -DCONFIG_TDLS
-+ccflags-y += -DCONFIG_TDLS
- endif
- 
- ifeq ($(CONFIG_WIFI_MONITOR), y)
--EXTRA_CFLAGS += -DCONFIG_WIFI_MONITOR
-+ccflags-y += -DCONFIG_WIFI_MONITOR
- endif
- 
- ifeq ($(CONFIG_MCC_MODE), y)
--EXTRA_CFLAGS += -DCONFIG_MCC_MODE
-+ccflags-y += -DCONFIG_MCC_MODE
- endif
- 
- ifeq ($(CONFIG_RTW_NAPI), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_NAPI
-+ccflags-y += -DCONFIG_RTW_NAPI
- endif
- 
- ifeq ($(CONFIG_RTW_GRO), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_GRO
-+ccflags-y += -DCONFIG_RTW_GRO
- endif
- 
- ifeq ($(CONFIG_RTW_REPEATER_SON), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_REPEATER_SON
-+ccflags-y += -DCONFIG_RTW_REPEATER_SON
- endif
- 
- ifeq ($(CONFIG_RTW_IPCAM_APPLICATION), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_IPCAM_APPLICATION
-+ccflags-y += -DCONFIG_RTW_IPCAM_APPLICATION
- ifeq ($(CONFIG_WIFI_MONITOR), n)
--EXTRA_CFLAGS += -DCONFIG_WIFI_MONITOR
-+ccflags-y += -DCONFIG_WIFI_MONITOR
- endif
- endif
- 
- ifeq ($(CONFIG_RTW_NETIF_SG), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_NETIF_SG
-+ccflags-y += -DCONFIG_RTW_NETIF_SG
- endif
- 
- ifeq ($(CONFIG_TX_CSUM_OFFLOAD), y)
--EXTRA_CFLAGS += -DCONFIG_TX_CSUM_OFFLOAD
-+ccflags-y += -DCONFIG_TX_CSUM_OFFLOAD
- endif
- 
- ifeq ($(CONFIG_ICMP_VOQ), y)
--EXTRA_CFLAGS += -DCONFIG_ICMP_VOQ
-+ccflags-y += -DCONFIG_ICMP_VOQ
- endif
- 
- ifeq ($(CONFIG_IP_R_MONITOR), y)
--EXTRA_CFLAGS += -DCONFIG_IP_R_MONITOR
-+ccflags-y += -DCONFIG_IP_R_MONITOR
- endif
- 
- ifeq ($(CONFIG_RTW_WIFI_HAL), y)
--#EXTRA_CFLAGS += -DCONFIG_RTW_WIFI_HAL_DEBUG
--EXTRA_CFLAGS += -DCONFIG_RTW_WIFI_HAL
--EXTRA_CFLAGS += -DCONFIG_RTW_CFGVEDNOR_LLSTATS
--EXTRA_CFLAGS += -DCONFIG_RTW_CFGVENDOR_RANDOM_MAC_OUI
--EXTRA_CFLAGS += -DCONFIG_RTW_CFGVEDNOR_RSSIMONITOR
--EXTRA_CFLAGS += -DCONFIG_RTW_CFGVENDOR_WIFI_LOGGER
-+#ccflags-y += -DCONFIG_RTW_WIFI_HAL_DEBUG
-+ccflags-y += -DCONFIG_RTW_WIFI_HAL
-+ccflags-y += -DCONFIG_RTW_CFGVEDNOR_LLSTATS
-+ccflags-y += -DCONFIG_RTW_CFGVENDOR_RANDOM_MAC_OUI
-+ccflags-y += -DCONFIG_RTW_CFGVEDNOR_RSSIMONITOR
-+ccflags-y += -DCONFIG_RTW_CFGVENDOR_WIFI_LOGGER
- endif
- 
- ifeq ($(CONFIG_MP_VHT_HW_TX_MODE), y)
--EXTRA_CFLAGS += -DCONFIG_MP_VHT_HW_TX_MODE
-+ccflags-y += -DCONFIG_MP_VHT_HW_TX_MODE
- endif
- 
- ifeq ($(CONFIG_APPEND_VENDOR_IE_ENABLE), y)
--EXTRA_CFLAGS += -DCONFIG_APPEND_VENDOR_IE_ENABLE
-+ccflags-y += -DCONFIG_APPEND_VENDOR_IE_ENABLE
- endif
- 
- ifeq ($(CONFIG_RTW_DEBUG), y)
--EXTRA_CFLAGS += -DCONFIG_RTW_DEBUG
--EXTRA_CFLAGS += -DRTW_LOG_LEVEL=$(CONFIG_RTW_LOG_LEVEL)
-+ccflags-y += -DCONFIG_RTW_DEBUG
-+ccflags-y += -DRTW_LOG_LEVEL=$(CONFIG_RTW_LOG_LEVEL)
- endif
- 
--EXTRA_CFLAGS += -DDM_ODM_SUPPORT_TYPE=0x04
-+ccflags-y += -DDM_ODM_SUPPORT_TYPE=0x04
- 
- ifeq ($(CONFIG_RTW_VIRTUAL_INTF), y)
--EXTRA_CFLAGS += -DRTW_VIRTUAL_INTF=1
-+ccflags-y += -DRTW_VIRTUAL_INTF=1
- endif
- 
- ifeq ($(CONFIG_PLATFORM_I386_PC), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc/powerpc/; s/armv.l/arm/; s/aarch64/arm64/; s/riscv.*/riscv/;")
- ARCH ?= $(SUBARCH)
- CROSS_COMPILE ?=
-@@ -669,8 +669,8 @@ STAGINGMODDIR := /lib/modules/$(KVER)/kernel/drivers/staging
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_RPI), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH ?= arm
- CROSS_COMPILE ?=
- KVER ?= $(shell uname -r)
-@@ -680,8 +680,8 @@ INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM64_RPI), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH ?= arm64
- CROSS_COMPILE ?=
- KVER ?= $(shell uname -r)
-@@ -691,8 +691,8 @@ INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_NV_NANO), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm64
- KVER := $(shell uname -r)
- KSRC := /lib/modules/$(KVER)/build
-@@ -702,8 +702,8 @@ STAGINGMODDIR := /lib/modules/$(KVER)/kernel/drivers/staging
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_ODROIDC2), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH ?= arm64
- CROSS_COMPILE ?=
- KVER ?= $(shell uname -r)
-@@ -713,8 +713,8 @@ INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_PPC), y)
--EXTRA_CFLAGS += -DCONFIG_BIG_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_BIG_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- SUBARCH := $(shell uname -m | sed -e s/ppc/powerpc/)
- ARCH ?= $(SUBARCH)
- CROSS_COMPILE ?=
-@@ -725,16 +725,16 @@ INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_NV_TK1), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_NV_TK1
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_NV_TK1
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_P2P_IPS -DCONFIG_PLATFORM_ANDROID
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_P2P_IPS -DCONFIG_PLATFORM_ANDROID
- # Enable this for Android 5.0
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
--EXTRA_CFLAGS += -DRTW_VENDOR_EXT_SUPPORT
--EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC
-+ccflags-y += -DCONFIG_RADIO_WORK
-+ccflags-y += -DRTW_VENDOR_EXT_SUPPORT
-+ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC
- ARCH ?= arm
- 
- CROSS_COMPILE := /mnt/newdisk/android_sdk/nvidia_tk1/android_L/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
-@@ -743,9 +743,9 @@ MODULE_NAME = wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_NV_TK1_UBUNTU), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_NV_TK1
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_PLATFORM_NV_TK1
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
- ARCH ?= arm
- 
-@@ -757,7 +757,7 @@ INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ACTIONS_ATM702X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ACTIONS_ATM702X
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ACTIONS_ATM702X
- #ARCH := arm
- ARCH := $(R_ARCH)
- #CROSS_COMPILE := arm-none-linux-gnueabi-
-@@ -769,18 +769,18 @@ MODULE_NAME :=wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ACTIONS_ATM705X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--#EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+#ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC
- # default setting for Android 4.1, 4.2, 4.3, 4.4
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ACTIONS_ATM705X
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_PLATFORM_ACTIONS_ATM705X
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
- # Enable this for Android 5.0
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_RADIO_WORK
- 
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- _PLATFORM_FILES += platform/platform_arm_act_sdio.o
- endif
- 
-@@ -790,20 +790,20 @@ KSRC := /home/android_sdk/Action-semi/705a_android_L/android/kernel
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SUN50IW1P1), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN50IW1P1
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN50IW1P1
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_RESUME_IN_WORKQUEUE
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_RESUME_IN_WORKQUEUE
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- 
- # Enable this for Android 5.0
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_RADIO_WORK
- 
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
-@@ -817,14 +817,14 @@ KSRC :=/home/android_sdk/Allwinner/a64/android-51/lichee/linux-3.10/
- endif
- 
- ifeq ($(CONFIG_PLATFORM_TI_AM3517), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_SHUTTLE
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_SHUTTLE
- CROSS_COMPILE := arm-eabi-
- KSRC := $(shell pwd)/../../../Android/kernel
- ARCH := arm
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MSTAR_TITANIA12), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MSTAR -DCONFIG_PLATFORM_MSTAR_TITANIA12
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MSTAR -DCONFIG_PLATFORM_MSTAR_TITANIA12
- ARCH:=mips
- CROSS_COMPILE:= /usr/src/Mstar_kernel/mips-4.3/bin/mips-linux-gnu-
- KVER:= 2.6.28.9
-@@ -832,13 +832,13 @@ KSRC:= /usr/src/Mstar_kernel/2.6.28.9/
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MSTAR), y)
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_MSTAR
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_MSTAR_HIGH
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_MSTAR
-+ccflags-y += -DCONFIG_PLATFORM_MSTAR_HIGH
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX -DCONFIG_FIX_NR_BULKIN_BUFFER
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX -DCONFIG_FIX_NR_BULKIN_BUFFER
- endif
- ARCH:=arm
- CROSS_COMPILE:= /usr/src/bin/arm-none-linux-gnueabi-
-@@ -849,18 +849,18 @@ endif
- ifeq ($(CONFIG_PLATFORM_ANDROID_ARM64), y)
- # For this to work, change the "modules:" section is also needed, in order to build with CLANG.
- # "$(MAKE) ARCH=$(ARCH) SUBARCH=$(ARCH) REAL_CC=${CC_DIR}/clang CLANG_TRIPLE=aarch64-linux-gnu- CROSS_COMPILE=$(CROSS_COMPILE) -C $(KSRC) M=$(shell pwd) O="$(KBUILD_OUTPUT)" modules"
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -fno-pic
--EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -fno-pic
-+ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC -DCONFIG_RADIO_WORK
- #Enable this to have two interfaces:
--#EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_P2P_IPS
-+#ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_P2P_IPS
- # A special rule for cfg80211_connect_bss() to receive all 10 arguments in an Android build
--EXTRA_CFLAGS += -DCONFIG_CFG80211_CONNECT_BSS_ANDROID
-+ccflags-y += -DCONFIG_CFG80211_CONNECT_BSS_ANDROID
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ANDROID_X86), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- SUBARCH := $(shell uname -m | sed -e s/i.86/i386/)
- ARCH := $(SUBARCH)
- CROSS_COMPILE := /media/DATA-2/android-x86/ics-x86_20120130/prebuilt/linux-x86/toolchain/i686-unknown-linux-gnu-4.2.1/bin/i686-unknown-linux-gnu-
-@@ -869,20 +869,20 @@ MODULE_NAME :=wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ANDROID_INTEL_X86), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ANDROID_INTEL_X86
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_SKIP_SIGNAL_SCALE_MAPPING
-+ccflags-y += -DCONFIG_PLATFORM_ANDROID_INTEL_X86
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_SKIP_SIGNAL_SCALE_MAPPING
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_RESUME_IN_WORKQUEUE
-+ccflags-y += -DCONFIG_RESUME_IN_WORKQUEUE
- endif
- endif
- 
- ifeq ($(CONFIG_PLATFORM_JB_X86), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- SUBARCH := $(shell uname -m | sed -e s/i.86/i386/)
- ARCH := $(SUBARCH)
- CROSS_COMPILE := /home/android_sdk/android-x86_JB/prebuilts/gcc/linux-x86/x86/i686-linux-android-4.7/bin/i686-linux-android-
-@@ -891,7 +891,7 @@ MODULE_NAME :=wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_PXA2XX), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH := arm
- CROSS_COMPILE := arm-none-linux-gnueabi-
- KVER  := 2.6.34.1
-@@ -899,7 +899,7 @@ KSRC ?= /usr/src/linux-2.6.34.1
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_S3C2K4), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH := arm
- CROSS_COMPILE := arm-linux-
- KVER  := 2.6.24.7_$(ARCH)
-@@ -907,7 +907,7 @@ KSRC := /usr/src/kernels/linux-$(KVER)
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_S3C6K4), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH := arm
- CROSS_COMPILE := arm-none-linux-gnueabi-
- KVER  := 2.6.34.1
-@@ -915,7 +915,7 @@ KSRC ?= /usr/src/linux-2.6.34.1
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTD2880B), y)
--EXTRA_CFLAGS += -DCONFIG_BIG_ENDIAN -DCONFIG_PLATFORM_RTD2880B
-+ccflags-y += -DCONFIG_BIG_ENDIAN -DCONFIG_PLATFORM_RTD2880B
- ARCH:=
- CROSS_COMPILE:=
- KVER:=
-@@ -923,7 +923,7 @@ KSRC:=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MIPS_RMI), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH:=mips
- CROSS_COMPILE:=mipsisa32r2-uclibc-
- KVER:=
-@@ -931,7 +931,7 @@ KSRC:= /root/work/kernel_realtek
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MIPS_PLM), y)
--EXTRA_CFLAGS += -DCONFIG_BIG_ENDIAN
-+ccflags-y += -DCONFIG_BIG_ENDIAN
- ARCH:=mips
- CROSS_COMPILE:=mipsisa32r2-uclibc-
- KVER:=
-@@ -939,7 +939,7 @@ KSRC:= /root/work/kernel_realtek
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MSTAR389), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MSTAR389
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MSTAR389
- ARCH:=mips
- CROSS_COMPILE:= mips-linux-gnu-
- KVER:= 2.6.28.10
-@@ -947,7 +947,7 @@ KSRC:= /home/mstar/mstar_linux/2.6.28.9/
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MIPS_AR9132), y)
--EXTRA_CFLAGS += -DCONFIG_BIG_ENDIAN
-+ccflags-y += -DCONFIG_BIG_ENDIAN
- ARCH := mips
- CROSS_COMPILE := mips-openwrt-linux-
- KSRC := /home/alex/test_openwrt/tmp/linux-2.6.30.9
-@@ -955,7 +955,7 @@ endif
- 
- # This is how I built for openwrt Neo2 platform. --Ben
- ifeq ($(CONFIG_PLATFORM_OPENWRT_NEO2), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH := arm64
- CROSS_COMPILE := aarch64-openwrt-linux-
- #export PATH=$PATH:/home/greearb/git/openwrt-neo2-dev/staging_dir/toolchain-aarch64_cortex-a53_gcc-7.3.0_musl/bin/
-@@ -964,7 +964,7 @@ KSRC := /home/greearb/git/openwrt-neo2-dev/build_dir/target-aarch64_cortex-a53_m
- endif
- 
- ifeq ($(CONFIG_PLATFORM_DMP_PHILIPS), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DRTK_DMP_PLATFORM
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DRTK_DMP_PLATFORM
- ARCH := mips
- #CROSS_COMPILE:=/usr/local/msdk-4.3.6-mips-EL-2.6.12.6-0.9.30.3/bin/mipsel-linux-
- CROSS_COMPILE:=/usr/local/toolchain_mipsel/bin/mipsel-linux-
-@@ -972,8 +972,8 @@ KSRC ?=/usr/local/Jupiter/linux-2.6.12
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTK_DMP), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DRTK_DMP_PLATFORM  -DCONFIG_WIRELESS_EXT
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DRTK_DMP_PLATFORM  -DCONFIG_WIRELESS_EXT
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
- _PLATFORM_FILES += platform/platform_RTK_DMP_usb.o
- endif
-@@ -984,7 +984,7 @@ KSRC ?= /usr/src/DMP_Kernel/jupiter/linux-2.6.12
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MT53XX), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MT53XX
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MT53XX
- ARCH:= arm
- CROSS_COMPILE:= arm11_mtk_le-
- KVER:= 2.6.27
-@@ -992,7 +992,7 @@ KSRC?= /proj/mtk00802/BD_Compare/BDP/Dev/BDP_V301/BDP_Linux/linux-2.6.27
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_MX51_241H), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_WISTRON_PLATFORM
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_WISTRON_PLATFORM
- ARCH := arm
- CROSS_COMPILE := /opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi/bin/arm-none-linux-gnueabi-
- KVER  := 2.6.31
-@@ -1000,8 +1000,8 @@ KSRC ?= /lib/modules/2.6.31-770-g0e46b52/source
- endif
- 
- ifeq ($(CONFIG_PLATFORM_FS_MX61), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm
- CROSS_COMPILE ?=
- KVER ?= $(shell uname -r)
-@@ -1011,7 +1011,7 @@ INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ACTIONS_ATJ227X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ACTIONS_ATJ227X
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ACTIONS_ATJ227X
- ARCH := mips
- CROSS_COMPILE := /home/cnsd4/project/actions/tools-2.6.27/bin/mipsel-linux-gnu-
- KVER  := 2.6.27
-@@ -1019,9 +1019,9 @@ KSRC := /home/cnsd4/project/actions/linux-2.6.27.28
- endif
- 
- ifeq ($(CONFIG_PLATFORM_TI_DM365), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_TI_DM365
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_RX
--EXTRA_CFLAGS += -DCONFIG_SINGLE_XMIT_BUF -DCONFIG_SINGLE_RECV_BUF
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_TI_DM365
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_RX
-+ccflags-y += -DCONFIG_SINGLE_XMIT_BUF -DCONFIG_SINGLE_RECV_BUF
- ARCH := arm
- #CROSS_COMPILE := /home/cnsd4/Appro/mv_pro_5.0/montavista/pro/devkit/arm/v5t_le/bin/arm_v5t_le-
- #KSRC := /home/cnsd4/Appro/mv_pro_5.0/montavista/pro/devkit/lsp/ti-davinci/linux-dm365
-@@ -1032,7 +1032,7 @@ KVER  := 2.6.18
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MOZART), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MOZART
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_MOZART
- ARCH := arm
- CROSS_COMPILE := /home/vivotek/lsp/mozart3v2/Mozart3e_Toolchain/build_arm_nofpu/usr/bin/arm-linux-
- KVER  := $(shell uname -r)
-@@ -1041,11 +1041,11 @@ KERNELOUTPUT := /home/pink/sample/ODM/IP8136W-VINT/tmp/kernel
- endif
- 
- ifeq ($(CONFIG_PLATFORM_TEGRA3_CARDHU), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/nvidia/tegra-16r3-partner-android-4.1_20120723/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
- KSRC := /home/android_sdk/nvidia/tegra-16r3-partner-android-4.1_20120723/out/target/product/cardhu/obj/KERNEL
-@@ -1053,11 +1053,11 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_TEGRA4_DALMORE), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/nvidia/tegra-17r9-partner-android-4.2-dalmore_20130131/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-
- KSRC := /home/android_sdk/nvidia/tegra-17r9-partner-android-4.2-dalmore_20130131/out/target/product/dalmore/obj/KERNEL
-@@ -1065,7 +1065,7 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_TCC8900), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/Telechips/SDK_2304_20110613/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
- KSRC := /home/android_sdk/Telechips/SDK_2304_20110613/kernel
-@@ -1073,7 +1073,7 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_TCC8920), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/Telechips/v12.06_r1-tcc-android-4.0.4/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
- KSRC := /home/android_sdk/Telechips/v12.06_r1-tcc-android-4.0.4/kernel
-@@ -1081,10 +1081,10 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_TCC8920_JB42), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/Telechips/v13.03_r1-tcc-android-4.2.2_ds_patched/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-
- KSRC := /home/android_sdk/Telechips/v13.03_r1-tcc-android-4.2.2_ds_patched/kernel
-@@ -1092,7 +1092,7 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_RK2818), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ROCKCHIPS
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ROCKCHIPS
- ARCH := arm
- CROSS_COMPILE := /usr/src/release_fae_version/toolchain/arm-eabi-4.4.0/bin/arm-eabi-
- KSRC := /usr/src/release_fae_version/kernel25_A7_281x
-@@ -1100,13 +1100,13 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_RK3188), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ROCKCHIPS
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ANDROID -DCONFIG_PLATFORM_ROCKCHIPS
- # default setting for Android 4.1, 4.2, 4.3, 4.4
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
- # default setting for Power control
--EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC
--EXTRA_CFLAGS += -DRTW_SUPPORT_PLATFORM_SHUTDOWN
-+ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC
-+ccflags-y += -DRTW_SUPPORT_PLATFORM_SHUTDOWN
- # default setting for Special function
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/Rockchip/Rk3188/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-
-@@ -1115,15 +1115,15 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_RK3066), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_RK3066
--EXTRA_CFLAGS += -DRTW_ENABLE_WIFI_CONTROL_FUNC
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211
-+ccflags-y += -DCONFIG_PLATFORM_ARM_RK3066
-+ccflags-y += -DRTW_ENABLE_WIFI_CONTROL_FUNC
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DRTW_SUPPORT_PLATFORM_SHUTDOWN
-+ccflags-y += -DRTW_SUPPORT_PLATFORM_SHUTDOWN
- endif
--EXTRA_CFLAGS += -fno-pic
-+ccflags-y += -fno-pic
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/Rockchip/rk3066_20130607/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6/bin/arm-linux-androideabi-
- #CROSS_COMPILE := /home/android_sdk/Rockchip/Rk3066sdk/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.6/bin/arm-linux-androideabi-
-@@ -1132,7 +1132,7 @@ MODULE_NAME :=wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_URBETTER), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN #-DCONFIG_MINIMAL_MEMORY_USAGE
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN #-DCONFIG_MINIMAL_MEMORY_USAGE
- ARCH := arm
- CROSS_COMPILE := /media/DATA-1/urbetter/arm-2009q3/bin/arm-none-linux-gnueabi-
- KSRC := /media/DATA-1/urbetter/ics-urbetter/kernel
-@@ -1140,7 +1140,7 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_TI_PANDA), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN #-DCONFIG_MINIMAL_MEMORY_USAGE
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN #-DCONFIG_MINIMAL_MEMORY_USAGE
- ARCH := arm
- #CROSS_COMPILE := /media/DATA-1/aosp/ics-aosp_20111227/prebuilt/linux-x86/toolchain/arm-eabi-4.4.3/bin/arm-eabi-
- #KSRC := /media/DATA-1/aosp/android-omap-panda-3.0_20120104
-@@ -1150,14 +1150,14 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_MIPS_JZ4760), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_MINIMAL_MEMORY_USAGE
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_MINIMAL_MEMORY_USAGE
- ARCH ?= mips
- CROSS_COMPILE ?= /mnt/sdb5/Ingenic/Umido/mips-4.3/bin/mips-linux-gnu-
- KSRC ?= /mnt/sdb5/Ingenic/Umido/kernel
- endif
- 
- ifeq ($(CONFIG_PLATFORM_SZEBOOK), y)
--EXTRA_CFLAGS += -DCONFIG_BIG_ENDIAN
-+ccflags-y += -DCONFIG_BIG_ENDIAN
- ARCH:=arm
- CROSS_COMPILE:=/opt/crosstool2/bin/armeb-unknown-linux-gnueabi-
- KVER:= 2.6.31.6
-@@ -1165,20 +1165,20 @@ KSRC:= ../code/linux-2.6.31.6-2020/
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SUNxI), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUNxI
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUNxI
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
- # default setting for A10-EVB mmc0
--#EXTRA_CFLAGS += -DCONFIG_WITS_EVB_V13
-+#ccflags-y += -DCONFIG_WITS_EVB_V13
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_sdio.o
- endif
- 
-@@ -1191,22 +1191,22 @@ KSRC=/home/android_sdk/Allwinner/a10/android-jb42/lichee-jb42/linux-3.0
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SUN6I), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN6I
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN6I
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2, 4.3, 4.4
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS +=  -DCONFIG_QOS_OPTIMIZATION
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y +=  -DCONFIG_QOS_OPTIMIZATION
- 
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
- # default setting for A31-EVB mmc0
--EXTRA_CFLAGS += -DCONFIG_A31_EVB
-+ccflags-y += -DCONFIG_A31_EVB
- _PLATFORM_FILES += platform/platform_ARM_SUNnI_sdio.o
- endif
- 
-@@ -1223,17 +1223,17 @@ KSRC :=/home/android_sdk/Allwinner/a31/kitkat-a3x_v4.5/lichee/linux-3.3
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SUN7I), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN7I
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN7I
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2, 4.3, 4.4
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS +=  -DCONFIG_QOS_OPTIMIZATION
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y +=  -DCONFIG_QOS_OPTIMIZATION
- 
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
-@@ -1253,17 +1253,17 @@ KSRC := /home/android_sdk/Allwinner/a20/kitkat-a20_v4.4/lichee/linux-3.4
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SUN8I_W3P1), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN8I
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN8I_W3P1
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN8I
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN8I_W3P1
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
-@@ -1280,20 +1280,20 @@ KSRC :=/home/android_sdk/Allwinner/a23/android-kk44/lichee/linux-3.4
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SUN8I_W5P1), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN8I
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN8I_W5P1
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN8I
-+ccflags-y += -DCONFIG_PLATFORM_ARM_SUN8I_W5P1
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
- # Enable this for Android 5.0
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_RADIO_WORK
- 
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- _PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
-@@ -1307,8 +1307,8 @@ KSRC :=/home/android_sdk/Allwinner/a33/android-L/lichee/linux-3.4
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ACTIONS_ATV5201), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ACTIONS_ATV5201
--EXTRA_CFLAGS += -DCONFIG_SDIO_DISABLE_RXFIFO_POLLING_LOOP
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_ACTIONS_ATV5201
-+ccflags-y += -DCONFIG_SDIO_DISABLE_RXFIFO_POLLING_LOOP
- ARCH := mips
- CROSS_COMPILE := mipsel-linux-gnu-
- KVER  := $(KERNEL_VER)
-@@ -1316,29 +1316,29 @@ KSRC:= $(CFGDIR)/../../kernel/linux-$(KERNEL_VER)
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_RTD299X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ifeq ($(CONFIG_ANDROID), y)
- # Enable this for Android 5.0
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_RADIO_WORK
- endif
- #ARCH, CROSS_COMPILE, KSRC,and  MODDESTDIR are provided by external makefile
- INSTALL_PREFIX :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_RTD299X_LG), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DRTW_P2P_GROUP_INTERFACE=1
--EXTRA_CFLAGS += -DCONFIG_IFACE_NUMBER=3
--#EXTRA_CFLAGS += -DCONFIG_FIX_HWPORT
--EXTRA_CFLAGS += -DLGE_PRIVATE
--EXTRA_CFLAGS += -DPURE_SUPPLICANT
--EXTRA_CFLAGS += -DCONFIG_CUSTOMIZED_COUNTRY_CHPLAN_MAP -DCONFIG_RTW_IOCTL_SET_COUNTRY
--EXTRA_CFLAGS += -DDBG_RX_DFRAME_RAW_DATA
--EXTRA_CFLAGS += -DRTW_REDUCE_SCAN_SWITCH_CH_TIME
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DRTW_P2P_GROUP_INTERFACE=1
-+ccflags-y += -DCONFIG_IFACE_NUMBER=3
-+#ccflags-y += -DCONFIG_FIX_HWPORT
-+ccflags-y += -DLGE_PRIVATE
-+ccflags-y += -DPURE_SUPPLICANT
-+ccflags-y += -DCONFIG_CUSTOMIZED_COUNTRY_CHPLAN_MAP -DCONFIG_RTW_IOCTL_SET_COUNTRY
-+ccflags-y += -DDBG_RX_DFRAME_RAW_DATA
-+ccflags-y += -DRTW_REDUCE_SCAN_SWITCH_CH_TIME
- ARCH ?= arm
- KVER ?=
- 
-@@ -1354,11 +1354,11 @@ INSTALL_PREFIX ?=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_HISILICON), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_HISILICON
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -DCONFIG_PLATFORM_HISILICON
- ifeq ($(SUPPORT_CONCURRENT),y)
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
- endif
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm
- ifeq ($(CROSS_COMPILE),)
-        CROSS_COMPILE = arm-hisiv200-linux-
-@@ -1370,23 +1370,23 @@ endif
- endif
- 
- ifeq ($(CONFIG_PLATFORM_HISILICON_HI3798), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_HISILICON
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_HISILICON_HI3798
--#EXTRA_CFLAGS += -DCONFIG_PLATFORM_HISILICON_HI3798_MV200_HDMI_DONGLE
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_HISILICON
-+ccflags-y += -DCONFIG_PLATFORM_HISILICON_HI3798
-+#ccflags-y += -DCONFIG_PLATFORM_HISILICON_HI3798_MV200_HDMI_DONGLE
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211
--EXTRA_CFLAGS += -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211
-+ccflags-y += -DRTW_USE_CFG80211_STA_EVENT
- # default setting for Android 5.x and later
--#EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+#ccflags-y += -DCONFIG_RADIO_WORK
- 
- # If system could power on and recognize Wi-Fi SDIO automatically,
- # platfrom operations are not necessary.
- #ifeq ($(CONFIG_SDIO_HCI), y)
--#EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+#ccflags-y += -DCONFIG_PLATFORM_OPS
- #_PLATFORM_FILES += platform/platform_hisilicon_hi3798_sdio.o
--#EXTRA_CFLAGS += -DCONFIG_HISI_SDIO_ID=1
-+#ccflags-y += -DCONFIG_HISI_SDIO_ID=1
- #endif
- 
- ARCH ?= arm
-@@ -1400,35 +1400,35 @@ endif
- # Platform setting
- ifeq ($(CONFIG_PLATFORM_ARM_SPREADTRUM_6820), y)
- ifeq ($(CONFIG_ANDROID_2X), y)
--EXTRA_CFLAGS += -DANDROID_2X
-+ccflags-y += -DANDROID_2X
- endif
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_SPRD
--EXTRA_CFLAGS += -DPLATFORM_SPREADTRUM_6820
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_SPRD
-+ccflags-y += -DPLATFORM_SPREADTRUM_6820
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- _PLATFORM_FILES += platform/platform_sprd_sdio.o
- endif
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_SPREADTRUM_8810), y)
- ifeq ($(CONFIG_ANDROID_2X), y)
--EXTRA_CFLAGS += -DANDROID_2X
-+ccflags-y += -DANDROID_2X
- endif
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_SPRD
--EXTRA_CFLAGS += -DPLATFORM_SPREADTRUM_8810
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_SPRD
-+ccflags-y += -DPLATFORM_SPREADTRUM_8810
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- _PLATFORM_FILES += platform/platform_sprd_sdio.o
- endif
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_WMT), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- ifeq ($(CONFIG_SDIO_HCI), y)
- _PLATFORM_FILES += platform/platform_ARM_WMT_sdio.o
- endif
-@@ -1439,18 +1439,18 @@ MODULE_NAME :=8189es_kk
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTK119X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--#EXTRA_CFLAGS += -DCONFIG_PLATFORM_ARM_SUN7I
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+#ccflags-y += -DCONFIG_PLATFORM_ARM_SUN7I
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--#EXTRA_CFLAGS +=  -DCONFIG_QOS_OPTIMIZATION
--EXTRA_CFLAGS += -DCONFIG_QOS_OPTIMIZATION
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+#ccflags-y +=  -DCONFIG_QOS_OPTIMIZATION
-+ccflags-y += -DCONFIG_QOS_OPTIMIZATION
- 
--#EXTRA_CFLAGS += -DCONFIG_#PLATFORM_OPS
-+#ccflags-y += -DCONFIG_#PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- #_PLATFORM_FILES += platform/platform_ARM_SUNxI_usb.o
- endif
- ifeq ($(CONFIG_SDIO_HCI), y)
-@@ -1470,15 +1470,15 @@ MODULE_NAME := 8192eu
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTK119X_AM), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_RTK119X_AM
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE -DCONFIG_FULL_CH_IN_P2P_HANDSHAKE
--EXTRA_CFLAGS += -DCONFIG_IFACE_NUMBER=3
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_PLATFORM_RTK119X_AM
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE -DCONFIG_FULL_CH_IN_P2P_HANDSHAKE
-+ccflags-y += -DCONFIG_IFACE_NUMBER=3
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- 
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- endif
- 
- ARCH := arm
-@@ -1490,28 +1490,28 @@ CROSS_COMPILE :=
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTK129X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DRTK_129X_PLATFORM
--EXTRA_CFLAGS += -DCONFIG_TRAFFIC_PROTECT
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DRTK_129X_PLATFORM
-+ccflags-y += -DCONFIG_TRAFFIC_PROTECT
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--#EXTRA_CFLAGS += -DCONFIG_P2P_IPS -DCONFIG_QOS_OPTIMIZATION
--EXTRA_CFLAGS += -DCONFIG_QOS_OPTIMIZATION
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+#ccflags-y += -DCONFIG_P2P_IPS -DCONFIG_QOS_OPTIMIZATION
-+ccflags-y += -DCONFIG_QOS_OPTIMIZATION
- # Enable this for Android 5.0
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_RADIO_WORK
- ifeq ($(CONFIG_RTL8821C)$(CONFIG_SDIO_HCI),yy)
--EXTRA_CFLAGS += -DCONFIG_WAKEUP_GPIO_INPUT_MODE
--EXTRA_CFLAGS += -DCONFIG_BT_WAKE_HST_OPEN_DRAIN
-+ccflags-y += -DCONFIG_WAKEUP_GPIO_INPUT_MODE
-+ccflags-y += -DCONFIG_BT_WAKE_HST_OPEN_DRAIN
- endif
--EXTRA_CFLAGS += -Wno-error=date-time
-+ccflags-y += -Wno-error=date-time
- # default setting for Android 7.0
- ifeq ($(RTK_ANDROID_VERSION), nougat)
--EXTRA_CFLAGS += -DRTW_P2P_GROUP_INTERFACE=1
-+ccflags-y += -DRTW_P2P_GROUP_INTERFACE=1
- endif
--#EXTRA_CFLAGS += -DCONFIG_#PLATFORM_OPS
-+#ccflags-y += -DCONFIG_#PLATFORM_OPS
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- endif
- 
- ARCH := arm64
-@@ -1526,12 +1526,12 @@ KSRC := /home/android_sdk/DHC/trunk-6.0.0_r1-QA160627/linux-kernel
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTK390X), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_RTK390X
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_RTW_NETIF_SG
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_PLATFORM_RTK390X
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_RTW_NETIF_SG
- ifeq ($(CONFIG_USB_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- endif
- 
- ARCH:=rlx
-@@ -1542,12 +1542,12 @@ KSRC:= /home/realtek/share/Develop/IPCAM_SDK/RealSil/rts3901_sdk_v1.2_vanilla/li
- endif
- 
- ifeq ($(CONFIG_PLATFORM_NOVATEK_NT72668), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_NOVATEK_NT72668
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_RX
--EXTRA_CFLAGS += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
-+ccflags-y += -DCONFIG_PLATFORM_NOVATEK_NT72668
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_RX
-+ccflags-y += -DCONFIG_USE_USB_BUFFER_ALLOC_TX
- ARCH ?= arm
- CROSS_COMPILE := arm-linux-gnueabihf-
- KVER := 3.8.0
-@@ -1556,10 +1556,10 @@ KSRC := /Custom/Novatek/TCL/linux-3.8_header
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ARM_TCC8930_JB42), y)
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android 4.1, 4.2
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
- ARCH := arm
- CROSS_COMPILE := /home/android_sdk/Telechips/v13.05_r1-tcc-android-4.2.2_tcc893x-evm_build/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-
- KSRC := /home/android_sdk/Telechips/v13.05_r1-tcc-android-4.2.2_tcc893x-evm_build/kernel
-@@ -1567,7 +1567,7 @@ MODULE_NAME := wlan
- endif
- 
- ifeq ($(CONFIG_PLATFORM_RTL8197D), y)
--EXTRA_CFLAGS += -DCONFIG_BIG_ENDIAN -DCONFIG_PLATFORM_RTL8197D
-+ccflags-y += -DCONFIG_BIG_ENDIAN -DCONFIG_PLATFORM_RTL8197D
- export DIR_LINUX=$(shell pwd)/../SDK/rlxlinux-sdk321-v50/linux-2.6.30
- ARCH ?= rlx
- CROSS_COMPILE:= $(DIR_LINUX)/../toolchain/rsdk-1.5.5-5281-EB-2.6.30-0.9.30.3-110714/bin/rsdk-linux-
-@@ -1575,17 +1575,17 @@ KSRC := $(DIR_LINUX)
- endif
- 
- ifeq ($(CONFIG_PLATFORM_AML_S905), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_AML_S905
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN -fno-pic
-+ccflags-y += -DCONFIG_PLATFORM_AML_S905
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN -fno-pic
- # default setting for Android
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211
--EXTRA_CFLAGS += -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211
-+ccflags-y += -DRTW_USE_CFG80211_STA_EVENT
- # default setting for Android 5.x and later
--EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+ccflags-y += -DCONFIG_RADIO_WORK
- 
- ifeq ($(CONFIG_SDIO_HCI), y)
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+ccflags-y += -DCONFIG_PLATFORM_OPS
- _PLATFORM_FILES += platform/platform_aml_s905_sdio.o
- endif
- 
-@@ -1599,19 +1599,19 @@ endif
- endif
- 
- ifeq ($(CONFIG_PLATFORM_ZTE_ZX296716), y)
--EXTRA_CFLAGS += -Wno-error=date-time
--EXTRA_CFLAGS += -DCONFIG_PLATFORM_ZTE_ZX296716
--EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
-+ccflags-y += -Wno-error=date-time
-+ccflags-y += -DCONFIG_PLATFORM_ZTE_ZX296716
-+ccflags-y += -DCONFIG_LITTLE_ENDIAN
- # default setting for Android
--EXTRA_CFLAGS += -DCONFIG_CONCURRENT_MODE
--EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211
--EXTRA_CFLAGS += -DRTW_USE_CFG80211_STA_EVENT
-+ccflags-y += -DCONFIG_CONCURRENT_MODE
-+ccflags-y += -DCONFIG_IOCTL_CFG80211
-+ccflags-y += -DRTW_USE_CFG80211_STA_EVENT
- # default setting for Android 5.x and later
--#EXTRA_CFLAGS += -DCONFIG_RADIO_WORK
-+#ccflags-y += -DCONFIG_RADIO_WORK
- 
- ifeq ($(CONFIG_SDIO_HCI), y)
- # mark this temporarily
--#EXTRA_CFLAGS += -DCONFIG_PLATFORM_OPS
-+#ccflags-y += -DCONFIG_PLATFORM_OPS
- #_PLATFORM_FILES += platform/platform_zte_zx296716_sdio.o
- endif
- 
-@@ -1621,11 +1621,11 @@ KSRC ?=
- endif
- 
- ifeq ($(ARCH), i386)
--EXTRA_CFLAGS += -mhard-float
--EXTRA_CFLAGS += -DMARK_KERNEL_PFU
-+ccflags-y += -mhard-float
-+ccflags-y += -DMARK_KERNEL_PFU
- else ifeq ($(ARCH), x86_64)
--EXTRA_CFLAGS += -mhard-float
--EXTRA_CFLAGS += -DMARK_KERNEL_PFU
-+ccflags-y += -mhard-float
-+ccflags-y += -DMARK_KERNEL_PFU
- endif
- 
- ########### CUSTOMER ################################
-@@ -1634,7 +1634,7 @@ CONFIG_CUSTOMER_HUAWEI = y
- endif
- 
- ifeq ($(CONFIG_CUSTOMER_HUAWEI), y)
--EXTRA_CFLAGS += -DCONFIG_HUAWEI_PROC
-+ccflags-y += -DCONFIG_HUAWEI_PROC
- endif
- 
- ifeq ($(CONFIG_MULTIDRV), y)
-@@ -1823,3 +1823,7 @@ endif
- 	@$(KSRC)/scripts/sign-file sha256 MOK.priv MOK.der 88XXau.ko
- 
- sign-install: all sign install
-+
-+# For compatibility with kernels prior to 2.6.24.
-+EXTRA_CFLAGS += $(ccflags-y)
-+EXTRA_LDFLAGS += $(ldflags-y)
-diff --git a/hal/phydm/phydm.mk b/hal/phydm/phydm.mk
-index a05df64..b4cdca3 100644
---- a/hal/phydm/phydm.mk
-+++ b/hal/phydm/phydm.mk
-@@ -1,4 +1,4 @@
--EXTRA_CFLAGS += -I$(src)/hal/phydm
-+ccflags-y += -I$(src)/hal/phydm
- 
- _PHYDM_FILES := hal/phydm/phydm_debug.o	\
- 								hal/phydm/phydm_antdiv.o\
-@@ -223,4 +223,4 @@ _PHYDM_FILES += hal/phydm/$(RTL871X)/halhwimg8814b_bb.o\
- 								hal/phydm/halrf/$(RTL871X)/halrf_8814b.o \
- 								hal/phydm/halrf/$(RTL871X)/halrf_iqk_8814b.o \
- 								hal/phydm/halrf/$(RTL871X)/halrf_rfk_init_8814b.o
--endif
-\ No newline at end of file
-+endif
-diff --git a/hal/phydm/sd4_phydm_2_kernel.mk b/hal/phydm/sd4_phydm_2_kernel.mk
-index f11c6ac..65eb93c 100644
---- a/hal/phydm/sd4_phydm_2_kernel.mk
-+++ b/hal/phydm/sd4_phydm_2_kernel.mk
-@@ -1,4 +1,4 @@
--EXTRA_CFLAGS += -I$(src)/hal/phydm
-+ccflags-y += -I$(src)/hal/phydm
- 
- _PHYDM_FILES := hal/phydm/phydm_debug.o	\
- 								hal/phydm/phydm_interface.o\
-diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
-index 684d685..4c276f6 100644
---- a/include/osdep_service_linux.h
-+++ b/include/osdep_service_linux.h
-@@ -385,7 +385,11 @@ __inline static void _set_timer(_timer *ptimer, u32 delay_time)
- 
- __inline static void _cancel_timer(_timer *ptimer, u8 *bcancelled)
- {
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0))
-+	*bcancelled = timer_delete_sync(&ptimer->timer) == 1 ? 1 : 0;
-+#else
- 	*bcancelled = del_timer_sync(&ptimer->timer) == 1 ? 1 : 0;
-+#endif
- }
- 
- static inline void _init_workitem(_workitem *pwork, void *pfunc, void *cntx)
--- 
-2.39.5
-
diff --git a/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch b/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
deleted file mode 100644
index 46f67f14ac..0000000000
--- a/package/rtl8812au-aircrack-ng/0002-fix-build-for-kernel-6.16.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From de764c6b43fef79bdea8783232a89d2e8ff0e059 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Fri, 15 Aug 2025 23:48:33 +0200
-Subject: [PATCH] fix build for kernel 6.16
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
-from_timer() has been renamed to timer_container_of() so let's rename
-according to linux version >= 6.16
-
-Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1236
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- include/osdep_service_linux.h | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
-index 4c276f6..9f9a317 100644
---- a/include/osdep_service_linux.h
-+++ b/include/osdep_service_linux.h
-@@ -355,7 +355,9 @@ static inline void timer_hdl(struct timer_list *in_timer)
- static inline void timer_hdl(unsigned long cntx)
- #endif
- {
--#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0))
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 16, 0))
-+	_timer *ptimer = timer_container_of(ptimer, in_timer, timer);
-+#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 14, 0))
- 	_timer *ptimer = from_timer(ptimer, in_timer, timer);
- #else
- 	_timer *ptimer = (_timer *)cntx;
--- 
-2.43.0
-
diff --git a/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch b/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
deleted file mode 100644
index 361615b945..0000000000
--- a/package/rtl8812au-aircrack-ng/0003-Fix-build-for-kernel-6.17.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From dfbeaa319808624c367200739a9a6f7fbc4b8281 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 8 Oct 2025 17:56:52 +0200
-Subject: [PATCH] Fix build for kernel 6.17
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b74947b4f6ff7c122a1bb6eb38bb7ecfbb1d3820
-set_wiphy_params() and set/get_tx_power() gain argument radio_idx to get
-radio index. So let's add that argument according to linux version >=
-6.17.
-
-Upstream: https://github.com/aircrack-ng/rtl8812au/pull/1238
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- os_dep/linux/ioctl_cfg80211.c | 11 +++++++++++
- 1 file changed, 11 insertions(+)
-
-diff --git a/os_dep/linux/ioctl_cfg80211.c b/os_dep/linux/ioctl_cfg80211.c
-index ec47e95..3d834a4 100644
---- a/os_dep/linux/ioctl_cfg80211.c
-+++ b/os_dep/linux/ioctl_cfg80211.c
-@@ -3365,7 +3365,12 @@ exit:
- 	return ret;
- }
- 
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, int radio_idx,
-+					 u32 changed)
-+#else
- static int cfg80211_rtw_set_wiphy_params(struct wiphy *wiphy, u32 changed)
-+#endif
- {
- #if 0
- 	struct iwm_priv *iwm = wiphy_to_iwm(wiphy);
-@@ -4267,6 +4272,9 @@ static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
- 	struct wireless_dev *wdev,
- #endif
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+	int radio_idx,
-+#endif
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 36)) || defined(COMPAT_KERNEL_RELEASE)
- 	enum nl80211_tx_power_setting type, int mbm)
- #else
-@@ -4328,6 +4336,9 @@ static int cfg80211_rtw_get_txpower(struct wiphy *wiphy,
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 8, 0))
- 	struct wireless_dev *wdev,
- #endif
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 17, 0))
-+	int radio_idx,
-+#endif
- #if (LINUX_VERSION_CODE >= KERNEL_VERSION(6, 14, 0))
- 	unsigned int link_id,
- #endif
--- 
-2.47.3
-
diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch b/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
deleted file mode 100644
index 83ed1600f6..0000000000
--- a/package/rtl8812au-aircrack-ng/0004-fix-build-for-kernel-6.19.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From f17facc866cb36bc889f873beb36e7991fa5e71c Mon Sep 17 00:00:00 2001
-From: Christian Stewart <christian@aperture.us>
-Date: Sat, 14 Mar 2026 14:53:48 -0700
-Subject: [PATCH] Fix build for kernel 6.19
-
-With kernel 6.19 and CONFIG_X86_KERNEL_IBT or CONFIG_KLP_BUILD enabled,
-objtool runs on the linked module object (delayed objtool via --link).
-The module Makefile passes --strip-all to ld -r, which strips local
-function symbols. Without these symbols, objtool cannot determine
-function boundaries and reports errors like:
-
-  88XXau.o: warning: objtool: rtw_mp_cmd+0xf8: unannotated intra-function call
-
-Replace --strip-all with --strip-debug to preserve function symbols
-while still stripping debug information, allowing objtool to properly
-validate the linked module object.
-
-Upstream: https://github.com/aircrack-ng/rtl8812au/commit/f17facc866cb36bc889f873beb36e7991fa5e71c
-Signed-off-by: Christian Stewart <christian@aperture.us>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
---- a/Makefile
-+++ b/Makefile
-@@ -22,7 +22,7 @@
-
- ccflags-y += -I$(src)/include -I$(srctree)/$(src)/include
- ccflags-y += -I$(src)/hal/phydm -I$(srctree)/$(src)/hal/phydm
--ldflags-y += --strip-all -O3
-+ldflags-y += --strip-debug -O3
-
- ########################## WIFI IC ############################
- CONFIG_RTL8812A = y
---
-2.50.1 (Apple Git-155)
diff --git a/package/rtl8812au-aircrack-ng/Config.in b/package/rtl8812au-aircrack-ng/Config.in
deleted file mode 100644
index d903ab2b3f..0000000000
--- a/package/rtl8812au-aircrack-ng/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-comment "rtl8812au-aircrack-ng needs a Linux kernel to be built"
-	depends on !BR2_s390x
-	depends on !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_RTL8812AU_AIRCRACK_NG
-	bool "rtl8812au-aircrack-ng"
-	depends on !BR2_s390x
-	depends on BR2_LINUX_KERNEL
-	help
-	  rtl8812au wifi driver (aircrack-ng repository)
-
-	  https://github.com/aircrack-ng/rtl8812au
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash b/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
deleted file mode 100644
index bb7c4b297d..0000000000
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  d4a1435e29bf4a46a4b0b31cad91f30bb263a899b382f828125437dce3cb4bae  rtl8812au-aircrack-ng-c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e.tar.gz
-sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rtl8812au/Config.in b/package/rtl8812au/Config.in
new file mode 100644
index 0000000000..ab08051c72
--- /dev/null
+++ b/package/rtl8812au/Config.in
@@ -0,0 +1,13 @@
+comment "rtl8812au needs a Linux kernel to be built"
+	depends on !BR2_s390x
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_RTL8812AU
+	bool "rtl8812au"
+	depends on !BR2_s390x
+	depends on BR2_LINUX_KERNEL
+	help
+	  Realtek RTL8812AU USB wifi driver, based on Realtek's
+	  v5.13.6 (20210820) release.
+
+	  https://github.com/cybersnow02/8812au-20210820
diff --git a/package/rtl8812au/rtl8812au.hash b/package/rtl8812au/rtl8812au.hash
new file mode 100644
index 0000000000..3db40e66a2
--- /dev/null
+++ b/package/rtl8812au/rtl8812au.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1d6ae6900a19afcd6c1b39421d09e33570351775079481c7ea92ccd84e588d10  rtl8812au-Kernel-7.3.tar.gz
+sha256  87a0b05f8f3ff97404c082af47e61d9c14476e9c6a3285761facc4452829008f  LICENSE
diff --git a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk b/package/rtl8812au/rtl8812au.mk
similarity index 57%
rename from package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
rename to package/rtl8812au/rtl8812au.mk
index f8c62608ef..17a0d1cfc0 100644
--- a/package/rtl8812au-aircrack-ng/rtl8812au-aircrack-ng.mk
+++ b/package/rtl8812au/rtl8812au.mk
@@ -1,27 +1,28 @@
 ################################################################################
 #
-# rtl8812au-aircrack-ng
+# rtl8812au
 #
 ################################################################################
 
-RTL8812AU_AIRCRACK_NG_VERSION = c3fb89a2f7066f4bf4e4d9d85d84f9791f14c83e
-RTL8812AU_AIRCRACK_NG_SITE = $(call github,aircrack-ng,rtl8812au,$(RTL8812AU_AIRCRACK_NG_VERSION))
-RTL8812AU_AIRCRACK_NG_LICENSE = GPL-2.0
-RTL8812AU_AIRCRACK_NG_LICENSE_FILES = LICENSE
+RTL8812AU_VERSION = Kernel-7.3
+RTL8812AU_SITE = $(call github,cybersnow02,8812au-20210820,8812au-$(RTL8812AU_VERSION))
+RTL8812AU_LICENSE = GPL-2.0
+RTL8812AU_LICENSE_FILES = LICENSE
 
-RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS = \
+RTL8812AU_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
 	-DRTW_USE_CFG80211_STA_EVENT \
 	-Wno-error
 
-RTL8812AU_AIRCRACK_NG_MODULE_MAKE_OPTS = \
+RTL8812AU_MODULE_MAKE_OPTS = \
+	CONFIG_PLATFORM_AUTODETECT=n \
 	CONFIG_PLATFORM_I386_PC=n \
-	CONFIG_88XXAU=m \
+	CONFIG_RTL8812AU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	USER_EXTRA_CFLAGS="$(RTL8812AU_AIRCRACK_NG_EXTRA_CFLAGS)"
+	USER_EXTRA_CFLAGS="$(RTL8812AU_EXTRA_CFLAGS)"
 
-define RTL8812AU_AIRCRACK_NG_LINUX_CONFIG_FIXUPS
+define RTL8812AU_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
