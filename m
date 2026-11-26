Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC37A606A31C
	for <buildroot@archiver.kernel.org>; Thu, 26 Nov 2026 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BEtAkzpg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C503781203;
	Thu, 26 Nov 2026 19:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3mQxRT5cXs8; Thu, 26 Nov 2026 19:25:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C0A87811E1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795721116;
	b=K/1qiqcxx0J6qPRGsMZN4+ETS2ebRsBehGPND2PbR45WeRU6aUDP1Pg62KAz13IlO4bC
	 vdVrEeJNuZcYiBw+wkEyPeZJNBH8GU1Rr6TwvRCIx1dkslguW4nlNicZLI9XtVV2Ryf/m
	 e0FCI0/I3pi0PEgWNkGh11ktqha2EAIZPtuImb6bZgmgivCYf3C0HDWpjM9mXPTpO6hO3
	 KvcwUaoi2en6MhkwW34aghfs73DvxHEkS0r9WwXlnaA3XE+bFjtf4+iqbHfT1Ypdozf6s
	 z4ZxQBrFqr9Wlgx8lCLfnYqBQRCzbj3Y7mJgsQYBtceMVwn/zHwOw1KOIGxy+xYTxzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795721116;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:To:Cc:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=ZJoK+iS4b/JaRh9tNcDzfzBdoCzk2wdirgHhvwHuib4=;
	b=c0XOR+nXWX6evFNVqsbngyArDBVznu2BkQ/kbNCCu6DOesrfujUWsW4sKHAYfqxCoiGZ
	 UtAkcweyQXDIO0UwhBCnZcDUqIjPbjbIrjGUtgxkT5vrQSS/mzc+PtReg25VsoIYNzI7Z
	 nHJxJQXVy+RohiPdf6hWrcHy6gR8+kblJsauDHtcXY7wd1Y6R8UA4G+/I4ldagalSkKP4
	 rNo0lrTr4yCr7IkJTWid3+9UVYMw4qh4m8p3hC688+YOciXHK9HgHTBOagNpKEqBiOwlB
	 8ZA52OXbWC9v4wsA1OWl7FsKxNgGw20nRd92KIofgfKUaJmZlXSLQBeWu11QQP0gryg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795721116;
	bh=ZJoK+iS4b/JaRh9tNcDzfzBdoCzk2wdirgHhvwHuib4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BEtAkzpg2tfKRuQ+zM+PdZ5A0m7R0p4CYK7IB3HANxYKYXr5+SIuZnCIoeAkdUhQ9
	 D/QPP60I5Gi9iAtqVhYbfdcdQjBDIG4v2lBf+Zg5FPTe5ALzvgO8V4NETAED3QtUMa
	 PQMsUfc9kXcAp5yCxrtI3xqp8gsE7RAmEBjnWti0y+tsXdevP/GtQHFf1RN/3KULNe
	 BrNZCJHSk19yGGFUDcoEXdwR/iJ7soZjV3weVWCQYAhUCSMqSqRgqJjDv6X/2R24Q8
	 lRrz9/S+UT0mXSzsFzM3I2Qzmb13LVGAuivq74yupdc6w1vLjcgk9bkzmV2jnUF9we
	 z/AlYHYsZlsBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0A87811E1;
	Thu, 26 Nov 2026 19:25:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4982F260
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B7FE400E6
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwSs33xNXyjC for <buildroot@buildroot.org>;
 Thu, 26 Nov 2026 19:25:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org ED81640540
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED81640540
 for <buildroot@buildroot.org>; Thu, 26 Nov 2026 19:25:07 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795721105; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:OY5PxKCq/HzuWT+rLmi8qqNQqRi6
 qCrpTZ1E2N+MuL49VRfsZrEYzzZHTpPa1EK0XJWiB0iADONboo1l/hXdby8CPXc1CQL/8OdHGkr
 5POcZbBZ3L4mX2c3kFv26BdUNVu7cgqfEmWVZ9u8m6VEiLW8ybG+dQ1t0aYrxuMnGeH6IJenm/O
 rGOCHPKd4etrxHht7pAljKNcVEC1RnJhU0zWT+S+Is3nooKuY2j4xE1bMOh8D/sKjLKI+6w7iBA
 UJLEfSPhmt9rbUck3X+mq92dcVDjOlv+d2apa4DS+xS2NK8FsZYJJo+nryN6qaqRfaS2jr+fOeg
 sW/ehNvmF28DVQ==;
Message-Instance: m=1; h=sha256: dL7cmTxpxiRGIjvDYAw404GamThvUSdzgNJglid/DT4=:
 F3QvWoiFyQbtIFclM8HKOXIoSHEui7AfBzgZT/xS/FU=, sha512:
 kSze/queH4g/Nf+x7ULtRtveuzR9hkLOZhydWhEDH60rQNNIssoLOeHrudW51UlcBCaAJUPTmKouvMd7c0vEAA==:
 wgcNK6k1Q+yKSLwhjHZ0uuo/MVuLWB5m4QaViVR+UI03cVm09HyWYO/uv/7HyjM5k5v5mftHml3UCEeqKaWVew==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1xVIAx0XdL-00Gexn; Thu, 26
 Nov 2026 20:25:00 +0100
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Thu, 26 Nov 2026 20:24:35 +0100
Message-ID: <20261126192435.1826415-11-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261126192435.1826415-1-fiona.klute@gmx.de>
References: <20261126192435.1826415-1-fiona.klute@gmx.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:k/z0brJtF0xt0qlOAkA05alAK3tiw9r+IK3fFtZTlxzKGTp5vHH
 b1JT5/syYizTaEtStlqKyONInKJhsFfRT5ZyeZuZHRn1a3w1DuTIEmHCOTQNIupCoZn8YfQ
 7jdL8qYu7nIQHJ/UNo8rU7q1v2+EGeLDtxp8BsxGFx15RQ2vZZuzJ4GvbsHt3y4eY2h3RzI
 vllfclynSyRCHcIIYpPaw==
UI-OutboundReport: notjunk:1;M01:P0:5j6QvB9Me24=;0COXcM3ncoyi/mNFZACrsXTOJrF
 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
 Vaetf7CtoOgZWmgCAZUyMWUFO/v89iUbX
Subject: [Buildroot] [PATCH 10/10] support/testing: test_cpio: add test for
 dracut initrd with systemd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

The test first checks the initrd system using the emergency shell,
then continues the boot and expects to arrive in the regular rootfs.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 support/testing/tests/fs/test_cpio.py         | 100 ++++++++++++++++++
 .../tests/fs/test_cpio/dracut-systemd.conf    |  83 +++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 support/testing/tests/fs/test_cpio/dracut-systemd.conf

diff --git a/support/testing/tests/fs/test_cpio.py b/support/testing/tests/fs/test_cpio.py
index 172af579bb..0624846576 100644
--- a/support/testing/tests/fs/test_cpio.py
+++ b/support/testing/tests/fs/test_cpio.py
@@ -1,6 +1,8 @@
 import os
 import infra.basetest
+import pexpect
 import subprocess
+import time
 
 CHECK_FS_CMD = "mount | grep 'rootfs on / type rootfs'"
 
@@ -128,3 +130,101 @@ class TestCpioDracutMuslMergedUsr(TestCpioDracutBase):
 
     def test_run(self):
         self.check_dracut()
+
+
+class TestCpioDracutSystemd(infra.basetest.BRTest):
+    config = \
+        """
+        BR2_arm=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+        BR2_INIT_SYSTEMD=y
+        BR2_PACKAGE_SYSTEMD_INITRD=y
+        BR2_PACKAGE_SYSTEMD_SYSUSERS=y
+        BR2_TARGET_ROOTFS_CPIO=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT=y
+        BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILES="{}"
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """.format(
+            " ".join([
+                "fs/cpio/dracut.conf",
+                "support/testing/tests/fs/test_cpio/dracut-systemd.conf",
+            ]))
+
+    def setUp(self):
+        # If no kernel version is set on the command line, dracut uses
+        # the first directory found in $sysroot/lib/modules to
+        # determine the kernel version. Systemd requires merged-usr,
+        # making it $sysroot/usr/lib/modules. If that directory cannot
+        # be found, dracut fails. The test uses a pre-built test
+        # kernel, so just create the directory with the version of
+        # those. It could be done with a root overlay, but that seems
+        # a little excessive.
+        kernel_moddir = os.path.join(
+            self.builddir, "target", "usr", "lib", "modules", "5.10.202")
+        os.makedirs(kernel_moddir, exist_ok=True)
+        super().setUp()
+
+    def test_run(self):
+        initrd = os.path.join(self.builddir, "images", "rootfs.cpio")
+        img = os.path.join(self.builddir, "images", "rootfs.ext4")
+        infra.img_round_power2(img)
+
+        self.emulator.boot(
+            arch="armv7",
+            kernel="builtin",
+            kernel_cmdline=[
+                "rd.break=initqueue", "SYSTEMD_SULOGIN_FORCE=1",
+                "root=/dev/mmcblk0",
+            ],
+            options=[
+                "-initrd", "{}".format(initrd),
+                "-drive", "file={},if=sd,format=raw".format(img),
+            ])
+
+        # self.emulator.login() expects a login prompt. The dracut
+        # emergency shell doesn't provide one, just "Press Enter for
+        # system maintenance". Handle that and then prepare the shell
+        # the same way.
+        index = self.emulator.qemu.expect(
+            ["Press Enter for system maintenance", pexpect.TIMEOUT],
+            timeout=60 * self.emulator.timeout_multiplier)
+        if index != 0:
+            self.emulator.logfile.write("==> System does not boot")
+            raise SystemError("System does not boot")
+        self.emulator.qemu.sendline("")
+        self.emulator.connect_shell()
+
+        output, exit_code = self.emulator.run(f"date -s @{int(time.time())}")
+        if exit_code:
+            raise SystemError("Cannot set date in virtual machine")
+
+        self.assertRunOk("mount | grep 'none on / type rootfs'")
+        self.assertRunOk("systemctl status")
+
+        # dracut-emergency.service provides the emergency shell we're
+        # using, and it's a oneshot service that doesn't finish
+        # starting until the shell exits.
+        output, _ = self.emulator.run(
+            "systemctl status dracut-emergency.service")
+        self.assertTrue(any(
+            line.strip().startswith('Active: activating') for line in output))
+
+        # check basic systemd services included in initrd are running
+        self.assertRunOk("systemctl is-active systemd-journald.service")
+        self.assertRunOk("systemctl is-active systemd-udevd.service")
+
+        # exit the emergency shell, boot must continue into rootfs
+        self.emulator.qemu.sendline("exit")
+        self.emulator.login()
+        self.assertRunOk("mount | grep '/dev/mmcblk0 on / type ext4'")
+        self.assertRunOk("systemctl is-active multi-user.target")
+        output, exit_code = self.emulator.run("systemctl status initrd.target")
+        self.assertEndsWith(
+            output[-2], "Reached target Initrd Default Target.")
+        self.assertEndsWith(
+            output[-1], "Stopped target Initrd Default Target.")
+        self.assertEqual(exit_code, 3)  # initrd.target is no longer active
diff --git a/support/testing/tests/fs/test_cpio/dracut-systemd.conf b/support/testing/tests/fs/test_cpio/dracut-systemd.conf
new file mode 100644
index 0000000000..4039312833
--- /dev/null
+++ b/support/testing/tests/fs/test_cpio/dracut-systemd.conf
@@ -0,0 +1,83 @@
+# Test uses a pre-made kernel without modules, don't try to install
+# any.
+no_kernel=yes
+
+# Dracut modules needed
+add_dracutmodules=" \
+base \
+busybox \
+dracut-systemd \
+initqueue \
+systemd \
+systemd-ask-password \
+systemd-initrd \
+systemd-journald \
+systemd-sysusers \
+systemd-tmpfiles \
+systemd-udevd \
+udev-rules \
+"
+
+# Modules to ignore. fs/cpio/dracut.conf puts all systemd modules on
+# the list, so override omit_dracutmodules completely.
+omit_dracutmodules=" \
+bash \
+biosdevname \
+btrfs \
+bluetooth \
+caps \
+cifs \
+crypt \
+crypt-gpg \
+dash \
+dbus-broker \
+dbus-daemon \
+dm \
+dmraid \
+dmsquash-live-ntfs \
+fcoe \
+fcoe-uefi \
+fs-lib \
+iscsi \
+i18n \
+lvmmerge \
+lvm \
+lunmask \
+mdraid \
+memstrack \
+mksh \
+modsign \
+mount-root \
+multipath \
+nbd \
+network-legacy \
+network-wicked \
+nfs \
+nvdimm \
+nvmf \
+parse-lunmask \
+qemu \
+qemu-net \
+resume \
+rootfs-block \
+rngd \
+systemd-coredump \
+systemd-timedated \
+systemd-rfkill \
+systemd-resolved \
+systemd-hostnamed \
+systemd-ldconfig \
+systemd-networkd \
+systemd-timesyncd \
+systemd-veritysetup \
+systemd-modules-load \
+systemd-sysctl \
+systemd-repart \
+systemd-sysext \
+squash \
+ssh-client \
+stratis \
+tpm2-tss \
+url-lib \
+usrmount \
+"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
