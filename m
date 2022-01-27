Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE591C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ECD741C68;
	Thu, 27 Jan 2022 16:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wNsPQ_iaVm2S; Thu, 27 Jan 2022 16:29:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816C041C5D;
	Thu, 27 Jan 2022 16:29:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5551BF297
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:29:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4823684EF9
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjRbhChsbxvu for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:29:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91F8B84EC1
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:29:28 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id e8so2909710ilm.13
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 08:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihz5rcoPeitwrMYLqevhJFu3hPc2qlcX4cuo2RSIHtU=;
 b=EgVSv/hRun+d/J/D+lKyDdZ+2inE0LSEU3gAcRCJYRD+cDrxyv1V00Y6jE+LyFXKXO
 8BxK7fU+WrWboGkWDNqhLh7j450qEzsLg/m1hrSKy/Q2aGX1ntdjfNdh4g93d+wSDUQS
 zWNeeP+Yrs8KNq6QJOIjufbZQ5/fsppEmGxYhJ1nWofzhCSIr1SBwouFoPnZZ1CfjAI7
 L/vK69W6khwcSFI0ro29NZWLrOHvmfNIodCknPWFbrIn50xqBiwlJZ7Fo7B3kiI21Y3/
 FmntaRd2eQ3hZPfjL0MXNmg1qII0ac5E6x/YOLP5XX8MPEhA2A/daGzy8Q1okr0SR1ZR
 qe8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ihz5rcoPeitwrMYLqevhJFu3hPc2qlcX4cuo2RSIHtU=;
 b=d1ktrQhLccHlpaIeOBmNvrG9lRYCbJ+z4Ti2UmaDFU1Qapb+nuEflEXqGVrawUbv2l
 xK0j2pbrVKNjA33pyC/Rtc1aWRK7916B7o/uMZ9yFwL9QewYre8iut16i+RAR4HX5Bka
 bNLo8oX/k5vJiVpWdKHyq52z5YVpnCZ6xcdHBs0e+niYw/ps8xjSJhDY1vJny+e92zVR
 6lKKW+NwObBCmsjYxk+bspgNg2rR52c1zpqIo1h25CK3SKeLDTKQEDacBrONIctuJwWu
 DNpPRD6aCPHtZ1SdbXZxaBIZHvokwdrCIhAgWteQSxWtygYU6J5YUZHqzr6jIpNSSDEc
 BNHw==
X-Gm-Message-State: AOAM5310cy/HsY163/O38///WNTjCRhydIH56T4IV12PsX+BhN9IG+Nj
 eorJDhmQ2WTJBlGCFHYasyJvQOdXCnA=
X-Google-Smtp-Source: ABdhPJzhBJMr+hrAUsZhnuMOQtQWmsvhyTlgD0OxJACfWlgB4cBYizCZ3hD7uXX0B/8U6Otm8LF8SQ==
X-Received: by 2002:a92:dc09:: with SMTP id t9mr2825709iln.94.1643300967454;
 Thu, 27 Jan 2022 08:29:27 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id o22sm1634818iow.37.2022.01.27.08.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 08:29:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 09:29:25 -0700
Message-Id: <20220127162925.2639638-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 250.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index f89b2ce17d..81f51eac20 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  ccfdd97679972cd3d9fb15bc3c647a3ee3351a434e20e1e3eec2851caa1b4849  systemd-250.1.tar.gz
+sha256  87b0eee7b6e5aaab2ab56d158f9536daa6bfd5de011f2a5fc6ccdd81ee1e7a24  systemd-250.3.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 2d3971f31d..5626b54e8e 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.1
+SYSTEMD_VERSION = 250.3
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
