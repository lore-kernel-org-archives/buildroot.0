From: z4ziggy <z4ziggy@gmail.com>
Date: Thu, 7 Jun 2007 08:17:56 +0300
Subject: [Buildroot] busybox setgid : kernel panic
Message-ID: <e19d85410706062217k34a4f7e3s9259444f89de132e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey all...

uclibc=0.9.28.3
gcc=4.0.4/4.1.2/4.2
binutils=2.17/2.17.50.0.14
busybox=1.5.0/1.6.0/snapshot

after finally being able to successfully build an image with working
openssh and samba, when trying to boot into it on a real machine i get
the following:

init: setgid
  kernel panic - not synching: Attempted to kill init!

This only happens with busybox which was built using uclibc 0.9.28.3 -
ive built the complete image again using uclibc 0.9.29 - and the boot
process works (i cant use 0.9.29 image due to the openssh/samba
problems)
i also tried using "init=/bin/sh" but the error remains (only shows
"sh: setgid" instead).

is there a way to fix this? did anyone encounter this problem before?

thanks in advance,
Elia.
