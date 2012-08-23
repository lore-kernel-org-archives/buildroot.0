From: Aras Vaichas <aras.vaichas@gmail.com>
Date: Thu, 23 Aug 2012 09:45:35 +0100
Subject: [Buildroot] gdbserver with external crosstool
Message-ID: <CAJkQPOknYkU=jGjpS2B+b+DUYLNPq6NX-muxC04BBSKbbhGcLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've got a question about building gdbserver when an external
toolchain is selected.

in toolchain/gdb/Config.in:

config BR2_PACKAGE_GDB_SERVER
        bool "Build gdb server for the Target"
        depends on !BR2_TOOLCHAIN_EXTERNAL
        help
            Build the gdbserver stub to run on the target.
            A full gdb is needed to debug the progam.

Why doesn't Buildroot build gdbserver when an external toolchain is selected?

I noticed that both gdbserver and gdb are built (with the external
toolchain) by Buildroot, but only gdb is copied over to the target.

I see that BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY allows the gdbserver
from the external toolchain to be copied over.

So why doesn't Buildroot allow me to copy over the gdbserver that I
built within Buildroot?

Aras Vaichas
