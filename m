Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD66C433EF
	for <buildroot@archiver.kernel.org>; Sun, 15 May 2022 11:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B1DD83FA8;
	Sun, 15 May 2022 11:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pxrcy78BB4N0; Sun, 15 May 2022 11:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20C5B82538;
	Sun, 15 May 2022 11:03:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE1F71BF573
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 11:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BFDE60D59
 for <buildroot@lists.busybox.net>; Sun, 15 May 2022 11:03:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1MVXDor9loU for <buildroot@lists.busybox.net>;
 Sun, 15 May 2022 11:03:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4024F60A97
 for <buildroot@buildroot.org>; Sun, 15 May 2022 11:03:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u3so17061011wrg.3
 for <buildroot@buildroot.org>; Sun, 15 May 2022 04:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyQFVhztMMdGpYt6iDkU9ZnFfWAvIb76zgdJ5mPOUkQ=;
 b=iTcbecb5UwpWHZjd6DZNhz5LmG6gRd4eBiN+9geI1wLTaBM7Hs4uETruAwSLJzgAc8
 l+0awuPHe0dYMxkbFjgdxGWGgtDS4eNELBbzf9LEKpxKFSn1ChnLNgAP6cOOmP+La3L7
 z5Qd5bUGmqGwnCK2sii/0mlNiPPmZOAkqjNr7JZITHuJPF0TbBmelc/cDmQnDq80gdwE
 LT6NTgo+eoUu/k/tdTnS3j0kfK07QYlNzexz5nGd5XkrNwMd/zHTKnlMqdXzKcg36gTK
 GLHIYVv0qEhjWDlKxZwgiPCta8oBUt4Cecr5EbNjuDjIbckYYAZ/xtTPDN7g+h6q9dSF
 ED3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tyQFVhztMMdGpYt6iDkU9ZnFfWAvIb76zgdJ5mPOUkQ=;
 b=OwmqOSiGp5j0OSbWEjVWP5uuLwu3fYUTy5iRfatLeVD8kDelIoMUUsi9m2/cvGjSWR
 dzkcoMY1fMrKrmPiTdEzM4tMBqaqoGfUeHw2U4RRrBM78kz+fW7rJcIefQg+73sDwOMN
 hQfu6x61AzGtUdJrOCZnYoMWLwzApGnoWtsTI2HTy3utXK0XPfn1uURpM+SxjvC1KN2+
 E4twQhHW47ZqYHaMYqyq9t/1i69fGtEu1lsQvLX9mjd3LZYJo9QE4/QlQhVeYtJS5mrQ
 rYY1WOPVOuv0GR4sEJ0Zt5R6iY+0vxBRHCaD65sBu/7VgACPvD6QX9gWQwf12ij8GGbY
 XMAw==
X-Gm-Message-State: AOAM531c6H4gxR8kmdXSLbpQ2ZS2LVZpeElCqPdCa5LvuHYGWmr02ACw
 8fHhzifDZUWiebQfCfJVP57ck6SJIHw=
X-Google-Smtp-Source: ABdhPJwCxHjn7A0MKyp/7GHUO709wK08K8irat1CmxUOXAPkP7A1jHntBM88pvtlqvPHT2sYVUUaLQ==
X-Received: by 2002:a5d:6d88:0:b0:20c:594d:6ac7 with SMTP id
 l8-20020a5d6d88000000b0020c594d6ac7mr10630476wrs.622.1652612625062; 
 Sun, 15 May 2022 04:03:45 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a5d5984000000b0020c77f36b13sm6865040wri.100.2022.05.15.04.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 04:03:44 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 May 2022 13:03:41 +0200
Message-Id: <20220515110341.173923-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] toolchain/toolchain-buildroot: error if no libc
 available
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Each libc available in Buildroot to build an internal toolchain have
dependencies (architecture, static build only, mmu only etc...).

For examples, uClibc-ng is the only toolchain that support static only
builds. But since uClibc-ng doesn't support all architecture available
in Buildroot (nios2, riscv), we must prevent selecting static only
configuration (BR2_STATIC_LIBS) on such architectures.

For such broken configuration, we can start building a toolchain by
building host-binutils and host-gcc-final without building
host-gcc-initial, linux-headers and uclibc package.

The build fail during host-gcc-final build with the following error:

In file included from ../../../libgcc/libgcc2.c:27:
../../../libgcc/../gcc/tsystem.h:87:10: fatal error: stdio.h: No such file or directory
   87 | #include <stdio.h>
      |          ^~~~~~~~~
compilation terminated.

We can't add an uClibc-ng dependency on BR2_STATIC_LIBS option since
it's also used for external toolchain backend.
Instead add a check if BR2_TOOLCHAIN_BUILDROOT_LIBC is not empty

While at it, add a Kconfig comment for the user.

Fixes:
http://autobuild.buildroot.net/results/42965d286285d5d6cfbb39f6195c87fa05dd3283/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/toolchain-buildroot/Config.in              | 3 +++
 toolchain/toolchain-buildroot/toolchain-buildroot.mk | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 8d9cf4cc68..a97b17acb8 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -107,6 +107,9 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
+comment "No libc available for this target! Please check your configuration"
+	depends on !BR2_TOOLCHAIN_BUILDROOT_LIBC
+
 source "package/linux-headers/Config.in.host"
 source "package/linux-headers/Config.in"
 source "package/musl/Config.in"
diff --git a/toolchain/toolchain-buildroot/toolchain-buildroot.mk b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
index b30cc332d2..7688d44615 100644
--- a/toolchain/toolchain-buildroot/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot/toolchain-buildroot.mk
@@ -6,6 +6,10 @@
 
 BR_LIBC = $(call qstrip,$(BR2_TOOLCHAIN_BUILDROOT_LIBC))
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT):$(BR_LIBC),y:)
+$(error "No libc available for this target! Please check your configuration.")
+endif
+
 # Triggering the build of the host-gcc-final will automatically do the
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
