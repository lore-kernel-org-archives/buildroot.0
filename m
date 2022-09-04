Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2145ECAAD4
	for <buildroot@archiver.kernel.org>; Sun,  4 Sep 2022 09:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42AFE40496;
	Sun,  4 Sep 2022 09:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42AFE40496
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LuBENNH6O2_3; Sun,  4 Sep 2022 09:52:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C091403C2;
	Sun,  4 Sep 2022 09:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C091403C2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 91E3E1BF429
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 09:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62497408CD
 for <buildroot@lists.busybox.net>; Sun,  4 Sep 2022 09:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62497408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SjVd7fU79mZp for <buildroot@lists.busybox.net>;
 Sun,  4 Sep 2022 09:52:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F44404CC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6F44404CC
 for <buildroot@buildroot.org>; Sun,  4 Sep 2022 09:52:44 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Md66H-1p4wKq1dGF-00aI3D; Sun, 04
 Sep 2022 11:52:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun,  4 Sep 2022 11:52:35 +0200
Message-Id: <20220904095237.1401885-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:lQFPG/nho7at808KBir2uVrQ/XBEOXHRDrteKLwxnvswbw+Kwz7
 5qxX7ki631lu9r2h+ghHxlQLHaYgfvZx6c2O0rIzQKzTHzHtViolzGw8IWBlodI84jsfCvx
 9hI6AEGECj99aKVzR0WHDpUjwVpSbWBQe8Th2NO44jO6M78MLCqatP2wAT5d5vDI729BgAY
 AnSsM06D/MnyfjEevrGpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I2JlPAr9A8M=:GUoYRXntxx74htAWps/Lj6
 rSeZz4B8YJUGfR3OCcyYUpS+1771oPjG+MES85aRICg/Q32lzViIOreaAJ2MU0rAFYS1u1z+V
 Lf96NV+fQWK5HM6LWYMGHlXfscdZEZiNcjF98wty6Cn7FyBbkqS7g4aRE7cIc0YSP8WC8qlUG
 DwF7wOH/LLGhwnkoGlakcJr6fxtTkRnBF/Dg+l5x1yA9Pzm49n90fvTLpuDkLkj0iDzCrJ2wK
 ulkIqVSBsiUBqxFB72seemU1t5Ma8+0XrHqVUtE8HTMt9Ds3zjczszGnFRjkW5Y1/UPWrCZd5
 FsH3brLGw2fXVWUQkDJxHmjpXzELOfG8qdVYlWAEkRkBiP14/+MJVjLKDo3FCdgO3Qpic9IZd
 rwgrMryJLhFkbQk6GT+DXJLZiVyWclUy/OUiq9JzKdRls3YDzvQsb67aKOqaz8xxacYF95mgW
 5hlVAdm30VrONARISHHNNMC4kBGoLu/gBAE5V29bDqBrCiIB3SRzmo9De6KEZ0+w3xwg+0/fS
 ia/AmRqYgEhdY/Zyg4HUFcnNtirhkgA7/jKrg0iT2IRt/pHw9TJZ6BLUQMo/Rw2AHgN417de6
 agcXYr4cASbSPGNaKmhNDF2meVu6jdboFn6fNoZDoZG+QJ5u1mA5/qE/AIfG1EN18gETX4HZe
 2W9NsbZXpUPU1XLjHNk7i4oaEuCRyh9VJsANQDgTwZu4M3EFagpD87f+rhXuM5+49r5NBa1r7
 t+18Fwam+tPDHKlQxdHi4yKCg67aBZEpdV+l6XPAmbXLkJoucJSESxc9lHD7MgoiOOwZ44CqW
 4KRh4Ld
Subject: [Buildroot] [PATCH v5 0/2] package: add petitboot to use with
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
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
