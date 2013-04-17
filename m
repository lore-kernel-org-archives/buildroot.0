From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed, 17 Apr 2013 13:32:07 -0500
Subject: [Buildroot] RFC: "make emu" build and start QEMU target
Message-ID: <CAEBucnDgqjO+3RpdXOgqJzkitSG6P-L=cbOEJws09WZXnnD5kQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm proposing a project where a "make emu" target would be added to
Buildroot in order to start a virtualized version of the target.  This
would provide developers with the ability to quickly test and validate
their configuration.

To configure the emu target a new top-level menu, "Target Emulation,"
would be added.  This menu would contain the following options.

Emulation Method -> QEMU
QEMU Version -> Custom Git Tree | Custom tarball | Custom Version | X.Y.Z
... Source Configuration similar to Kernel ...
Machine -> list of machines
Memory -> Memory in Megabytes
Additional QEMU Options -> (additional options for command line)

This will start the qemu-system-$(ARCH) version of QEMU with the
appropriate configuration.

Thanks,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
