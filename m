From: Romain Naour <romain.naour@gmail.com>
Date: Sun,  2 May 2021 23:49:14 +0200
Subject: [Buildroot] [PATCH 0/5] poke: new package
Message-ID: <20210502214919.1826571-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series add poke package into Buildroot.

In order to build poke on riscv, this series enable riscv support in libatomic_ops
along with a bdwgc fix for riscv64.

The uClibc-ng support has been difficult to add due to issues
with gnulib similar we have with gdb package.
With the workaround applied, poke is working at runtime.
This will be reported to gnulib project.

More info about poke:
https://www.youtube.com/watch?v=92Sykut06N8

Qemu testing:
https://asciinema.org/a/mtFjz7pcN1QuVbxdZhBUfBQTs

Romain Naour (5):
  package/bdwgc: Fix 'undefined reference to __data_start' linker error
    on RISC-V
  package/libatomic_ops: enable for riscv32 and riscv64
  package/poke: new package
  package/poke: add optional json-c dependency
  package/poke: enable uClibc-ng support

 package/Config.in                             |  1 +
 ...ference-to-__data_start-linker-error.patch | 33 ++++++++++++
 package/libatomic_ops/Config.in               |  2 +-
 ...ck-for-Tcl-Tk-if-disable-gui-is-spec.patch | 43 +++++++++++++++
 ...nfig.in-avoit-host-poisoning-while-c.patch | 45 ++++++++++++++++
 ...P2MAN-replace-by-true-when-cross-com.patch | 34 ++++++++++++
 package/poke/Config.in                        | 27 ++++++++++
 package/poke/poke.hash                        |  3 ++
 package/poke/poke.mk                          | 54 +++++++++++++++++++
 9 files changed, 241 insertions(+), 1 deletion(-)
 create mode 100644 package/bdwgc/0001-Fix-undefined-reference-to-__data_start-linker-error.patch
 create mode 100644 package/poke/0001-build-do-not-check-for-Tcl-Tk-if-disable-gui-is-spec.patch
 create mode 100644 package/poke/0002-jitter-jitter-config.in-avoit-host-poisoning-while-c.patch
 create mode 100644 package/poke/0003-configure.ac-HELP2MAN-replace-by-true-when-cross-com.patch
 create mode 100644 package/poke/Config.in
 create mode 100644 package/poke/poke.hash
 create mode 100644 package/poke/poke.mk

-- 
2.30.2
