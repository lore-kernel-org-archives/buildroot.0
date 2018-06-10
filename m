From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Jun 2018 22:39:09 +0200
Subject: [Buildroot] xtensa: qemu_xtensa_lx60 issue with gcc 8.1
Message-ID: <8d26aa17-fe18-2f56-8eb0-d32073ad099b@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Max,

We recently added gcc 8.1 in Buildroot and checked if all qemu configs are able
to boot correctly:

https://gitlab.com/free-electrons/toolchains-builder/pipelines/23083553

Unfortunately the qemu_xtensa_lx60 config doesn't boot using a toolchain with
gcc 8.1, binutils 2.30, uclibc-ng 1.0.30 and a kernel 4.16.7.

See: https://gitlab.com/free-electrons/toolchains-builder/-/jobs/72006443

I'm able to reproduce the issue and fallback to gcc 7.3 allow to boot the system
on Qemu. So it seems really related to the gcc version.

Do you have any clue ?

Best regards,
Romain
