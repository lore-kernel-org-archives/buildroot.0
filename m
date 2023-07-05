Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72931EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 14:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACEE46102C;
	Wed,  5 Jul 2023 14:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACEE46102C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5q6xAbbAXdhW; Wed,  5 Jul 2023 14:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBAEC60FFB;
	Wed,  5 Jul 2023 14:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBAEC60FFB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4EB71BF5B3
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 14:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B927640141
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 14:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B927640141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UYiqSPc8zg_g for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 14:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B970400BA
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B970400BA
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 14:30:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbca8935bfso55417855e9.3
 for <buildroot@buildroot.org>; Wed, 05 Jul 2023 07:30:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688567426; x=1691159426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6NjnflwPRSffK+965McTB9+Jo8APXpehFCd5VYlU9g4=;
 b=hMGcLwIDREsVMA0zgQfymBsO4F7VGZ9RBXhl1d6EvXNQq+KF661JWsva3pspJV0Lr2
 BFj1vGh79wLp0KHuHcQfnEZCk+g8T5E8vuA8ehxSIl033ZheYsJRaJ6PzbsTgwTrDiFj
 Z4c+7R5h0E6u7t58PUzAdq5IoUdAKVXOrPnDLIN1WhtAvFsuCSL1PxZuO3y4lmNwT3uq
 Pj7uHKZtDAVf9GJNyuLUSA1MwsPKUTMO7uuTkt1COic+bCyeKKVpkhIWkoErhwyUkWPn
 bCWQdfFvhP3vjHMNV87k/TFD9NQyqGp1AkfiqpKRMAMeu/2MKM5Zy2k0yYFs1a+saniB
 V7MA==
X-Gm-Message-State: AC+VfDyyIi0tYFZ7jYJcsdu2eGCkKoeMPlAZvTdq6BGBLxPMsKAVyvOE
 SFisgFXb15yoyBj9BwqwZRfIqq+pmgD4OVjYyEM=
X-Google-Smtp-Source: ACHHUZ42A4wDPuf1U/Ug5yQnXdwA9ubQIgXNZLbrpcA4JGtlRX6WGlE9UuoLrk7p6cuJwFs5EM4Clw==
X-Received: by 2002:a1c:770c:0:b0:3fb:b5dc:dab1 with SMTP id
 t12-20020a1c770c000000b003fbb5dcdab1mr12644337wmi.39.1688567425775; 
 Wed, 05 Jul 2023 07:30:25 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a1c7915000000b003fb5e3710d3sm2266297wme.43.2023.07.05.07.30.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 07:30:25 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 16:30:23 +0200
Message-ID: <20230705143023.233143-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1688567426; x=1691159426;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6NjnflwPRSffK+965McTB9+Jo8APXpehFCd5VYlU9g4=;
 b=evHwi3ERZ9qQsjjzD2BacqrpbSmYwkof1dzhs1nHhzwtpXONgv7I8AlMLZHxda23l7
 IHuot8cLWUwEoMZ7oYtHq+askl1zOM2Vvf2981Ii8vEXPBr0JT3Hy63WT5APZjk5E6Ki
 k2NqJ+qGJqUgWxBoox1KbpBz5ujNDbLWd7uSKLj4bw2P2WqHX9WB1TrUX3jkDqrDCDNQ
 Dy4W0iEcKZ4fN8GBXOZwQsqyr8mdjW2gWsJX739QEGn3mVZkOjsuFFyfC4VcMgg0djjT
 iZG6WQjIekTjsn+FqYYcf2CMmrZvs1EHmVJSAgqTGSBHeN8fF0NLA90daWPhFBCWrBpr
 THbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=evHwi3ER
Subject: [Buildroot] [PATCH] support/testing: test_edk2: bump ATF version to
 2.9 for binutils 2.39+ support
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following the toolchain-external-arm-aarch64 bump to version 12.2-rel1
by commit [1], binutils 2.39 is now provided by the toolchain.

This new binutils version break the ATF build due to new linker warnings as
reported by the EDK2 test:

  ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions

From [2]
"Users of GNU ld (BPF) from binutils 2.39+ will observe multiple instaces
 of a new warning when linking the bl*.elf in the form:

   ld.bfd: warning: stm32mp1_helper.o: missing .note.GNU-stack section implies executable stack
   ld.bfd: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld.bfd: warning: bl2.elf has a LOAD segment with RWX permissions
   ld.bfd: warning: bl32.elf has a LOAD segment with RWX permissions

 These new warnings are enbaled by default to secure elf binaries:
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=ba951afb99912da01a6e8434126b8fac7aa75107
  - https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=0d38576a34ec64a1b4500c9277a8e9d0f07e6774
"

Bump the ATF custom version to 2.9 for binutils 2.39+ support.

[1] 90404e84c1c9d65b4f38cc3ebc30ef6a4da314cb
[2] https://github.com/ARM-software/arm-trusted-firmware/commit/1f49db5f25cdd4e43825c9bcc0575070b80f628c

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4581325484

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/boot/test_edk2.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/testing/tests/boot/test_edk2.py b/support/testing/tests/boot/test_edk2.py
index 623e77e992..16fa10f8c9 100644
--- a/support/testing/tests/boot/test_edk2.py
+++ b/support/testing/tests/boot/test_edk2.py
@@ -24,6 +24,8 @@ class TestEdk2(infra.basetest.BRTest):
         BR2_TARGET_GRUB2=y
         BR2_TARGET_GRUB2_ARM64_EFI=y
         BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+        BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="qemu_sbsa"
         BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
         BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
