Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19EEC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 11:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23EF240445;
	Sun, 14 Aug 2022 11:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23EF240445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9YnGOFA52wX; Sun, 14 Aug 2022 11:56:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D9B64024B;
	Sun, 14 Aug 2022 11:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D9B64024B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 427EB1BF2C3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 11:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E981415C3
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 11:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E981415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfHhF9PN6p6F for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 11:56:27 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B10A41526
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B10A41526
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 11:56:26 +0000 (UTC)
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MWitM-1nq7UT2f7o-00X5Gk; Sun, 14
 Aug 2022 13:51:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 13:51:13 +0200
Message-Id: <20220814115115.2798469-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:DyTA/iclg1QL7PDMaTfwglMD2yAls5uo9rUIBcm2uHzkIeawy3M
 gBjSV7BZwNMsOQWgb3a/6EJv6j3Cm8x73LeU8PNVH6nkeOHcdFhbFgDBEEOpQ357gZI8hWk
 TGlCoGYOffxz6mIGUTcq3igzFzjTWT2XOfFoa19jHh2qxrqnWIQMOI3OmIJvVj1aJ7IPo6W
 N2usqBoZgEL9kjl0PVTgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bwYgfglUfuo=:u/PCiAhcD5FMy5iROLE9ax
 WlEAv4URWXXeZ3oxrZyVcE+zmRDHMiX8Vv7ugNsNa56QzIb9j3plGYMsiDpWIaKGq6oPHE1mH
 3gkN0gvWc0b6ZtvS0YxpyFD6HPXjl9t8GJSLOpmS3DIgj7QUxzlr0kLRAkU47BAXrKGvMQc76
 X2IOI1T0P3lR9uesYdCZ4d9GKaEBIgbYooW9EPuZaui5e/yjSunRyhdnKgKu6p5MxZNMAXWSa
 7OgTuL6RNVM2LKhHva3ovI8ImkN649RWBCMb+SEEzLDT7sl5GN38OIpRHpcB2XIRK71GEMLCj
 mKdya8DIysWHpUzZLDRUrcGtMogF08rGMpfrpNb3Mi12SX+ACFHuJwsnFPedl0NcOb17GqDGA
 EcF0mJEf2JL7iHOf/0YkOEawc2RLhTVZOWHUp3E2ORbj3n5mtYAymDmyEVVDYHhwQQVfIhUzx
 wpEwyImMnB16CnODtLss9BynoF4vc5DuiDzMkxyc5sn1L4PFY2VTCkaVfenm+Mt3VIJPc1vdC
 AfyGnjyafAEZ3bA2JCbasEKNOLoZN9EAyej4wwqe70N43RMgSv/kzwLLeVan4Sx34uSKysMgc
 ftazQ/USIIVenF20Fldk3MZjwbV+ap2kzU4UtlT0ehfwq+S50ET12/k68NNy3uo43lPvxsvR7
 xzQxbpE9XnhG/Scph7cnG2jlspa5U2GxAQ1xySERXGj/SkgSMWKdSRxS5cD8/8j8cndsL1/8C
 PyJ/N8gSla1syE5iJK622tXqn4f4/sloDo7jkA==
Subject: [Buildroot] [PATCH v3 0/2] package: add petitboot to use with
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
Cc: Romain Naour <romain.naour@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
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

Laurent Vivier (2):
  package: add petitboot
  board/qemu/m68k-virt: Add virt-m68k linux config

 board/qemu/m68k-virt/config.linux            | 89 ++++++++++++++++++++
 board/qemu/m68k-virt/readme.txt              |  5 ++
 configs/qemu_m68k_virt_petitboot_defconfig   | 28 ++++++
 package/Config.in                            |  1 +
 package/kexec/Config.in                      |  2 +-
 package/petitboot/63-md-raid-arrays.rules    | 41 +++++++++
 package/petitboot/65-md-incremental.rules    | 69 +++++++++++++++
 package/petitboot/66-add-sg-module.rules     |  2 +
 package/petitboot/Config.in                  | 33 ++++++++
 package/petitboot/S14silence-console         |  9 ++
 package/petitboot/S15pb-discover             | 38 +++++++++
 package/petitboot/fs-overlay/etc/inittab     | 34 ++++++++
 package/petitboot/fs-overlay/etc/locale      |  1 +
 package/petitboot/fs-overlay/init            |  8 ++
 package/petitboot/kexec-restart              |  8 ++
 package/petitboot/petitboot-console-ui.rules |  6 ++
 package/petitboot/petitboot.hash             |  1 +
 package/petitboot/petitboot.mk               | 85 +++++++++++++++++++
 package/petitboot/removable-event-poll.rules |  4 +
 package/petitboot/shell_config               | 19 +++++
 package/petitboot/shell_profile              |  2 +
 21 files changed, 484 insertions(+), 1 deletion(-)
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
