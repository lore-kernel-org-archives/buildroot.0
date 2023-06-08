Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075E4C7EE29
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A967C6151D;
	Thu,  8 Jun 2023 18:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A967C6151D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yUBcRNcOKcHV; Thu,  8 Jun 2023 18:10:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6B176154D;
	Thu,  8 Jun 2023 18:10:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6B176154D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A06921BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F7F6150D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F7F6150D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R7LlNU1JUGJf for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A210F611B9
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A210F611B9
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f78a32266bso8589365e9.3
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247735; x=1688839735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l5JmrCyJEhsYfdzfLcHFVUgApKMWuopK5/jx8v4dyCY=;
 b=lrnGu3edyjWBVsf5hhX/88j4ZsjNC8XW/JGyPcNIY263cV4/pXdQ8Dq3qrUryEUi2M
 J/JRHC96kvAJ3OBjVgVMvoaYPo7ijvWTAeCvdRtEjcPtoAmvJ12WR49Av6CosdzrTRZh
 JSl/YH7b+JAvMmJMFFzNyD3X/e6ki7kYuTOQQndt0+0avRv0mYzhETzqDiQEI//LvafC
 sEt/0oid8t1C8VnI0KimLogUJYuVh0Zx9fzq6Zfv9ct7KLNhNh3QX3HHbbVmJi7uq/dD
 OXP3mMxT0bLHgd4lrLA0souw8Y6yTnD++H2lQ0yrkFPfsYVofGMTyxVYZXgduI2oWw1h
 NCZw==
X-Gm-Message-State: AC+VfDzKLXl+8PvskteWGwHE3bWUXldwwEQVMerWY5+mLfHxQR9O0hjt
 wleqKqJrpb7wm7/LJGMupn8ticznqv0=
X-Google-Smtp-Source: ACHHUZ4NAYkfbHaAl79kxtMhNJhyTXG2KO0UIJemXsKXiVCaXR9FF6voYav0cOnje049/qJkaGYi7w==
X-Received: by 2002:a5d:498f:0:b0:307:cb94:85de with SMTP id
 r15-20020a5d498f000000b00307cb9485demr11889554wrq.11.1686247735479; 
 Thu, 08 Jun 2023 11:08:55 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:54 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:35 +0200
Message-Id: <20230608180844.189528-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247735; x=1688839735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l5JmrCyJEhsYfdzfLcHFVUgApKMWuopK5/jx8v4dyCY=;
 b=k6r4XlLfimWQoYo9ceHzu5puNioL4twVyMlgyj/rJ4Y83uKd61XfbSk/kDlWKNigs8
 nAdwmFV53dAv11CQQX79+5wm1DYP+T08SHl2EluPSGuwmY2hRcWsu4MPEtMZLufWii3u
 cMZVr91kQaA7e6saidR3Y1mb+KyxmGAEWRM8LmwP5usaVPdpsVwzHum8edpeeJz2SIZv
 6PDKXmJ/j+Twnk1WASzSpDx72BqtV2JBmAGaoTDe9PKGLl4HQ7N04L+TZsrniAXVbPS3
 GbjKFjz5hGvWsBFLEY5aM4oZsGIAnW4VcpYwwDPi5NFMQgu3IfdmQb/yJYFXIEdWHP5y
 IGGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=k6r4XlLf
Subject: [Buildroot] [PATCH 07/16] support/testing: TestMtools: use base
 configuration
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
 support/testing/tests/package/test_mtools.py | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/support/testing/tests/package/test_mtools.py b/support/testing/tests/package/test_mtools.py
index 51e5138481..4a232bc926 100644
--- a/support/testing/tests/package/test_mtools.py
+++ b/support/testing/tests/package/test_mtools.py
@@ -4,14 +4,8 @@ import infra.basetest
 
 
 class TestMtools(infra.basetest.BRTest):
-    # We use a glibc toolchain to have iconv conversion working for
-    # codepage 850.
-    config = \
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
-        BR2_arm=y
-        BR2_TOOLCHAIN_EXTERNAL=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
-        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE=y
         BR2_PACKAGE_MTOOLS=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
