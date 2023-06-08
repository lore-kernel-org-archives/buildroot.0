Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED66C7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C85042483;
	Thu,  8 Jun 2023 23:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C85042483
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dq17e0BqIT0Q; Thu,  8 Jun 2023 23:32:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 292DA42476;
	Thu,  8 Jun 2023 23:32:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 292DA42476
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 861161BF390
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CEA060EE4
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CEA060EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IxXIMcXPzyGc for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4FAD60E5D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B4FAD60E5D
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:18 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe934so8779445e9.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266956; x=1688858956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YvsqxGVEpoV5geZ7tDqDXUPuWk3uOdE6GguDZbVHFpA=;
 b=QVIeAVR3FyMWXUMqFar3AgTiFUfYdrbxDW2dUp+hLnH4rBLtYeM/wSVF5llaohORmA
 5bbgUEXoqf0uj7UvOMNv0vUr4XjzQ2whFctWFKhixaS+xb/613tgLQABHNbjQoRBNIJl
 b1IltNL0GIUMo6Cydjtn9YdNFGKpoT05m9wqpg6UHFYYgWCvvUYeUJp0DDoo+NserjW4
 cRsMucirB++8bwllbOU6S26Gnu1e6Oah7xwtLaAsGYv54LSpSczRpwrIG1sIgDa1+qAV
 1T373Saf6/JVb+7xFUHWS7yk9/8Vsj3XQyHsemsW9R1qKjmgaUBw2uOe1+z4JM2rPqpI
 Xffg==
X-Gm-Message-State: AC+VfDwGiYoflpTjgGAAPrRpZ5Q5Z1XgGwEa53oq1dNJrDxtfi6LMT+W
 yWX3G+kkpCSiCXxrud+7IumaqgUPTvY=
X-Google-Smtp-Source: ACHHUZ5v9vjUL7LV2N3KYR7/TYsisH4jgtwIFXUlyEVuGi1uY6sgh173rGbjMHh819+n2IBhXGMUVg==
X-Received: by 2002:a05:600c:a388:b0:3f6:787:4a84 with SMTP id
 hn8-20020a05600ca38800b003f607874a84mr2280640wmb.7.1686266956634; 
 Thu, 08 Jun 2023 16:29:16 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:16 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:57 +0200
Message-Id: <20230608232859.1245497-15-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266956; x=1688858956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YvsqxGVEpoV5geZ7tDqDXUPuWk3uOdE6GguDZbVHFpA=;
 b=WKudP9ALEht4hUfiVuDDRfvc9C0+5qDHcTkdSMdCzPqKOhDiwbQsPAqQbU+eUczIE2
 drrGeHwGk5R89CnAGttTtUHwdDoeEaZRkUlLzOEibvQBf4PgLPxxBIhCJM/7tnqa2ZnZ
 SFSGG171TCB53J4BC9qTTjruPcAMfWAaDY68gDXYZ4QYQUq5/efGljgPXBxwYvXQO+Ms
 gYUdm9uK3Q70Xq2JmWeb6/ui+DehTiFhCrQtQ2k4DjWFGyBUyCVYR7LlCzqi4xfOOnSP
 rFmdD9z+SwZlqupZJ9PGbqJFejhr2uNWXH9BrNxY84A0AtJ2IxdNRJgDBXzlIFq2X9bL
 /yDQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=WKudP9AL
Subject: [Buildroot] [PATCH v2 15/17] support/testing:
 TestPythonPy3ServiceIdentity: use python base configuration
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The base configuration now provide a glibc toolchain,
we can safely switch to it.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: use TestPythonPackageBase.config
---
 .../testing/tests/package/test_python_service_identity.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
index dbad5f931f..16ea943d41 100644
--- a/support/testing/tests/package/test_python_service_identity.py
+++ b/support/testing/tests/package/test_python_service_identity.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
     __test__ = True
-    # Need to use a different toolchain than the default due to
-    # python-cryptography using Rust (not available with uclibc)
-    config = \
+    config = TestPythonPackageBase.config + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
