Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19DEC4167B
	for <buildroot@archiver.kernel.org>; Wed,  6 Dec 2023 22:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EDF4206B;
	Wed,  6 Dec 2023 22:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75EDF4206B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnRR0XIKbwwO; Wed,  6 Dec 2023 22:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92B9F42090;
	Wed,  6 Dec 2023 22:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92B9F42090
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A3431BF980
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6EE7983133
 for <buildroot@lists.busybox.net>; Wed,  6 Dec 2023 22:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6EE7983133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arSMwrYFoEWl for <buildroot@lists.busybox.net>;
 Wed,  6 Dec 2023 22:44:27 +0000 (UTC)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7F9683112
 for <buildroot@buildroot.org>; Wed,  6 Dec 2023 22:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7F9683112
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3334a701cbbso329230f8f.0
 for <buildroot@buildroot.org>; Wed, 06 Dec 2023 14:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701902665; x=1702507465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kiH+hLsQvW0ylElL0VYG2T3bv36jRey18d06vH1s5Tw=;
 b=FEyr7y6E5iA9zSH/W406410rPqkaiR76TFgZOmRh/7KsXT3hWDRrt6TlxN0SdVfjp+
 BO1SM27M6x1jlLDQN0MqfiRSfUm+cVAJ+JqYCN5pgu63VBapnm5Ar1xZg7Jdr8ni9jsW
 I8RCnR9So215Hh+g3Y5PjKZ5Eujm3rwWYEJrpPEYHaAOT0CYQCztSfs//KgQaABluRUV
 jlrSYKC62Rg1qaeqPRm5eO1ucLU0l9dDqaCS24FTYvLmbVXRyZx5lMBIujSMKjglSSeK
 rMVUONqJpI8kuP75DmrUM9wH1Z+59+1Qd5nGs9dUL9sNR1qf4kcB/kCxDj6SZKqVf7qh
 AfvA==
X-Gm-Message-State: AOJu0YxczTZC0WGXqK8ftv6XmHZNoq2SFMd1CswQBcxxAvikHgeIzOXq
 PIz0FhRRwm5imv8rcVkfvMu6NTrAm05zkzxjeZo=
X-Google-Smtp-Source: AGHT+IFb8fceRGZ2KPyNyZ3jj9SkTBJRuiGQ69jEsKGiuM9m/iN7tvzPOAJfxIjnp88X/6abgyhmvg==
X-Received: by 2002:adf:f18e:0:b0:333:86d:c28b with SMTP id
 h14-20020adff18e000000b00333086dc28bmr693354wro.32.1701902664980; 
 Wed, 06 Dec 2023 14:44:24 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w6-20020a05600018c600b00334b1564f0esm668567wrq.89.2023.12.06.14.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 14:44:24 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed,  6 Dec 2023 23:44:20 +0100
Message-ID: <20231206224422.16063-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701902665; x=1702507465;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kiH+hLsQvW0ylElL0VYG2T3bv36jRey18d06vH1s5Tw=;
 b=xF3nDsgo7r/0W7uWiPE2CH/kvyv5wMdZQNDlJeMzpTfFvoLuRJ9D/zCrGgg2vTXcac
 11FdKeoaXhpoYXht0m7bkv9rsSEZta+Kvz1dfop6PtrBpOatxa7sxGe9t75lmq2k4MDG
 wLKHaROBCU88ktdh3uGZInb6mgnrNupM/YZ5w8NtlVzwJzdQq43p1RrTUwZqv0Djl/91
 9D9tGY9ukbryMT2zXu5NsN7ZcKyyE1IDb73L4Me3ONGoeGsNViRfsUkph0bkXsTm72DZ
 Jvidp41JMk0PyArUAlSkRFgrzQmMrAMtOT7qtb4Zrw9YIBNJUSbmZ5wGrpYYJOSphrdM
 eQkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xF3nDsgo
Subject: [Buildroot] [PATCH 1/3] support/testing: bump prebuilt kernel to
 5.10.202
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

As reported on the mailing list [1], TestPolkitSystemd and
TestPolkitInitd are failing since we bumped the Bootlin toolchain
2023.08 [2].

The issue is caused by expat (XML library) package detecting
arc4random_buf() introduced by glibc 2.36 [3].

With arc4random_buf() support enabled, expat hang Polkit while reading
its policy files (XML files) due to a lack of entropy on the system.

Upgrading the kernel allows to avoid such issue thanks to
random_get_entropy_fallback() introduced in 5.10.119 (backpored) [4].

Build the vexpress-v2p-ca9 (armv7) 5.10.202 using the kernel
configuration file found in /proc/config.gz but with additional kernel
options provided by SYSTEMD_LINUX_CONFIG_FIXUPS. Indeed some kernel
options requested by systemd were missing in 5.10.7 kernel.

Build the versatile-pb (armv5) kernel using the same kernel
configuration as qemu_arm_versatile_defconfig but with additional
kernel options like for vexpress-v2p-ca9. While at it, enable
IKCONFIG_PROC option to provide the kernel configuration at runtime
in /proc/config.gz.

Runtime tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/1097887826 (tests.package.test_polkit.TestPolkit*)
https://gitlab.com/kubu93/buildroot/-/pipelines/1097705399 (tests.init.*)

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309948 (TestPolkitSystemd)
https://gitlab.com/buildroot.org/buildroot/-/jobs/5689309947 (TestPolkitInitd)

[1] http://lists.busybox.net/pipermail/buildroot/2023-December/680445.html
[2] 452365a385ef35e808eb2eb669d1e3227c7399dd
[3] https://sourceware.org/git/?p=glibc.git;a=commit;h=6f4e0fcfa2d2b0915816a3a3a1d48b4763a7dee2
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fdca775081527364621857957655207d83035376

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/infra/emulator.py | 8 ++++----
 support/testing/run-tests         | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/support/testing/infra/emulator.py b/support/testing/infra/emulator.py
index 09f81eca89..624740fcb1 100644
--- a/support/testing/infra/emulator.py
+++ b/support/testing/infra/emulator.py
@@ -54,16 +54,16 @@ class Emulator(object):
 
                 if arch == "armv7":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-vexpress-5.10.7")
+                                            "kernel-vexpress-5.10.202")
                     dtb = infra.download(self.downloaddir,
-                                         "vexpress-v2p-ca9-5.10.7.dtb")
+                                         "vexpress-v2p-ca9-5.10.202.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "vexpress-a9"]
                 elif arch == "armv5":
                     kernel = infra.download(self.downloaddir,
-                                            "kernel-versatile-5.10.7")
+                                            "kernel-versatile-5.10.202")
                     dtb = infra.download(self.downloaddir,
-                                         "versatile-pb-5.10.7.dtb")
+                                         "versatile-pb-5.10.202.dtb")
                     qemu_cmd += ["-dtb", dtb]
                     qemu_cmd += ["-M", "versatilepb"]
                     qemu_cmd += ["-device", "virtio-rng-pci"]
diff --git a/support/testing/run-tests b/support/testing/run-tests
index e8c540f370..485811b746 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -65,10 +65,10 @@ def main():
     BRConfigTest.downloaddir = os.path.abspath(args.download)
 
     if args.prepare_only:
-        emulator_builtin_binaries = ["kernel-vexpress-5.10.7",
-                                     "vexpress-v2p-ca9-5.10.7.dtb",
-                                     "kernel-versatile-5.10.7",
-                                     "versatile-pb-5.10.7.dtb"]
+        emulator_builtin_binaries = ["kernel-vexpress-5.10.202",
+                                     "vexpress-v2p-ca9-5.10.202.dtb",
+                                     "kernel-versatile-5.10.202",
+                                     "versatile-pb-5.10.202.dtb"]
         print("Downloading emulator builtin binaries")
         for binary in emulator_builtin_binaries:
             infra.download(BRConfigTest.downloaddir, binary)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
