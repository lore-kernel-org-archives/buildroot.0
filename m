Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D97C3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 21:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AA4860A6C;
	Fri, 13 May 2022 21:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kRqWSkrE2iSX; Fri, 13 May 2022 21:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE1460B79;
	Fri, 13 May 2022 21:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C95801BF5A8
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:54:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5CC160806
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 21:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTXQLYT9zFDf for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 21:54:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBC5660681
 for <buildroot@buildroot.org>; Fri, 13 May 2022 21:54:08 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bd25-20020a05600c1f1900b0039485220e16so5973494wmb.0
 for <buildroot@buildroot.org>; Fri, 13 May 2022 14:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iTJ5SwAIHsXOhOWCOyl+TlYX6TXZk0NITXBgnm8EdtI=;
 b=e+UaefpOzFlAN9JMgrVfsA/fTQ2N3WYjsSgRFbVHSheailCmMYtNhPZ0eP8BwYlCOv
 Rpx7DTmk7f4I2GCko456lIT66/DKKM/E6C+jQxylrDaiiAaSBdATplE/VXoAKRvz51dB
 F/HzOngqkqTIcwWb+OEFy10qNqdZLju5G8hyhJvujJrwxgNDN8ihLpDWbVcDZlqaw3As
 tnIl2kFYgb1FIAd/dOUyUMHIgRRoHuWi0O5QHDFScH7fMLuu7VwRoCR32sSYMQFaIBC1
 9PSajoEBwgUMzceisFxLdynqvx0LzAsfPNQ1Dfxc0puAjZ2R72nJh4rZJLI+HmhqDwWv
 gckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iTJ5SwAIHsXOhOWCOyl+TlYX6TXZk0NITXBgnm8EdtI=;
 b=Ie224rsIKQsfruZm4hpYfn/ohc3q2BwKt42dGSBZDmmius5rX0tcdGFj+XRiEhiMi7
 rxv6s0JMqVzKiMKS4Jxt2uoQ/Y7ZRVTT3dtmiMK9xDwstErvlHV83dR/lUtD1UnycRVZ
 KvE4sow6A/QPWHM41LU0rOye6646RLfJ6XeVB5pVEC8erC5zpk2qjtns+hn33UeRFv0B
 NLLlh4WbQmEhHdfrC+0OyYnpD78C7P2triE/n4/rqYBTgfXNWjvruS/f4edF7cfuWDr3
 lIVDj+f+1RrnQWOyyWBqIMsVrFomZNw2RkpzXLEaRZsvE//SXWLTKW3S3HtYuRfwoJ0d
 1asQ==
X-Gm-Message-State: AOAM531S7WHVEQMWDJP6aEHlktkZBORKI51k8Ai+6nBNdfCvWQL77bX7
 wYCCJBjAb5voAHm8rMHPpq2rzCI7HFs=
X-Google-Smtp-Source: ABdhPJx912JhZ2xK47TbdvMHOkygzJ3CfMfIL6B+OScWiDyqTToVY5faQ3W4lp2s9VAhu6q1sZB5vg==
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr6503723wmk.15.1652478846887; 
 Fri, 13 May 2022 14:54:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d90asm3006290wrd.86.2022.05.13.14.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 14:54:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 23:51:56 +0200
Message-Id: <20220513215156.1342774-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/i2pd: fix build with libressl >=
 3.5.0
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

Fix the following build failure with libressl raised since bump to
version 3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

In file included from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Signature.h:18,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Identity.h:20,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Destination.h:21,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd_client/ClientContext.h:16,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/i18n/I18N.h:12,
                 from /nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/i18n/Afrikaans.cpp:13:
/nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Crypto.h: In function 'int DSA_set0_pqg(DSA*, BIGNUM*, BIGNUM*, BIGNUM*)':
/nvmedata/autobuild/instance-27/output-1/build/i2pd-2.40.0/build/../libi2pd/Crypto.h:338:22: error: invalid use of incomplete type 'DSA' {aka 'struct dsa_st'}
  338 |                 if (d->p) BN_free (d->p);
      |                      ^~

Fixes:
 - http://autobuild.buildroot.org/results/8da524dda4a548de9b006ae156fdc582b0cffd47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pd-Fix-the-build-with-LibreSSL-3-5-2.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch

diff --git a/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
new file mode 100644
index 0000000000..e9f905b7ee
--- /dev/null
+++ b/package/i2pd/0001-libi2pd-Fix-the-build-with-LibreSSL-3-5-2.patch
@@ -0,0 +1,27 @@
+From 0a1e302e8a242bbd1d39556e5ef05aced1b3b504 Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Sun, 8 May 2022 22:50:44 -0700
+Subject: [PATCH] libi2pd: Fix the build with LibreSSL 3.5.2
+
+[Retrieved from:
+https://github.com/PurpleI2P/i2pd/commit/0a1e302e8a242bbd1d39556e5ef05aced1b3b504]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libi2pd/Crypto.h | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/libi2pd/Crypto.h b/libi2pd/Crypto.h
+index b02778141..726bd0a1e 100644
+--- a/libi2pd/Crypto.h
++++ b/libi2pd/Crypto.h
+@@ -29,7 +29,9 @@
+ #include "CPU.h"
+ 
+ // recognize openssl version and features
+-#if ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
++#if (defined(LIBRESSL_VERSION_NUMBER) && (LIBRESSL_VERSION_NUMBER >= 0x3050200fL)) // LibreSSL 3.5.2 and above
++#   define LEGACY_OPENSSL 0
++#elif ((OPENSSL_VERSION_NUMBER < 0x010100000) || defined(LIBRESSL_VERSION_NUMBER)) // 1.0.2 and below or LibreSSL
+ #   define LEGACY_OPENSSL 1
+ #   define X509_getm_notBefore X509_get_notBefore
+ #   define X509_getm_notAfter X509_get_notAfter
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
