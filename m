Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B219FC678DC
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 23:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41D4060E86;
	Thu, 17 Aug 2023 23:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41D4060E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1KvtjXMWTDZ; Thu, 17 Aug 2023 23:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D35660E7C;
	Thu, 17 Aug 2023 23:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D35660E7C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 616B31BF476
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A39540111
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 23:08:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A39540111
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoJPp6bukh3t for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 23:08:52 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5542E40363
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 23:08:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5542E40363
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe4b95c371so1997935e9.1
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 16:08:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692313730; x=1692918530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkSF+zwAa90bcUEqjlgCQTBp9ijH/K1q66iuqmtdn5I=;
 b=FRDv61JdAKE3xjJYHCW6/S2zcEiRmRK4QzOCIsQMRwPuutiGZAzF3irFNPsEAvKNwe
 0rCFOZvSbmh/KG2i1HhC48UmMht13mqv9SHFDWQYB/hwql/fJzZORUsvAxtB9ZQz+lKG
 Q1jAIhoFv/6VAwasLfRXyk/z0YKVisBr00pUzxGLyZoABz3dazLc/olXWq6spLfe/ksG
 LMdZ/PczC75RwF/ApOtKkgT8ESBhrN8lVBAfoIwoPilKNWVrjU+b5EjPWm0UosMf0fRu
 e6BzITu46Ge5kvjsz1BYx6yledzUHpnbWFSQJOhGzmF0RbGjmIm5VBgGTFqurYM7LNtB
 NTDw==
X-Gm-Message-State: AOJu0Yx3KK0d6O4oBr0avFl/j0VbJ0vcNTBJpbgrCH/fzO8rjEJQ0nTD
 aPKzmbch81XcVX34YRTcCQSll5tE8Oo=
X-Google-Smtp-Source: AGHT+IFpor84FpqU0Y7/MqD4b7K5hWqjpvQqHkBm+EicT2b7P5zpTToZyIYs0yC34m4vz1zdkkFK+w==
X-Received: by 2002:a05:600c:3490:b0:3fa:88b4:bff3 with SMTP id
 a16-20020a05600c349000b003fa88b4bff3mr3367529wmq.11.1692313730155; 
 Thu, 17 Aug 2023 16:08:50 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 26-20020a05600c021a00b003fa95f328afsm4409479wmi.29.2023.08.17.16.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 16:08:49 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 18 Aug 2023 01:08:42 +0200
Message-ID: <20230817230844.450092-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817230844.450092-1-romain.naour@gmail.com>
References: <20230817230844.450092-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692313730; x=1692918530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gkSF+zwAa90bcUEqjlgCQTBp9ijH/K1q66iuqmtdn5I=;
 b=rxT7yITl+FhaFEE6kCD1YqbrfHP30JFOARvBkW2r16zUs7STXhkKzJrV98lwrkG3pM
 ngtDqnhha93hCEBP6lMGMnavFXbmSEgRVH4xRTfGOrVxaMsIBzOGaiHINGcCT5MYNvtc
 6slzGnnBIZXXSl8/3KlPCnUmj8bdD+dbYhY3NqzfhDxIalqg9ht/kRt0HW9r2CJyfryN
 bx2CHoOzJiOHcDlvkckuS8v/3Wni/EYqScNIvJ2a65HeeLoBZaNBHoWBrvfcJPQN765k
 iJP8VJK95+oWdRcZxyavSVInTp6pAHDW9lT/H0C6kYJeWyMiNhmAgLQYazB0Jk5CvH0M
 W8gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rxT7yITl
Subject: [Buildroot] [PATCH 2/4] configs/pc_x86_64_{bios,
 efi}_defconfig: add midding libelf kernel dependency
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

objtool built by the kernel requires libelf

ldd output/build/linux-6.1.24/tools/objtool/objtool
  linux-vdso.so.1
  libelf.so.1 => output/host/lib/libelf.so.1

While updating the kernel [1] we forgot to select
BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF to provide Buildroot's host-libelf.
Using host-libelf avoid linking with libelf installed on the host or
failing to build objtool if libelf is not installed.

[1] d45538f2e7acc1b330b191d559a81e8c1a961648

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436869
https://gitlab.com/buildroot.org/buildroot/-/jobs/4889436872

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/pc_x86_64_bios_defconfig | 1 +
 configs/pc_x86_64_efi_defconfig  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index a057ddd259..6032544d2d 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -32,6 +32,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index efa603f0c0..afb652f3fc 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -33,6 +33,7 @@ BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
 
 # Firmware
 BR2_PACKAGE_LINUX_FIRMWARE=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
