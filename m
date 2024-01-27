Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEF5C46CD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Jan 2024 17:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AF02415F1;
	Sat, 27 Jan 2024 17:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AF02415F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id elQMK_EMofCD; Sat, 27 Jan 2024 17:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9868E415E9;
	Sat, 27 Jan 2024 17:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9868E415E9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 16EA31BF2E3
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E47CE60BF7
 for <buildroot@lists.busybox.net>; Sat, 27 Jan 2024 17:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E47CE60BF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JV756Xo3QJ8i for <buildroot@lists.busybox.net>;
 Sat, 27 Jan 2024 17:30:06 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE0A560AF8
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 17:30:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE0A560AF8
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso1496448f8f.0
 for <buildroot@buildroot.org>; Sat, 27 Jan 2024 09:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706376603; x=1706981403;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hlrsuz1Xok2g1DMLlYgLfWVIxsPI3589IC7uE9HsQU4=;
 b=EihaLdeNCChPhCNHSSwkOqWXc5FLUO8tL/hUVtX46uQB9ak7yst/VJ9swfmmiZAHPz
 mLZFpymXZao6fq4o95+JAVIxSl3o76has9QyNksWczDjGZuBtuzAz25bsTd8n7Ha8WO8
 pgT10pfS2lt6uchzeCpRnuaEUoIZV60f6gH8hKBSTajMmFBvZ4l0B4scwUzZTBoBebgl
 GqNVfiAw/Nn3dNcwrHNPaASpxzQfs6h+3yw62091n+5OhLMEC2zRHDVvIDllZlh82k00
 APLavvOhXC/eulmW3mRUFqiFsHPAWZsgiNWB9kVeIlq13XYzzgaVAEdr7edA/e9wrc1D
 QihQ==
X-Gm-Message-State: AOJu0Yy0XbCYl4EYCuoAfx1c8azzF6oT7IvHCDi3G7CyzkscEVkt6zGb
 XVESrPW9Ns3BljDm7xjGKyj7m5y49DeE0nmN0nBC2+ib8OIXYfpgGTbWnqZPqJg=
X-Google-Smtp-Source: AGHT+IGqSVvuAaXbNUeR6MAy5aL5X2KpmWi7rMDyorbE0yGAzaJZZgoHAVYXVlDGaVkXa9vmdfLdrQ==
X-Received: by 2002:adf:e7c9:0:b0:337:d4e3:e1dd with SMTP id
 e9-20020adfe7c9000000b00337d4e3e1ddmr1388003wrn.3.1706376602651; 
 Sat, 27 Jan 2024 09:30:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j9-20020a05600c190900b0040ecdd672fasm5249595wmq.13.2024.01.27.09.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Jan 2024 09:30:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Jan 2024 18:29:52 +0100
Message-ID: <20240127172952.1799597-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706376603; x=1706981403; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hlrsuz1Xok2g1DMLlYgLfWVIxsPI3589IC7uE9HsQU4=;
 b=TYdvPeFiVIduWIQkDuJOY41YCUA4UqLZNj9vWL2xruX7bVdjJAiB6a76hCNp4tgBC/
 RNtXuxpHSRJma8+Q9q1x3RFQFFyzhEmjMZGJZ2OCGQxTIA95A8X9wp7mFW0TaaBVJ9Ro
 oScJdIKPhsHixFiLsrEH+JRHRgVagkvUBepgTMgSzvk4x75+oVpRgjR/AgySHg2FKXgV
 4c9385UpCUlnfYcw8OoMByG7gk6GoSgwGNwHHJMPcMpMp56CE/23Is/xCNtAqjC0fU3D
 OPMVVW1GzAXPaM6Jw9A76Jr1yU9JhpxYEfLpoqW0hVMwGDdap+39PkTN6vWSt9h9rpt4
 GLMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TYdvPeFi
Subject: [Buildroot] [PATCH 1/1] Revert "package/uuu: fix build failure with
 host gcc 13.x"
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 04dfeff6242516a1061973fc7af2cc9c5e3dd4e2 as it
raises the following build failure because patch has been merged since
version 1.5.104:

Applying 0001-Fix-missing-references.patch using patch:
patching file libuuu/libcomm.h
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file libuuu/libcomm.h.rej
patching file uuu/buildincmd.h
Reversed (or previously applied) patch detected!  Skipping patch.
1 out of 1 hunk ignored -- saving rejects to file uuu/buildincmd.h.rej

Fixes:
 - http://autobuild.buildroot.org/results/bf7b2206261e3385c567ae4359b0379b03161e3a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/uuu/0001-Fix-missing-references.patch | 40 -------------------
 1 file changed, 40 deletions(-)
 delete mode 100644 package/uuu/0001-Fix-missing-references.patch

diff --git a/package/uuu/0001-Fix-missing-references.patch b/package/uuu/0001-Fix-missing-references.patch
deleted file mode 100644
index 140c9755c7..0000000000
--- a/package/uuu/0001-Fix-missing-references.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 24fd043225903247f71ac10666d820277c0b10b1 Mon Sep 17 00:00:00 2001
-From: nixgnauhcuy <nixgnauhcuy@gmail.com>
-Date: Tue, 9 May 2023 14:32:33 +0800
-Subject: [PATCH] Fix missing references
-
-Upstream: https://github.com/nxp-imx/mfgtools/commit/24fd043225903247f71ac10666d820277c0b10b1
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- libuuu/libcomm.h | 1 +
- uuu/buildincmd.h | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libuuu/libcomm.h b/libuuu/libcomm.h
-index 0afdfa3..38d622d 100644
---- a/libuuu/libcomm.h
-+++ b/libuuu/libcomm.h
-@@ -28,6 +28,7 @@
- * POSSIBILITY OF SUCH DAMAGE.
- *
- */
-+#include <stdint.h>
- #include <string>
- #include <stdarg.h>
- #include <locale>
-diff --git a/uuu/buildincmd.h b/uuu/buildincmd.h
-index 9415117..46286cc 100644
---- a/uuu/buildincmd.h
-+++ b/uuu/buildincmd.h
-@@ -31,6 +31,7 @@
- 
- #pragma once
- 
-+#include <stdint.h>
- #include <map>
- #include <string>
- #include <vector>
--- 
-2.34.1
-
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
