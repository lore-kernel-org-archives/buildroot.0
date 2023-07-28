Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE875EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0591D6144A;
	Fri, 28 Jul 2023 22:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0591D6144A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAksbI1zesnj; Fri, 28 Jul 2023 22:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B81B613AE;
	Fri, 28 Jul 2023 22:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B81B613AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 930621BF3E5
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 22:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77DA541D67
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 22:54:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77DA541D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lcoy-sd4ghn5 for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 22:54:01 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0D0D41BD1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 22:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0D0D41BD1
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-317744867a6so2602605f8f.1
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 15:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690584839; x=1691189639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOJacCrNKcY0l+JgI1WkpqZaPwaobfe3Ua2DE1mvAco=;
 b=BiNAE7qJ0P0cIxuViGWx6JeZhomtfiKOqWbOExOWq9oFEBd/ETtBIN14TAvJCW8vZz
 YnRKzD9FlUwIbXROD4j1yrZlVmO5bvPP8VTr4zTov/WL+HZJ+mz15EdZd0Cz1sAsLMai
 OP77aJzJRsOwvIPodT2DynToYVjFAwTCalAiDKPXcCkS3v7zVYVCWgbRcxjE63VBbJeU
 hidJ9GTamkHgsFs/9Eo16g/mpTyGcw8/7ZMPom21wqc/nMffjLpPDyI7lhFIqPfr9Afu
 DJwjNkJZP9m5JfHPW0urnqVgRWSWMkPNTLaM2CSmyygGLEHOqPHP1i8IHpGsYtqFQufp
 JI+g==
X-Gm-Message-State: ABy/qLY8RtFQ2AZIVsvKmx/Hf8TFqeN6lrNyhyU4Jz+2rRhCWkKrVm0k
 7jDT19rFW/oOWSZiAfrmSAqur+hvBx0=
X-Google-Smtp-Source: APBJJlEdlOE+RwEtfgXtSDAGR+NZQebmTNKSUmwVoZVYzuUklqbO6fiISMUa5SubhSNWL8Kb3O5nog==
X-Received: by 2002:a5d:6b8c:0:b0:317:51ff:c249 with SMTP id
 n12-20020a5d6b8c000000b0031751ffc249mr2776884wrx.13.1690584838463; 
 Fri, 28 Jul 2023 15:53:58 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 p9-20020adfce09000000b0031763fd36c4sm5868306wrn.104.2023.07.28.15.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jul 2023 15:53:57 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jul 2023 00:53:54 +0200
Message-ID: <20230728225354.269776-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690584839; x=1691189639;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EOJacCrNKcY0l+JgI1WkpqZaPwaobfe3Ua2DE1mvAco=;
 b=VZs7qd4+knkoQbXHwuVeMD3dB6jWRBn4Te2O+9gmbKhAZ9R7uu1c+7U3L4b8uY8b6A
 /vD6+HRHw5JkO20qcIQuDMZRwAL6MXppUCqQtvZhW5GaCK3FSgeTJH6fdMc94+++s5Ns
 KhUmxzB8Wl0aRQ5ydeEtT2rCtxZ2HZRCYF5CCQAdGp/lykOMMdpDbdZc9FySSCHuKCNp
 jOCu6IJmp2WbezbkqCTnAls2zMHMB3UgcMatZzWZl9vlts5xW5/lB1b8HA+xenAEzX0U
 dtmEg90chMQXyPdTVqSkkjTLul5GOPI77cjzEZpM2RiyLFVpADKLxxlskA6zlBnLvIC1
 JINQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VZs7qd4+
Subject: [Buildroot] [PATCH] support/testing: Override the EDK2 CPU hotplug
 bug check
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
Cc: Romain Naour <romain.naour@gmail.com>, Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
(requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)

The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.

https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186190 (TestGrubX8664EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186198 (TestGrubi386EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186306 (TestIso9660Grub2EFI)
https://gitlab.com/buildroot.org/buildroot/-/jobs/4725186317 (TestIso9660Grub2Hybrid)

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Julien Olivain <ju.o@free.fr>
---
Adding Debian bullseye backport repository in the Docker image used by the Buildroot Gitlab-ci
is not enough, since the bug is really fixed in Qemu 8.0.0 and only Qemu 7.2.0 is provided.
---
 support/testing/tests/boot/test_grub.py  | 20 ++++++++++++++++++--
 support/testing/tests/fs/test_iso9660.py | 11 ++++++++++-
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/support/testing/tests/boot/test_grub.py b/support/testing/tests/boot/test_grub.py
index 2c393f730e..9f3a6a8495 100644
--- a/support/testing/tests/boot/test_grub.py
+++ b/support/testing/tests/boot/test_grub.py
@@ -61,7 +61,15 @@ class TestGrubi386EFI(infra.basetest.BRTest):
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
-        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda])
+        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
+        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
+        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
+        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
+        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
+        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
+        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
+        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
+        self.emulator.boot(arch="i386", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
         self.emulator.login()
 
         cmd = "modprobe efivarfs"
@@ -104,7 +112,15 @@ class TestGrubX8664EFI(infra.basetest.BRTest):
     def test_run(self):
         hda = os.path.join(self.builddir, "images", "disk.img")
         bios = os.path.join(self.builddir, "images", "OVMF.fd")
-        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda])
+        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
+        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
+        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
+        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
+        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
+        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
+        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
+        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
+        self.emulator.boot(arch="x86_64", options=["-bios", bios, "-hda", hda, "-fw_cfg", qemu_fw_cfg])
         self.emulator.login()
 
         cmd = "modprobe efivarfs"
diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
index 692291267e..3d08f2e895 100644
--- a/support/testing/tests/fs/test_iso9660.py
+++ b/support/testing/tests/fs/test_iso9660.py
@@ -29,7 +29,16 @@ def test_mount_internal_external(emulator, builddir, internal=True, efi=False):
     img = os.path.join(builddir, "images", "rootfs.iso9660")
     if efi:
         efi_img = os.path.join(builddir, "images", "OVMF.fd")
-        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img])
+        # In QEMU v5.1.0 up to v7.2.0, the CPU hotplug register block misbehaves.
+        # EDK2 hang if the bug is detected in Qemu after printing errors to IO port 0x402
+        # (requires BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL to see them)
+        # The Docker image used by the Buildroot gitlab-ci uses Qemu 5.2.0, the workaround
+        # can be removed as soon as the Docker image is updated to provided Qemu >= 8.0.0.
+        # This workaround is needed only when efi=True since it imply EDK2 is used.
+        # https://github.com/tianocore/edk2/commit/bf5678b5802685e07583e3c7ec56d883cbdd5da3
+        # http://lists.busybox.net/pipermail/buildroot/2023-July/670825.html
+        qemu_fw_cfg = "name=opt/org.tianocore/X-Cpuhp-Bugcheck-Override,string=yes"
+        emulator.boot(arch="i386", options=["-cdrom", img, "-bios", efi_img, "-fw_cfg", qemu_fw_cfg])
     else:
         emulator.boot(arch="i386", options=["-cdrom", img])
     emulator.login()
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
