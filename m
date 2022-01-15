Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE31EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AEE6400A6;
	Sat, 15 Jan 2022 20:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0NgpHWL0LCC; Sat, 15 Jan 2022 20:03:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00287400D6;
	Sat, 15 Jan 2022 20:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA9061BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99180605DB
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 20:03:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mhyxFB6Gi4x for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 20:03:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E260A600BB
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 20:03:27 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id 30so47716462edv.3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 12:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P639LnIf9FhKHHMkfFPmMAgqYZPE1RKVKnu0ry2vCpw=;
 b=Mq351OoUckWpfeOejSEky4xsLzM4E0yE75Om4veUxg8nn4phyFsWJRP5J1etGEz3MO
 fiAVb3RMQ9akmwl9Eq3w/nXCJhE4T/VeU4i60AiTF3BsGspkBa4DsVxmSI075wmsskyX
 L5ZN3g3gW3QIZd8UNYIGxZxM+Tr3LG/Uaf4rT36NqpDPX0nTwJvZoY3TSEVY+jDZBSJs
 82yCCPwoMF+NqtBMAvTCauUCVnokCpySUidzYn5chjsW+wgyhu14kWkX3E4bDxQMVULp
 8ZbAY2qIPd98Mb0BPxNOmMlmE5Tud/XInL7sOvlQg2Zb7TErwFrwdst8J9wIRXPLkEwf
 kgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P639LnIf9FhKHHMkfFPmMAgqYZPE1RKVKnu0ry2vCpw=;
 b=p9s7giM95aEAnIeToKGrsnZD4T9Nq1P1MSNAXyXoo299ZAsCoT1G5hrCJ4MNgXzmGZ
 hhh9YEnq4vVAt4dbaiaSg8SWfdXiNHZsuikLdYsvAqS2A9iTp7FeeziG0IPZtKV6aWdT
 1hRitP4hb0U6ozr6EOFWAhvrV8eud+3TO7P75E0SRIkWlHRQAp0s/bdDa4niNucoN2PN
 Cu6XLrL/7Nvt71QEioLCkcQjZ/0T0BjBN0rUlK2TcoJ0jqA7S0abvUWdN/6iZ0J/P8kE
 +X1mxaheC5KlfgeD38hzXJj/PrQOLwuKQ7/gA/YfTLlpjlxN+ILiJKwLoZ9nqudolgIA
 j8uQ==
X-Gm-Message-State: AOAM533rL1V5wRAMycsHeUasPR2ZnRm1R2zal4wgarUQF1NS01JnUVuG
 T6jyWDDLWOclLRO/oXEwK0ju7ry/jx4=
X-Google-Smtp-Source: ABdhPJyYaerskNVs600Hl+5pZjWgFO15n6+fnVxCpeLuX7i4f7FInt9JmymbLEZkrQSLQGprWC6HoA==
X-Received: by 2002:a05:6402:520b:: with SMTP id
 s11mr14161212edd.27.1642277005952; 
 Sat, 15 Jan 2022 12:03:25 -0800 (PST)
Received: from localhost (ptr-5gw9tzn82s1glqex1i.18120a2.ip6.access.telenet.be.
 [2a02:1810:510:3800:ad4b:62a2:fdc7:acc6])
 by smtp.gmail.com with ESMTPSA id j21sm2822267ejj.133.2022.01.15.12.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 12:03:25 -0800 (PST)
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 21:02:58 +0100
Message-Id: <20220115200306.14037-1-patrickdepinguin@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 0/7] Basic support for 64-bit kernel and
 32-bit userland
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
Cc: romain.naour@gmail.com,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Hello,

Even though there are already cases where a 64-bit kernel is combined with
32-bit userland, like MIPS64n32, that Buildroot can support out-of-the-box,
there are other combinations that don't currently work.

At work, we have two such cases:
- 64-bit x86_64 kernel with 32-bit i386 userspace
- 64-bit aarch64 kernel with 32-bit arm userspace

This series adds basic support for these cases, with the limitation that the
user still needs to know what they are doing.

Patch 1 is a general improvement and can land even if you don't agree
with the rest.

Patch 2 handles the realization that 'KERNEL_ARCH' can mean two different
things, and that we need two separate variables.

Patch 3 makes it possible for users to specify the kernel architecture that
differs from the Buildroot notion of userspace architecture.

Patch 4 fixes the build of perf in this mixed 64-bit-kernel+32-bit-userspace
case.

Patch 5 prepares host-qemu for the case of x86_64. I'm not very fond of the fact
that this does not provide a generic solution.

Patch 6 adds a new qemu defconfig for x86_64 kernel and x86 userspace, that
employs the new logic.

Finally patch 7 corrects LINUX_ARCH_PATH for sparc64, not directly related to
this series but reported by Romain Naour during his review.


As hinted above, users that would like to employ such scenarios still need to
know what they are doing:

- the correct value of BR2_KERNEL_ARCH_OVERRIDE is to be known by the user

- the toolchain should be capable of generating both 64-bit (kernel) output as
  well as 32-bit userspace output. This is typically done with a multilib
  toolchain, where the default output is 64-bit so that the kernel build does
  not require additional changes, while passing the correct '-mXXX' flag as
  BR2_TARGET_OPTIMIZATION for the userspace compilations.

- it is not possible to create one multilib toolchain that supports Aarch64 and
  (32-bit) ARM output. We have solved it by packaging two individual toolchains
  in one archive, with symlinks at top-level to the 32-bit toolchain, and
  some additional changes in Buildroot to make sure the 64-bit toolchain is
  used where needed (kernel, bootloader)

- BR2_KERNEL_64_USERLAND_32 is not automatically passed.


An alternative implementation would be to explicitly support certain
combinations, but this is less flexible.

Best regards,
Thomas

Thomas De Schampheleire (7):
  arch: move definition of KERNEL_ARCH to Config.in.<arch> files
  core: introduce NORMALIZED_ARCH as non-kernel replacement for
    KERNEL_ARCH
  core: introduce BR2_KERNEL_ARCH_OVERRIDE
  perf: fix compilation in case of i386 userspace with x86_64 kernel
  package/qemu: add support for overridden KERNEL_ARCH=x86_64
  configs: add new qemu defconfig 'x86_multilib'
  linux/linux.mk: correct LINUX_ARCH_PATH for sparc64

 Makefile                                      | 22 ++-----
 arch/Config.in                                | 18 ++++++
 arch/Config.in.arc                            |  3 +
 arch/Config.in.arm                            |  4 ++
 arch/Config.in.csky                           |  3 +
 arch/Config.in.m68k                           |  3 +
 arch/Config.in.microblaze                     |  3 +
 arch/Config.in.mips                           |  3 +
 arch/Config.in.nds32                          |  3 +
 arch/Config.in.nios2                          |  3 +
 arch/Config.in.or1k                           |  3 +
 arch/Config.in.powerpc                        |  3 +
 arch/Config.in.riscv                          |  3 +
 arch/Config.in.s390x                          |  3 +
 arch/Config.in.sh                             |  3 +
 arch/Config.in.sparc                          |  4 ++
 arch/Config.in.x86                            |  4 ++
 arch/Config.in.xtensa                         |  3 +
 board/qemu/x86_multilib/linux.config          | 57 +++++++++++++++++++
 board/qemu/x86_multilib/post-build.sh         | 11 ++++
 board/qemu/x86_multilib/readme.txt            |  7 +++
 boot/barebox/barebox.mk                       | 10 ++--
 boot/uboot/uboot.mk                           |  6 +-
 configs/qemu_x86_multilib_defconfig           | 26 +++++++++
 linux/linux.mk                                |  2 +
 package/busybox/busybox.mk                    |  2 +-
 .../environment-setup/environment-setup.mk    |  2 +-
 package/kvmtool/kvmtool.mk                    |  4 +-
 package/libselinux/libselinux.mk              |  2 +-
 package/linux-tools/linux-tool-perf.mk.in     |  7 ++-
 .../linux-tools/linux-tool-selftests.mk.in    |  6 +-
 package/olsr/olsr.mk                          |  4 +-
 package/pciutils/pciutils.mk                  |  2 +-
 package/qemu/qemu.mk                          |  3 +
 package/uboot-tools/uboot-tools.mk            | 10 ++--
 35 files changed, 210 insertions(+), 42 deletions(-)
 create mode 100644 board/qemu/x86_multilib/linux.config
 create mode 100755 board/qemu/x86_multilib/post-build.sh
 create mode 100644 board/qemu/x86_multilib/readme.txt
 create mode 100644 configs/qemu_x86_multilib_defconfig

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
