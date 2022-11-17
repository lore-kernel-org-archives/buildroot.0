Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5175EC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 17:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D009941935;
	Thu, 17 Nov 2022 17:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D009941935
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FiSgMI1GW5MT; Thu, 17 Nov 2022 17:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9243C41933;
	Thu, 17 Nov 2022 17:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9243C41933
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5B7C1BF401
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 17:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DD58404E9
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 17:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DD58404E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fngMSQZ38yE for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 17:46:25 +0000 (UTC)
X-Greylist: delayed 00:05:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84C88401F8
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84C88401F8
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 17:46:24 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M42b8-1ovisy03KS-00070p; Thu, 17
 Nov 2022 18:41:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 18:41:08 +0100
Message-Id: <20221117174110.314474-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:+F12TpNDBo8a9zIAl5nf0UNUxPb3Bos5MRn8HKzi4zj1QtoS8X0
 F6AxQEzTWyrvl3XybuhXDgR6oPaqiBiOUy6XA5Nv8u0zdTVWojpw9yYgcq3avoton7AGLa2
 G1AP2yOKYaNHInSU2mWCylxRvvWojH/54Ixh8WMu164aGyH+CQrn3nFCvIlwwU1Jy0bblme
 twkhE4f+zB71TD/gXMarQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ArCr4vRINF4=:278LZ04T2SFFha6a8iHVkY
 hntfpZmOxPcGIQTXtffxGpI8kcFytOZgU5Sa1xwEfYJaF26dlhMyqSFL1JepEduzizGvSNI4B
 eBgQCzgQIM4gBZdNEWr60jdtofW4wPNfEb4gOfe+CYmpoNwMmH7b6S6AudPyrjRCcxSw8kFCP
 yvyko7X+HBFw3qx5Q2PxSqu0aXAH2lVx9LsI/MDVXH9zBng7qyGxQ8MJ7qOztYzY72FeqVj8F
 WdgezuxWk2cUhNKJX96ZEzx1RjWPqkv3FPQ2TBdQ15zmdpPOibgozd9Nhw8Ojn14rM3yDAjQW
 eWOVWbUd33EQo9or7L+v3/s1c5UhdtPRHL/fvV3pEdESheXtgek3fjpK+sNBQc5+UHmw3OTei
 R2+GGkpwea4lduh6NmDXwpOJ+Mb0eNK60bk6TGETn9OXrXtRs7qQR8AlI2oEnTGVlY6ctV0NQ
 VGfjQ76xXO5xXxpJyQbmRnnCmqWJryorAlNoDaKBp/rhbcApcBpYhjcRnyloADW6IUB/k/eRb
 01NCZibIUal/DPR0yHZI6ckZhWcORnmebvMA61pRpJXjdWw3k5YyfbO/Kmwndbyvegn3pjqAp
 BgDgHeD0FNdqpuicbhaTloBhYi8JG9+ljZ2ByMzx9uheEAQD9SHdJMD/vSxV2lyKpoJabppYf
 XMt/3sqXEKANHp7pi2RHvHLMADrfI1IXJTEAFEyg86hL11em0bFCmwHSJ+vMwwpheOgXnYCYO
 MbeU8LL+WdLk1wacANa5TD3cQwr3p29fbkz55y17qTghoI/xrZctLVhCQs/+x/JwJdoPcRZdk
 q/51Fif
Subject: [Buildroot] [PATCH v6 0/2] package: add petitboot to use with
 qemu-system-m68k
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

qemu-system-m68k has introduced in v6.0 a new pure virtual machine
that is now supported by linux v5.19.

The goal of this series is to provide petitboot as an embedded bootloader
for it (like it is for the IBM spapr machine).

The first patch introduces petitboot package, the second patch the
configuration to build buildroot with petitboot for the QEMU machine.

You can test it with:

  qemu-system-m68k -M virt -kernel images/vmlinux \
                   -initrd images/rootfs.cpio.xz \
                   -append "console=ttyGF0" --nographic

Signed-off-by: Laurent Vivier <laurent@vivier.eu>

v6:
  - rebase

v5:
  - remove BR2_CCACHE_DIR, BR2_PACKAGE_DTC and BR2_PACKAGE_DTC_PROGRAMS

v4:
  - address Thomas' comments
  - remove petitboot-mtd config as libflash is not available

v3: v2: v1:
  - first version, I messed up with list subscription and git-publish...

Laurent Vivier (2):
  package: add petitboot
  board/qemu/m68k-virt: Add virt-m68k linux config

 DEVELOPERS                                   |  5 ++
 board/qemu/m68k-virt/config.linux            | 89 ++++++++++++++++++++
 board/qemu/m68k-virt/readme.txt              |  5 ++
 configs/qemu_m68k_virt_petitboot_defconfig   | 25 ++++++
 package/Config.in                            |  1 +
 package/kexec/Config.in                      |  2 +-
 package/petitboot/63-md-raid-arrays.rules    | 41 +++++++++
 package/petitboot/65-md-incremental.rules    | 69 +++++++++++++++
 package/petitboot/66-add-sg-module.rules     |  2 +
 package/petitboot/Config.in                  | 23 +++++
 package/petitboot/S14silence-console         |  9 ++
 package/petitboot/S15pb-discover             | 38 +++++++++
 package/petitboot/fs-overlay/etc/inittab     | 34 ++++++++
 package/petitboot/fs-overlay/etc/locale      |  1 +
 package/petitboot/fs-overlay/init            |  8 ++
 package/petitboot/kexec-restart              |  8 ++
 package/petitboot/petitboot-console-ui.rules |  6 ++
 package/petitboot/petitboot.hash             |  2 +
 package/petitboot/petitboot.mk               | 78 +++++++++++++++++
 package/petitboot/removable-event-poll.rules |  4 +
 package/petitboot/shell_config               | 19 +++++
 package/petitboot/shell_profile              |  2 +
 22 files changed, 470 insertions(+), 1 deletion(-)
 create mode 100644 board/qemu/m68k-virt/config.linux
 create mode 100644 board/qemu/m68k-virt/readme.txt
 create mode 100644 configs/qemu_m68k_virt_petitboot_defconfig
 create mode 100644 package/petitboot/63-md-raid-arrays.rules
 create mode 100644 package/petitboot/65-md-incremental.rules
 create mode 100644 package/petitboot/66-add-sg-module.rules
 create mode 100644 package/petitboot/Config.in
 create mode 100755 package/petitboot/S14silence-console
 create mode 100755 package/petitboot/S15pb-discover
 create mode 100644 package/petitboot/fs-overlay/etc/inittab
 create mode 100644 package/petitboot/fs-overlay/etc/locale
 create mode 100755 package/petitboot/fs-overlay/init
 create mode 100755 package/petitboot/kexec-restart
 create mode 100644 package/petitboot/petitboot-console-ui.rules
 create mode 100644 package/petitboot/petitboot.hash
 create mode 100644 package/petitboot/petitboot.mk
 create mode 100644 package/petitboot/removable-event-poll.rules
 create mode 100644 package/petitboot/shell_config
 create mode 100755 package/petitboot/shell_profile

-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
