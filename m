From: Sam <samiswt@gmail.com>
Date: Sat, 27 Jan 2018 11:55:43 -0800
Subject: [Buildroot] File ownership issues while patching DAQ
Message-ID: <CAPi4xiUKNY_KLk-0O-1k47n6wqfZ+sWpx3rMqNUhfySF=fu9pw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

I'm trying to compile and install DAQ-2.2.2 to my Raspberrypi3B. There's a
parallel cross-compiling issue that I have to apply a patch, as you can see
in attached file:0004-sfbpf-Makefile*.patch, to solve it.
In my default user bash prompt, the problem is that Buildroot copied
Makefile.in(ownership user:usergrp) to Makefile.in.orig(ownership
root:root), which is not allowed to modify, and rejected an error as shown
in attached file build.log.
I've tried to compile and build it with root:root, Buildroot uncompressed
DAQ*.gz to files and subdirectories with ownership user:usergrp other than
root:root which is what I expected.

How can I make this patch work?

P.S.: I download daq-2.2.2 from www.snort.org and I've never created a user
group named usergrp on my host, I don't know if Buildroot did or DAQ.
Assuming user is my default user name.

Thank you for your consideration,


Tao
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/550c442e/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0004-sfbpf-Makefile-tokdefs-h-nonexist.patch
Type: application/octet-stream
Size: 367 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/550c442e/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: build.log
Type: application/octet-stream
Size: 840 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/550c442e/attachment-0001.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile.in
Type: application/octet-stream
Size: 32247 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/550c442e/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile.in.orig
Type: application/octet-stream
Size: 32247 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/550c442e/attachment-0003.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile.in.rej
Type: application/octet-stream
Size: 346 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180127/550c442e/attachment-0004.obj>
