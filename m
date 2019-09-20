From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 20 Sep 2019 15:38:49 +0200
Subject: [Buildroot] Systemd default console
Message-ID: <CADYdroO1n5J9ssSmV=_TY=FDw4WriNuB_-M09UES3o-qkQtPuA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I tried systemd with busybox for the first time and I have now the
problem that login vie serial is not working correctly.

-   busybox creates the link
/etc/systemd/system/getty.target.wants/console-getty.service, which
starts a getty on ttyS0
-   systemd itself create
/run/systemd/generator/getty.target.wants/serial-getty at ttyS0.service
automatically (no idea when and how)

in and output is perfectly garbled until one of those services is killed.
Given that systemd automatically picks up the getty from the
commandline, is there any reason for busybox to setup /dev/console?

kind regards, Norbert
