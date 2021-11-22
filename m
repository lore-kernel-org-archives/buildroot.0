Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937F7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 22:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31A6F80DB9;
	Mon, 22 Nov 2021 22:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I98GP3TwYpon; Mon, 22 Nov 2021 22:46:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD1880DA3;
	Mon, 22 Nov 2021 22:46:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44AE51BF951
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4180540433
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 22:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nPsTP2bp_XJ for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 22:46:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DFDA94041F
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 22:46:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id s13so35525452wrb.3
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 14:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKvTyGaHOMH7EXd1dqBkoQYLLbqNUpQ1JFJOCQodrag=;
 b=QlHKOV5tG8thLaJDMok+tRYk4K66pjY8IEz5yCVpQ/k+uc6r7rnSOzUiWuPEL+GB7t
 A1DqecRdxeRZP7j+NZzxH1xW2nhaQYb8/sRcMlq14R6UX7CI0MBq9+g72J333Uh/OZ4y
 UC8Rqaej4qNXC++rQ5PSTnME85ZMqswcTjIsfKGnPOp9MHp09AerG8HS9BU7XywokbVj
 6w7HXAYdmKZaxqLlnMDpnxJCLyOUdFPDKDE5hNyEBFNaRLdZKsvBHtPoOaHlvud5lMrd
 DRd6pB5BNKer4iILv0OkJt8meRPo3GkOSEsUP+nF9hdrkLJqN+TnvO4sU+Dn0CXJwSVQ
 68rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKvTyGaHOMH7EXd1dqBkoQYLLbqNUpQ1JFJOCQodrag=;
 b=Tbgr1Z1DkIzdfwSsJnyWtdGcuzmW/kIdZqwXLKm6cmX+Bc+Blf0r6GOKbzT3P5MEWS
 hC9InmMZyi6PjNrNv1cFdp1n+5xKOB3omIIg+oomWKHUHtEJSA4KQRfh+ESx9Dn1+wO2
 XCG2MRhAhLygX56PKiqfTL9j0Gj5H1OmQhiumgaLYjWGogeUteGhwhy2pNiuiWaQuFUp
 4r2n0zqiO9QmGlARdVDGkDSyNd1x0NDQDucmLWKZ3K9Yj+mQxC2YVVrEwLwZBoTchv9J
 MLIQigPgl8cS+IrAemJMxW3ls/EG2F7vrRoKmero//tmUtwHRU+Zjavew+Mo1gHSHoe+
 Zvag==
X-Gm-Message-State: AOAM530yt5kqH5ko1x3cOpjgDvSI/R+5gWlSazDPzc2zdqbmrdmx2C7P
 +4dookMlnyRcFUhih1cee0K73dxHvY0=
X-Google-Smtp-Source: ABdhPJyiNnh0Lq1STkwv0IelMF96vQmJskFTCmT/7HyiWcrZupnPAzYI6YhUw2vhhV+rpUWg5Eoi5A==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr987119wrn.423.1637621190540; 
 Mon, 22 Nov 2021 14:46:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t127sm24106427wma.9.2021.11.22.14.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 14:46:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 23:44:07 +0100
Message-Id: <20211122224407.3646031-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gmp: fix CVE-2021-43618
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

GNU Multiple Precision Arithmetic Library (GMP) through 6.2.1 has an
mpz/inp_raw.c integer overflow and resultant buffer overflow via crafted
input, leading to a segmentation fault on 32-bit platforms.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...z-inp_raw.c-Avoid-bit-size-overflows.patch | 27 +++++++++++++++++++
 package/gmp/gmp.mk                            |  3 +++
 2 files changed, 30 insertions(+)
 create mode 100644 package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch

diff --git a/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
new file mode 100644
index 0000000000..0003f342c3
--- /dev/null
+++ b/package/gmp/0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
@@ -0,0 +1,27 @@
+# HG changeset patch
+# User Marco Bodrato <bodrato@mail.dm.unipi.it>
+# Date 1634836009 -7200
+# Node ID 561a9c25298e17bb01896801ff353546c6923dbd
+# Parent  e1fd9db13b475209a864577237ea4b9105b3e96e
+mpz/inp_raw.c: Avoid bit size overflows
+
+[Retrieved from: https://gmplib.org/repo/gmp-6.2/rev/561a9c25298e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+
+diff -r e1fd9db13b47 -r 561a9c25298e mpz/inp_raw.c
+--- a/mpz/inp_raw.c	Tue Dec 22 23:49:51 2020 +0100
++++ b/mpz/inp_raw.c	Thu Oct 21 19:06:49 2021 +0200
+@@ -88,8 +88,11 @@
+ 
+   abs_csize = ABS (csize);
+ 
++  if (UNLIKELY (abs_csize > ~(mp_bitcnt_t) 0 / 8))
++    return 0; /* Bit size overflows */
++
+   /* round up to a multiple of limbs */
+-  abs_xsize = BITS_TO_LIMBS (abs_csize*8);
++  abs_xsize = BITS_TO_LIMBS ((mp_bitcnt_t) abs_csize * 8);
+ 
+   if (abs_xsize != 0)
+     {
+
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5e16ef1916..9b402767fd 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -14,6 +14,9 @@ GMP_CPE_ID_VENDOR = gmplib
 GMP_DEPENDENCIES = host-m4
 HOST_GMP_DEPENDENCIES = host-m4
 
+# 0001-mpz-inp_raw.c-Avoid-bit-size-overflows.patch
+GMP_IGNORE_CVES += CVE-2021-43618
+
 # GMP doesn't support assembly for coldfire or mips r6 ISA yet
 # Disable for ARM v7m since it has different asm constraints
 ifeq ($(BR2_m68k_cf)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6)$(BR2_ARM_CPU_ARMV7M),y)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
