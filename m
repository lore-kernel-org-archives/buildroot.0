From: Romain Naour <romain.naour@smile.fr>
Date: Mon, 3 Jul 2017 21:43:54 +0200
Subject: [Buildroot] Syslinux: mbr build failure
Message-ID: <b2f7acb4-a732-92dc-445f-65834091bc9b@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benoit,

There is another issue with syslinux since the build with the target toolchain
is enabled.

syslinux-6.03/bios/core/../lzo/prepcore ldlinux.raw ldlinux.bin
syslinux-6.03/bios/core/../lzo/prepcore: ldlinux.raw: write error

You should be able to reproduce with this defconfig:

BR2_x86_64=y
BR2_x86_steamroller=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TARGET_SYSLINUX=y
BR2_TARGET_SYSLINUX_MBR=y

Best regards,
Romain
