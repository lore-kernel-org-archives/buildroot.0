Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A972A606BF80
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=moZM+4Ib;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JC2CjiLf
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B73607B1;
	Tue,  3 Nov 2026 10:52:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bBMKjyeKncBE; Tue,  3 Nov 2026 10:52:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6206A6078A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793703160;
	b=g21u+w5cwGgsdCSgXaaDIlswWtDtXL+Z5qZ7Ub7c+v2U08yvjxTnaXJSS6/J45PbsS7B
	 ele1640ICF6ck6aca0pDZc4p5roioAjnqURYJ4BgNqYDcbDnaKO1P3325TueeZBKxTBgK
	 IesXVdHZEfd1ZYhdysVGorZTVqz4/US+FMW06HmN4EPN42gU+zujq1W7HcJS1VFD9pcnQ
	 5kMsXb1zr/msdhpZ+4gOqr30hZqnlsaJN5UzEQIckorbPQgNzHST31I6/qWkBHtejM54/
	 krqZTbGtUtA7YZaewYYFTdWWKwDMunM1L+FDuJ5pxKO7MO5PYZ+F/z/Ck05f6IXM4dA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793703160;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=fnibRiQgYzHKQG8pINuYR0M1YnC5AjvdxrTtwKOFVNw=;
	b=jLQyGGZShU82G/P+BWkw+TR9mEbhR+uZVaE/pVV/to0aJqFRfu2EwyOgoyWN2MfrjymN
	 AOJwLEm0YnaAd0LkQsTJ3YNE9KwWmjR/+wZPmedKMKxLlFEseX/11/pcTf96UpYQ68syz
	 CQ791mPnI5Qs66P+xQwRI/RakNYfQ9ezZGB9zcZFh2wmTgFiIzYaBwUL1oaXN++vRS79/
	 /5sN0C/+jbcLHWKtKIWWDY8uJcf0JC4GKsJWL6++kf8wsr8+AJE+S+28REwFg56FliXAf
	 +tykDYeLGNNfHjeXZ3sEkehGAQgloH9y+9irjyKzFAKsJnyoLwZecyVXcbFMOJBHwsg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793703160;
	bh=fnibRiQgYzHKQG8pINuYR0M1YnC5AjvdxrTtwKOFVNw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=moZM+4IbTB98F5IqL2AWGzuuVatmHubbyKHp3Ekftd6x4V6ReiT68RXJa9lk4WA0y
	 b6BfMFC+fOLxA5/noaJyAQktfoB0fPY537IhkRTpHlIrcG3blspJK4ctiuOCOOwVg/
	 97gil4dFtbnAKDdqVThGu+QDSwAkNxgQZCGIw8Duip8Meghb3Bu7NDk6tRbiTn4I9p
	 hXIT/lMrtRfLV/XYOT04Z2nCMa2UR6R/hGXOc1J3OlIcvGXYLwFGO+m1Xo0yAsKIl8
	 M6s9PHx9UklTriJ1VfnKRao/JcOd3ValDRmfiFRHFEQKEintVcH2LlXXas16J+ojX0
	 /WJRx3i3n0Dlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6206A6078A;
	Tue,  3 Nov 2026 10:52:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A1A72356
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93B61405B7
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y0yjZPEk0XlZ for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 10:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 771FB40575
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793703153;
 b=cLHoMkN7e+98KCz+uPp0RdtSe5XHDBlG2nmIukbPt0kJctWItA8o29y2+qXBC8hWLf4M
 y2wsbAQUrcQBLwwG5vGoRlhb4ud4T+1WH8COzEJlwD1Dnxr8FDiUEn9al2VWALjq47Ljr
 1tb0cInaLlHlvGrFzhrE3A1kUEaBtsKKZpwbwnKLXCQ/aiwwtZ6+jhHdVZIJHhj5bEAgy
 3xse/jV20LUVrSIs4Lko0O0J7KZxa+z8wPdUN9GCCYwmqg+UvTRfRjw/N8YWDuxAv5rZo
 KzTqahGunyUQ6+zIXKrAmsa4UTNA0g3jTHC1TTsiXkoppgFvaxj84ObKlPvONW8j0KQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793703153;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=rxY5gBJA/fowx+ldV08xkiGgJo1lWr40OY8TDS5H7Ik=;
 b=E8AunXc/kRy09FrxYotYbrISjLvGpNwmoPwf7IKi9saraYyC6KCmL2gkA6chS3FytvE5
 afi6U5OjM6c/0PYdAoFj5agrsLMxPL9WfGnC7Dy9Ojr1XkZigA3ZWjRDDTR0fwnzJZpfl
 sVCdj6iAqkNAORgtcC/SoYnKAOmWG3QPhpE3NDHUJv0ns5lY3LJIm+hIEGhOcR/Udjzgw
 AqC+go3tbjNRBotjU895mqXkDjDorBamBn4aH4jweabPEedwW8MJK6b1DzLqNzPGZ0unw
 tjSVGuXZFnAMMpn6BJOYHtaxk0uK3jkGIjnYLNp0eASREgYcGfmuLSInxa/ntob5nRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=JC2CjiLf; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=JC2CjiLf
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 771FB40575
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 10:52:32 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48e47347279so2498988f8f.1
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 02:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793703151; x=1794307951; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rxY5gBJA/fowx+ldV08xkiGgJo1lWr40OY8TDS5H7Ik=;
 b=JC2CjiLfRSAQnt68r8s6zCVEqLuVhrdWPiPYmE2dWr87uMY2Tg64e5OhaEx5DaTpE9
 wQc0tYuK9K97LjzRHVqY+IKqXrV8Ku1H2V0HRFUhAQZbsTCU1SIsdtLi7NnhfGZ5OWGn
 uTuiDTce9ZHTKjBbBFoOsWknEwwKH14IdB6sBEaxvt6zQSjsEuUCyq4f9kp7rtVngO0i
 n9i9m6Zp8KBSKRg3i1WzJPClUrDXnRD2pObKALtgMpJiFQEnqaqLc0omLjJgqymynE/b
 MPxF9Ai+7GuJjMDnf6aPu9rAgBwKluj1BwXnjGPsS0ELZMGVEDM+4+Vrht6DbNox6JgQ
 ChOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793703151; x=1794307951;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rxY5gBJA/fowx+ldV08xkiGgJo1lWr40OY8TDS5H7Ik=;
 b=m1o7pqylseMdWvYCqq5GLVY4wVS2Sq2qoBUWzp9sdpeFJMG25KJK7MRvZ4K30ID9tS
 4NhVUwlgbQUKzT2npTDQotRopxtGS/HP5QpZZEiZagTP6bl4XTcpGn8f0Qn96m1WEBUA
 2F+NRN48QUCHEKjgDJs64U3g4lq2ePJjfcJVjmaY1VcCUqW9gSecIrigC2CcAJSFbg/3
 nIv0tACqS4gaL6ULCDDyoNXVUbC7ZHfsoCD6gAawjgkJkGIWleX+/R/WSgQE7BKUlZLv
 3nRRQ9X3bPRP7S24rTB3DlIHNUFt/23P5JO67fdmqz6TLUMD40zpffI9Qm55ec+IhUWN
 QMzA==
X-Gm-Message-State: APuU4Z8dR8a+2zcimGxoL0QBVf0oqDfJHtDgsxib9V/AGLnjyFLIGLsz
 9LiS0RX5iZxMib8K6wByZTxVBPFnQEnkoa5y4rTekkaYlandsav1xOkJtPumsA==
X-Gm-Gg: AYBFou1FwkUqPoDODsjLMuaxi86wmeYnVqOR+ZYZpXy5LNnNewnCyBaO1iVI8kYBSR6
 H/A2SzLGWU7pZDd3yclPSvODKMs/QRaVIAN9h3KJEbPgnKBw+n2gfH2B130ZPUAVaTWnhorPSfP
 NnNk8sKdF6qnbWc8n3EEsMDAv8hO2/3rGzLkflZ/Ncum9LaK1j8NhGBRV89vIB4UU5gz0SuYwfO
 Xjq7v8OYgGLpoSNCK2eMPxhPnsJKiFUg7fO94Fp7tnEy8O+liQtoN74ZmV1j9reSOnwIbNyFn4c
 qrmAtrzHNBHDx59JlSh+UHyfK4KDYi3G27C8uI1vXiiTAV+pytRlfLZwNJxVJIQl4SazQ2SnHxR
 D2y0Dw+JmptSbnG5Kli/XxSt9baPPdzcWzukXsqNoV60inX6WteZxmBsrXYt2kIEagt5NDFCPPt
 DuZFJr7LcPYBdQRRIzuR5dF2l9Dpzn2/f9kMxbtzynEhHDda1AQ8p1fMOp7+E4NDVzl8UyfqcbG
 nVZfBQAjuLr33irDtVscwaDFePK/+H7X3rZzlqJ1wpRdRTIdja7VGmGPGKVJhNkMSlbDLGdVl1v
 1zD5iDrks9wHIvwWhypGp+D5PbUyDpDEurB3Q62pcyz3aHB4lxQNpA==
X-Received: by 2002:a05:6000:186c:b0:48e:7a19:7aad with SMTP id
 ffacd0b85a97d-48e7a197e64mr22043122f8f.6.1793703150579; 
 Tue, 03 Nov 2026 02:52:30 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e7a1d9d71sm18911099f8f.48.2026.11.03.02.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 02:52:30 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue,  3 Nov 2026 11:52:24 +0100
Message-Id: <20261103105224.1995953-4-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
References: <20261103105224.1995953-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] support/testing: add runtime tests for the
 /etc overlayfs
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Test the /etc overlayfs with the busybox, sysvinit and systemd init
systems, with a read-only ext4 root filesystem and a second ext4 disk
as the persistent device: the original init runs as PID 1, /etc is an
overlay whose changes are stored on the persistent device and survive
a reboot, and the original /etc is exposed read-only. Also check that
the system still boots, with a read-only /etc, without the persistent
device.

The kernel configuration disables overlayfs, to check that the option
enables it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                                    |   1 +
 .../testing/tests/init/test_overlayfs_etc.py  | 128 ++++++++++++++++++
 .../linux-no-overlayfs.fragment               |   2 +
 3 files changed, 131 insertions(+)
 create mode 100644 support/testing/tests/init/test_overlayfs_etc.py
 create mode 100644 support/testing/tests/init/test_overlayfs_etc/linux-no-overlayfs.fragment

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b9dd41f01..0c6e777133 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -262,6 +262,7 @@ F:	package/sshguard/
 F:	package/sunwait/
 F:	package/sysdig/
 F:	package/uthash/
+F:	support/testing/tests/init/test_overlayfs_etc.py
 
 N:	Andy Shevchenko <andy.shevchenko@gmail.com>
 F:	package/fb-test-app/
diff --git a/support/testing/tests/init/test_overlayfs_etc.py b/support/testing/tests/init/test_overlayfs_etc.py
new file mode 100644
index 0000000000..7b258c8793
--- /dev/null
+++ b/support/testing/tests/init/test_overlayfs_etc.py
@@ -0,0 +1,128 @@
+import os
+import subprocess
+
+import infra.basetest
+
+
+class InitSystemOverlayfsEtcBase(infra.basetest.BRTest):
+    # The kernel fragment disables overlayfs, to check that
+    # BR2_ROOTFS_OVERLAYFS_ETC enables it.
+    kern_frag = infra.filepath(
+        "tests/init/test_overlayfs_etc/linux-no-overlayfs.fragment")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW is not set
+        BR2_ROOTFS_OVERLAYFS_ETC=y
+        BR2_ROOTFS_OVERLAYFS_ETC_DEVICE="/dev/vdb"
+        BR2_ROOTFS_OVERLAYFS_ETC_EXPOSE_LOWER=y
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.60"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kern_frag}"
+        BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+        BR2_TARGET_ROOTFS_EXT2=y
+        BR2_TARGET_ROOTFS_EXT2_4=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def create_data_disk(self):
+        disk = os.path.join(self.builddir, "images", "data.ext4")
+        subprocess.check_call(
+            ["dd", "if=/dev/zero", f"of={disk}", "bs=1M", "count=32"],
+            stdout=self.emulator.logfile, stderr=self.emulator.logfile)
+        mkfs = os.path.join(self.builddir, "host", "sbin", "mkfs.ext4")
+        subprocess.check_call(
+            [mkfs, "-F", "-q", disk],
+            stdout=self.emulator.logfile, stderr=self.emulator.logfile)
+        return disk
+
+    def boot(self, data_disk):
+        rootfs = os.path.join(self.builddir, "images", "rootfs.ext2")
+        kernel = os.path.join(self.builddir, "images", "Image")
+        options = ["-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                   "-drive", f"file={rootfs},if=virtio,format=raw"]
+        if data_disk:
+            options += ["-drive", f"file={data_disk},if=virtio,format=raw"]
+        self.emulator.boot(arch="aarch64",
+                           kernel=kernel,
+                           kernel_cmdline=["root=/dev/vda", "ro", "rootwait",
+                                           "console=ttyAMA0"],
+                           options=options)
+        self.emulator.login()
+
+    def check_common(self):
+        # The original init runs as PID 1, after the pre-init
+        self.assertRunOk("cmp /proc/1/exe /usr/libexec/overlayfs-etc/init")
+        # The root filesystem stays read-only
+        self.assertRunOk("grep -q '^/dev/root / ext4 ro' /proc/mounts")
+        self.assertRunNotOk("touch /usr/foo")
+
+    def check_overlay(self):
+        disk = self.create_data_disk()
+
+        self.boot(disk)
+        self.check_common()
+
+        # /etc is an overlay with its upper on the persistent device
+        self.assertRunOk("grep -q '^overlay-etc /etc overlay ' /proc/mounts")
+        self.assertRunOk("grep -q '^/dev/vdb /data ext4 ' /proc/mounts")
+
+        self.assertRunOk("echo foobar >/etc/br-test")
+        self.assertRunOk("test -e /data/overlay-etc/upper/br-test")
+
+        # The original /etc is exposed read-only
+        self.assertRunOk("cmp /data/overlay-etc/lower/passwd /etc/passwd")
+        self.assertRunNotOk("test -e /data/overlay-etc/lower/br-test")
+        self.assertRunNotOk("touch /data/overlay-etc/lower/foo")
+
+        # The changes persist across boots
+        self.assertRunOk("sync")
+        self.emulator.stop()
+        self.boot(disk)
+        out, exit_code = self.emulator.run("cat /etc/br-test")
+        self.assertEqual(exit_code, 0)
+        self.assertEqual(out[0], "foobar")
+
+
+class TestInitSystemOverlayfsEtcBusybox(InitSystemOverlayfsEtcBase):
+    config = InitSystemOverlayfsEtcBase.config
+
+    def test_run(self):
+        self.check_overlay()
+
+
+class TestInitSystemOverlayfsEtcSysv(InitSystemOverlayfsEtcBase):
+    config = InitSystemOverlayfsEtcBase.config + \
+        """
+        BR2_INIT_SYSV=y
+        """
+
+    def test_run(self):
+        self.check_overlay()
+
+
+class TestInitSystemOverlayfsEtcSystemd(InitSystemOverlayfsEtcBase):
+    config = InitSystemOverlayfsEtcBase.config + \
+        """
+        BR2_INIT_SYSTEMD=y
+        """
+
+    def test_run(self):
+        self.check_overlay()
+
+
+class TestInitSystemOverlayfsEtcNoDevice(InitSystemOverlayfsEtcBase):
+    config = InitSystemOverlayfsEtcBase.config
+
+    def test_run(self):
+        # Without the persistent device, the system still boots, with
+        # the read-only /etc
+        self.boot(None)
+        self.check_common()
+        self.assertRunNotOk("grep -q ' /etc overlay ' /proc/mounts")
+        self.assertRunNotOk("touch /etc/foo")
diff --git a/support/testing/tests/init/test_overlayfs_etc/linux-no-overlayfs.fragment b/support/testing/tests/init/test_overlayfs_etc/linux-no-overlayfs.fragment
new file mode 100644
index 0000000000..f59e353141
--- /dev/null
+++ b/support/testing/tests/init/test_overlayfs_etc/linux-no-overlayfs.fragment
@@ -0,0 +1,2 @@
+# Disabled here, to check that BR2_ROOTFS_OVERLAYFS_ETC enables it
+# CONFIG_OVERLAY_FS is not set
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
