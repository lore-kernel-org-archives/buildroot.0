Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14F3C3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 28 Dec 2023 15:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A85D41A74;
	Thu, 28 Dec 2023 15:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A85D41A74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nkOOGGrk-Z-e; Thu, 28 Dec 2023 15:28:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D664F41A6F;
	Thu, 28 Dec 2023 15:28:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D664F41A6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD5C1BF31A
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 15:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 441F683252
 for <buildroot@lists.busybox.net>; Thu, 28 Dec 2023 15:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 441F683252
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 87xJ-uaV7SYn for <buildroot@lists.busybox.net>;
 Thu, 28 Dec 2023 15:27:39 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBF8B831EF
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 15:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBF8B831EF
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40d5b159497so22720835e9.1
 for <buildroot@buildroot.org>; Thu, 28 Dec 2023 07:27:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703777256; x=1704382056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jBIDqIwLg2U0OBRPnToLH51uhE44jXh6D70Hgt3JDrQ=;
 b=XnSlz0ukjfRqT3Zolwk6ZaCrNeHt+w9unMP276MHtZUoR5i2D0ddZtPDK0aYj94fHr
 VAgogzbuzul6pBsTJeEtpOsieRHJt2s5nA9MvOE7mNCq+SbQBzB0A8K3nP8l4bHhMs1Z
 4qIWXipCPIsK8UVHWzpa4xH7ua0jcwndJQRSTqCX6cs+p/bKvOp9GdCvJLWzkm+nApM1
 XNO21EbtMRWy0xbKrHO1S5OdBNxKx4IDVWMYz7wuhtyCYLhyYTxvlHxIxb+GBM3fZzHw
 IdU9OzU1rM7Pnm6s9OHSu7F1d5J/L6TQkEVRGRRHZq5+cMd8NbIans2X/Ad8lu3EdUvq
 ucFA==
X-Gm-Message-State: AOJu0YymSEaq1+KeOfEykNea4ntQT9pgSZoNLYXQwE59noBYCuPUVyLi
 Lc2zM0/rh2X+EFzQm+9o/djBsWs5ooN8dkxB8dLhgL9Jok4=
X-Google-Smtp-Source: AGHT+IGKOUEnlfAqjZXj79bvvwgebCqEvAQtLXHxNBHfKkBN1DbKROPLDDTAIFFczl0zjBnycDW5Yw==
X-Received: by 2002:a05:600c:3d08:b0:40d:5ca1:80b9 with SMTP id
 bh8-20020a05600c3d0800b0040d5ca180b9mr1175873wmb.7.1703777256450; 
 Thu, 28 Dec 2023 07:27:36 -0800 (PST)
Received: from P-NAN-KHNOUM.home
 (2a01cb088681650065579d49ec208dd1.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8681:6500:6557:9d49:ec20:8dd1])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a05600c444800b0040c2c5f5844sm27729591wmn.21.2023.12.28.07.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Dec 2023 07:27:36 -0800 (PST)
From: Antoine Coutant <antoine.coutant@smile.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Dec 2023 16:26:57 +0100
Message-Id: <20231228152657.488457-3-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231228152657.488457-1-antoine.coutant@smile.fr>
References: <20231228152657.488457-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1703777256; x=1704382056;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jBIDqIwLg2U0OBRPnToLH51uhE44jXh6D70Hgt3JDrQ=;
 b=QSYLFQqa0sUiOnOgJVl6CFt6VW7aUPulYda5/zPpxQjHk3dh7DQTjGtHjccmyXovsv
 bfb5vdHl0Ux7clEV2S+5BuWd+uB7Oz7dRDal/hzxgUEnMTnfI8Wo8Q0RLTf5RieGV9mo
 RMl4ZUItjr5shgXlCy3+WDcN8e+SUDeSNfR2wUppW7nhNplF4Z3lUTnWzZ9Y4XUVhYHG
 hr3f3KjMCX49iINBymh1G7N7J9EeepIdINCcYIWTsWu22Gkn6cS+TKWB8FoIgSUn/CDk
 /RwSjagjKCcX9xXGctcLi5cg3fviMfvQbDRDF/E7e6IRzVvzq5X/xkbloYyrb7psnQAI
 n36w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QSYLFQqa
Subject: [Buildroot] [PATCH v2 3/3] support/testing: test_rust.py: Add test
 to check correct vendoring
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
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr,
 sebastian.weyer@smile.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sebastian Weyer <sebastian.weyer@smile.fr>

Currently the tests TestRust and TestRustBin do check for vendoring by
requiring package ripgrep to be built but only if the download
directory is already empty, otherwise the existing contents of the download
directory will be reused and therefore not be redownloaded.

This new test will only verify that the required packages are downloaded
and vendored correctly without doing a runtime test. It does so by setting a
path to a folder "dl" inside the build directory (output-directory/testname/)
and then setting the environment variable BR2_DL_DIR to this path before the
build starts. BR2_DL_DIR is not set in the config options because it would be
overridden by the user's own environment variable if defined. This code was
essentially copied from the file test_gitforge.py which was added in commit
1ca6ab6ace3c1f9edfbfd16b57d1280b3ea2c6f5

We want the package ripgrep to be built since it requires vendoring
directly. Additionally we want the package python-cryptography to be
built because it has rust dependencies and therefore indirectly also requires
vendoring.

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
---
Changes v1 -> v2:
	- make the change proposed here:
	http://patchwork.ozlabs.org/project/buildroot/patch/20230207165031.17188-1-sebastian.weyer@smile.fr/
---
 support/testing/tests/package/test_rust.py | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
index fb9dd2d916..763125ca20 100644
--- a/support/testing/tests/package/test_rust.py
+++ b/support/testing/tests/package/test_rust.py
@@ -1,4 +1,5 @@
 import os
+import shutil
 
 import infra.basetest
 
@@ -54,3 +55,44 @@ class TestRust(TestRustBase):
     def test_run(self):
         self.login()
         self.assertRunOk("rg Buildroot /etc/issue")
+
+
+class TestRustVendoring(infra.basetest.BRConfigTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_cortex_a9=y
+        BR2_ARM_ENABLE_NEON=y
+        BR2_ARM_ENABLE_VFP=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        BR2_PACKAGE_HOST_RUSTC=y
+        BR2_PACKAGE_RIPGREP=y
+        BR2_PACKAGE_PYTHON3=y
+        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
+        BR2_BACKUP_SITE=""
+        """
+
+    def setUp(self):
+        super(TestRustVendoring, self).setUp()
+
+    def tearDown(self):
+        self.show_msg("Cleaning up")
+        if self.b and not self.keepbuilds:
+            self.b.delete()
+
+    def check_download(self, package):
+        # store downloaded tarball inside the output dir so the test infra
+        # cleans it up at the end
+        dl_dir = os.path.join(self.builddir, "dl")
+        # enforce we test the download
+        if os.path.exists(dl_dir):
+            shutil.rmtree(dl_dir)
+        env = {"BR2_DL_DIR": dl_dir}
+        self.b.build(["{}-dirclean".format(package),
+                      "{}-legal-info".format(package)],
+                     env)
+
+    def test_run(self):
+        self.check_download("ripgrep")
+        self.check_download("python-cryptography")
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
