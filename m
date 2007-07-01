From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Sun, 1 Jul 2007 13:54:37 +0700
Subject: [Buildroot] top-level Makefile
Message-ID: <5d75f4610706302354m56c341c4mc9aa045852e2d4cd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

   I used subversion to get the source for buildroot; it says I have
revision 18980.  There are some lines in the top-level Makefile
that always give me errors, but this didn't happen before.  These
lines look like this:

HOSTAR:=$(shell $(CONFIG_SHELL) which $(HOSTAR) || type -p $(HOSTAR) || echo ar)

My /bin/which is not a shell script, it is a normal compiled C program.
I get these errors when I try to configure:

BLS #make menuconfig
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
make CC="/usr/bin/gcc" CFLAGS="-g -O2" MAKECMDGOALS="menuconfig" \
                -C package/config conf mconf

and eventually it does show the menu.  However, the menu will
not generate the .config.cmd file any more and so I cannot build
after I configure.

BLS #make
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
/bin/which: /bin/which: cannot execute binary file
Makefile:170: .config.cmd: No such file or directory
make: *** No rule to make target `.config.cmd'.  Stop.

My which version:
BLS #/bin/which --version
GNU which v2.16, Copyright (C) 1999 - 2003 Carlo Wood.
GNU which comes with ABSOLUTELY NO WARRANTY;
This program is free software; your freedom to use, change
and distribute this program is protected by the GPL.
