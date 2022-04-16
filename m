Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730E9C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 07:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3801841C7;
	Sat, 16 Apr 2022 07:47:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xe476kQ56bDG; Sat, 16 Apr 2022 07:47:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD2E481D4D;
	Sat, 16 Apr 2022 07:47:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D9A601BF3DD
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 07:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5CB84015D
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 07:47:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n4QBSGnaQt0J for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 07:47:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 722A4400BA
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 07:47:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id x18so5069521wrc.0
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lvbcvKo6DLy+oyagGSlm1jV4ZNnuIrYueFEq7Ueqrss=;
 b=QRRRDnTmxO6OCUfLBF/NMkmPPFgy58kYDyh78V2cov/4z49NX8fVj10ntug2JSPVcJ
 WmhQCjFNpZqwlBR+E4mWchAbHXK9fCUz1d1C4a33w4irXd/VrnZjyDER4cixYJYPA+Ek
 dAdcyyGZ6sinYCpbmhJhI33FDJQ3n+mN0mAZv/Q4VdqKAPfCPh+RMOCR7KfD8WA/hyhU
 TPAwVym4bCT9qqpdYtPMG3T880HK6Cgx9dvYlTGmXftXGiudrMnviYHIeZmfb9OEEQCS
 VYItx3y1xyv4SKJhFdpjnERF4AVY3Cu5JiQFtIS9S2FFkPruSSYvRBZrnS89MjPHYjlS
 ReWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lvbcvKo6DLy+oyagGSlm1jV4ZNnuIrYueFEq7Ueqrss=;
 b=eTt7TVMzNMLpdzbRYilDRGD8nKKh0wV9Ux4IZqQ/XHMHkqzPwPkLtQvr6+YbWQu79R
 p2InPHB4PUWfM6ovNQtNud5RCmJdoIAUoBNdCY8xXDzb/HvIHE0UODzBSYBuBezGnWfx
 zIurx8nL4JIFKNpRH+McRURMq5HU9u4SaeYxl+SaNKY3jQ5FppVWR+fA6ylcf4OJ24Dp
 XM2s2tX2OQ6Q/rWdIQmQlewpl46vcCfcEIzzS9cZrVa68wJLgs/j5LMTtzWnv3os+Yeu
 QX/Rqt+tbovQoXbOESELa/eb5VFFPQGLZvcVqNL8O1dtvPx1kPfgwyIMP7CpCaQ3FgT0
 uhuQ==
X-Gm-Message-State: AOAM532qHHQLpHJ+c11gDqd+aRLcQN4qgMoN5q6rx2Me9IRWpjqKJMcM
 S/q3kVBD8YnpB23WI0faSgVeLuZFbl0=
X-Google-Smtp-Source: ABdhPJzzr+qTXw5QgXFEVUQZWUoRQOIXeVDU3wQwTOFMmjaCCuFXURNIQbwl/EgvHq27Ua0x+rT6XA==
X-Received: by 2002:a5d:64a7:0:b0:205:fb7a:50ee with SMTP id
 m7-20020a5d64a7000000b00205fb7a50eemr1750746wrp.185.1650095226319; 
 Sat, 16 Apr 2022 00:47:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b0038ce57d28a1sm6994333wmh.26.2022.04.16.00.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 00:47:05 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Apr 2022 09:44:58 +0200
Message-Id: <20220416074458.1361288-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/diffutils: fix build on arceb
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.8 in
commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/8c5b8b37eb3c2667c75666079b056df7e0023e05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-Fix-compilation-error-on-arceb-CPUs.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch

diff --git a/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
new file mode 100644
index 0000000000..20db798f3a
--- /dev/null
+++ b/package/diffutils/0004-sigsegv-Fix-compilation-error-on-arceb-CPUs.patch
@@ -0,0 +1,41 @@
+From 1957bb5113a2bf02c7ecf0815125eec04b9476d2 Mon Sep 17 00:00:00 2001
+From: Bruno Haible <bruno@clisp.org>
+Date: Sat, 16 Apr 2022 03:01:51 +0200
+Subject: sigsegv: Fix compilation error on arceb CPUs.
+
+Reported by Fabrice Fontaine <fontaine.fabrice@gmail.com> in
+<https://lists.gnu.org/archive/html/bug-gnulib/2022-04/msg00028.html>.
+
+* m4/stack-direction.m4 (SV_STACK_DIRECTION): Treat the 'arc' variants
+like 'arc'.
+
+[Retrieved (and backported) from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=1957bb5113a2bf02c7ecf0815125eec04b9476d2]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ ChangeLog             | 8 ++++++++
+ m4/stack-direction.m4 | 4 ++--
+ 2 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 1df823e..924c5de 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -1,4 +1,4 @@
+-# stack-direction.m4 serial 7
++# stack-direction.m4 serial 11
+ dnl Copyright (C) 2002-2021 Free Software Foundation, Inc.
+ dnl This file is free software, distributed under the terms of the GNU
+ dnl General Public License.  As a special exception to the GNU General
+@@ -18,7 +18,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       a29k | \
+       aarch64* | \
+       alpha* | \
+-      arc | \
++      arc | arceb | arc32 | arc64 | \
+       arm* | strongarm* | xscale* | \
+       avr | avr32 | \
+       bfin | \
+-- 
+cgit v1.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
