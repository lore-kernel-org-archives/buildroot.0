From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 23:11:57 +0100
Subject: [Buildroot] [PATCH 0/2] qemu: allow selection of host qemu-user
	from menuconfig
Message-ID: <1418249519-15794-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This patch series is a respin of those old patches posted by Frank
Hunleth.

The first patch is almost unchanged (just refreshed on top of the
current master) and creates a menuconfig entry in 'Host utilities' to
enable Qemu.

The second patch is inspired by
http://patchwork.ozlabs.org/patch/319108/ (from Frank as well), but
has a completely different implementation, which I find nicer (based
on make code, plus the check is done much earlier, plus we don't need
to depend on the toolchain package). Ideas on how to make the 'make'
checks nicer are welcome.

This set of patches superseds:

  http://patchwork.ozlabs.org/patch/319108/ (from Frank)
  http://patchwork.ozlabs.org/patch/299014/ (from Frank)
  http://patchwork.ozlabs.org/patch/419140/ (from Thierry Bultel)

Comments welcome.

Thomas

Frank Hunleth (1):
  qemu: add to host utilities menu

Thomas Petazzoni (1):
  qemu: add host/target Linux version check

 package/Config.in.host      |  1 +
 package/qemu/Config.in.host |  8 ++++++++
 package/qemu/qemu.mk        | 28 ++++++++++++++++++++++++++++
 3 files changed, 37 insertions(+)
 create mode 100644 package/qemu/Config.in.host

-- 
2.1.0
