Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6D3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 21:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8102A4048A;
	Thu, 17 Mar 2022 21:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZ9QHwuDosCg; Thu, 17 Mar 2022 21:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A9AF40469;
	Thu, 17 Mar 2022 21:43:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 297B61BF315
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14C6960B61
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 21:43:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BScZhfhiJDpJ for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 21:43:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D1C9960B59
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 21:43:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h15so9209847wrc.6
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 14:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gjIy+vvRU6VkPqLUGdZe9ROgSQRrLQfaQoPNK7YtCLw=;
 b=cLynTanXsbkoxW/uo2X9BIpx4dhFcy2RyV0YR1WAu9jL1ipXAXW7m7CmBnxvLqSPIC
 t/kZjyFaLVKsi3k0PYRufAd12N4eGzmjv9huHk/ed6F85wBXx8G788Yk0dSgIsB2NDwR
 EeO1mRLj20XPGTsBF9Ynsm0pXgef8skwlPr4qy6wYFEOY6ni7SqXF/UzDmdpvxBzAewq
 MSG3A84ncbQN6dxituFNtttDMm4epsdhQF35X4uO6zpb6LpH9A1BfZf8sQhNYJWla2bv
 gFQPDlYLlMviyNogqhNIS/I4KV5CCWOkX2QAlM0fl3UbiAqt6c6l6POZaOedDuzgPhqi
 gmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gjIy+vvRU6VkPqLUGdZe9ROgSQRrLQfaQoPNK7YtCLw=;
 b=SE1QHJP8lceiuFbRe4LZKKJtqITXDZEXad8IFE4l0fIrhV4z9aKq1EHfUx/u+A9LBu
 baXivxVEs0druXKdZXdIzaUQFeWrNZ1Ap/raTRP86uX9zT2NpONuHlIdUtxwnPMoD49l
 sOOnvJ9XEXs/jIHtsgFfIVPQuushIBa2gu2XszbBosWG3KdKGaVPgc68oTAZFicFescP
 o3aLmr042dw4pAESQXRv5GHHdSUKb+8J57TsnAWL6EPfmFc7hCONo9icg3KAEZgHXlYh
 0FgterXvkWP2r0gUNyEPPqDpFYfrINX7fqtWCWCWMeKOtNGqqR4YNr9qwvstwvVT+GQm
 wvGQ==
X-Gm-Message-State: AOAM531hsnxMrqfCll+kArIX0ebAdDYecXvd/IGDw4imvIkrzmsNA0aX
 QWmGMSfHlHxI4b4YGXX2Mv8FuBRDc0Y=
X-Google-Smtp-Source: ABdhPJw0NvKUmqvmd5I0aVGV23W+pov1nns5QSelhjm8jIjIKJRkXOvP8jUAjQHEfX8vaDnID9OYBA==
X-Received: by 2002:a5d:64af:0:b0:203:88d0:716e with SMTP id
 m15-20020a5d64af000000b0020388d0716emr5547854wrp.327.1647553390716; 
 Thu, 17 Mar 2022 14:43:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 10-20020adf808a000000b001edd413a952sm4712972wrl.95.2022.03.17.14.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 14:43:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 22:42:03 +0100
Message-Id: <20220317214203.258736-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rtl_433: fix CVE-2022-25051
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

An Off-by-one Error occurs in cmr113_decode of rtl_433 21.12 when
decoding a crafted file.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...low-in-Clipsal-CMR113-and-Somfy-IOHC.patch | 58 +++++++++++++++++++
 package/rtl_433/rtl_433.mk                    |  3 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch

diff --git a/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch b/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
new file mode 100644
index 0000000000..e2088b29e7
--- /dev/null
+++ b/package/rtl_433/0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
@@ -0,0 +1,58 @@
+From 2dad7b9fc67a1d0bfbe520fbd821678b8f8cc7a8 Mon Sep 17 00:00:00 2001
+From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
+Date: Mon, 24 Jan 2022 15:53:20 +0100
+Subject: [PATCH] minor: Fix overflow in Clipsal-CMR113 and Somfy-IOHC reported
+ by aug5t7
+
+[Retrieved from:
+https://github.com/merbanan/rtl_433/commit/2dad7b9fc67a1d0bfbe520fbd821678b8f8cc7a8]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/devices/cmr113.c     | 4 ++--
+ src/devices/somfy_iohc.c | 9 +++++----
+ 2 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/src/devices/cmr113.c b/src/devices/cmr113.c
+index c85dfac56..19ec5d421 100644
+--- a/src/devices/cmr113.c
++++ b/src/devices/cmr113.c
+@@ -42,8 +42,8 @@ Kudos to Jon Oxer for decoding this stream and putting it here:
+ 
+ */
+ 
+-#define COMPARE_BITS 83
+-#define COMPARE_BYTES (COMPARE_BITS/8)
++#define COMPARE_BITS  83
++#define COMPARE_BYTES ((COMPARE_BITS + 7) / 8)
+ 
+ static int cmr113_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+ {
+diff --git a/src/devices/somfy_iohc.c b/src/devices/somfy_iohc.c
+index 906cae53e..2c88067b5 100644
+--- a/src/devices/somfy_iohc.c
++++ b/src/devices/somfy_iohc.c
+@@ -100,11 +100,12 @@ static int somfy_iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+     if (bitbuffer->num_rows != 1)
+         return DECODE_ABORT_EARLY;
+ 
+-    int offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
+-    if (offset >= bitbuffer->bits_per_row[0] - 19 * 10)
++    unsigned offset = bitbuffer_search(bitbuffer, 0, 0, preamble_pattern, 24) + 24;
++    if (offset + 19 * 10 >= bitbuffer->bits_per_row[0])
+         return DECODE_ABORT_EARLY;
+ 
+-    int num_bits = bitbuffer->bits_per_row[0] - offset;
++    unsigned num_bits = bitbuffer->bits_per_row[0] - offset;
++    num_bits = MIN(num_bits, sizeof (b) * 8);
+ 
+     int len = extract_bytes_uart(bitbuffer->bb[0], offset, num_bits, b);
+     if (len < 19)
+@@ -120,7 +121,7 @@ static int somfy_iohc_decode(r_device *decoder, bitbuffer_t *bitbuffer)
+     // calculate and verify checksum
+     if (crc16lsb(b, len, 0x8408, 0x0000) != 0) // unreflected poly 0x1021
+         return DECODE_FAIL_MIC;
+-    bitrow_printf(b, len * 8, "%s: offset %d, num_bits %d, len %d, msg_len %d\n", __func__, offset, num_bits, len, msg_len);
++    bitrow_printf(b, len * 8, "%s: offset %u, num_bits %u, len %d, msg_len %d\n", __func__, offset, num_bits, len, msg_len);
+ 
+     int msg_type = (b[0]);
+     int dst_id   = ((unsigned)b[4] << 24) | (b[3] << 16) | (b[2] << 8) | (b[1]); // assume Little-Endian
diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index a5139ddae6..d1c28adbf5 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -17,6 +17,9 @@ RTL_433_CONF_OPTS = \
 	-DBUILD_TESTING_ANALYZER=OFF \
 	-DENABLE_SOAPYSDR=OFF
 
+# 0003-minor-Fix-overflow-in-Clipsal-CMR113-and-Somfy-IOHC.patch
+RTL_433_IGNORE_CVES += CVE-2022-25051
+
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
