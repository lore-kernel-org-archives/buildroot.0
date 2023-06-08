Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C48C7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 311ED61575;
	Thu,  8 Jun 2023 18:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 311ED61575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XKUTAlBRjzW; Thu,  8 Jun 2023 18:11:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5837E61572;
	Thu,  8 Jun 2023 18:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5837E61572
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 944F51BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B88B403EA
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B88B403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bAcsttwye6Yn for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:09:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2835401CC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2835401CC
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:09:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f732d37d7bso6826775e9.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247745; x=1688839745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vpr8q3bGkCW4VxXd9lMF3ciKgVTffwTmOwqyEJIoXcs=;
 b=AaG1cRoGCHBKnu8wGEOCsOONPk4hqIFqvjZz/tgatI54Iu0GVimiYrbJt7HXftEqSN
 lpnvAdWTMVAPL9CHXOZQQ4TqPpq2Zz4uV5+yAB8ydGxBN4JfKOEzdz6llsDInSVhkOi+
 xT+b8+jCjK+gyULL8Z6XZMp2qWgp357+5N2+Bp3fvEjC5TJKsVXbaz8IfqPDJZ5ToGSB
 wWfYcm+bkX7bO6gkykCXxKM+BGfzQdjpB3GqoyvCSusmuJiMEWE9K4I71NbWxTS1aMyS
 4R2UFaTGcvQfbDQXVo65Lj9Hy+XcLNTiNZHRIK4auUy6dE6xcCy5Y3u7AhhZcH48nYg/
 dhuA==
X-Gm-Message-State: AC+VfDz4wqncURy+MsyCbiYhQJC0FDhW16qPKEhJU6J1gRAOR6cub3QN
 EgN0qEiADwy6JHRCevDbJnEGhyPW8VA=
X-Google-Smtp-Source: ACHHUZ7S0j1k+EPbqAlZORWBgMXTTrdDtou3u3KbQCiQ41VS32+9HEtrLmvzCfpJnKlAo5GCvautbA==
X-Received: by 2002:a5d:698b:0:b0:30a:8c0b:320e with SMTP id
 g11-20020a5d698b000000b0030a8c0b320emr7397790wru.10.1686247744836; 
 Thu, 08 Jun 2023 11:09:04 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:09:04 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:43 +0200
Message-Id: <20230608180844.189528-15-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247745; x=1688839745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vpr8q3bGkCW4VxXd9lMF3ciKgVTffwTmOwqyEJIoXcs=;
 b=iB9354o/c5VFHYZ+mNdpub/x4xNN8tf1E6OfOJv2YeVhBqryK+C2pj3CShvJcBIFON
 SAyXg14bpSaBg9pQSJ+5JmVnIPlIG90sG/+c9p2kJfU/fSb0ZlHmfxlIGbupnK6SGt3P
 IdAqz6KL+wKGJup7EvwIYCuDjB5klbBByQziIg73v153iRBjnPjg1xBic/uPwmMyt1yz
 /hPdPRrao1ZqHsKbcMVPHTXyxQoayuhkBIL9nYA+bziHbmwFvnMAKZ9O0qZcMF+9+47o
 R8sipHArQM92hf0ydorr05vN5g4nFqwYi24rZs5gq6kfCsXL3YbalI33sxMZ67I0t2ae
 NgRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iB9354o/
Subject: [Buildroot] [PATCH 15/16] support/testing: TestPythonPy3Txtorcon:
 use basetest
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
 support/testing/tests/package/test_python_txtorcon.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
index 6f0c4ca1ed..d471b43a4b 100644
--- a/support/testing/tests/package/test_python_txtorcon.py
+++ b/support/testing/tests/package/test_python_txtorcon.py
@@ -3,14 +3,8 @@ from tests.package.test_python import TestPythonPackageBase
 
 class TestPythonPy3Txtorcon(TestPythonPackageBase):
     __test__ = True
-    # Need to use a different toolchain than the default due to
-    # python-cryptography using Rust (not available with uclibc)
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_PYTHON3=y
         BR2_PACKAGE_PYTHON_TXTORCON=y
         BR2_TARGET_ROOTFS_CPIO=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
