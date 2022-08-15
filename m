Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3DAC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 14:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73B1F401BF;
	Mon, 15 Aug 2022 14:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73B1F401BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaCQ2vqStcow; Mon, 15 Aug 2022 14:49:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3616A416F4;
	Mon, 15 Aug 2022 14:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3616A416F4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75C981BF308
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E29D83ED7
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 14:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E29D83ED7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kB6EFe9f_hAC for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 14:49:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4A3C83EC7
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4A3C83EC7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 14:49:14 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M9qYn-1oKYbI19CH-005t5E; Mon, 15
 Aug 2022 16:49:09 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 16:49:05 +0200
Message-Id: <20220815144907.3300089-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:GkwAQGKW4djNc5KwIgh4PY5P+FFKMOE+9d+ibiI+wQniUgTGyfD
 ZO+ltH5vv3f5YL+o/V6nL80cBHHnVfr/zpuMX/s1HOgnd5Pmxett29ltHudPBsSp9iIF3bU
 21uw1j7JRRaD+mElsmontTuQ5qGwQWmJrbN1pwhLZ6OUDtLsRGhs9YKdihvqux0+u4tbsnr
 2lJcv2XtvwVSJasslsfig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qE2wpwlBRFc=:Mqih/gsBKth9URxvRlujvY
 anKXAj1hLltptt7CLVIZbB9lTEZg1w3/YdwmwjUZ21flpE4myMM8+3lrKGEI06nNQ8LusIagG
 DUutx59Mqn0+4qY3TweK1BfrDQ/Zlii/RWtwyGBiqaSj6OBDFlc2AtIvMkcnQsO6Yu0c1zBEw
 1PZxzHFXzewEwDTLm6svLJwT+jf5FGTMqOpifnaVA0DQ8zph+sONup+M/t7N3EduttV6NkInh
 QdltHoPgyPHW2f8C0Y8tKJHhaltJuUiy0RtrBKOvTuq+uyZWdAgPYVLzOzDafzjdo9X32R93e
 sysxLHhGq0IbIF8HuldUH0Ym/nOK2WkOUWw696nCqkGStfWswFLtiEYBFghmXJOcaFaa3Zmia
 QDhbaLESbYYnXuizWsRJ1OQZZDyU3cPCSjHMGnNikSkd+jJwnWt0rWJw9oH2DqofwgGvDLtEp
 AyntVYn0xlmTyGU8DUTwu2bZoxOJygYzAD4l69md4YTWi62Ikhiipdgy3gVko8dFXBij1tjIP
 NmdjCRcS4qMG+RuqHz6mGHd8j98PWbVjsr3JDpHKi8dK41QRxRiYLaSncNfBD3WD+IAgruxfN
 i9DOzkzMCgU5OWO40fFQF9cvdbNdB0SgrJamEQPLBwvgtjrxsDeIozSr0h7n5dUkjAr1vN99r
 47v9Xt5Npf2w/0UOSipzhttBnu4MV4/JOZCGcEuByAX/0tvTtc7YyvZt3rWJ40skBdgi6v6p+
 8dBXXSSAzuhMZLkX3Sw0FcUk7234hf9PkPiPpg==
Subject: [Buildroot] [PATCH v4 0/2] package: add petitboot to use with
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
 configs/qemu_m68k_virt_petitboot_defconfig   | 28 ++++++
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
 22 files changed, 473 insertions(+), 1 deletion(-)
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
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
