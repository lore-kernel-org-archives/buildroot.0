From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 27 May 2017 10:51:22 +0200
Subject: [Buildroot] regression for microblaze architecture
Message-ID: <20170527085122.GB24800@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot and OpenADK have samples to create a Linux system to be
bootup in Qemu system emulation for microblaze architecture.

With gcc 6.3 and 7.1 the samples are not working anymore, 
because the Linux system userland does not boot.
Qemu 2.9.0:
Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
(with glibc, musl and uClibc-ng toolchains)

I bisected gcc source code and found the bad commit:
6dcad60c0ef48af584395a40feeb256fb82986a8

When reverting the change, gcc 6.3 and 7.1 produces working
Linux rootfs again.

What can we do about it?

best regards
 Waldemar
