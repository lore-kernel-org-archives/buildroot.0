Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E20C531DF
	for <buildroot@archiver.kernel.org>; Sun, 18 Aug 2024 23:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030354014E;
	Sun, 18 Aug 2024 23:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8tDi1GXqGDiW; Sun, 18 Aug 2024 23:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA945403C1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA945403C1;
	Sun, 18 Aug 2024 23:56:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D82961BF401
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 23:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C49BE403C1
 for <buildroot@lists.busybox.net>; Sun, 18 Aug 2024 23:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZdlY9VHv_Df for <buildroot@lists.busybox.net>;
 Sun, 18 Aug 2024 23:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5FAED4014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FAED4014E
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FAED4014E
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 23:56:08 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-81f9339e52cso173365139f.0
 for <buildroot@buildroot.org>; Sun, 18 Aug 2024 16:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724025367; x=1724630167;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zko6CoIGliXvvVi/Y+jqrx8zPSLEuSZee3309p/jnCA=;
 b=AMu+uG7RyuVYGBR2/pamA1HB4UBuD9A5qPaxSO5T5TPvB6tGboVE8540b2C0CS0uSP
 ScRiXyo9W49D/GfKaVy1upEk8dJi5gMXSs2FExBm5/gfT3HNaXnc7WF87LPuAdBD1rAM
 5/LI33UUJHuykDCuTM8SUFMFKE3mOsM4ap2XnD4OXSS4VLIEqsTDBrYX04/mZAwtGy1z
 c636bFynSjJGV+cZgh45amfFxcaCQCnfqCIcGuUpFiVSRnujrvzRQ7h0olE6nUQ92QYW
 Xv6i0s1FQHTK65ClpNlWpfMMrJ/OqU9XNTlnaPKc3zIIk3gGFZnMuoldQE3Bb0+BibQe
 7Jrg==
X-Gm-Message-State: AOJu0YwVFU2jeZ+GC9UVlVJgama/4wCf9BCYYyjVZ6FQEi9UsXdmtTZi
 f8HzHFAo5P4ZLE525YYFApOYDQ+8mW5nz34RVmia1jLO1cwah9eitmPSGezY
X-Google-Smtp-Source: AGHT+IGa5qkDz8fYQE9jzCr5SQd+XkfqqVqL+OhbfsSEm1+B6slYTXqtzENyvZ+txmJiPOCEAI7Mtw==
X-Received: by 2002:a05:6602:1545:b0:822:6d2a:e52d with SMTP id
 ca18e2360f4ac-824f25eb2c7mr1085082139f.1.1724025366944; 
 Sun, 18 Aug 2024 16:56:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ccd6e7c0e2sm2746304173.30.2024.08.18.16.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 16:56:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Aug 2024 17:56:02 -0600
Message-Id: <20240818235602.1867361-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724025367; x=1724630167; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zko6CoIGliXvvVi/Y+jqrx8zPSLEuSZee3309p/jnCA=;
 b=PdPDz1rZq+ZRqamOSXPxub30XiX9nUMX0OtmDC5CwzvSmyL9+xZTlFGzi5Db7qwZiZ
 PHiCU7eHsr2LqyjAcCCIKEeas2NbFO2kKVch4/mMKUME4Px0r4si9TkNb3+ukZS8lPK+
 yzemnokYKLOnZvYjd2Tyh2VY3drEjMcX2cQGCu6RrjVm59CHHzH2/dPZ3nOhNMYQyXXd
 N/Ih0nzZyH7Ue1BuwHuXusn+RSC3RxX55OyjmLuFSSTfLOdeV/tg+SaDp4KRE+GHAcD7
 IqR4B7RFXNbP6KMZMzq/H5+po0LhTwhNpwBOa8nufYs87E7SGFT80i6Lgcr5b4u2CYGK
 Qfxw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PdPDz1rZ
Subject: [Buildroot] [PATCH 1/1] package/uefisettings: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/uefisettings/Config.in         |  9 +++++++++
 package/uefisettings/uefisettings.hash |  3 +++
 package/uefisettings/uefisettings.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)
 create mode 100644 package/uefisettings/Config.in
 create mode 100644 package/uefisettings/uefisettings.hash
 create mode 100644 package/uefisettings/uefisettings.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d7d0af3543..4b80b2d0a9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1503,6 +1503,7 @@ F:	package/serd/
 F:	package/sord/
 F:	package/sratom/
 F:	package/stb/
+F:	package/uefisettings/
 F:	package/zchunk/
 F:	support/testing/tests/package/sample_python_rtoml.py
 F:	support/testing/tests/package/test_python_rtoml.py
diff --git a/package/Config.in b/package/Config.in
index f2c63ffb6e..4f2d0cf7b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -648,6 +648,7 @@ endmenu
 	source "package/udev/Config.in"
 	source "package/udev-gentoo-scripts/Config.in"
 	source "package/udisks/Config.in"
+	source "package/uefisettings/Config.in"
 	source "package/uhubctl/Config.in"
 	source "package/umtprd/Config.in"
 	source "package/upower/Config.in"
diff --git a/package/uefisettings/Config.in b/package/uefisettings/Config.in
new file mode 100644
index 0000000000..734f9b864d
--- /dev/null
+++ b/package/uefisettings/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_UEFISETTINGS
+	bool "uefisettings"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  The tool to read/get/extract and write/change/modify
+	  BIOS/UEFI settings from Linux terminal.
+
+	  https://github.com/linuxboot/uefisettings
diff --git a/package/uefisettings/uefisettings.hash b/package/uefisettings/uefisettings.hash
new file mode 100644
index 0000000000..505b5de566
--- /dev/null
+++ b/package/uefisettings/uefisettings.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  5d4d6f771e615df9fee3d531c85dad9946ed793fc0a0e636dee1d342780f7863  uefisettings-f90aed759b9c2217bea336e37ab5282616ece390-cargo2.tar.gz
+sha256  acc0b83e151985bb943d35ac37e7522fef28d707af9a4829678e92baa409aaf1  LICENSE
diff --git a/package/uefisettings/uefisettings.mk b/package/uefisettings/uefisettings.mk
new file mode 100644
index 0000000000..0559b1c504
--- /dev/null
+++ b/package/uefisettings/uefisettings.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# uefisettings
+#
+################################################################################
+
+UEFISETTINGS_VERSION = f90aed759b9c2217bea336e37ab5282616ece390
+UEFISETTINGS_SITE = $(call github,linuxboot,uefisettings,$(UEFISETTINGS_VERSION))
+UEFISETTINGS_LICENSE = BSD-3-Clause
+UEFISETTINGS_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
