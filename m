Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427AECD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 18:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD19C40142;
	Mon,  2 Sep 2024 18:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ILnZMIWh19d; Mon,  2 Sep 2024 18:00:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CC714023F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CC714023F;
	Mon,  2 Sep 2024 18:00:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB09F1BF37E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D889A6066D
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 18:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TA6H1vU98st6 for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 18:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8270960622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8270960622
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8270960622
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 18:00:36 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53346132348so5545587e87.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 11:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725300034; x=1725904834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bVEQNuFsvSVPHaurgB7jJ7+bPxmcw3NZh9kSyCB7EfQ=;
 b=b0hPBgTUvVi8OzyeYxDrjyYSw4iQE8sEPdOcF6OBr18r24JTLA25pcElbHEGLQ4s63
 LBw8xFg8nBFcJba7n/Lw4zyxBQDCSvC1V0VjQER/k42Of/25dhBanM130J+ei9j3aDYQ
 2z9Z+p15uZt5/pPz1qviLJLwoyQHpe0kW9aBMv25hl82V99sbrKEX1yeisrduu1ZY8Cu
 E+B6MGsNyqte9u24xbihG1aYqYrJSjiMuXrnsy4bzpXgn9/o/xdrtT0qmyr2YVBomn+3
 ABUZnbXrnHPb8k+Kufafs6q05P2HgJtSieHRRLKfKwNF7hizG7Bcwjmpjfqaaku1c3+P
 A43Q==
X-Gm-Message-State: AOJu0YyelOLF2hA1WrsGjFcYx5D3bFYgACkc42/wToVA4BdYWEkFVYV0
 FijgDbO5cOSyPAc0Lvw+Rb7vEAIeyOpI78tLflAK4boh3K1lWng6DOo3vw==
X-Google-Smtp-Source: AGHT+IE3ERaBXobjQclzmyGrubIhGX6vaCr2udF/gcjaMx6F1TV8LTJ0eQpDtvvMeXHNWMk2fFDjyQ==
X-Received: by 2002:a05:6512:1598:b0:52f:cbce:b9b7 with SMTP id
 2adb3069b0e04-53546a56c49mr7362082e87.0.1725300033119; 
 Mon, 02 Sep 2024 11:00:33 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-53540841d8esm1709818e87.225.2024.09.02.11.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 11:00:32 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 21:00:20 +0300
Message-ID: <20240902180029.2651596-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725300034; x=1725904834; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bVEQNuFsvSVPHaurgB7jJ7+bPxmcw3NZh9kSyCB7EfQ=;
 b=TAR3G4BlyFEZT/iCTeDen7z57fEFQ/UEqzZpUw1GyL+YqgmeTduzzM7rX/dcaifvXV
 1jz9IDJ447RDzoKQ2eR9T7Dzn7B74epF6/t1UeW4agrZa8rBnmo3Eh6t7vqG8SeUKo/8
 tr+fPqkAf5ZBYtWWj9pUCkHnfmv5nm/sfv+2fBOUGUhNUUs3kTh+k8DJ/u7Aoc+LIuC7
 YxFp4y2XcbF/K73JYwqkWJOdQtw4clHB2H6wn0NdpunSclRzSjv+9z1Vqj5kxqzqAKZk
 2E1BNBaLF7w6KI0iMUcR+6zIJQed/pihpYXZlzLA58FYtS+JdKPIlr57PrM7tLWiQOoz
 YQlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TAR3G4Bl
Subject: [Buildroot] [PATCH v2] package/wpa_supplicant: macsec offload needs
 headers >= v5.7
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hardware offload in Linux macsec driver is enabled in compile time if
libnl version is >= v3.6. However this is not enough for successful
build since enum 'macsec_offload' has been added to Linux headers only
since Linux >= v5.7.

Add upstream commit that extends compile time condition for the
enablement of the macsec hardware offload adding Linux headers version
check.

Fixes:
- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---

v1 -> v2:

- drop requirements for Linux headers >= 5.7 for wired driver
- add upstream patch that extends compile time check for macsec offload
  enablement

 ...dware-offload-requires-Linux-headers.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch

diff --git a/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch b/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
new file mode 100644
index 0000000000..7330319d06
--- /dev/null
+++ b/package/wpa_supplicant/0002-macsec_linux-Hardware-offload-requires-Linux-headers.patch
@@ -0,0 +1,53 @@
+From 809d9d8172db8e2a08ff639875f838b5b86d2641 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Thu, 22 Aug 2024 00:03:41 +0300
+Subject: [PATCH] macsec_linux: Hardware offload requires Linux headers >= v5.7
+
+Hardware offload in Linux macsec driver is enabled in compile time if
+libnl version is >= v3.6. This is not sufficient for successful build
+since enum 'macsec_offload' has been added to Linux header if_link.h
+in kernels v5.6 and v5.7, see commits:
+- https://github.com/torvalds/linux/commit/21114b7feec29e4425a3ac48a037569c016a46c8
+- https://github.com/torvalds/linux/commit/76564261a7db80c5f5c624e0122a28787f266bdf
+
+New libnl with older Linux headers is a valid combination. This is how
+hostapd build failure has been detected by Buildroot autobuilder, see:
+- http://autobuild.buildroot.net/results/b59d5bc5bd17683a3a1e3577c40c802e81911f84/
+
+Extend compile time condition for the enablement of the macsec hardware
+offload adding Linux headers version check.
+
+Fixes: 40c139664439 ("macsec_linux: Add support for MACsec hardware offload")
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+
+Upstream: https://w1.fi/cgit/hostap/commit/?id=809d9d8172db8e2a08ff639875f838b5b86d2641
+
+---
+ src/drivers/driver_macsec_linux.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/drivers/driver_macsec_linux.c b/src/drivers/driver_macsec_linux.c
+index c86715498..fad47a292 100644
+--- a/src/drivers/driver_macsec_linux.c
++++ b/src/drivers/driver_macsec_linux.c
+@@ -19,6 +19,7 @@
+ #include <netlink/route/link.h>
+ #include <netlink/route/link/macsec.h>
+ #include <linux/if_macsec.h>
++#include <linux/version.h>
+ #include <inttypes.h>
+ 
+ #include "utils/common.h"
+@@ -32,7 +33,8 @@
+ 
+ #define UNUSED_SCI 0xffffffffffffffff
+ 
+-#if LIBNL_VER_NUM >= LIBNL_VER(3, 6)
++#if (LIBNL_VER_NUM >= LIBNL_VER(3, 6) && \
++     LINUX_VERSION_CODE >= KERNEL_VERSION(5, 7, 0))
+ #define LIBNL_HAS_OFFLOAD
+ #endif
+ 
+-- 
+2.46.0
+
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
