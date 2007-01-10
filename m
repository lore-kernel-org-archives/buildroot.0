From: Thomas Wedde <t.wedde@centersystems.com>
Date: Wed, 10 Jan 2007 18:42:08 +0100
Subject: [Buildroot] "gdb.mk" in buildroot does not respect extension in
	cygwin
Message-ID: <001701c734de$a6d24290$6b1410ac@Berlin1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list,

Builing a croos ? toolchain from i386-pc-cygwin (host) for arm-linux-gnu
(target) with Building gdb for the host and gdbserver for the target enabled
ends whith following error:

make[3]: Entering directory
`/opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb'
make[4]: Entering directory
`/opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb/doc'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb/doc'
make[3]: Leaving directory
`/opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb'
make[2]: Leaving directory
`/opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb'
make[1]: Leaving directory `/opt/buildroot/toolchain_build_arm/gdbhost-6.3'
strip /opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb/gdb
strip: /opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb/gdb: No such file or
directory
make: *** [/opt/buildroot/toolchain_build_arm/gdbhost-6.3/gdb/gdb] Error 1


I found out that the "gdb.mk" in \buildroot\toolchain\gdb\" uses the plain
filename "gdb" for the last steps of the makefile (stripping and installing).
In cygwin, we always have an ".exe" extension for all the host tools.

This is not a fatal problem, but I think this is easy to fix with a check of
the host configuration.

Best Regards

Thomas
