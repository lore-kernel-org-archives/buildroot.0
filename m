Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E63C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 21:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAFFE8274E;
	Mon, 13 Jun 2022 21:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c43DSIPDRhiI; Mon, 13 Jun 2022 21:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB8C826DF;
	Mon, 13 Jun 2022 21:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECB81BF27C
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BD46416C3
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 21:17:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDI1JbNrEwFo for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 21:17:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2ACF1416E7
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 21:17:06 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 m39-20020a05600c3b2700b0039c511ebbacso5215930wms.3
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 14:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yahTDkIQr8Zea83yvGO9WzeV1sq5CuSGQjC9s9PBc4g=;
 b=osNS+FFloHNyrTWzGLhp9ZD2x08CfUjeJgc6w9CVXhPwGsY/VHey9q9UDpDCPfl8bH
 BsOi5NpGgro5q3vb08chiMUpZ23AlsHrXzhtOg+sUsDPVJGt8dGV/KW6Ttwomo1aTSpd
 mhakLdHmPBOI2fWphpyV/SsfULq/Q0wUinTniCekDxMNJjuTFCguCo0gFemtbyNVdiTR
 bukWm8JmPbv7Btlqo91N10W6odEY2olLInXXN7rvZZw29EtANrd0xJyUFdAzzevEHJEQ
 Dg3xmYI0tKgx/uDJ+fe4qCdl2j1aXecMh9OSFpvsWbfukwiUEWQs6cMAzTdebep+67DJ
 4xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yahTDkIQr8Zea83yvGO9WzeV1sq5CuSGQjC9s9PBc4g=;
 b=v+Yo3m/lZUzp2g0cV5lyZXgT7SKDjJL4XjFWY5/0VVzUASPaX7UOBR87LmHm9cFZUy
 QgtUdxrKZHzUZceLrPoe5Pxmjjp+HCKQo28IFBbJd7gx7391GrwDXild+G1Oc7NffFVj
 G4rUZrnbfBHFy7NdQ/2vKMkVrkRUKnQu7lYNNEMcJxUpiPsoQl5hL9VYCz+TFDxIctW/
 SUf5q5+qmktAEDaYX/zwUshwWam1dsHgRvu7D3srZz7P4d3V8fx/3j8A+f+q3vhu/Lsu
 BeRqgqVKLmV/MJIs2wx8LvmRcPn7hwSUiK5qgPBo37X2QLAgMk9BMAVk9AhSEG3IQqUC
 UBfw==
X-Gm-Message-State: AOAM531AK1vQu/tPwMkuEUjt49GWtipc/BZsSNQLpBPA3cw3Z1JpAGzF
 Z8po6aWRWn8pbE5GZpnbpATBc90mLZU=
X-Google-Smtp-Source: ABdhPJxRkJNC5RsRrGzwgA3fMl88833mTa/65XRtfd9ZpYb2hGWGsaVMVTO0uCXpItBM29/nq1MCgw==
X-Received: by 2002:a7b:c310:0:b0:38c:f07a:e10d with SMTP id
 k16-20020a7bc310000000b0038cf07ae10dmr660160wmj.110.1655155024093; 
 Mon, 13 Jun 2022 14:17:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l30-20020adfa39e000000b00215859413f3sm10015582wrb.107.2022.06.13.14.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 14:17:03 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 23:14:19 +0200
Message-Id: <20220613211419.296864-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pillow: security bump to
 version 9.1.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This release addresses several security problems including
CVE-2022-30595.

https://github.com/python-pillow/Pillow/releases/tag/9.1.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index 2e259c1caf..ff23ed6299 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  a9ebd39b3482993474872757d317e26f  Pillow-9.1.0.tar.gz
-sha256  f401ed2bbb155e1ade150ccc63db1a4f6c1909d3d378f7d1235a44e90d75fb97  Pillow-9.1.0.tar.gz
+md5  f0d347298e72b403fbc3198677f394bb  Pillow-9.1.1.tar.gz
+sha256  7502539939b53d7565f3d11d87c78e7ec900d3c72945d4ee0e2f250d598309a0  Pillow-9.1.1.tar.gz
 
 # Locally computed sha256 checksums
 sha256  a6554cb737ba6c9b47d3301f78de03b4ed0d3f08d6cf9400714f3d4c894f6943  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 2abe5e04ef..8c9cb86863 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 9.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/4b/83/090146d7871d90a2643d469c319c1d014e41b315ab5cf0f8b4b6a764ef31
+PYTHON_PILLOW_VERSION = 9.1.1
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/43/6e/59853546226ee6200f9ba6e574d11604b60ad0754d2cbd1c8f3246b70418
 PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
